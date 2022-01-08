Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B914884E9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:19:42 +0100 (CET)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FNV-0008KG-H0
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FLK-0004Pj-Le
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:17:26 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:53369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FLI-0003z8-Uh
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:17:26 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5mSj-1mHmBN3n9X-017IHr; Sat, 08 Jan 2022 18:17:23 +0100
Message-ID: <c296185b-9730-4384-1ad9-1e5f03bf0db4@vivier.eu>
Date: Sat, 8 Jan 2022 18:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/4] linux-user: Implement capability prctls
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
 <20220106225738.103012-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220106225738.103012-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k2AZBx7YvvBnvG+8M7j7+P9AHAvrbCUGIAwp9E7T4QchYOb17Ba
 tzpjaa9dRqvZ/EVn+S4o4WXyK/msE0c/a8x7jQuWUe6g+giblVtaH+k6FooCU3T989U33Zn
 ARjvEFJl6J6P2D9439+IHMua3/Cb3QowibuzE+TS+13a/JvgT+69lfe3m26KR7ht7TxAxOp
 vtOocT3H2AWVie2rrzvxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eItCTdeM6+o=:aA/TdDzVma42nzLGuSSSBq
 U653GlPaaAFrtyqmWM4YG3hV11WGfyffgXiTjvtRvt/rF5rusp67YVfvgrYiyJnNfpRn7flkR
 exMdRJtEqevojFJw1UKIpVUGy8LHxI8UPI/uishaidWZGXph3w51e4cbXPtlAm+eGxNL9aGHN
 jEH2r5uzmGSNKuGoHY0tadNlFfXVO0keYQKT5qmex4XZl9gVTbcM4fck13Kf0G5uInriEyYjO
 7uor9Px32qSrmGdEScj8h28F4CDE3eeb+BNvDRZaLuYqABRJU/PCKrsW8B51MWrZFGxmHbk1J
 G6jKnphZp5yGYapp2aSYqyIJ0NXxXUeFgmt6xHGfr6XBPBuctxZPUgQguSmzm+853h5fDez/a
 mG+LUkbSLQdCqJtLQiT7Kp5VCRx8d5YoUmzAfZZHnGaz1Y0D7cJ3Mk1Clhh2WfA9vYDttzexw
 uC1NCynPD6WzE+FK/A9pciXXgeDzAXa7GNPBCbEKZLQnN0NdlrCUHRb0us1LL2CBPZGuRsgT/
 n1/A5dFqgD4Rg53BhTFp0yjoThscAKEF6EAWQMZHPHy8bEy7SzExGV63eDNclCxdG8MGYFMsh
 GOUARHqRxa7gCTEgWuYFH/CIHIPdInqtsRJ9OzR8B1MblTUYrzhVJ8yk+LsJaiirGzLpHA83D
 VEQ3JkJ8kdPqZ1DUTQNVKlTx0Wik9MmwDBBbQcWYs3mAQnNUGNXmx8SF2xBarh//lQNQ=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/01/2022 à 23:57, Richard Henderson a écrit :
> This is PR_CAPBSET_READ, PR_CAPBSET_DROP and the "legacy"
> PR_CAP_AMBIENT PR_GET_SECUREBITS, PR_SET_SECUREBITS.
> 
> All of these arguments are integer values only, and do not
> require mapping of values between host and guest.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8495f5e08e..4711afaf8c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6504,10 +6504,15 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
>       case PR_SET_UNALIGN:
>           return do_prctl_set_unalign(env, arg2);
>   
> +    case PR_CAP_AMBIENT:
> +    case PR_CAPBSET_READ:
> +    case PR_CAPBSET_DROP:
>       case PR_GET_DUMPABLE:
>       case PR_SET_DUMPABLE:
>       case PR_GET_KEEPCAPS:
>       case PR_SET_KEEPCAPS:
> +    case PR_GET_SECUREBITS:
> +    case PR_SET_SECUREBITS:
>       case PR_GET_TIMING:
>       case PR_SET_TIMING:
>       case PR_GET_TIMERSLACK:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

