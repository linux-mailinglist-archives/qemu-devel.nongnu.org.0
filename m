Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0426616C0A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIPi-0004pP-Py; Wed, 02 Nov 2022 14:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIPh-0004nM-Ib; Wed, 02 Nov 2022 14:24:33 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIPf-0001Dy-M1; Wed, 02 Nov 2022 14:24:33 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MpDa5-1pNw0f1zmp-00qkrx; Wed, 02 Nov 2022 19:24:22 +0100
Message-ID: <d858ba61-8eac-fa7c-66fd-237ba8754046@vivier.eu>
Date: Wed, 2 Nov 2022 19:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] libvhost-user: Add format attribute to local function
 vu_panic
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <20220422070144.1043697-4-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220422070144.1043697-4-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cfNNMLk/m4Ne1/lTYmikSwTpHMn3OLifEmAcDYl/GyaY87DtrGy
 UrDNIoZLVgJGNHq+FKPTwunSzleoq2kGVWWjYtGjbEtwMP8a87aTD4lZJwriC4caW4CoGT8
 QC552RI5TF04SuPfwFr/eSGoqYRHfHQZwSDwAvBVZGTijWhX6FXrLYknkZ6Ohr6zI93w5Gr
 3LRz2T3qpw+GJPlkgB4Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1S9LHDjKw4M=:v/Ox/6An25EXelk0i4z6jX
 Nh3ax12a7KmfqQwQQWyvcPFxrC+pai67beWqJF0CN3N7SOkPufkrE1BlVXLTCqD3OLft9jBir
 X2l90A7OzJJd02Rf0F+LxSL/5OICq2a1O1rsLXsAI4+slIATGnFV9I+UUJWTsyjSQw0t3yfDq
 6xIM/wNwby2jGmHyBueUXn8rzO6jPdTtcAfe0X6s8HNuHU4GUC2dEGAR0OWshRBnwfnkT2Cbo
 Qx2jSxsbCchMtWIXLMFvZcPTfA2EFMfEVjSA1TKlAzIOWdKG+zAVjBAgc98iteQw9xw/uPhuL
 UIah5rluHatSGAkKxUxJ8Zv3Vl6fyL+1l0GFMZ9XqUzGmgplLpz9ABFW29OMjW4COQxGiKnOc
 d+AZaPDUTUXVqP3Uh1qMV8pGpIH4S8/LblGNavaBjvIfLsy8OZATZ/yTof4t49VsGvZaKSN67
 mfstO0p9tIPDWa47qg/jWDy5cOAJk7f0YxVCCGViHUfJAjQa0EC5DSY9nj5WC6JM/zW0xzxhf
 zFCPKSjBrDEhdyt0jKJVRbvCeG445kxJocZiFXg0KNyuxsDnLGxggfjHHjVW1whPpayj1wp5j
 4vsU/P7JlEcvcMp3aZBa+m5OXQc6NvWCm8cGQY/5jRcuzR0AD8yLcLaMLnPdzNWVLKsQIV0Z1
 THDYy37te+T32/DXIUL4qYoA43W73r/II3jFnbBF1h25v9xcOZCQ+WQfeuDEboEf7wt6yCw+m
 Ym8oTBTkDKGEZ5ti7wu05tAx5k7QtAuZXDLPqM5Z2rgPxhNdGQOa4980xxqXaoN8qQEJJlBWK
 oMPL9kJ
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2022 à 09:01, Stefan Weil a écrit :
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> It would be good to add format attributes to local functions, too (like
> it is done here) to avoid future format bugs.
> 
> The changes here could be simplified by including a glib header,
> but from the comments I assumed that is unwanted here?
> 
>   subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 94645f9154..29ab85fc9d 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -45,6 +45,17 @@
>   #include "libvhost-user.h"
>   
>   /* usually provided by GLib */
> +#if     __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
> +#if !defined(__clang__) && (__GNUC__ == 4 && __GNUC_MINOR__ == 4)
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(gnu_printf, format_idx, arg_idx)))
> +#else
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(__printf__, format_idx, arg_idx)))
> +#endif
> +#else   /* !__GNUC__ */
> +#define G_GNUC_PRINTF(format_idx, arg_idx)
> +#endif  /* !__GNUC__ */
>   #ifndef MIN
>   #define MIN(x, y) ({                            \
>               typeof(x) _min1 = (x);              \
> @@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)
>       }
>   }
>   
> -static void
> +static void G_GNUC_PRINTF(2, 3)
>   vu_panic(VuDev *dev, const char *msg, ...)
>   {
>       char *buf = NULL;

Applied to my trivial-patches branch.

Thanks,
Laurent



