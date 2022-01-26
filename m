Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEFA49D289
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:36:17 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCo5Y-0005gs-P5
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:36:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCnwh-0000UZ-Ua
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:27:13 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCnwe-0006Pt-1p
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:27:07 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMX9b-1mwelj0vxP-00JanX; Wed, 26 Jan 2022 20:26:48 +0100
Message-ID: <b76958e9-d1b6-1c1f-f4d3-882700c54246@vivier.eu>
Date: Wed, 26 Jan 2022 20:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] linux-user: sigprocmask check read perms first
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220126175850.1904968-1-venture@google.com>
 <20220126175850.1904968-3-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126175850.1904968-3-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8VmiW0mJQj7qzun6RBmHRFMOkd6Xjrj3Y16MajPyXnBWNArqQnk
 pnOoYAPEWiwJ15XtrfaljreErdJGdxaMU0EQxSMLG6Pf0Cm4AMKi8bb5n/XRteoLujNdL1V
 hVmO1xr1fhikSKHKcLubKE2S2YcgV0YgRe7X+bv61IkhIAXacICiDEhoVrNcfaDP75I2Uem
 Zo3rUNXZcuAEGIowmCWWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FQr+oNyJsgI=:XdnDRsrSOgsANz0f+TGRYT
 CMLAF5v8KSN+PsA13UeQm6iSvdUqok7p3/RwOJVi6eMxSyy/gaqZo3QTEwygRVg9htcFl5i7k
 Zd8/aZQHfv1R9o5csbD1DnT887HRChM4DfaW1qS8+NqRhoL4Vv/XijPQ5kw0RStdeml/Q71Aj
 OBmdhfoDwsZYjFU9Sy3MPvbzjKzBWyGRs4jHTDDfOcHgBkTvAT+m+AZ7fdHR+zgtGNMgTvJDL
 OwoqOl12E8l1s++eVO7R4nYd5vX8Thl6OEeVYiLmvDT6lMV7bkrBmxvVj5RLbh39aKiiNpbp+
 WcCrrZHvMZyGzBE8S5CAhz3wwImx5tzaNLsWEm9nJTHz1ZVoRY4DMeVpnrrWKuYvI98/YJQfu
 JmNQRJy1kSyZJ33l5DTHOHjAOktKtuZQAeds+zV9r0IGwaV6go75v+IPgnSNqTtGhrJPOcHU2
 XfaqTsaYlMQHIRC2raciq/68wu88rmD+D5+VtijHV0nH7I5Er3o+HbMnyFLbaPu5nDZY7H8/8
 8veCdUBnRhFpso1VbnHWRJZKnbDoml+13khCw05yO1yPXPw1MrZYd5ZCIJk+7nGjeLjqXM11r
 hB5wLMOADN2V29eCTThfj2QVV+/eYEoitjUkwlxlnVm3hbys1s44cw09e5+EpM4WyL/gjgO06
 9DdiiaBowpC4W2nAYHxcbrZvmiq/9Bwj6GVWSafxO3tDS9MpTNrFrYZYD80w8d4oaUI8=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, scw@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2022 à 18:58, Patrick Venture a écrit :
> Linux kernel now checks the read permissions before validating `how`
> 
> Suggested-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Patrick Venture <venture@google.com>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>   linux-user/syscall.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 34bd819e38..210483d4e4 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9465,6 +9465,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               int how;
>   
>               if (arg2) {
> +                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1));
> +                if (!p) {
> +                    return -TARGET_EFAULT;
> +                }
> +                target_to_host_old_sigset(&set, p);
> +                unlock_user(p, arg2, 0);
> +                set_ptr = &set;
>                   switch (arg1) {
>                   case TARGET_SIG_BLOCK:
>                       how = SIG_BLOCK;
> @@ -9478,11 +9485,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                   default:
>                       return -TARGET_EINVAL;
>                   }
> -                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
> -                    return -TARGET_EFAULT;
> -                target_to_host_old_sigset(&set, p);
> -                unlock_user(p, arg2, 0);
> -                set_ptr = &set;
>               } else {
>                   how = 0;
>                   set_ptr = NULL;


