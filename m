Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A292DD07C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:38:26 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprc1-0007Yg-Jr
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprX2-0002SY-Qg
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:17 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:33115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprX1-0005ja-46
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:33:16 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsI0K-1jwOWo0l8U-00tn77; Thu, 17 Dec 2020 12:33:12 +0100
Subject: Re: [PATCH v2 3/4] linux-user/sparc: Don't restore %g7 in
 sparc64_set_context()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106152738.26026-1-peter.maydell@linaro.org>
 <20201106152738.26026-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9ee3d3b4-ca5c-dbc8-d735-300d172a4290@vivier.eu>
Date: Thu, 17 Dec 2020 12:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106152738.26026-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:03lrXPLIF3EzbLw+cuzW2QtEkjbIJnRYge4Qdghd6ZFfze9pK3q
 pTdqYpKMFLQovyx2giY3YNpTulT6R0rH3fT5dLp9A9ELZqnM45yRfVrMmJAnJQ9EhdGTSRG
 ZBrB2PsByU6Y2+FSTqEsncKiUlRSNT3IimfxnO1/aSpyUT3t/Y1zf+5F/XuhCoM2Qhwn8N8
 tyEgdq5haPSZUK+KvoYsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4CaY6t+w6Gs=:SqI/q/WhNl3kWHQwd4gctN
 Wu4vw9nHbnAeNmvhGsugkB58993p2nWO/Z8q4FqM6lrCO6yT0moqNYKkoycKGtWiES5z/jipp
 y6+Zd8mjsBoRJr/Rm2gDToD14iJ+SGz4hx2cGczAFQa70wz9hQ0mGjpGDqyyTnogxiQAP09/K
 LMg+u8a0XzPmtZOjNmmz667/7/VyvG4D09YSmczt+UbF/tXVg/3QFkn574ZsxPsLkIuP/tokJ
 yFbSjw/+bARCbEYi9r8JSdvnJCB90YhmRO0JZspRXoYmgL/a3jlUA6hrrvsjGmn1/AvdEvIpT
 yURVhVdnwJgGmXmsE7bYkNN7wgWZypgdXM5uSJUcib27MzbmMAYY3E9X0oyOiEmftsOdk+luF
 OZkSk1m5dXMImmfNr5okJMAlO6lM8nMWUWysIdxJLKFQjN/O9iTYmmxikjnvGb3KfwMXPtxfv
 StckApJzMw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2020 à 16:27, Peter Maydell a écrit :
> The kernel does not restore the g7 register in sparc64_set_context();
> neither should we. (We still save it in sparc64_get_context().)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/sparc/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index 43dcd137f51..ed32c7abd17 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -447,7 +447,7 @@ void sparc64_set_context(CPUSPARCState *env)
>      __get_user(env->gregs[4], (&(*grp)[SPARC_MC_G4]));
>      __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
>      __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
> -    __get_user(env->gregs[7], (&(*grp)[SPARC_MC_G7]));
> +    /* Skip g7 as that's the thread register in userspace */
>  
>      /*
>       * Note that unlike the kernel, we didn't need to mess with the
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


