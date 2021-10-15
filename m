Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5565B42F0E5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 14:27:27 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbMJ4-0002xA-DH
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 08:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mbMFh-0000p4-IW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:23:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mbMFf-0005vm-Ml
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:23:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id v127so2391408wme.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ErrKU1nNjLlW3Bw3X1PGFEvVO/njZ3tUD7zOxBLP/dY=;
 b=emh6nYy/cqhG1ZuPAA3P2wHP1ThWhJtTjdmm1CI6sl11Z52zJVmNIYwoRsAm5b673w
 7StOOxetfON4NUwJ94DfNpBAgtXclG07wLMsxY0hygMqm2rWUe7kMqeUNgGAHsv4uBXu
 6kBzUd6QKpMRZapXkhohFCOKi+raMRyghD8yM2wn/BJ4c07i63J4+1m1loYg/FlD1GcZ
 Vgb2qzDaR4RK2aVM7JWztIojqV/jsvBEtLW+6SS2hE0e/q0GTvO39XK5qju84oeK5iYo
 Vy8CNNiHr+FX3tMYxouU9+wNaCzqtjUnEroN8O6485EiImMd8OvsXw9fydBYOBak3ffb
 8Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ErrKU1nNjLlW3Bw3X1PGFEvVO/njZ3tUD7zOxBLP/dY=;
 b=5FM4GBaqVXip19fbhLRwVqCvLG7vDI4oGAcvx1NbCyffpk6XwqF5uYt7hjVstlQ7O6
 OP/kPC4mljcfHtFmvWwvg41Ku8Ivru2pEsRRNOLB3bop5TKM4ICH2kNu0rvE8OI/dsSl
 K1JS8jxlVDxyXIAEp30YqChYs9bKH0yFu+ODnSFhtbSN+HfOpkZcHkNRErKOR3MnNuws
 MM366yia9U8bLqmvqnb9U5dKw6/3Lk+RMNDJtXN2SxWkibUJnKNK5P96G7p8JXDEQD1n
 z4Vg6lnenikyFm0NMJ7FleWdeK9r7l8EC+PzGdGTunQpDlB+PGivQA5trqAq66ogtqWG
 9Gcg==
X-Gm-Message-State: AOAM531qKbqM2QMmFZ52IqqhoLa6ChnWdchR51CTZUJnINkW9djDOMee
 CpaJ8f/BgaebNY73K5c2IFocAw==
X-Google-Smtp-Source: ABdhPJwWucQ4THkJrISLOmArhpaOeDK1bu/+mRW69P89MkE0FMr/KhSjGUaA/fJz4i+ARouQ4b90UA==
X-Received: by 2002:a05:600c:414c:: with SMTP id
 h12mr12059894wmm.66.1634300633518; 
 Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id n1sm10386990wmi.30.2021.10.15.05.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
Date: Fri, 15 Oct 2021 13:23:51 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211015122351.vc55mwzjbevl6wjy@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

(Apologies for delay. Alex also tells me you are currently away, but
there is no strong urgency here.)

On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > If we assume that we don't want to further complicate this set by
> > adding the additional logic *now*, I see three options:
> > - Implement memory map versioning for sbsa-ref for this set, placing
> >   the ITS (if enabled) directly after the DIST for sbsa-ref-6.2.
> > - In this set, place the ITS frames in a different location relative
> >   to the REDIST frames than it will end up once the further logic is
> >   implemented.
> > - Drop the sbsa-ref ITS support from this set, and bring it in with
> >   the set implementing the additional logic.
> >
> > Typing that, I'm getting the feeling that if I was the maintainer,
> > the third option would be my preference...
> 
> So, we took that third option just to get the initial ITS support
> into QEMU, and it has now landed. Where do we want to go with
> the sbsa-ref support ?
> 
> There doesn't seem like there's much coding required on the QEMU
> side, it's probably about an afternoon at most to update this patch
> to match whatever we decide we need to do. But it's very unclear
> to me what it is we should be doing.
> 
> Leif, what's your plan/preferences here ?

I discussed this with Alex/Shashi.

One further complicating aspect is that the EDK2 GIC driver currently
relies on GIC addresses being known at compile-time.

> Presumably somebody also needs to do the system-software side
> of things to handle the ITS being present and the redistributor
> frames moving...

Since it *would* be useful to get this support in, I think the most
pragmatic plan would be:
- Add ITS in the location originally proposed by Shashi.
- Add information to DT:
  - Platform version (1).
  - GICD, GICR, and ITS base addresses.
- edk2: Convert GIC driver to support dynamic block addresses.
- TF-A: Parse the DT and add SIP SVC calls:
  - to retrieve it (or return not supported if not found).
  - to retrieve base addresses for GICD, GICR, and ITS.
- edk2-platforms: Query TF-A for platform version.
  If platform version >= 1, request base addresses for GICD, GICR, and
  ITS.
  - Generate IORT if ITS present.
- Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)

Unrelated to the ITS question, and not requiring any intervention on
the QEMU side, we can then also transition the CPU and DRAM discovery
to SIP SVC calls, and stop sharing the DT with edk2 completely.

And some way further down the line we could do the SCP thing, which
would let us support different GIC-layouts/configurations based on
platform command line options. (Platform version 3.)
(TF-A makes SCP calls if version >= 3)
This would then require no changes to edk2-platforms.

(Numeric values described as incrementing integer rather than trying
to guess at specific qemu release numbers.)

This minimises any compatibility breakages, and I think remaining ones
are acceptable for this type of platform.

/
    Leif

