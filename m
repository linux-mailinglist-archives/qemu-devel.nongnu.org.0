Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E514577F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 15:12:10 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuGjo-0004W2-Uf
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 09:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iuGie-0003TR-A1
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iuGid-0000VS-9I
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:10:56 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:60355)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iuGid-0000US-0E
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 09:10:55 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQdI8-1jHpAf2iJS-00NjEX; Wed, 22 Jan 2020 15:10:39 +0100
Subject: Re: [PATCH 10/12] configure: Detect kcov support and introduce
 CONFIG_KCOV
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1579214991-19602-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1579214991-19602-11-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <81c1db40-e322-fb08-728f-bffc0fc4ce99@vivier.eu>
Date: Wed, 22 Jan 2020 15:10:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1579214991-19602-11-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J6Eq5vcg3MNwjl5R0oCCDvTRD+yEcw7BSzXFa5kvpSg+qn0XCCo
 in9/T22bEG1qEpbXAudwH0nY2wH3Mu37wPD1T8mwcwY4sXNK0NGvzoHeOhUNtN0+uDJKCeE
 kzcYdfcsyPE+kFLrtUbFYMT2ALdI1F/dxSkI2m9dpre85dlhZsr9x6bud6RUH6C5M2D+lcp
 eJDYY6vdYqSbvdmJcOmpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2OyUDeZ6ykM=:lJv4fW4ZjrFCTi8V7RYd8u
 h+M/MgXKbZjSgcebDDxsrMyzEdCqsHfiGYbq3wLoeTnZUuIzOcYnwFmdk258A201s6dFNqjjC
 nDSG1dpSzRTo1HNtT/7VNKNFkbL1KoJXLakFXNNYrZ7JZqQp/17zE3EoWpXRWvAOzNfbRtunY
 mqnZ+PvzsJqQQAUsAqRDLVSioUSbNqjwK1JHNOSWX5WYsxXYEKSb6woXB+t1CJ6cpx5lrKgTh
 US+YcCQjRjbSYPys3zNawo9a1ydUz8r7lJV9r2RLkIyo97ArM3i1EDBFSY1YZiGhpleaHE2Rl
 AH0FWJBDgK9sXgBstvrdsaPxy5mKvs6ivkOg1T4I12SmKnmgWH64dV6gSi1okMD2yPy6q8/PP
 JxiRZzITEpbFk0SgJvrazh7z0AcsLRvnQH9NaX0z4EnROgHcT6X5wltRL9XIytmPQ4xqaDYnu
 yVHibU0odLnxuuqrE7D8O3YwNKX+wJ6x1WXQH6YVA3GKoHvlIyYGcsHZpGccn4Wn131rOClwH
 mkTEH1QI/gsIZQD5Sm/l4Fabp1lzuEo/GqhMnll35g1Z6gLWZ/dm7qkfV7wmr5KNofaxSneDp
 gkqDHX534DbFJcI5ESq02ygvB+8yjcZqmMAd/80QTEksgL6jEBna7IoeuSWh8iEZqITW1k7p1
 NgQqNvx3kIw9j5zfRGu0KlGyg9dlx/n7frYZlW2cIsPwlbDRvwvqUa4bgbW7P7k4aJMM5MWGF
 vtGlmp0Iuv1WRhAJ3n4V6olHTl9K73RP0QYciKeU1jWeDx1YGXpg1YigAqVs9eQa9qaCzcvT+
 lP9TN91RoDQDtQ7aCDtSYLwJDOG1Be9aoZVN3p1vPwG0QPLsVI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.13
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/01/2020 à 23:49, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> kcov is kernel code coverage tracing tool. It requires kernel 4.4+
> compiled with certain kernel options.
> 
> This patch checks if kcov header "sys/kcov.h" is present on build
> machine, and stores the result in variable CONFIG_KCOV, meant to
> be used in linux-user code related to the support for three ioctls
> that were introduced at the same time as the mentioned header
> (their definition was a part of the first version of that header).
> 
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  configure | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/configure b/configure
> index 940bf9e..57e6eba 100755
> --- a/configure
> +++ b/configure
> @@ -4752,6 +4752,12 @@ if compile_prog "" "" ; then
>    syncfs=yes
>  fi
>  
> +# check for kcov support (kernel must be 4.4+, compiled with certain options)
> +kcov=no
> +if check_include sys/kcov.h ; then
> +    kcov=yes
> +fi
> +
>  # Check we have a new enough version of sphinx-build
>  has_sphinx_build() {
>      # This is a bit awkward but works: create a trivial document and
> @@ -6874,6 +6880,9 @@ fi
>  if test "$syncfs" = "yes" ; then
>    echo "CONFIG_SYNCFS=y" >> $config_host_mak
>  fi
> +if test "$kcov" = "yes" ; then
> +  echo "CONFIG_KCOV=y" >> $config_host_mak
> +fi
>  if test "$inotify" = "yes" ; then
>    echo "CONFIG_INOTIFY=y" >> $config_host_mak
>  fi
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


