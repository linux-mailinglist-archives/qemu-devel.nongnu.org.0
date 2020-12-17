Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89082DD11D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:13:39 +0100 (CET)
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsA6-0004v2-J4
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kps7B-00045R-Vy
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:10:38 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kps7A-0001GF-2H
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:10:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y23so5501566wmi.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=arNC/TBt06tQUCVySRcksjUkXGeWU5Athi9qYuzlPts=;
 b=vQ994tgPqPxWxRZt5BnYHeSx9+pBF0BHT3btBBMZLkOLsVaHsuYMMeqFfn0xgFtMQ5
 20LX8GW+GSNbdvfadAxgX3VAbNiO+v17xGtBGpmVtdCWLRmU6Sh8qvg66asfP1mndjGs
 rgy3ChniKfx8DSM5kLsYXhXmfeWVph0ihcEy4t6JESRQ/unHbMK4FsS6/L30KyTbOJSz
 4VNJFmRip+xv1rxNUOOgklPuGBOJExK60Ujen5be00QjVCGPM+YL55bR11LmiBr4BAoK
 STHlfEM1NNkvUo75pOtxK6tBmM2nfP7HyROAeErIBadVrYJtl7dKv+02UDu1nhT8ZecO
 27Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=arNC/TBt06tQUCVySRcksjUkXGeWU5Athi9qYuzlPts=;
 b=f7MrYmd9zTHuVf0SIhojOstLSWNCbH5HFLL7g6BzLvVbWeU+3x1nzMZ5F4hySS+jWv
 Dn6cKvnm7ztzWbjzK8MUhz/rQX9JW4owEl1M9YDudZoT0K99IG1PzEhIdJardqJ3+sOc
 efSIyK1C8vLMcORhkRUtJBavbu6dXexIkvxkoR1YvAt23YRPPhORfKiygHhYx4XtmGd8
 EaKtGh1mu1FXgrbLcpkczkTaY9eXb4aAZMj/xUgGrMVRdy15vKTG+9LwZU/HZA6/oIf7
 eCQH+XNAMVFu5R/PXBJfnYQVhYwjOv9bXy3X9oIrq0woZk0R+CQ5krPgrF0/GutZVbQ0
 bT4A==
X-Gm-Message-State: AOAM533S6wR4FiZHkxyjU/OgANyWFU+cLW6voimpM8Za+Cu+2sjbxULA
 2I5X5ZtXYka6v9h74wL73joesg==
X-Google-Smtp-Source: ABdhPJz/XLlp81RhEB4r4RL09ch8O+et3RrejEESHkuBiZHaVmpUoD8UeI3vi72v71ChTXzctmWvWA==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr8248254wmn.74.1608207034208; 
 Thu, 17 Dec 2020 04:10:34 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id f9sm11090606wrh.9.2020.12.17.04.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:10:33 -0800 (PST)
Date: Thu, 17 Dec 2020 12:10:31 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201217121031.GK1664@vanye>
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
 <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On Thu, Dec 17, 2020 at 11:02:23 +0100, Laurent Desnogues wrote:
> Hi Leif,
> 
> On Tue, Dec 15, 2020 at 5:49 PM Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > On Tue, Dec 15, 2020 at 13:23:58 +0100, Laurent Desnogues wrote:
> > > Hello,
> > >
> > > On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
> > > >
> > > > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > > > ---
> > > >  target/arm/cpu.h | 24 ++++++++++++++++++++++++
> > > >  1 file changed, 24 insertions(+)
> > > >
> > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > > index fadd1a47df..90ba707b64 100644
> > > > --- a/target/arm/cpu.h
> > > > +++ b/target/arm/cpu.h
> > > > @@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
> > > >  /*
> > > >   * System register ID fields.
> > > >   */
> > > > +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> > > > +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> > > > +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> > > > +FIELD(CLIDR_EL1, LOC, 24, 3)
> > > > +FIELD(CLIDR_EL1, LOUU, 27, 3)
> > > > +FIELD(CLIDR_EL1, ICB, 30, 3)
> > > > +
> > > > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> > > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
> > >
> > > The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
> > > depend on whether the ARMv8.3-CCIDX extension is implemented or not.
> > > If we really want to define the fields this way, we perhaps should
> > > define two sets.  Or at the very least, add a comment stating this
> > > definition is for ARMv8.3-CCIDX.
> >
> > Urgh, sorry for this.
> > I added the fields only to make the CPU definition more readable, so I
> > think we don't need to worry about runtime handling of this?
> > But I don't think it makes sense to add only the one form.
> > Should I use CCIDX_CCSIDR_EL1 for these ones and add
> >
> > /* When FEAT_CCIDX is not implemented */
> > FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
> > FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
> >
> > with a comment that
> > /* When FEAT_CCIDX is implemented */
> > for the former set
> > ?
> 
> Having both would be handy, but you need to have different names for
> the fields.

Different names for the same field?
I.e.
FIELD(CCIDX_CCSIDR_EL1, LINESIZE, 0, 3)
would need a different name for LINESIZE than
FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
?

> For setting fields up in cpu{64}.c that'd be acceptable
> as you know if the CPU you define has ARMv8.3-CCIDX. In the rest of
> the code the use would be more complicated as you'd have to check for
> ARMv8.3-CCIDX before accessing fields.  But the use of those fields
> outside of cpu{64}.c would likely be extremely limited so I don't
> think that's an issue.

Yeah, QEMU itself currently doesn't look into the fields at all.

> > > > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > > > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > > > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > > > +FIELD(CTR_EL0,  ERG, 20, 4)
> > > > +FIELD(CTR_EL0,  CWG, 24, 4)
> > > > +FIELD(CTR_EL0,  IDC, 28, 1)
> > > > +FIELD(CTR_EL0,  DIC, 29, 1)
> > >
> > > There's a missing field:  TminLine which starts at bit 32.
> >
> > Ack, oops.
> >
> > > If
> > > implemented, that would require to make ctr a 64-bit integer.
> >
> > As far as I can tell, this will be safe with existing code - should I
> > fold in a patch extending the register?
> 
> IMHO it'd be better to extend ctr to 64-bit.  But I'm not sure of the
> implications in the rest of the code.

Sorry, I was ambivalent in my message: I meant that (at a glance it
looked like) existing code should be fine with extending it to
64-bit. So I'll do that.

Best Regards,

Leif

> 
> Thanks,
> 
> Laurent
> 
> > Regards,
> >
> > Leif
> >
> > > Thanks,
> > >
> > > Laurent
> > >
> > > > +
> > > >  FIELD(MIDR_EL1, REVISION, 0, 4)
> > > >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> > > >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> > > > --
> > > > 2.20.1
> > > >
> > > >

