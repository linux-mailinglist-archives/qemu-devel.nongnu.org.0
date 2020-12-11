Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577192D7AA4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:16:30 +0100 (CET)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl5p-0008OV-A4
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1knl2D-0004gY-Hz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:12:45 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1knl29-0006fQ-6A
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:12:45 -0500
Received: by mail-wm1-x344.google.com with SMTP id k10so8002459wmi.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yfiohLCTMgGp+FvYC1C9dXLrbSF2LxBg9B71c6GrX8I=;
 b=Qf0SFjJ8LqX6VUuDD3w/3IsIe8dTad889MQCVp/46BEq/BrrKpYpCOjZp/RI5XriJA
 AChh1uJcQnvyuhHZNMp3lt4aStsTA/8M+XvD5aG8CvqcAsCgT+6OaIF8dZCPNpnX1Y4Z
 Hfx0rMki9jBZtxhQ7MMvQ39v+81ekKfjbYgc/bc4Ww3c53qlThop0zR9oexUFatyZsQl
 mQyAsmpjO/dp3wgi9SbibBdW6u7hGZAFRLxhdI7Ko00/gQK6ydnu9rrnBNPHmYibZkpS
 54tW4RClfyRBnJYT5vYso44ku4GR3GudkJ/udg24PjUHrO9wvLxJ31SJZMAjycpEG+Mq
 vRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yfiohLCTMgGp+FvYC1C9dXLrbSF2LxBg9B71c6GrX8I=;
 b=Wc3z7wTmDjD+ieedwf3SNHVWUEixwjZpFsvN872dcYSTbS80EhmpdaPvmsZGWhlVKi
 DrwmJbnTMndvdwEHJHmlgWpOWEYyQ66OPlea2wSq09/VEZyB06quveDQ5OofWcFujCS5
 jjq7tm4gz8wx+/eQNmM71qpRgg6G813/YWYZfHewiabHGcz+VTOMaoHuDxdq3YMgFUc5
 qaiHYEkJWhNQtbeIV6VJctEQcJBjcLvZkvhXoUwjbYHvV2Llo1OAnP6UTywG8wmLr4LF
 fXrcapJoE+Q0+ERykhQr5Wk1ZC8lJ3g611W0HOxTpbEr2dGcIW5dppUCvuFsRBzyKZOA
 yQzA==
X-Gm-Message-State: AOAM532GozS+DI/PokRwfFN7zdWvHlsczoaPxWFjwK4ZAGz4Tdgr6ie0
 8Dz8EzNGDF/j9r0zs1ts9gkHBg==
X-Google-Smtp-Source: ABdhPJzWy479bgLHfcoqnNfhGh0rWoWZt3UBgnZ+FGZoKn/IrANLPIcsLoQTW6St0zkv/+/3nJbJag==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9249579wmb.15.1607703159009; 
 Fri, 11 Dec 2020 08:12:39 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id c9sm16117983wrn.65.2020.12.11.08.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:12:38 -0800 (PST)
Date: Fri, 11 Dec 2020 16:12:36 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201211161236.GT1664@vanye>
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
 <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x344.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 14:45:55 +0000, Peter Maydell wrote:
> On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >  target/arm/cpu.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index b54d1dc092..5e9e8061f7 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1713,6 +1713,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
> >  /*
> >   * System register ID fields.
> >   */
> > +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> > +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> > +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> > +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> > +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> > +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> > +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> > +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> > +FIELD(CLIDR_EL1, LOC, 24, 3)
> > +FIELD(CLIDR_EL1, LOUU, 27, 3)
> > +FIELD(CLIDR_EL1, ICB, 30, 3)
> > +
> > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)
> 
> The ASSOCIATIVITY field is bits [23:3], so it's
> 21 bits long, not 20, right ?

Err, indeed.

> > +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)
> 
> Similarly, NUMSETS is [55:32] so 24 bits long.

Sorry, brain must have taken holiday.

Would you like a v2 of this patch, fixing those?

> > +
> > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > +FIELD(CTR_EL0,  ERG, 20, 4)
> > +FIELD(CTR_EL0,  CWG, 24, 4)
> > +FIELD(CTR_EL0,  IDC, 28, 1)
> > +FIELD(CTR_EL0,  DIC, 29, 1)
> > +
> >  FIELD(MIDR_EL1, REVISION, 0, 4)
> >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> 
> Any reason not to define the other fields here?
> FIELD(MIDR_EL1, VARIANT, 20, 4)
> FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)

Those are just context, not added by this patch.
(Glad to see I'm not the only one making that mistake...)

Best Regards,

Leif

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

