Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5E30D9BF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 13:28:00 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7HGJ-0000Ip-56
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 07:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7HEe-00089Z-Ll
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:26:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7HEb-0004hm-I4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:26:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so24001640wre.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oxMfT/7YoIew+n+1+EvavO1Ar4lv9KXNVU58zCZ30XU=;
 b=iUs5imSCY6AOEUVvH1NWhKsJAFhuXZYOInbIOVe2QDYITvvKYMxYtQGCx4DA3ZLoRL
 s0DVDzUeTSOqQ0TVKtLVy2++nPM2CYweCMuJ4iU1TSwvrNbmg3FRbnJ7OGHfyWPN5FW3
 xP0PnFjcY6vkKa45mZo6+PlJUYOOEJsgbH+8GjwSg5c4G8CTd3njuplKW08aB9Rx/d1s
 RokVFM3iCzO4QwmO5fke63icUQIa8Q/rQhSTb3rRKw+akaKVh+TiMNL7MJAnQxgfYArX
 +CPreK2NRwq76TtIlv21uoGDOMnkuGTHg1lj/ac/iRJpSqvhxNhwNLcdZpj+1K6vwbU4
 7fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oxMfT/7YoIew+n+1+EvavO1Ar4lv9KXNVU58zCZ30XU=;
 b=jIWZcalLR+mtscEEgJBEhSiAeY8/wz6P5llpWJf+S3q+Ste/C4GzuKfig2O2jrLK5h
 TrIaA0DHGg+mHTFnoNRjxGJg6DRB+g7mGDCjxBXWT4/POsi/DVboZADcq/otBQJYLzw4
 K6GeXR1JSHc+FeYl5FuAGUPOF2AES4VixyQcPiCM8DNBvPOLbZmOuyMX4+iF6alRzDd2
 7k8CL9XtP3HwKg0OjNd3PDKUVDe8UcuHJxF/b5dOId2kw/jpA5V1SGIWdf7hujyzKjxm
 G+EVvpsl00yGPBVqICqe6e21htaoCdyic8/kAt4o+MBYCgZw6tRLqeyje65yQ0ISi6mM
 SB8g==
X-Gm-Message-State: AOAM530QrKy92CBufxvI+eW78dsYv5RMFSNMm1hNg0B6+NSA4JVKO35h
 gAbTCmQyKWQtbMLrPHpUnr3Ytg==
X-Google-Smtp-Source: ABdhPJyHJclPABRY4GWn452Q/WPD/iMboKf9ljaT4JITl0Wc6Y+e6ubNQZAdH1uhJtohW+OOWxPqXQ==
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr3388699wrx.250.1612355172055; 
 Wed, 03 Feb 2021 04:26:12 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id r16sm3434064wrt.68.2021.02.03.04.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 04:26:11 -0800 (PST)
Date: Wed, 3 Feb 2021 12:26:09 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3
 driver
Message-ID: <20210203122609.GW1664@vanye>
References: <20210124025306.3949-1-leif@nuviainc.com>
 <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 10:39:22 +0000, Peter Maydell wrote:
> On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
> > only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
> > the GICv3 functionality only.
> >
> > This set aims at enabling these codebases to run, without actually enabling
> > full support for GICv4.
> >
> > This creates a ... problematic ... system, which will misbehave if you try
> > to use the virtual LPIs. But it does help with letting me use QEMU for
> > modelling a platform containing a GICv4, and share firmware images with
> > other prototyping platforms.
> 
> So, what's your aim for this series? I think we could reasonably
> take patches 2 and 4 upstream (they are changes we'll want for eventual
> v4 emulation support), but I don't really want 1 and 3.
> That would reduce the delta you're carrying locally, at least.

That would be much appreciated.

In a way, I wanted to test the waters a bit with regards to whether
gicv4 emulation could be introduced gradually, and whether doing so by
extending the existing gicv3 driver was the way to go.

Anyway, for now, I'll address your comments and send out a 2-part v2,
containing 2,4/4.

Best Regards,

Leif

> I suppose we should look at what changes QEMU needs for KVM in-kernel GICv4
> support at some point...
> 
> thanks
> -- PMM

