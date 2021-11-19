Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90A457076
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:17:45 +0100 (CET)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4i0-0005eg-CG
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:17:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo4gI-0004N6-5V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:15:58 -0500
Received: from [2a00:1450:4864:20::433] (port=36431
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo4g2-0006hs-Ua
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:15:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id s13so18446856wrb.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WH4l/UkWDRIjKFqseBjz9VauxfJmn66a91xGsdpi+s=;
 b=sSfq/DtSBWihls3rRoimLyyxPZ5fcncVw93pw0GsauliUXZmIHjwIY1UGiXUwPuECh
 oEynphvH2WSE6aHuW9COrnQc96RbvmDZNMiE9dAkrHM5lE2DcL6GZJwr8sWkUFJgisui
 Vy22+FPnvZU/jJpbkzgCPZ7/QM3aXKlPWqewYPL4opEKheQ+iCGCjt8Go2a2C9FcDnMD
 zh3QnpiAtsZOFgilbe4+OgTd/wwhSEClZDLx3EnQeXFgWB3army2ntr0KxxhFsWQOM7g
 +q2jyyU5JIoGOLhTmxh+oR6f/sjCNOda+I+3zNKG040GUu82FwkALb10dwsI5ZZt2OXw
 WCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WH4l/UkWDRIjKFqseBjz9VauxfJmn66a91xGsdpi+s=;
 b=wZRcBuq97CyLefRBNi9NDA7R32JnyoX13RFu0Qcv9/GBQj5j1r7z6a5G/nbUBBF8Ln
 9ecyxFSdmznMluuSnWYwovWfGyTRef6zRkhHWW/sCQZKRwL1vH6WJbHCpKRu/d6EUYWF
 FZx8dUgoCZgIN/rIBqrzB0WhkqmszUBm4QeRwNJaiSJbKusTw1QBXNbk45Dc7pYZQgwq
 WqbRUInsAQHkAGLTcWCl1Yu9e6nxbKBYIMro1GlCLtPgtBHjCpBvnQIx9WU4ub7SqWz1
 v8DGdLwthaSgxWHiMuQZEDdO6BujA4+DU0Yt3beAmpXpRbF9RZ+5VZPxxQF/6aJUhmNf
 TJAA==
X-Gm-Message-State: AOAM533RtESOBQeZFk2PbGPMyXJXTk2xW+dyOPnONjBFs8DV07p/y0h+
 NCsbXQtZ8zvTemdBtYOZdcVD/1PnUkr1nt4pvS0Zig==
X-Google-Smtp-Source: ABdhPJx/fu7XOY+JuSkhnuXVP9VXycBVNy+QY/wb65hMGFh0hSiEBJcxmp6R1LpyenichOY87Is+QU8yl1yujuoOygM=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr7904979wrt.275.1637331339827; 
 Fri, 19 Nov 2021 06:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20210930151201.9407-1-peter.maydell@linaro.org>
 <20210930151201.9407-3-peter.maydell@linaro.org>
 <CAFEAcA_-V7uJ3hkC88ycXFBEXxV2fiUTBNrh+RDnjDfX2GGNww@mail.gmail.com>
 <6f83f61e-138d-b8a2-b21c-0dbd2805437d@csgraf.de>
In-Reply-To: <6f83f61e-138d-b8a2-b21c-0dbd2805437d@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Nov 2021 14:15:28 +0000
Message-ID: <CAFEAcA-gNPGoU5_s8mPreQBn9TO_D6ff+6_iDJJLAXHmUG0teA@mail.gmail.com>
Subject: Re: [PULL 02/22] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrei Warkentin <andrey.warkentin@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Nov 2021 at 10:35, Alexander Graf <agraf@csgraf.de> wrote:
> Ugh :(. Conceptually, once you tell QEMU to handle PSCI, you're
> basically giving up that EL to it. It sounds almost as if what these
> boards (imx6ul + highbank) want is an EL4 they can call into to deflect
> PSCI calls into from EL3 they own. We would basically have to allocate a
> currently undefinied/reserved instruction as "QEMU SMC" and make the EL3
> code call that when it needs to call QEMU for PSCI operations. Or a PV
> MMIO device. Or a PV sysreg. But at the end of the day, EL3 calling into
> QEMU differently than on real hardware is paravirtualization.

I think in practice what they're doing is "we want an emulated
firmware that provides PSCI and also stubs out some other SMCs".
(My extremely vague recollection is that the SMC in question was
some kind of "flush cache" operation on the l2x0 cache controller,
which was secure-mode-access only.) So probably the eventual
answer is going to be "PSCI setting x0 is OK, get rid of the
infrastructure for setting up the do-nothing-SMC-handler. But it's
too complicated and needs too much archaeology on why we added
this code to be doable for 6.2.

> Just to double check: Is the broken monitor code that expects QEMU to
> partially handle SMCs only ever injected into the guest by us or is
> there existing guest payload code for EL3 that makes the same assumption?

We only write the boot stub code that uses SMC if we're booting a
Linux kernel (ie not running the guest at EL3). So for guest EL3
code the highbank board is in the same bucket as the other
affected boards (mcimx6ul-evk, mcimx7d-sabre, orangepi, xlnx-zcu102,
plus for EL3 code loaded via -kernel: virt and xlnx-versal-virt):
maybe somebody had EL3 guest code that was assuming that QEMU
provided PSCI, but that would be something that could only run
on QEMU's model, not on the real hardware. So I'm OK with
breaking that if it exists.

(In particular to get SMP to work on these boards
with EL3 guest code we need to model a power controller or some
other way to get the secondary CPUs to power up, unless the EL3
code expects the "all cores start the bios code simultaneously"
pattern.)

-- PMM

