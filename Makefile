# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdaufin <jdaufin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/12 16:16:05 by jdaufin           #+#    #+#              #
#    Updated: 2020/12/12 18:40:35 by jdaufin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

.PHONY: all re clean bclean fclean start

CC = clang
# TODO remove debug flag
CFLAGS = -Wall -Wextra -Werror -g

NAME = ft_traceroute

SRCDIR = srcs/
OBJDIR = objs/
HDRDIR = includes/
LIBDIR = libft/
LIBHDRDIR = $(addsuffix includes/, $(LIBDIR))

FILES = ft_traceroute
SRC = $(addprefix $(SRCDIR), $(addsuffix .c, $(FILES)))
OBJ = $(addprefix $(OBJDIR), $(addsuffix .o, $(FILES)))
HDR = $(addprefix $(HDRDIR), ft_traceroute.h)
LIBHDR = $(addprefix $(LIBHDRDIR), libft.h)
LIB = $(addprefix $(LIBDIR), libft.a)

all : start $(NAME)

$(NAME) :$(OBJ) $(LIB)
		@echo ""
		@$(CC) $(CFLAGS) -o $@ $^ -I $(HDRDIR) -L $(LIBDIR) -lft
		@echo "$(NAME) ready"

$(LIB) :
		@echo ""
		@echo "Building libft dependancy"
		@make -C $(LIBDIR)

$(OBJDIR)%.o : $(SRCDIR)%.c $(HDR) $(LIBHDR)
		@[ -d $(OBJDIR) ] || mkdir $(OBJDIR)
		@echo -n "."
		@$(CC) $(CFLAGS) -o $@ -c $< -I $(HDRDIR) -I $(LIBHDRDIR)

start :
		@([ ! -d $(OBJDIR) ] || \
			[ $(shell ls -A $(SRCDIR) | wc -l) \
			-ne $(shell [ -d $(OBJDIR) ]  && ls -A $(OBJDIR) | wc -l || echo 0) ]) \
			&& echo "Launching compilation of $(NAME)" || echo "$(NAME) : no compilation needed"

bclean : 
		@rm -rf $(OBJDIR)
		@echo "$(NAME) object files removed"

clean : bclean
		@make -C $(LIBDIR) clean

fclean : bclean
		@make -C $(LIBDIR) fclean
		@rm -rf $(NAME)
		@echo "$(NAME) removed"

re : fclean $(NAME)