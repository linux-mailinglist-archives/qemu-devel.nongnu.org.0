Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E486241B31
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 14:53:25 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5TmN-0002Kc-SD
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 08:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k5Tlh-0001uG-1K
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:52:41 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k5Tlf-00081F-0C
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 08:52:40 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsqIi-1kyPp81yWW-00tGej; Tue, 11 Aug 2020 14:51:58 +0200
Subject: Re: [PATCH] linux-user: Fix 'utimensat()' implementation
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200811113101.6636-1-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d7bf73b9-5ce3-a23b-02f7-90cb92491129@vivier.eu>
Date: Tue, 11 Aug 2020 14:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811113101.6636-1-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ubeUt/pfnQByqqUY5rFr243I1e89pL/In/1ejwQU1u1mUPqal6h
 pSLh7e7ZEao2x0iqp0fWhobET7e5f17ZwXOr6Py6XEKxU+TYtQPePzjx8H4gAUddWRSD8SD
 IpSMfQW8gyFgiAQWsKhYX0h/fGEBWdBnTTNn0F9SknLxxflkh4U+hHICKTijLG4yVuGudrJ
 47XzixbQYs6Hl1W/L8vzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hOVgHC6lbG0=:80pcZ0C9dC63YggXC0N1A/
 Z56zDgkkSiMIct4jBEtYIciKWBg3UJJDsECuL7Z/XgKvbUnaGKnJGxNzT/sp1KcGRyPQa7Ao5
 UqH8Q2fVXRATzrxV+XVDCYG+ADBVPkU7jvQMEDTO6IfbONrBiNjeVJNe4d/AcFETfu1wi3d/9
 X7F8vEPBDqNfG9pfaP8VPU5RC5SEd1at6MbxexD4c7C/zl+Od8+wF4wuSLmFyjs/DknUc7zar
 LZCB2Z8pa9ErsRZVJliduqA21u2M8T/z7UHxE4SeYvv8rN8FCMw0HaVvXsfDf+hjeaJT3GpgF
 9bWR0+SpgSwDddmwIhXsvFLp2xNR7uNYLKIZTK9RusMSpMO3MHbBzUzzBibnZ7CLLJXWf1SmN
 fCspC3dwdWl/rKAFwZjOM6OheS3apUEIVO1OwxztrLIVtSgFZvIKz4co/tjaeh6UQoZu8wVX8
 y4kWtwEphT3DiUh694nSkDTBAWLnPvG5gtDU0oFYCod3uu0RUL8ZnV4w4nr2L0oEfW9CAofW9
 /gwk0kreyhXLghkIBDAHQ+q2xuxDVvRqGdtMSJ/j5Xs4nmHxN2wbvWU9q0I+S6mQZDuKoJCIq
 yL9A3pcTWq0nsjnDTdWFg1078/pC+KfMwhAfCzOFmKwgJN3hTe0sYOX3SJNgmOqp1hHwB/p+K
 LHOrn+vs0JopjOihmB4AK3ur7I2ovwWsDgEss2ph4g6SFSpTgUIUMh4X8KqlL9O5Si1fvIQMo
 4S5VEnkq1Z07RJkimxDLS7d2rISQsaCBrW/z/hj8WoygoYesd4vm5Ke2YIkFQd0gr08hR8sUT
 dx+aW4KVhBl2f0NE6O+Mi5/0ET84D4GikSvrf4S4F45qrfwRLaqgBiwfoG3ovl8bve1qiI2
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 08:52:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/08/2020 à 13:31, Filip Bozuta a écrit :
> Implementation of syscall 'utimensat()' in 'syscall.c' uses functions
> target_to_host/host_to_target_timespec() to convert values of
> 'struct timespec' between host and target. However, the implementation
> doesn't check whether the conversion succeeds and thus can cause an
> inappropriate error or succeed unappropriately instead of setting errno
> EFAULT ('Bad address') which is supposed to be set in these cases.
> 
> This was confirmed with the LTP test for utimensat ('testcases/utimensat')
> which fails for test cases when the errno EFAULT is expected. After changes
> from this patch, the test passes for all test cases.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/syscall.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 05f03919ff..920656191b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11722,8 +11722,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>              if (!arg3) {
>                  tsp = NULL;
>              } else {
> -                target_to_host_timespec(ts, arg3);
> -                target_to_host_timespec(ts+1, arg3+sizeof(struct target_timespec));
> +                if (target_to_host_timespec(ts, arg3)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                if (target_to_host_timespec(ts + 1, arg3 +
> +                                            sizeof(struct target_timespec))) {
> +                    return -TARGET_EFAULT;
> +                }
>                  tsp = ts;
>              }
>              if (!arg2)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

