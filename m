Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937D49E4C2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:38:32 +0100 (CET)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5ux-0007OO-LX
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5WU-0005Jx-Gl
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:13:14 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5WH-000226-5H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:13:02 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mcp7M-1mdCno3mK2-00ZvUU; Thu, 27 Jan 2022 15:12:59 +0100
Message-ID: <9269289c-bfb7-689a-7281-56485f561425@vivier.eu>
Date: Thu, 27 Jan 2022 15:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/2] linux-user: sigprocmask check read perms first
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220126212559.1936290-1-venture@google.com>
 <20220126212559.1936290-3-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126212559.1936290-3-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I3VftFVQbCL1zyIwyGC+VvzVCE2ePQV4EBoDSeDs7ddtBfC8LNZ
 55wMscz1VSiL7RDhqx2+9vzJgC7diNZAVMfuCtXYg1BmSdsLhH9wGWOmDtpgNWUvn6AIONp
 D3G+wXcX9+Qj0iipsCG7HPnhBbgUiTuoHDSNbke6i9X8ZEg3fvdLHv6UrPlp+ljAdqhucn+
 PRzWoCzgB33Q6mJUF6qrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ptVKt22AP5A=:9hOWQB87JsVmGhIWQwgf2K
 HglpcNKZNVWhtIjgdXtuzwYhFOV1fUt9o3bGGAcacrCmaC2oRa1UmlbRSadJVN+yKxna5LVzK
 7E2yN7NEZTFOAsvxJeVQ/NOluippYKOUiHWIOIOBqlHKu0bSQKBskdDmmb3oJTT9g/8wamCpx
 Nkxncy3O9/7sJ1UpBIf4/QM85dKA5yIk5awyo+V8+jeldbaY4oW529KFgzmt6Qc3Bb9bQHfai
 8YJkkjmFTLnBY2hG9o6lF0Yhb8f7cmGRx37BlqzIYcC2jw9tHFWiJyde/SdvXQgOP45Q9v8eO
 8LIK/RlPEvlwDQE2VKOJlFUU4b83Hj27sW8m1EOFkeXLuo2I2JZLhanxJVIkvwEZT7Bsbok6D
 EQR+J9ilP91O2xxQIX6jx0e4f+Uxbq0+URDzHt8pQRZAEHiNtkEy5+VqwMnB6IsUkCISyXMBG
 EUQsxhcV3TzX79wLlF95mw66Omi4D/nNuJU3fy4MmlX2pGK7wIiLOFieF2YPlluY0lSOWq/ka
 FWtNMGtxQPnH/mJkoQegu47fnIf/QU3gixNRjZgymXD4xbaqOSac53GucYhHTMtN+v8+eoSNC
 83oqF1mPGiUlu77nfvVNfjXMQI7jQ7DWWcmlYV0eDvoDJPdylfZ3FjXVrjm+eVaokHVSI5V7L
 DX16rkyUJPKk+8lXNw6TaprfpgKeLa06lLLVZB0MlrLT45k142VPydPephNLkRyYaHqE=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 26/01/2022 à 22:25, Patrick Venture a écrit :
> Linux kernel now checks the read permissions before validating `how`
> 
> Suggested-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

