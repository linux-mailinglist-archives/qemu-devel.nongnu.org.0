Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB434AC3CD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:35:34 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH63B-00033T-PR
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:35:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5rC-0007MC-GY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:23:10 -0500
Received: from [2a00:1450:4864:20::429] (port=41852
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5rA-0008Ao-7E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:23:10 -0500
Received: by mail-wr1-x429.google.com with SMTP id k1so8920010wrd.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=17Y6SImHH3S/OQfwbWHmEwaQDhoZn7pbL9oytXMX2ew=;
 b=xNc1mBDsLFha6//Og3LkPHo1X36T9/xnGIMy6Qc7nc32dvjkBbIjOJOXySRl4SSJq8
 luqniylhM4bGfFV0AOog8GMN74zrGfL14wEtllrImxNrIFKMKoPJygZ0fw9C9Ub96g00
 GU2Mi4kGDqTnjzZZZHHHJL9dbvEqZ6kcrwCHwcZzb0s6G77IBYFstUGDg/gL52fDWkCF
 xWaXFwA9V3iEanF8NjeS+wAbwOw6WsBNqZLi/E0WyhklVlkXiqvla97dzOFolJ+zvOeJ
 3EhWZ5nGuaB4gHYbdFidJQ225hSJ6VGSYJY+BkfLzQzwMm51dYDQlMwtYqUdaljqynWd
 mngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17Y6SImHH3S/OQfwbWHmEwaQDhoZn7pbL9oytXMX2ew=;
 b=PLAE+P5BVzH2GgXOu1Zi00SGvkfWWcNTafJ89ay9amRMddzfc/XZYRmSOxKeQVwzAt
 caK66L3tTJfcpTJiOt4tyvXFa/xrc8AXQFEVgeh2sMgNbePV1l4JppRP0GCAJSNXWifB
 iD1ZcOd39XBLgUPoQuQPZlNomhzVT2fLDV6m4hs9ZL9WfGqnQZq8n8WTaGiJEoldMXIO
 bZe+yPBKbewWlcbAJVF1sCWIbekf3C2AAAFB97QV2h3GDi8nHUnUD3b+7lM/tZDoN5eT
 4Nyh2f3Kw4NuPTRavAXV/voaxlXRtXGj1SdWrvDs39mBT5dJAm8y1GjyrrkGG6h+IeRM
 kNlA==
X-Gm-Message-State: AOAM533mSJYQPoVsBywsriwmEt3W7v3qi3WminAHV0vCXgaMDLmieg81
 qlRNQ52eiyADkeoiV40rvda+Tu9LIzmdkYXcplETwQ==
X-Google-Smtp-Source: ABdhPJzC8L7miytglhir6AId1731DdJd9DgpZvUHHTMtcRLan8IBPuH696eYwFcd6n/02nyxyB4S+BhNwmR70PWu7ds=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr7708wrz.2.1644247386814; 
 Mon, 07 Feb 2022 07:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
In-Reply-To: <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 15:22:55 +0000
Message-ID: <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 sstabellini@kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 michal.simek@xilinx.com, Joel Stanley <joel@jms.id.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 14:21, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 27.01.22 16:46, Peter Maydell wrote:
> > Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
> > boot.c functionality to allow us to enable psci-conduit only if
> > the guest is being booted in EL1 or EL2, so that if the user runs
> > guest EL3 firmware code our PSCI emulation doesn't get in its
> > way.
> >
> > To do this we stop setting the psci-conduit property on the CPU
> > objects in the SoC code, and instead set the psci_conduit field in
> > the arm_boot_info struct to tell the common boot loader code that
> > we'd like PSCI if the guest is starting at an EL that it makes
> > sense with.
> >
> > Note that this means that EL3 guest code will have no way
> > to power on secondary cores, because we don't model any
> > kind of power controller that does that on this SoC.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> It's been a while since I worked with ZynqMP, but typically your ATF in
> EL3 will want to talk to a microblaze firmware blob on the PMU.
>
> I only see a stand alone PMU machine for microblaze and a PMU IRQ
> handling I/O block in QEMU, but nothing that would listen to the events.
> So I'm fairly sure it will be broken after this patch - and really only
> worked by accident before.

Edgar submitted a power-control model patchset:
https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/

thanks
-- PMM

