Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF863D594
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0MBg-0001zZ-M7; Wed, 30 Nov 2022 07:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MBe-0001yp-5t
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:27:38 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MBc-000390-IL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:27:37 -0500
Received: by mail-pg1-x535.google.com with SMTP id 62so15861550pgb.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W1I1E2iT1+JKOXqcl57Z9EGt3zZ+m8Rf45KNpkzA5VM=;
 b=ik9NVAaX2DGfGRqnErPK0VWejFTsgwpXr38kGtaNmIN8NQR99Mol72nLAYDLeS/ENs
 SKOOCSbl/myBAJPLEFemK5pmGsJP1ZPeO9/qAd/hGaKTbsnI0qHhGoCVOVpEv6YUpAUi
 QhFJh6BzPatx2JhF8zRbCSovpFLwQeI03TTo7EUAGazj3yB3DdwPJL+z3XmA5Jx7QNI7
 f2SgF+mtgvzMrJed3a21K4iCc6A9DhHx7kJALLHgqenbkjemuSPzxk3jz6qH6VN0jmEn
 tH50TLvxacyzVQC8Dj59FWMwSDGBKpFaKu80ZhrEcjZmjj3GqmKHH0bKXovsDdfhFTu8
 BNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1I1E2iT1+JKOXqcl57Z9EGt3zZ+m8Rf45KNpkzA5VM=;
 b=T0Yl7m3zEGSYfzU3ZyiyEA50zSgDWlCs7DKyVF69myHS4qROo/p8eKR7Jd7E7i/ooD
 wsYPFSCO3g++T5qnWcFgF1qxdzeM69wJITkreQt2obd2jNWEijdrB1is5gR9BoVDehrV
 B3TaJZ8/S7Hi4vZp6vL0S3XNr100BoTDMRpRmeqYFhRVgOHmuwcadfWRQKNwKnWaLn7G
 GWS14i25f0LZSZYqvtlwqzaaSbnPr4Uh53fDG/OE4IopMjFgPE/qqzwL9cYYZGtiF1L7
 +LdmoW2X81boyVY5ccbLy1F6sshwDxuG6nDaNMaP9JW4UmBG37aFDMegyIgZxYIAi4km
 UZHQ==
X-Gm-Message-State: ANoB5pmHpTwTSFrl78plBxtnpoJAy8aPDKrMWWwpeWxMWpXXM3IsQCHs
 wumYkGLr1DjCWqFI1J1cKsnt1fFpdxXjXzylb+9GMg==
X-Google-Smtp-Source: AA0mqf4M3m6A5CDPuZNK3Xb8CULIwBFTGeK914TgOAJzLGSnngHKxSQmUq7gAzIhHAS8+VkFUmDA3x1I2Qzl2vlw0AI=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr38483621pgr.192.1669811254948; Wed, 30
 Nov 2022 04:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-6-jean-philippe@linaro.org>
 <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
 <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
In-Reply-To: <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Nov 2022 12:27:23 +0000
Message-ID: <CAFEAcA_t2hRPLcG-dyg4U5EzBX16FWWRzqMGy=ovnQpC1iB6Vg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
To: Rob Herring <robh@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 29 Nov 2022 at 20:56, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 27, 2022 at 6:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > Since the pl061 device can be used as interrupt controller, its node
> > > should contain "interrupt-controller" and "#interrupt-cells" properties.
> >
> > It *can* be, but this PL061 is *not* an interrupt controller.
> > I don't see any reason why we should claim so in the DT.
>
> Taking another look, it is an interrupt controller. The GPIOs are
> connected to the 'gpio-keys' node which is interrupt based (there's a
> polled version too). That binding happens to be pretty lax and allows
> the GPIO to be specified either with 'gpios' or 'interrupts' property.
> The Linux PL061 driver happens to work only because it always
> registers an interrupt controller regardless of having
> "interrupt-controller" and "#interrupt-cells" properties or not.

No, it really isn't an interrupt controller. The interrupt controller
in this system is the GIC. The PL061 is a GPIO controller. It *has*
an interrupt line, which it connects to the GIC, but that doesn't make
it an interrupt controller any more than it makes a UART an interrupt
controller. It just means you can use the GPIOs in either a polled
or an interrupt-driven mode, same as you can use a PL011 UART in
either polled or interrupt-driven mode. And the guest knows it
can do that because we've told it "this is a PL061" and that's part
of the PL061's functionality.

The gpio-keys stuff is just "here is a wire which is tracking
the state of an emulated power button". This isn't an interrupt,
it's just a wire that has some status the guest probably
cares about.

The second PL061 which this bit of dtb-generation code also
applies to happens to currently be being used purely for
output GPIOs, so calling that one an interrupt controller
makes even less sense.

thanks
-- PMM

