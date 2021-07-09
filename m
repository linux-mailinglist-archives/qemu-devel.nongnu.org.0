Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A23C2793
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:30:24 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tOR-0004JT-AX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1tMG-0008DH-Hy; Fri, 09 Jul 2021 12:28:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1tME-0000qL-Mk; Fri, 09 Jul 2021 12:28:08 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEmMt-1lw3fm3FbX-00GM1t; Fri, 09 Jul 2021 18:28:01 +0200
Subject: Re: [PATCH] util/guest-random: Fix size arg to tail memcpy
To: Mark Nelson <mdnelson8@gmail.com>, qemu-devel@nongnu.org
References: <20210709120600.11080-1-mdnelson8@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d509a8ee-ffd4-e71d-a1af-852c454759d0@vivier.eu>
Date: Fri, 9 Jul 2021 18:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120600.11080-1-mdnelson8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ks5CrzMX8+uo4i9A0N/pOCw4gm2eAAd2QUPyYwRefLGYWD2lIeU
 z96XfFvgDeo7jvJX7glvyY6FfaxIwqjk1lQZqutmJ9US9HwUACTbiX0ieeWeIsmAjSNzHnR
 K60GBTKuW70Jk3Pl/8Q0a9qQrepwDlTauw0ul/dQR4jQl/GVkzIGpgLLFQRYtu4VnJ0Cg5b
 dvK1Z8QqGBcv9Jrah60iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PPxMjIpoK7E=:GNnPMQhXW3iC9Mn5Vw5ItG
 WNGvihxwR4nq/ZukAh3khiPfae6CTAbueE6nW2pxdENh5nxK7VqwYaccq/OSHck3EOiM1CUsY
 8CyCHme0lpb+yabYiFw9JQpnbex5P+OGuVvs00udgApK+EQoxcVYgtuFEqmUtP/PV8jV2R/oy
 RFX/+lZ7j9EU6/ccE6hob3Zl+SDSCsbKbwJh/cBZi5EhULpoQjyHAc60NGTaJCzCuJl1qMdnc
 2iVewkIKCDkUI+k6ssufGjVjtfyE5yFvfiGIbEMr1GejPuaQL2Dcjn3xC8xhy7M13Xm1ONkDU
 2M//fTVghYDFZ7+4vuQ78Rvz+oXb8dhKa4KZK2DU1no0fgRnCE+PYU3CSKDQsMOD7/BW4G7mv
 /7hgozp98MsdogupPl1re5KSgGfeBiwfYV2HjpOmmTXzWE4tB19yj0uKJIVhEUNhf60+Fsgqe
 HTSEAr5w0TlQ62JMMCvWJnRA33nuyncA0J2b8laDIsaPrjgVx+yKMXzzrGYkDWD3UWNgJtZFe
 z5YW8Px4ndlZ0240rR0SBIiE+QRwKXU10aSZWrTt87rbY1B+2JunuvdMXMtm2dQHtl8rFMpN9
 Ajri31aJlT5Gs7K9m22Kr8ASlsJOxAyOPQTK/WDgwszIKpR/BZAl/2mg3SwuNTTQmm7N8lgHl
 3VM329ZDSxswxVskkHnaSQnPyWUcfLC83Yzh5D32S3RIQZ9a8sYigE4kc/Z/qvmzeL1zx1+K3
 gCk69FNcRLKeCubnjUWSI4HEldythKJsFveS3uSibUQxWM2pBWSYm7RzTBwJPdTsba+FQVBNx
 GWIVCNBIhUzuyMPF44TcKFxOltkiEtq2hV7wdA7Q0uFbgQc2fau1cKOdQyK+P1zKvMR9Yzy
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/07/2021 à 14:06, Mark Nelson a écrit :
> We know that in the body of this if statement i is less than len, so
> we really should be copying len - i bytes not i - len bytes.
> 
> Fix this typo.
> 
> Signed-off-by: Mark Nelson <mdnelson8@gmail.com>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/guest-random.c b/util/guest-random.c
> index 086115bd67..23643f86cc 100644
> --- a/util/guest-random.c
> +++ b/util/guest-random.c
> @@ -38,7 +38,7 @@ static int glib_random_bytes(void *buf, size_t len)
>      }
>      if (i < len) {
>          x = g_rand_int(rand);
> -        __builtin_memcpy(buf + i, &x, i - len);
> +        __builtin_memcpy(buf + i, &x, len - i);
>      }
>      return 0;
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

