Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171CE3C1B5D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:08:37 +0200 (CEST)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1cCC-0000WX-17
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1m1c9X-0008AM-Fu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 18:05:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1m1c9V-0000Li-Ia
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 18:05:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so4569153wmi.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 15:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JRkKmzDJdsTgrUvUS/TTb30pCcFwMBt1Si87ZZX5t2Q=;
 b=Mbg0ybkO5jhBXxYfkvHk2a8eNSE6QvS0SwRqBjv9OVGCElgLOCaqispTFklxJEd0sl
 b7np5ets47/0p4ngMUVuvVIw/uWIecqhy/b+pMNUCCUrWZmWkUJHPE0L72v76/GkPTrR
 omJoHFoqihN2kv25kakKRROLptM3fLFLTLzKG8BAf+uwvZo1Njs1pUBSu9VZe1oXoh78
 xRMCaDnE4ds3T6ADawOHdn5DzXbuC/z2ILkH+tc2urlx9fWqkZUrCJvOsW9zsWWd/+hd
 YEK/R5EbzIutM55A/GZRG6RCFc+hUg/dPlI9HtVsif9RsAX8vlCJHl0jgowrlVTKXIR/
 ZLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JRkKmzDJdsTgrUvUS/TTb30pCcFwMBt1Si87ZZX5t2Q=;
 b=poScOLQb8bo++ggV4CPZkkga1NvcUaB4q7hLkKpKrNNbanh0N8H8S17pHVMyV5wH1j
 nfs63SAHQmX52DeeW6crBcLilxEP2yT6VKHc2eVk3qsnxsFX+HcM7/7DTFjTNNP99Gms
 4oDeeK6VaKQ86jZP82hky3fHM+FfghbHVtNUVPkZccDDtVKKwjXE6uFKCIiUt+e6xv6m
 tSYV3/coLP11Dj1EOfJjBuRrCKE6FQfjCthDThX+DjYNOCmQQS+8Z5iC/yf+qfDXTPSQ
 CQPJp+MggGyv6GwpTqBinbBEjerNQXsjCnMmB2jBqtyVjtA20EzbgKqNgksozojRCVxS
 55gQ==
X-Gm-Message-State: AOAM531iF39S/SsiWH906oMy2Q3SZrtvrpC5XtgrSi5M2iRndTPU3LD9
 2JlHN8u2x6JkIdBfDHnhghXmsg==
X-Google-Smtp-Source: ABdhPJwEEZZqIrd6wlisLW0/HEkd7hgj9z0rZmZSRS3a2OuZMA7NiLXjmwDqGR0XQvRCDT65W8Rriw==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr35487038wmg.76.1625781948171; 
 Thu, 08 Jul 2021 15:05:48 -0700 (PDT)
Received: from leviathan (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id x19sm3142204wmi.10.2021.07.08.15.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 15:05:47 -0700 (PDT)
Date: Thu, 8 Jul 2021 23:05:46 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210708220546.rd7yqpsh6l7dmltu@leviathan>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
 <20210604104204.z3hhm2cxesnm2jx2@leviathan>
 <16db7ae4bb0b38100a08f0539ae2865c15264f1e.camel@linaro.org>
 <20210708194053.ar4yspiodigxwbwc@leviathan>
 <CAFEAcA-9XnY=4qsD9RGVy1sTW-d=B6MGPLd-Qqs7HWMRC-dfeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-9XnY=4qsD9RGVy1sTW-d=B6MGPLd-Qqs7HWMRC-dfeQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 21:05:02 +0100, Peter Maydell wrote:
> On Thu, 8 Jul 2021 at 20:40, Leif Lindholm <leif@nuviainc.com> wrote:
> > I think my summary-summary would be:
> > - I think we will need to introduce a compatiblity-breaking change to
> >   sbsa-ref.
> > - I think we will need to have support for more than one ITS if we're
> >   going to be able to use QEMU to prototype real systems.
> > - I think we should then start versioning sbsa-ref (like many other
> >   platforms already are). And there are other reasons why I would want
> >   to do this.
> > - But I think it would be unfair to hold this set back for it.
> 
> FWIW, I do not currently expect this series to make 6.1, so we
> have some time to get things right.

Ah, ok.

Then I would ideally like to see this patch add the ITS block between
Distributor and Redistributors regions. I think it makes the most sense
for this version to match the GIC-600 layout.

I am also going to rework those two remaining gicv4-ish patches based
on my acquired understanding, to be sent out post v6.1.

And, I would like to switch the default CPU of sbsa-ref to "max" as
part of that platform versioning, now that is supported in TF-A
(from v2.5).

/
    Leif

