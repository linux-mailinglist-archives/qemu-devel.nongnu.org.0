Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE511E017
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 10:02:25 +0100 (CET)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifgq7-00025z-VX
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 04:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ifgob-0001XV-Iz
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:00:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ifgoa-0006xD-19
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:00:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:43755)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ifgoZ-0006u9-FU
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:00:47 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4yyQ-1hhIkd3iHk-010tBM; Fri, 13 Dec 2019 10:00:32 +0100
To: Xinyu Li <precinct@mail.ustc.edu.cn>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20191213022919.5934-1-precinct@mail.ustc.edu.cn>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] linux-user:Fix align mistake when mmap guest space
Message-ID: <965e1a25-cbdd-a758-371d-dab7a7c2eb4d@vivier.eu>
Date: Fri, 13 Dec 2019 10:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213022919.5934-1-precinct@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:axNnd7N8HEhvTJ1aMBSrvQHiOsq4JTbBY7RrUjinMVeNwfNItUr
 25NxG5wmzshP2a70pKLjacBg2uRapeQLPTrfY+Qi+0D3OmVQT126YgLVdPnQKx8zwZz8zea
 35YL1KSE51T+oYRTQDyMZcFPhEbffdW4IlcFgFuoNnGEzIlYzSCc/IVp9cpRSgpkuWf9bLZ
 BLSQoNT2IwOvsSxUFhOEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MKqD4MMBkA8=:vFUGjBuy4Lstb5EvB8an1Y
 xiNm/yu2fl3f0agEAcJrr+Byjql2t5BN+CTtWUAzzBAwJtn+OU4MOmBYhRypMDVmb1nhVh/kx
 TDlW9sTHeotHAZNsdZjV3SEgOLuufdC2LHHAZPhn+RU2rkBDTRNbM56NUEmAlHMQLr6C08V1m
 4c0Ejjvex4/uEaHet8etHp1yFyKo/WpGGkph+dHk4a7EDtOiQ7RYR7VrdveW3URawRD1oVsuN
 uN+8tQqPzWJLSg7heraRHeq4YT3EmBLh6yciR5e+SY7STJ6MED2ytDPFHV84FHVWt7YBpFc7X
 Y7iJpN8M5PxCuu5RbU6abGfRrUjqfOoiFp+FUWORzfnEsbjRdHakEQ4TyCOemwf5hfwqZ2FU7
 wyW26ctPO9EK3Rh9bEWWD5RMaYjjVPDSUVf5zv6wFou2Eubg/gM3vTImXKtMooJiVgCaxhX3V
 8NMlAoc3/ik2QnG8e/urgeEDzYlhCe4+CC8nAypg5ldHG1Sp0aqF5E7dfrMzMTJ0pGCAVzsqT
 cR8PAtfhiNvbJwdZN/OzDEi5PSJPijfbeHrtfT5Jgk6gJNGEi+m5T9lYpUditATZ/lrRM9ygf
 /TUl7VhWupmSztxL/C3uv3FoSeiC+uiswEgWQ1C1lvPS5OuF7lqo+mC4siRM1kuMgSMJhqqMs
 AWupBy5nYrduTuCelNqzI8n5ZLArFngx5KWSH9yRK+QObHs6l7AmSkpavM2D4CyhRYyGKmTP1
 MFQkJkzyBXzSNsqYrpr4L7cuiLNp+Wi0Jx/A7LS6apDoT7wXMB3UMysMkRY3Uz2dSPCIsLQJ6
 BJ4foqGnGp2qZcsC1b3mgKMXqhNSq18DdayJn3Dphlna6sllJy+Zpl7cKdvIAgs5y6zITg/VG
 1aNNxv+7kUnC0rNtqIMA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.10
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
Cc: riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/12/2019 à 03:29, Xinyu Li a écrit :
> In init_guest_space, we need to mmap guest space. If the return address
> of first mmap is not aligned with align, which was set to MAX(SHMLBA,
> qemu_host_page_size), we need unmap and a new mmap(space is larger than
> first size). The new size is named real_size, which is aligned_size +
> qemu_host_page_size. alugned_size is the guest space size. And add a
> qemu_host_page_size to avoid memory error when we align real_start
> manually (ROUND_UP(real_start, align)). But when SHMLBA >
> qemu_host_page_size, the added size will smaller than the size to align,
> which can make a mistake(in a mips machine, it appears). So change
> real_size from aligned_size +qemu_host_page_size
> to aligned_size + align will solve it.
> 
> Signed-off-by: Xinyu Li <precinct@mail.ustc.edu.cn>
> ---
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f6693e5760..312ded0779 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2189,7 +2189,7 @@ unsigned long init_guest_space(unsigned long host_start,
>               * to where we need to put the commpage.
>               */
>              munmap((void *)real_start, host_size);
> -            real_size = aligned_size + qemu_host_page_size;
> +            real_size = aligned_size + align;
>              real_start = (unsigned long)
>                  mmap((void *)real_start, real_size, PROT_NONE, flags, -1, 0);
>              if (real_start == (unsigned long)-1) {
> 

Your change seems correct to me.

Richard did you miss this in your patch
30ab9ef2967d ("linux-user: Fix shmat emulation by honoring host SHMLBA")
or was it voluntary to keep it?

Thanks,
Laurent

