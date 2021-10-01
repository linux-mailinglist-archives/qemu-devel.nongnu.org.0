Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0F41E986
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:21:06 +0200 (CEST)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEj3-0005XE-FN
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEhF-0004cE-Vz
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:19:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWEhD-000390-TR
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:19:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id x20so14382388wrg.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dofPHDkbS5EFK6rOTSbKGobLAdsU61X+RZBg8dfRTVk=;
 b=S6poW1P51cJFr2hRdvSLez6SAYz4Msukn5tEbtcTfMZ5Deb576L9LJdB1jRt8UnQ0K
 7w9uErjd78KTQpNXjkFWbEeNAC1aaXJQg0IWRJl9IrcGAAQUL/yyKjr78lvq4F79U0VP
 nQpMwmxbI9vAmEvFXNOM7LSyrr08G/QLpYka9LaFNfa++SRovzVIv8paT1wM/V/t3Pz8
 +Ld/ZIi2aVP3Op4QTnEHJPFP7BDcdawR5cs+cvN2F+BF1Tt2UW4dZpOhjeWzZExK8Dc8
 0vzjDVzwScgGSqqBSr96oi0NiBBtCtL5sjgCtZHNHRkoN6yKk8OOsC2f476ICfw8qCEg
 wpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dofPHDkbS5EFK6rOTSbKGobLAdsU61X+RZBg8dfRTVk=;
 b=TTV+taWxGsCoil6FH5Ap8bksCOkI3mRQqJwwiwgsFAgFRJVB3lOVYzUe3cYdVpbuj1
 82d/p954nOddaa/VvTDlKsX03tQXQenXfbXTEokOQ+zf36AQZlxqyLXLSf3P7yiaFTj/
 ryePcNjTsEJOKDpSMrlrLFOy434/jvaMQEqxECnMfY4v+KPQDxtZ/z4hh3UdoisxiAPN
 fAXqlsy5bWpt1JVLI9Shu2EG+nUU6IpOCt+k5CdqkgwSR2cmMYN489Toi4LWLQ7fOrQh
 uNypAYxTwF66PReITPhCxEU8OV3EMhc2WA+sXbrcFdFzlXkPnYkmmaO/QwGBy/n+j6QM
 QFkA==
X-Gm-Message-State: AOAM533K4P9pMpwIcQjaAPx3/hQXobpYeztpanOzke9AXAR53Di8htfN
 PFT33CJpQ97FaydTr+X+dM6U0WAvuYj1KFE9QqmHyw==
X-Google-Smtp-Source: ABdhPJyS1qw3hx0ulzWHTLtkbRMfM2dFODpvR+2F26kHUSHiRuUt0ygplA39XPeNusM+s3dINh9CIhjl6lGOsRUv0MA=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr10825268wrw.376.1633079950299; 
 Fri, 01 Oct 2021 02:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-2-peter.maydell@linaro.org>
 <907d7432-a81b-b36b-9af5-a5554df3bddf@amsat.org>
In-Reply-To: <907d7432-a81b-b36b-9af5-a5554df3bddf@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 10:18:16 +0100
Message-ID: <CAFEAcA_Lijdzooc=5UvP1U+khogXRBjunkrHg9wh0ex1z=u8TA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of
 redist-region-count to arm_gicv3_common_realize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 22:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> The pattern make me think gicv3_init_irqs_and_mmio() should be
> refactored as a ARMGICv3CommonClass::init_irqs_and_mmio handler,
> called in arm_gicv3_common_realize().

That won't work because the two subclasses want to call it
with different arguments.

More generally, I find QEMU's class method infrastructure
sufficiently clunky that it is better avoided except in
the case where it's actually needed, ie where you have one
callsite that might have to deal with an object whose
exact type may vary such that you don't know which of the
methods you want and you need the dynamic-dispatch.
In this case that doesn't apply: both of the callsites of
gicv3_init_irqs_and_mmio() know exactly what function they
want to be calling (there is only one implementation), and
moreover both callsites are part of the GICv3 implementation
themselves, so this isn't about presenting a nice (or "nice")
external interface to other parts of QEMU.

-- PMM

