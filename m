Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5344B450
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 21:50:37 +0100 (CET)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkY4e-000057-Qu
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 15:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mkY2G-0007jl-0e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 15:48:04 -0500
Received: from [2a00:1450:4864:20::330] (port=51036
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mkY2E-0003Q4-4n
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 15:48:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id 133so347242wme.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 12:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k/vTwMDMR4QyIkK24vhqvKCKCIJcbcTGzA/yBTZftXQ=;
 b=SK2upagKKWjYU4zCBFV6O/SrUdku/GcA2wQ9mLDuCQmDNR2nRC7FIsCw9gmanUamRu
 45bYnvTFfBhaZZmLENIUXyTNsQA9NaK40SQ8Z5fo5i3aSFS6NHktXwGB+8mWyhrgRPXE
 92cBZ7XvRh088+ZFbip5nPeP3gXv/EbiOcePCNR8c5r8+PP960xvaPxKPVM4A8XkQ77l
 NmUIvg50r0fVPGe0vx5RUfkcslY82KdQZEcwGSwlFE9cENl1oxit8Dw4DPvkf98EWVQ3
 uuVxTPN4XwpnKGkrt1HYY61IIQbnNQPowH7v9nqhmMu0bp+doR+gsa74g3whRKE35hkc
 yepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k/vTwMDMR4QyIkK24vhqvKCKCIJcbcTGzA/yBTZftXQ=;
 b=pGzwjHhzIaqcm7vCFr1biAsmRDz9hJvBoM/PK0Yp7GWAoMfsMENYMhoLcfGg9FdiBj
 j/OhpjnRhxhhH7MAFJHXkrJxIbnHWDqrhTXFJwhjRWjypY+cH+EGEA08xo0UpKOtxd61
 7KaZWg+Pm0wii2LiKrGA7E0/4ZexyPanul/yZrlH5o2KG7gMhEcJX9i9wFqSLF+StbGt
 OoQqvvQirsn/2yYro5sby6weKwfcxlm/1BCDI4fCerZi649Yon6Xbf416samWoBlthqY
 Ayc2TVp7IiltR+EfY7Rm1g6N1msbG3AGyE2sPZVq4L1XkbfOGN1gsje4LhYrTR45rh+i
 b8YQ==
X-Gm-Message-State: AOAM5321DWd6nF0PKjXGo0asFSM0n/6s0M7IeuSMS9YwXxd9JDrGAEXQ
 WeFTavyWsnaPnRfkl7CU+3o3rvXOy2Z0MitM
X-Google-Smtp-Source: ABdhPJxtx/MuWT8vk0YkUZAQBaNKy6mNE/e3h/6qtcEsT6es9AdFFdTHBhVBBO5mzUKTthWymUMnVw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr10471850wmq.138.1636490572469; 
 Tue, 09 Nov 2021 12:42:52 -0800 (PST)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id a22sm3452736wme.19.2021.11.09.12.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 12:42:51 -0800 (PST)
Date: Tue, 9 Nov 2021 20:42:49 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211109204249.usvfatm3frar3u7a@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 13:43:50 +0000, Peter Maydell wrote:
> On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > (Apologies for delay. Alex also tells me you are currently away, but
> > there is no strong urgency here.)
> 
> (Thanks for the ping via Alex -- I missed this email when I was
> scanning through my qemu-devel mail backlog after my holiday...)
> 
> > On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > > Leif, what's your plan/preferences here ?
> >
> > I discussed this with Alex/Shashi.
> >
> > One further complicating aspect is that the EDK2 GIC driver currently
> > relies on GIC addresses being known at compile-time.
> >
> > > Presumably somebody also needs to do the system-software side
> > > of things to handle the ITS being present and the redistributor
> > > frames moving...
> >
> > Since it *would* be useful to get this support in, I think the most
> > pragmatic plan would be:
> > - Add ITS in the location originally proposed by Shashi.
> > - Add information to DT:
> >   - Platform version (1).
> >   - GICD, GICR, and ITS base addresses.
> > - edk2: Convert GIC driver to support dynamic block addresses.
> > - TF-A: Parse the DT and add SIP SVC calls:
> >   - to retrieve it (or return not supported if not found).
> >   - to retrieve base addresses for GICD, GICR, and ITS.
> > - edk2-platforms: Query TF-A for platform version.
> >   If platform version >= 1, request base addresses for GICD, GICR, and
> >   ITS.
> >   - Generate IORT if ITS present.
> > - Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)
> >
> > Unrelated to the ITS question, and not requiring any intervention on
> > the QEMU side, we can then also transition the CPU and DRAM discovery
> > to SIP SVC calls, and stop sharing the DT with edk2 completely.
> >
> > And some way further down the line we could do the SCP thing, which
> > would let us support different GIC-layouts/configurations based on
> > platform command line options. (Platform version 3.)
> > (TF-A makes SCP calls if version >= 3)
> > This would then require no changes to edk2-platforms.
> 
> This sounds good to me.
> 
> > (Numeric values described as incrementing integer rather than trying
> > to guess at specific qemu release numbers.)
> 
> This is kind of mixing up two separate things. The above describes
> three "versions" of this machine type, which you might consider
> as like revision A/B/C of hardware (and where firmware might for
> instance read a 'board revision' register or something to tell
> them apart). QEMU release numbers and versioned board types like virt-6.0
> are a very specific thing that is taking on a guarantee about
> maintaining version compatibility of the same board type between
> different QEMU versions. We can make sbsa-ref a versioned machine
> type in that sense if you really want to do it, but it makes future
> changes to the machine rather more painful (everything new
> immediately needs flags and properties and so on so that it can be
> added only for newer versions of the machine type and not for the
> old one -- at a rough count at least  10% of hw/arm/virt.c is purely
> boilerplate and machinery for versioned machine types).
> So it's not something we should do for sbsa-ref unless we have a good
> reason I think.

Hmm, right. So you're thinking containing the versioning fully in the
interfaces presented by the model:
- Is the version node present?
  - If so, is it greater than X?
    - If so, is it great enough to support the SCP interface?
And let the firmware deal with that?

I was kind of thinking it was expected for incompatible machine
versions to be qemu versioned. But I'm good with skipping that bit if
it's not.

/
    Leif

