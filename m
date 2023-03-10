Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3E6B3BA0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:04:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZbW-00045o-7O; Fri, 10 Mar 2023 05:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paZbU-00045a-HX
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:04:00 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paZbS-00067N-JE
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:03:59 -0500
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M597s-1pbg401PZk-001DyA; Fri, 10 Mar 2023 11:03:56 +0100
Message-ID: <b5389348-2416-35d0-3e17-4d198de8d956@vivier.eu>
Date: Fri, 10 Mar 2023 11:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] target/m68k: Reject immediate as destination in
 gen_ea_mode
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
 <20230309201604.3885359-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230309201604.3885359-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yx67Yic+lAZIs3rBxoaNBeNWSxdPvO0qzAQiVIdORbjLVFxJiH/
 AQhYFauNOnMAvXT2xT/8aRP7IHv75k94kpAk2JZCG9b2RgTKeO6ZBOoDJ9kn2g1BBQA4vrm
 R8DPJYXDDIPvTbelhrWQdpLRdmo+xJG032wfOcqNocIbeOFEaUKIVVysZyzDAZTDKCQ9H9n
 11FMO9Rn8P7lnBBzKo5Cg==
UI-OutboundReport: notjunk:1;M01:P0:pMrqyl71aks=;B1RLTR0XEO3du9Pn02/yLeEM/CU
 txIO7XH57ClcYItcfgNcGI4vQWIiudLX2LqFAHj5y+B0hld0Al3lL0Z1yNEpX0yKa44OT4Jz3
 hzVUDh5Ek4MR01QaO+/mVikjIJvW7bK5smLLhgT7fmKWhoHeaMyaJbsDfLBDoTw6glM5qh1Uj
 9xF15mX18yEWSoQw101KtZSOKqLB/8oCoRI8M68WM8EuntIwivKsTWOsa0WN9LQ3WKL9bvmTC
 TqJKnNB489KV5zvn1/NikJ6TH4U+1Ia0sS0+HxSX1qn5JyawXYin9ziopMBJF9gGtlL1ERNYx
 DMN0OQ6pKwDKFGmrqtSmhn/7XvLpJ8CIvYuCFnBKDQvgWVDqnxCQ9UtguE11TGtBu2MxKXDU0
 3HCjndwlhXLIIG1KdYjJ3mBFW7NfVoZnlwMjKJUI4Ja4DyGo1Bthgp/g5dRfiCy3lqc6DjP5z
 HYA888KbURG/0rNpEkZAnRXcLUj1pIEH8X/8A2I6TLidt9pOzACZeY5JvY42j4BPEBiBvumoF
 c3eeLaZIU5nxa4NyRigM++65XKuwYXc6v5o1jrlAA4Gn2bn/XdUUo498MD00UbqRQ7VF/jY/2
 O+UFPPCsUJ0quHrsL94jXZHsAMOv+AlqE9X5x46uQe02MzY/u9qess6jClUobMjeZdVaA+PWm
 CkWAMBUiifx8NuDb+Q43hRwsvt6v+cvKl8KPVRaM8Q==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 09/03/2023 à 21:16, Richard Henderson a écrit :
> In theory this should never happen, as all such instructions
> are illegal.  This is checked in e.g. gen_lea_mode and
> gen_ea_mode_fp but not here.  In case something higher up
> isn't checking modes properly, return NULL_QREG.  This will
> result in an illegal instruction exception being raised.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 422f4652f1..e16c608ef8 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
>           case 3: /* pc index+displacement.  */
>               goto do_indirect;
>           case 4: /* Immediate.  */
> +            /* Should never be used for an output or RMW input. */
> +            if (what == EA_STORE || addrp) {
> +                return NULL_QREG;
> +            }
>               /* Sign extend values for consistency.  */
>               switch (opsize) {
>               case OS_BYTE:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

