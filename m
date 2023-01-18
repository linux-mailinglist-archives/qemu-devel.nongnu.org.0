Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF5671722
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4QM-0005bp-4V; Wed, 18 Jan 2023 04:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pI4Q7-0005ZZ-PL; Wed, 18 Jan 2023 04:07:49 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pI4Q5-0006QW-Ii; Wed, 18 Jan 2023 04:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n+JeVaO500UtKARNlapy3KaCN2914wF16r4yGiuA9OE=; b=tVTmb8vnov+e2LtKBEbolmFIZI
 s3wnXqOU7jFkTngx8+UjYkXPgmoD9bWBg5b28Mn471Gq+ssxDnMdJXVFWJUO5zXT9enIzqZ0atgs0
 rI/D/5HejnafVn8TmMEJsrneA0m4iGFvzJOPGiOOzYNH+Tl7xOEAYe0WovZA0r6aYCJ8=;
Date: Wed, 18 Jan 2023 10:03:19 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Message-ID: <20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause>
References: <20230117184217.83305-1-philmd@linaro.org>
 <6da18e97-c80e-1ac2-edca-34fb243edd81@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6da18e97-c80e-1ac2-edca-34fb243edd81@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.186.130, fs=14434487, da=161641923, mc=68,
 sc=0, hc=68, sp=0, fso=14434487, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.18.85717, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2022.12.20.5960001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Richard,

On Tue, Jan 17, 2023 at 11:01:37AM -1000, Richard Henderson wrote:
> On 1/17/23 08:42, Philippe Mathieu-Daudé wrote:
> > Remove dead code:
> > - unused fields in CPUTriCoreState
> > - (unexisting) tricore_def_t structure
> > - forward declaration of tricore_boot_info structure
> >    (declared in "hw/tricore/tricore.h", used once in
> >     hw/tricore/tricore_testboard.c).
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Given this compiles,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> It did surprise me though, since I would have expected something to use
> hflags.  It turns out the only thing that uses TRICORE_HFLAG_* is the kernel
> vs user-mode bits.

I'm not sure of the purpose of the hflags. I assume they are hidden flags that
hold some hidden state of the emulated CPU. However are privilege levels really
hidden state? At least in the TriCore any guest software can read PSW at any
privilege level and see its own privilige level. Is there a typical usecase when
I would use hflags?

Let's say I want to implement privilege levels using hflags anyways. In the MIPS
targets I see hflags as part of the DisasCtx and CPUState structs. There are
also flags in the TranslationBlock struct. I assume that CPUState holds the
"real" value (synced with the TriCore PSW reg) and the other two hold copies.
When we translate a TB we copy hflags from the CPUState into the
TranslationBlock using cpu_get_tb_cpu_state() first. During target translation
we copy it from the TranslationBlock to DisasCtx using tr_init_disas_context().
From DisasCtx it is used to make sure only supervisor mode can write CSFRs. Is
this correct so far?

I do wonder why there is the extra step via the flags of a TranslationBlock. Why
can't we sync directly using CPUState? I first thought to differentiated the
TranslationBlocks for the different privilege level. However isn't that done
using the softmmu_idx? Thus if the guest software changes privilege level,
we change the softmmu_idx and have to retranslate code for the new
privilege level. Therefor we run target translation again and can sync DisasCtx
from CPUState.

> 
> Bastian, there is code missing from cpu_get_tb_cpu_state, to copy
> env->PSW[11:10] to *flags.  At present it would seem that all code effectively
> runs in kernel mode.

Yes, everything runs in the highest privilege mode. I'll look into properly
implementing privilege levels, but for now we can remove this dead code.

Thanks & cheers,
Bastian

