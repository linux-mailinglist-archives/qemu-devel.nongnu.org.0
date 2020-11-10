Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B02AD014
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:56:37 +0100 (CET)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNa0-0001B2-9M
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNYu-0000h6-2Q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:55:28 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcNYs-00086B-Bp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:55:27 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTRdK-1kk6ml2tdk-00TkjW; Tue, 10 Nov 2020 07:55:23 +0100
Subject: Re: [PATCH for-5.2 3/3] linux-user/sparc: Don't zero high half of PC, 
 NPC, PSR in sigreturn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <20201105212314.9628-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bf6f8e6e-291d-70b1-09ab-badbb6edcae1@vivier.eu>
Date: Tue, 10 Nov 2020 07:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105212314.9628-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nRK93aVFMQy3p25p26L4d501xD7+A9PmWE1WP5UIq7/+DHpZjgN
 0zuoKQHrmEruxXuYnrvfC7mP3YDIKdgfVtVfmO77NZdeLyUwHKcGq2vNVlvgaLwDpsRR9WF
 /digfGOQa/15lnGJWvLFoNS/LKNo6OHLmIyJE4SaHP7KUlL34pnSyf10sLLuby+9FTnDv3p
 4vC5Wa74Nzjn+sRwqSAQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sv5OdtmrI5c=:6X/lm1xKFuGWUbuPu2NitU
 wwiw5Z1xNPOLprlmMJPAj9Eh+TvD/7s6zke7Gg0aImkaQtQnyvcNfjp4MbxcGm9Z56Nf17Uvx
 Lp/RnqU4CEswJhX9wY2lcBVhkPfF0KBLDOQDyGjUVt4sr5VCFh65qDpyD/iXcipfLaOMCq7IS
 6vGBrq5SagqEVFButGqNRNNg75YRZb3Pu87bEANn/oTB5g/zL4YByXYGY6oUGym7XWiQ6qe0U
 F80PTJRL8bHlvA46FIiJ15O5BESabVRLs08ZC7yNZrzkskaFbAZc6uc0LWavXlLfPupy64jDr
 5ZcZS4yjLFALswXtsxIFe9pKlI33C4s/CmMz0uLk9PpIcOYIkqtnJrgThUaulemQuyU8KYqgC
 LqZGj3G9c4r+Tr7pRrQWByGZZ8WEFf05i4zla43WTmjxvjX6bmA0Go5wFKxN1t8W4F3iH/bQH
 3kPz7/9gXA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2020 à 22:23, Peter Maydell a écrit :
> The function do_sigreturn() tries to store the PC, NPC and PSR in
> uint32_t local variables, which implicitly drops the high half of
> these fields for 64-bit guests.
> 
> The usual effect was that a guest which used signals would crash on
> return from a signal unless it was lucky enough to take it while the
> PC was in the low 4GB of the address space.  In particular, Debian
> /bin/dash and /bin/bash would segfault after executing external
> commands.
> 
> Use abi_ulong, which is the type these fields all have in the
> __siginfo_t struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/sparc/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index c315704b389..d12adc8e6ff 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -247,7 +247,7 @@ long do_sigreturn(CPUSPARCState *env)
>  {
>      abi_ulong sf_addr;
>      struct target_signal_frame *sf;
> -    uint32_t up_psr, pc, npc;
> +    abi_ulong up_psr, pc, npc;
>      target_sigset_t set;
>      sigset_t host_set;
>      int i;
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


