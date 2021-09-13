Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91118409CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:19:29 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrUG-0002aj-3R
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrT1-0001uq-GG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:18:11 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrSv-0002Dz-H7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:18:11 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8X9L-1n360v34Of-014Qh1; Mon, 13 Sep 2021 21:17:44 +0200
Subject: Re: [PATCH v2] linux-user: Correct host errno for IP[V6]_RECVERR
 socket options
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210911170814.537351-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d26f735-cf85-f64e-d2ce-eebba964f99e@vivier.eu>
Date: Mon, 13 Sep 2021 21:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210911170814.537351-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wje7qBmFGxKn95nZr6t1vNDp2z7LHH7fGcFNH/oB9d1V6zWoB1j
 1/8odVEAzIIT9C92u+znFKp4pWip1PMGDuzCduZxsRlhkRgumij4MvMlqkJhHSqtf8jHYP2
 sA5ywqmZ7wRwfYJOMctDtAdQ1kb4Yg9aygDLMw25P9oiOE07CVfOFqQZ6t+fiRBGWlWoWCU
 +eA/wSO1NS6uQ0RjL91rQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+AvGuCXj8Q=:y4MmyFF57la65fiSQuqrhT
 dFHWDeX8sWpS3LCLDqMjErD7mayZ67hwXJpugGxNakfq9ALPp8Xj+BMJrGfeCpZcfqeYwMXr8
 uvYCfZPqO7NotE2lRRmNib0VBgUUCf4qPg9D1iDA8zlKXXQShj4XAd9pkehRPClO0MKKKIHRG
 gra4hwqvqlqxwwMztxVxaSbaS5IOC29qbhtalSgnI7pz6YMYSVHK9fVGdcsjdzTi1c0A55nFm
 KFQW7440Gr5Gh9/UBwUYUz8MHA99ZoOwEq5XZd/12ynclTQ3Oj+Soozun1T0i7Jb9Wc1ycP/p
 vva4szjR6w+P8OOivCKnAKBfFR9FFhNBZElol6CvO0ToAk/PezJ86KOcgfvTP09wRg5UWqRYg
 v6wLQ/2/ANXKo9kenAlQYVCLi0n3fSOxwiHK1799yVaA0LgtvZtGe93enMiBMPALAA3RMK7BK
 wGKO+IoaT3r6AsDfUXZ1QVpQrSC4pnFpiwRnCj7fU+G4VGq4OYoaZli4z329zKzYM0ItIg9No
 elNbaNd/Fq1ZNqEqBvIXw8y8WuWY9NqmYPKns3DHYw7igHS0277t9C+IS2r8UocmLG4hjbhhX
 UEIzSdhsfH4txBedfDgSAdJv3yAIKZe2Kn7K2pJOFuSjPtSzFjQqoFmm7uJ70EurfqQQ02THw
 zs4mLlcmXPROMU/O1t0ygVk74pMahroaPUM3NhoMMuxVhHgu3HwQN6ia5mLp6sWPk4f+JRIp9
 2vW8ekK6Xf82tOLOkMW9UPqhm08hjSaEnHNQSQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Conrad Meyer <cem@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/09/2021 à 19:08, Philippe Mathieu-Daudé a écrit :
> Host errno must be converted to target errno in IP_RECVERR
> and IPV6_RECVERR socket options.
> 
> Fixes: ee1ac3a1822 ("linux-user: Add sockopts for IPv6")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/602
> Reported-by: Conrad Meyer <cem@FreeBSD.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Corrected patch description
> ---
>  linux-user/syscall.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ccd3892b2df..edc9d6b5ba2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1967,7 +1967,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>                      tgt_len != sizeof(struct errhdr_t)) {
>                      goto unimplemented;
>                  }
> -                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
> +                __put_user(get_errno(errh->ee.ee_errno),
> +                           &target_errh->ee.ee_errno);
>                  __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
>                  __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
>                  __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
> @@ -2011,7 +2012,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>                      tgt_len != sizeof(struct errhdr6_t)) {
>                      goto unimplemented;
>                  }
> -                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
> +                __put_user(get_errno(errh->ee.ee_errno),
> +                           &target_errh->ee.ee_errno);
>                  __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
>                  __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
>                  __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
> 


I don't think it's the correct use of get_errno() here.

get_errno() is:

static inline abi_long get_errno(abi_long ret)
{
    if (ret == -1)
        return -host_to_target_errno(errno);
    else
        return ret;
}

and ee_errno is:

struct sock_extended_err {
        __u32   ee_errno;
        __u8    ee_origin;
        __u8    ee_type;
        __u8    ee_code;
        __u8    ee_pad;
        __u32   ee_info;
        union   {
                __u32   ee_data;
                struct sock_ee_data_rfc4884 ee_rfc4884;
        };
};

https://man7.org/linux/man-pages/man7/ip.7.html

     ee_errno contains the errno number of the queued error.

so ee_errno is never negative.

You should use "host_to_target_errno(errh->ee.ee_errno)"

Thanks,
Laurent

