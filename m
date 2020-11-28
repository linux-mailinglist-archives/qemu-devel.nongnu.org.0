Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B032C6FA8
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 15:40:47 +0100 (CET)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kj1P4-0003GN-Fh
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 09:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kj1Nt-0002ps-DT
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 09:39:33 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kj1Nr-00009e-MC
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 09:39:33 -0500
Received: by mail-ej1-x641.google.com with SMTP id m19so6025703ejl.11
 for <qemu-devel@nongnu.org>; Sat, 28 Nov 2020 06:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ULYQF6oNuWKz5ZfAi6jOrwuhSag20IQakTmjaOCEPr8=;
 b=dIE+rf5hTbpvrpT1bHymt2VDJR+WRY1B+RnzArYz/Pbd4r3KpcXCn95BmlanQ/OK7b
 8kEyiPsY9GWx4OzMuI7+mJNxJ340LHcdy6T232aEPOC1uV3gyhBYquBaNlyOEhItXao9
 dbdY0w5OdCzsqebBhR1WnAdXhIcnltkHE+QK/v4MJFA/WhRY0cNyPK9mHRzAwD2MCcPJ
 bb/tnJ8V7CJOs4yEXQ3vJrQDFg4gctkMmyC48/Lt9L8vabTYODJeO4mVWQlUsAOfpJbL
 m1kJ3nNf5ZqE9IHwPcJGRZnEne4Xl3cGJQSruRbh/Ly3ms0B3FmwHdrQ1Yd+y5fYIcNE
 nQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ULYQF6oNuWKz5ZfAi6jOrwuhSag20IQakTmjaOCEPr8=;
 b=qx6Ha6gw5dVW7ib7KpMCmU4f3zKGh1TILbUJ4NT4YH7jCcpjmizCMfn8zyvDxxOn+n
 zULyh0iGNrffcyL45Ddq0BRLldQVq8qYzJMMb7JxVaXrcrgqkPx4fflE7mt1ru4bDSfO
 kAjjBlfnUpfaZBUhihvLe7a8ii9+tX1YZ3UhDHa8Elri0C5gXlTViVbYIcaL5OluRUiu
 IirywmNY4msAkOk2MkFrdoR3qvibppn9xnKSYvDtzJajNYqmsQ+6kQHFipeWmbn+DLA2
 yci75RROu290o+kVDvaFDmbs+ItO7EV/1Yr4FhHNPNwMC5M4LzVLcJWsclfWJYUnPq0S
 2rEA==
X-Gm-Message-State: AOAM530Q7b0uvpTWiH/1VDB1DkDBSt0T0hnUt4aLiETIFMmjLzrX2Ytw
 NcGaSHCDq2OfwYzmCMH9iCYWzRgHSRfFBplWySDJVA==
X-Google-Smtp-Source: ABdhPJw0S/Ct9C6K/GfkoB44kaOMvn8p2f1GHq2VpujdqB/Z662o2onDXVIskXlmctqh1QbpYumge2OYHQWPEzMhNfI=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr12107004ejd.382.1606574369912; 
 Sat, 28 Nov 2020 06:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20201127191233.11200-1-peter.maydell@linaro.org>
 <20201127191233.11200-2-peter.maydell@linaro.org>
 <DM6PR11MB4316F7ADAF2DC8124FA0F4BD8DF70@DM6PR11MB4316.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4316F7ADAF2DC8124FA0F4BD8DF70@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Nov 2020 14:39:18 +0000
Message-ID: <CAFEAcA-c_8c5jGhEhWWAuFTtHk27zeLmN5pwzW_DQkASiYqs0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/nios2: Move cpu_pic code into CPU object proper
To: "Wu, Wentong" <wentong.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 28 Nov 2020 at 05:50, Wu, Wentong <wentong.wu@intel.com> wrote:
> The code looks ok to me, and I tested the changes on Zephyr project, it w=
orks well.
>
> But, according https://www.intel.com/content/dam/www/programmable/us/en/p=
dfs/literature/hb/nios2/n2sw_nii52006.pdf ,
> The Nios II processor offers two distinct approaches to handling hardware=
 interrupts:
> =E2=96=A0 The internal interrupt controller (IIC)
> =E2=96=A0 The external interrupt controller (EIC) interface
>
> We have already defined TypeInfo named "altera,iic" , and others can also=
 define EIC, so IMHO I don't think we should replace the internal interrupt=
 controller with GPIO.

The "altera,iic" device is what connects to these GPIO lines -- the
single output line from the "altera,iic" device connects to the
"IRQ" GPIO input. The code currently in cpu_pic.c is in no way
an external-to-the-CPU device implementation:
 * it's not a device
 * it directly messes with CPUNios2State fields like irq_pending
   and env->regs[CR_STATUS]
It's been implemented as part of the CPU, it's just in the
wrong place in QEMU's source code and not very cleanly
connected to the rest of the system.

If we ever wanted to model an EIC, we'd need to also model the
EIC-to-CPU interface, which seems to be moderately complicated
(the EIC "presents one interrupt to the Nios II processor, with
interrupt handler address and register set selection information").
So we'd do that by modelling a suitable interface connection plus
the EIC device, and an board model with an EIC would wire that up
and simply not connect the NMI/IRQ GPIO lines to anything, which
would be the equivalent of "the IIC is disabled" (or if just not
connecting the inputs is insufficient, we'd have a QOM property
on the CPU object for "disable the IIC", which would be an exact
match for "to 'configure the h/w with the IIC not implemented").

You have, though, prompted me to look at hw/intc/nios2_iic.c,
which I had previously assumed was a real external interrupt controller,
and although that is coded as a separate device, it has no
internal state of its own -- it also is just looking directly
at the CPUNios2State fields and register state. It's part of the
CPU, it's just implemented in the wrong place in QEMU.

So I'll spin a v2 of this series that also folds that code properly
into the CPU object, so that the CPU object provides 32 input IRQ
lines. That will mean we're modelling the hardware much more closely:
 * the IIC is internal to the CPU itself
 * (hypothetical) board models using an EIC will provide an
   EIC model that connects to the CPU using an interface similar
   to what the real h/w does
 * if necessary, QOM property for the equivalent of "configure
   CPU with the IIC not implemented"

thanks
-- PMM

