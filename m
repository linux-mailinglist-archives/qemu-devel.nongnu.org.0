Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D543543
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 12:25:32 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbMvD-0005LD-SI
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 06:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hbMhU-0005p9-8R
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hbMhS-0008NP-7m
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:11:20 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37581)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hbMhN-0008Cf-Oy
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 06:11:15 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtwQk-1iVeWr24mi-00uEjS; Thu, 13 Jun 2019 12:05:37 +0200
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1559903719-7162-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1559903719-7162-3-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c6c60547-3b18-8466-592a-63aee9dd3cf9@vivier.eu>
Date: Thu, 13 Jun 2019 12:05:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559903719-7162-3-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fJvNpc21LiWMKz8F2yhf1BqFfdSsNV6wIz86z1gYG4ddwsTMumN
 N1IeY0/VqYL8ElQurGrIo+Ckh/zqqEl0DcW3eyOmEFUSFMn40+xKYez7QLWxxpvBM9ZQq2b
 FaTTy9wD+QgvJDiIXg2bHTMwEM605vsbra1HuVE8ic9UZXMm5D+sG4YjYf5Vgmxm0E40C85
 FJrxdIpEquSRXkv0HXsoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5FoIU6IUeZ4=:xqIlGh1xf1mK2tSO5HoGCL
 o5T1liNqoBWMzzPhWDtOJnU40Lb8HBTnFCcvJgyLbM4fOaXdHZffz9rrtlse0f7+yWwl5XbOK
 vQg945HcKEH7DxUd3pHLXzLqwK8F/VlYCS37picbqoOIH73MgXyWW9ROhlBjwVnH4BSXIvM33
 CRUZYYfNvAWNiNLw1q9gSMjfRN51P71canIjxyUsBGIiSiz1/Ch3ccVzcR6lN737Uk6ToL2d+
 fhR4lvBGl33BZfzjKQZADw7K2qM0BwYTHCmNmw1Xw93/HnjEO3p98axgwFxxRWhv/REP2mfAI
 1JuvGEuBUiJS4ZSLROIyCJQUc66g8w9FfV11fCP2nvVVstPPaeyQytljzA+ezbWdwfhUhDYmS
 VHgk1Z8v25K6f7wm0pzBvmHaZmQRdjmsaDNglxgpey5fd6lagaPqIj5A6Y4gse2zic/CMs+0y
 EnRB+gGLAFhRkasLdQ7uwhdLDt3FoivrTE1PHXhif0WSmhnEP4mrr6DcMpc0BXMTFRenkor+G
 pz+oG7gAYgUDxR/c02IMoKZEl8DxXReFtctxrdrhbnEEwqDYWELS2qvdiszxTGO/upaPMwQoO
 QyKmo0fGLsQRLRcu8kzwSeM7RjjVVh6JbSZlY59Xqo0facbR+lZSdCDLwVQsXZbUdkIX/y8dC
 UKtuhbtiNwnWEj8xkYa0lV7mY6ymPYKOg1foE9Mk0e2ZeJMaIToB0yHpTUG2USPo/3uNesxP/
 pfBpMZRrHgCAtxT4acqJ1MHnpQIpPX2kyfZP08tLd8ugPVRmUPc/T7vIfNI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-devel] [PATCH v10 2/3] linux-user: Add support for
 setsockopt() option SOL_ALG
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
Cc: Yunqiang Su <ysu@wavecomp.com>, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/06/2019 à 12:35, Aleksandar Markovic a écrit :
> From: Yunqiang Su <ysu@wavecomp.com>
> 
> Add support for options SOL_ALG of the syscall setsockopt(). This
> option is used in relation to Linux kernel Crypto API, and allows
> a user to set additional information for the cipher operation via
> syscall setsockopt(). The field "optname" must be one of the
> following:
> 
>   - ALG_SET_KEY – seting the key
>   - ALG_SET_AEAD_AUTHSIZE – set the authentication tag size
> 
> SOL_ALG is relatively newer setsockopt() option. Therefore, the
> code that handles SOL_ALG is enclosed in "ifdef" so that the build
> does not fail for older kernels that do not contain support for
> SOL_ALG. "ifdef" also contains check if ALG_SET_KEY and
> ALG_SET_AEAD_AUTHSIZE are defined.
> 
> Signed-off-by: Yunqiang Su <ysu@wavecomp.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  linux-user/syscall.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index dde6889..82c08b6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -103,6 +103,7 @@
>  #include <linux/blkpg.h>
>  #include <netpacket/packet.h>
>  #include <linux/netlink.h>
> +#include <linux/if_alg.h>
>  #include "linux_loop.h"
>  #include "uname.h"
>  
> @@ -1998,6 +1999,36 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>              goto unimplemented;
>          }
>          break;
> +#if defined(SOL_ALG) && defined(ALG_SET_KEY) && defined(ALG_SET_AEAD_AUTHSIZE)
> +    case SOL_ALG:
> +        switch (optname) {
> +        case ALG_SET_KEY:
> +        {
> +            char *alg_key = g_malloc(optlen);
> +
> +            if (!alg_key) {
> +                return -TARGET_ENOMEM;
> +            }
> +            if (copy_from_user(alg_key, optval_addr, optlen)) {
> +                g_free(alg_key);
> +                return -TARGET_EFAULT;
> +            }
> +            ret = get_errno(setsockopt(sockfd, level, optname,
> +                                       alg_key, optlen));
> +            g_free(alg_key);
> +            break;
> +        }
> +        case ALG_SET_AEAD_AUTHSIZE:
> +        {
> +            ret = get_errno(setsockopt(sockfd, level, optname,
> +                                       NULL, optlen));
> +            break;
> +        }
> +        default:
> +            goto unimplemented;
> +        }
> +        break;
> +#endif
>      case TARGET_SOL_SOCKET:
>          switch (optname) {
>          case TARGET_SO_RCVTIMEO:
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

