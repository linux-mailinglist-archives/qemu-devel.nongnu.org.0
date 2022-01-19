Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FC493841
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:19:27 +0100 (CET)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA83q-0000UG-Hl
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:19:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA80e-0007BG-Hk
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:16:08 -0500
Received: from [2a00:1450:4864:20::333] (port=42970
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA80b-0006s9-57
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:16:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso1524013wmf.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rCo1diIBMHHhgOV+1Krb/M6NeuRyFQxuYoeTGCvpasM=;
 b=AFFeLSLFF7BK9SwOxCvS2dL09pPVaxo5tpLOAwa4VPsiVbyQdCcp5D+9t2RrRHDQsm
 S53LZPWvbo6YRn1NY0iNGkKJET2NshSRpm9H956nTPzQw5FwaA3awt++eaFhITVhiWCM
 ZPx/i+S29llR42CXgyInThnj42IQOxmy/73Jij/mSMEL3HnNQ340BU3jNegXzNo0tyMr
 OqYXa4l4S3lrqAr1Pwg/OnAyu/P1CChHHaMItA27GMoSms0e7Le8AFjfWYmcTeq712Pz
 ozlGZaRDQEprAbxRbG7KbjTDnlMBuEy/lgOeuME0X8d2WInRR3LrXYGkujs7pDaooHy9
 gZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rCo1diIBMHHhgOV+1Krb/M6NeuRyFQxuYoeTGCvpasM=;
 b=6ZMfmWgjltQqCqwCev4ERypJ2H82WCojCLH4ASigY2tmfxBpEJkXUvmQU5+SbF2g7I
 ufA1W+wfOhcSaq6BahFxNmvhxXli016ZOZdJFmRBTt5vDinadJA/GnpF1fYkJuaQ3yjN
 MKKakeZzCXY7ehfazVRtR5S35RDM7RQrHf6wu49j4v9hSAICyXXZ6qBubdsq2QergYst
 LycXYr9EFGkbc/t4RuF7DY2fxQSOv9lep6lH0DAHV81ZLB46c1laNoyWbV5cnNSya98w
 k/uI0aY0+XGoEUeKAbSMOBGIVFrYYkd2COwue5n/PtchAFe/suSeC5d9PMmqZ12cpeXT
 WUGA==
X-Gm-Message-State: AOAM530MLSZ1CaCZhh3PE42we30q79q4rb0dA7WKUuAVPYpmcFYBS+KC
 h6Ja476ddZ0RwVLm7TrBkMqOZAg1NKotxNAGS9SdfQ==
X-Google-Smtp-Source: ABdhPJwkmWBxRrbd6STFnW2Cex7iY8DYjEK1EprIfGb8VFaYeIGR41rbHcPWIVUkiArhAkC7LIlw6Vwu9jXbvmbH5fw=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29132585wrv.521.1642587363418; 
 Wed, 19 Jan 2022 02:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <87pmop7xfw.fsf@linaro.org>
 <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
 <20220118232935.50ae1b25@slackpad.fritz.box>
In-Reply-To: <20220118232935.50ae1b25@slackpad.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 10:15:52 +0000
Message-ID: <CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
To: Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 23:30, Andre Przywara <andre.przywara@arm.com> wrote:
> Looking at k-u-t's arm/gic.c and QEMU's hw/intc/arm_gic.c I see two
> problems here: QEMU implements word accesses as four successive calls to
> gic_dist_readb() - which is probably fine if that helps code design,
> but it won't allow it to actually spot access size issues. I just
> remember that we spent some brain cells and CPP macros on getting the
> access size right in KVM - hence those tests in kvm-unit-tests.

Thanks for looking at this. I should have read the code rather
than dashing off a reply last thing in the evening based just
on the test case output! I think I was confusing how our GICv3
emulation handles register accesses (with separate functions for
byte/halfword/word/quad accesses) with the GICv2 emulation
(which as you say calls down into the byte emulation code
wherever it can).

> But more importantly it looks like GICD_IIDR is actually not
> implemented: There is a dubious "if (offset < 0x08) return 0;" line,
> but IIDR (offset 0x8) would actually fall through, and hit the bad_reg
> label, which would return 0 (and cause the message, if enabled).

Mmm. I actually have a patch in target-arm.next from Petr Pavlu
which implements GICC_IIDR, but we do indeed not implement the
distributor equivalent.

> If that helps: from a GIC MMIO perspective 8-bit accesses are actually
> the exception rather than the norm (ARM IHI 0048B.b 4.1.4 GIC register
> access).

Yes. We got this right in the GICv3 emulation design, where almost
all the logic is in the 32-bit accessor functions and the 8/16-bit
functions deal only with the very few registers that have to
permit non-word accesses. The GICv2 code is a lot older (and to
be fair to it, started out as 11MPcore interrupt controller
emulation, and I bet the docs of that were not very specific about
what registers could or could not be accessed byte at a time).
Unless we want to rewrite all that logic in the GICv2 emulation
(which I at least do not :-)) I think we'll have to live with
the warnings about bad-offsets reporting for each byte rather
than just once for the word access.

-- PMM

