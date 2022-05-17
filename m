Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F319A52A904
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:11:44 +0200 (CEST)
Received: from localhost ([::1]:35404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0jQ-0001U4-0y
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nr0PM-0003FU-MX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:50:58 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:39187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nr0PK-0007GT-UJ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:50:52 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f83983782fso193967387b3.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qSHvfFaJ3OL+YGvvTRmnqGd76gvkcJf1/fnltypW9Qc=;
 b=ut2zQxsxtbANadER19nofD72YHVfEyu+USGuzreSFVI+yNnLj52yTFAXEmOQQDiyFp
 ZzZ6Ng5+a5eMpCP5sCAX7Kc6IoHUYgLq5SrGfvEAYkBN56hXzW5sZ2DjUjzrxeNL5aJ0
 jvkE3W6ob7EHvsmQfMBe9n30dsFt5+YQzquOYXcoxpqcnx0dgwPzU4pKhDirIGw2ARij
 aQJ6cFYSjZrCfFIkkoahhhUxcrqF1OVir/4vj3cWOUImyX4OwJmyXQQqfY0d5ixIYVZS
 eSoMd4MDf7bY/T6kBit8OATgpN7akr5za+Gm+pzqSUX83KSW9jTTVBr/H63RtQbnUBVM
 MJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSHvfFaJ3OL+YGvvTRmnqGd76gvkcJf1/fnltypW9Qc=;
 b=gAgosJWFSTKpKz9LeITx0IZA4oljPWN83mcd5TdjbPscXVS9BdTY0N5am/9AuL0aMT
 wq8fPg2doucAuiMIsQb72mO3Ku1Cc/KJf8L9sWMR+DxgaYlAugxKQ6FOR/a9gUbdj9xG
 I8A+anqRXLL2igObyIZTmQ8UcoElqegANFCeD2mWVdQQIE95rKPxyi95i5BJQNFtison
 n7n91kmccWIFZ99TFktOAj6MGkHOMervvHO4JyzTqUQbI5NSl2aAblj2R44Fz6pG8DxT
 qOOHuHXsOyZYiJOO2CkW9CB0aZLuI5iqlrEl5Dt1Vs4dgk3fvHtqsbw9xxjJu9hkic3H
 V9Yw==
X-Gm-Message-State: AOAM533xMf18kbQMlmG/xzP9hvAKnTx+KXSHsnnYH+oy7jvTGuZ44bER
 MBJAOFAX+hMhT2msVEN8fBdlafCk/COI7krHxO343A==
X-Google-Smtp-Source: ABdhPJxE8gwS04LFtyZ8ztRXfQuT+Etf87apTPP3l5SMhxSdT04NlFkrCES5uUsnynmYbUXZRAGP14T2xMkLK1m2yU8=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr27495566ywb.257.1652806249947; Tue, 17
 May 2022 09:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113947.75714-1-quic_llindhol@quicinc.com>
 <CAL_JsqJirHpxC-QXDZUKbJUTgYpac3KyTh7r3v0frWg26F3rzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJirHpxC-QXDZUKbJUTgYpac3KyTh7r3v0frWg26F3rzQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2022 17:50:39 +0100
Message-ID: <CAFEAcA_qAVQVCi8x5dAgG-6oi9k1oRR7VQtyRfsQ2+rsS57UTQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add versioning to sbsa-ref machine DT
To: Rob Herring <robh@kernel.org>
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 May 2022 at 14:27, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 5, 2022 at 6:41 AM Leif Lindholm <quic_llindhol@quicinc.com> wrote:
> >
> > The sbsa-ref machine is continuously evolving. Some of the changes we
> > want to make in the near future, to align with real components (e.g.
> > the GIC-700), will break compatibility for existing firmware.
> >
> > Introduce two new properties to the DT generated on machine generation:
> > - machine-version-major
> >   To be incremented when a platform change makes the machine
> >   incompatible with existing firmware.
> > - machine-version-minor
> >   To be incremented when functionality is added to the machine
> >   without causing incompatibility with existing firmware.
> >   to be reset to 0 when machine-version-major is incremented.
>
> Where's the binding documentation for this?
>
> We already have a way to version DTs and that's with compatible. I'm
> not completely opposed to a version number though, but I am opposed to
> it not being common. We've rejected vendors (QCom in fact) doing their
> own thing here.
>
>
> > This versioning scheme is *neither*:
> > - A QEMU versioned machine type; a given version of QEMU will emulate
> >   a given version of the platform.
> > - A reflection of level of SBSA (now SystemReady SR) support provided.
>
> FYI, it's planned to certify the virt machine for SR-IR which will
> include DT schema validation. Undocumented properties are a problem
> for that.

This isn't the 'virt' machine :-)

This dtb fragment is a purely private communication between
the QEMU model and the sbsa-ref EL3 firmware. We could in
theory equally replace it with a set of hardwired
"board revision" registers. There's a comment in the existing
sources about this:

/*
 * Firmware on this machine only uses ACPI table to load OS, these limited
 * device tree nodes are just to let firmware know the info which varies from
 * command line parameters, so it is not necessary to be fully compatible
 * with the kernel CPU and NUMA binding rules.
 */

Kernels running on sbsa-ref won't see a dtb (let alone one with this
version information in it), because firmware will always boot them
with ACPI.

thanks
-- PMM

