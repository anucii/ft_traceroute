/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jdaufin <jdaufin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/11/10 17:40:52 by jdaufin           #+#    #+#             */
/*   Updated: 2020/12/10 17:03:41 by jdaufin          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s1)
{
	unsigned int	i;
	char			*s2;
	size_t			size;

	i = 0;
	size = ft_strlen(s1);
	if ((s2 = ft_strnew((size))))
	{
		while (i < (unsigned int)size)
		{
			s2[i] = s1[i];
			i++;
		}
		return (s2);
	}
	else
	{
		return (NULL);
	}
}
