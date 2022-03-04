Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9711E4CD571
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:48:09 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Hw-0003ju-Ci
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:48:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ7z0-000491-VE; Fri, 04 Mar 2022 08:28:34 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQ7yz-0007Ew-DO; Fri, 04 Mar 2022 08:28:34 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MumVX-1oGqr71ijr-00rpJu; Fri, 04 Mar 2022 14:28:14 +0100
Message-ID: <8678251d-1203-71dc-3fd3-8be0377477d9@vivier.eu>
Date: Fri, 4 Mar 2022 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] tests/tcg/ppc64le: change signal_save_restore_xer
 to use SIGTRAP
Content-Language: fr
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
 <20220113170456.1796911-3-matheus.ferst@eldorado.org.br>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220113170456.1796911-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+MUVpmYMTU2Gk9maH8b1i3QkF3bw1DMktga7Gyen6KP4Uc0aVs+
 AR4SL0bZqaTV4x60NniDfpQTBEnuha52cgMMTzklrzgdeyxxqc06h4oXvtXRF57X3ruQt1u
 PBTdzPHDVg4GXxy8sOLsEyITXwNEEdApvE/cldCMc+qeaIr783vg4CiQWPqWsHHexES5w2W
 EWtFSL5nFCQrPYIsUV97w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IroqrOCZS/c=:P0dT8wI06SUM2mn6LJRBBG
 k8YR2FOQa1v9CciOGWDDqrnY0Rh9BStalkKEMskE1fR2WykMR/u4l0K3ujYyx7jCRWfCJlGzx
 9TjPYy9DyUjrSzjjPxBIc5gFq+ZONsoWz7cgtd90Gl4N1MAjRUdeyMax1RW1pGrN3ca0Xn2y8
 HbGK7huc3HSr4beVYsaumINjWwnVZ8DiW5q76PeIkQpO1eDw4U7TNa1IcDBxAA/6KSvNR2bdE
 sX7DU0hdKPl+/FEW2oqx4WPlGLgwpSfTSB8A0XqgRCozU5lCIzi4mu7YjUn2rcagdZHdBrIBn
 QmVCwi0NO16QS+bAae8ODqN+UM9Y8NigW59KssL970N9f6iOu0vIuTVtMxPVTHT3IJXcXzFXH
 QOdP3qjNAgZGvwQN3pLemnGa3shBt9nsWVax1Qwi23VxYRZGEqWx488MNI3TgrMWS3cDqYu+G
 4ZfAIZqa8yBAM8jQGZqLE7OALVsb6W9kWwnOm6GNZUrUKkDmZJ4kfr+AlW/t0N7oCWOb2Whmt
 NgMechE0hzUmdnlzrlR7qNdtT2Q8GobUsWBpKV4ZTXqf9IGsCGLvoTuGJZSOXgfpdEusdr2ml
 W38SZon4E+UkbQ+f7wPKZHUrF83A6+RMTQBYfWl10YK7x0DJ2x/nh9T5F5RBX/2gnFGNSsb6O
 1yMo4beo4XxPpDDkUYfGA9bJ0LjEftLCHB6RdzJkOuFZP3lQuoPWNxP3Vz7adcOqbByI=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/01/2022 à 18:04, matheus.ferst@eldorado.org.br a écrit :
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Now that linux-user delivers the signal on tw, we can change
> signal_save_restore_xer to use SIGTRAP instead of SIGILL.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64le/signal_save_restore_xer.c
> index e4f8a07dd7..9227f4f455 100644
> --- a/tests/tcg/ppc64le/signal_save_restore_xer.c
> +++ b/tests/tcg/ppc64le/signal_save_restore_xer.c
> @@ -11,7 +11,7 @@
>   
>   uint64_t saved;
>   
> -void sigill_handler(int sig, siginfo_t *si, void *ucontext)
> +void sigtrap_handler(int sig, siginfo_t *si, void *ucontext)
>   {
>       ucontext_t *uc = ucontext;
>       uc->uc_mcontext.regs->nip += 4;
> @@ -23,14 +23,14 @@ int main(void)
>   {
>       uint64_t initial = XER_CA | XER_CA32, restored;
>       struct sigaction sa = {
> -        .sa_sigaction = sigill_handler,
> +        .sa_sigaction = sigtrap_handler,
>           .sa_flags = SA_SIGINFO
>       };
>   
> -    sigaction(SIGILL, &sa, NULL);
> +    sigaction(SIGTRAP, &sa, NULL);
>   
>       asm("mtspr 1, %1\n\t"
> -        ".long 0x0\n\t"
> +        "trap\n\t"
>           "mfspr %0, 1\n\t"
>           : "=r" (restored)
>           : "r" (initial));

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


