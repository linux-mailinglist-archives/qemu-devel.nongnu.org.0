Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA45AC921
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 05:32:21 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV2qS-0008Sn-L4
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 23:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oV2ot-00071X-Eh
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 23:30:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oV2or-0003wQ-Lk
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 23:30:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v5so7293150plo.9
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 20:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=90S2L9sOrMgczPQalGeRrpTxTl3BOJmicLXxvX904Ho=;
 b=R6ylnJWoUrzaVI8fVwmReeJFH1ZCh9G9SYcr1Ar/q1JbU/BZLLYbIt6GsCKWNLYFPc
 WO1b+inpJmP6EO1bHjx7xagcei/K+SQ/afRgnSOiBZAPXnpU3/o2F5UoA1lI9pV5YLaW
 tWnyRqOvmuEQvZ2cRklFJzQGPsH9t741i5wkPd0K0CTlu6O2ky9hOT5YuoJoY7a/PfuH
 ftydau4Zy2gZd8FPTKTkFX7rZKoHvWmEUOLiTIbR7xdTvC+g58T7ffSvC1oJoUe/Rmgi
 P5p9VJ8wrbS58obp1ufLpB3609mO20S3VB9664EYIucp9ADD8qIjCQH5iOhOgfJbu5Kc
 +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=90S2L9sOrMgczPQalGeRrpTxTl3BOJmicLXxvX904Ho=;
 b=UG6PVYXBcz3EWfk6trbrFbmly6fwQWSwTGAs3bIYc0I3QM8a+fzkvVrdeYXHdjEJKy
 Am2VbozhT4t8HjReNa9RhJ5PGtKZB+k5AlEztgyKOnXhpB5A4o5e7RlWQO3793YH67YX
 xiOL+uqZLJqhijd59bTmd2kfwj8wuunHNLoHMMS3NzOrmBJYT2FHbAwMzTJ3xTPJiW3r
 43nt2uE+eXF0nFTYSpGpQcoqU1sa94kHO9xoKzwJR+SR2H4uoNlS4bsVSF7MF637Buhs
 lHxA6yVMb/hEemKu9E6zj5gfDHfFbFKKaah4apy1gQhptQbLZVST7jicz7H32tCQ4wWW
 8Vzw==
X-Gm-Message-State: ACgBeo0t2SHsoBMM1Xn2fLjRgcHp4n9RMuKH0SxQ+uZZOTffe4IXP6MQ
 eQt39J3o2ZTkPzmNey4fylW/vw==
X-Google-Smtp-Source: AA6agR7SeQ7Bq5KXwkzYulSZZixPvKgPTNZlu3vugaSocBkJ/Fdzhcl8z3iItPq6xyh01V1EfRcsfg==
X-Received: by 2002:a17:90b:350b:b0:1fd:fe88:7cdf with SMTP id
 ls11-20020a17090b350b00b001fdfe887cdfmr17683959pjb.236.1662348638504; 
 Sun, 04 Sep 2022 20:30:38 -0700 (PDT)
Received: from john-millikin.com ([2405:6580:98c0:1200:ad49:8eb2:5f01:76d3])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a622504000000b00537eacc8fa6sm6387346pfl.40.2022.09.04.20.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 20:30:38 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:30:34 +0900
From: John Millikin <john@john-millikin.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
Message-ID: <YxVtWkzEJP7WotRe@john-millikin.com>
References: <20220804122950.1577012-1-john@john-millikin.com>
 <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=john@john-millikin.com; helo=mail-pl1-x62d.google.com
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

I notice this patch wasn't included in the [PULL] series last week, and
it isn't present in the `master` branch.

Is there anything else I should be doing to get it merged in? Sorry if
this isn't a good question, I'm not used to QEMU's email-based change
management workflow.

On Sat, Aug 20, 2022 at 09:42:25AM +0200, Paolo Bonzini wrote:
> No, I had not seen it indeed. Queued now, thanks.
> 
> Paolo
> 
> Il gio 4 ago 2022, 14:39 John Millikin <john@john-millikin.com> ha scritto:
> 
> > SunOS expects CD-ROM devices to have a block size of 512, and will
> > fail to mount or install using QEMU's default block size of 2048.
> >
> > When initializing the SCSI device, allow the `physical_block_size'
> > block device option to override the default block size.
> >
> > Signed-off-by: John Millikin <john@john-millikin.com>
> > ---
> >  hw/scsi/scsi-disk.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > This is the same diff as sent to qemu-devel@ about a week ago. That
> > first email seems to have been eaten by a grue, but replying to it
> > worked, so maybe the grue is gone now.
> >
> > See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
> > related discussion about SunOS CD-ROM compatibility.
> >
> > diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> > index f5cdb9ad4b..acdf8dc05c 100644
> > --- a/hw/scsi/scsi-disk.c
> > +++ b/hw/scsi/scsi-disk.c
> > @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error
> > **errp)
> >      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
> >      AioContext *ctx;
> >      int ret;
> > +    uint32_t blocksize = 2048;
> >
> >      if (!dev->conf.blk) {
> >          /* Anonymous BlockBackend for an empty drive. As we put it into
> > @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error
> > **errp)
> >          assert(ret == 0);
> >      }
> >
> > +    if (dev->conf.physical_block_size != 0) {
> > +        blocksize = dev->conf.physical_block_size;
> > +    }
> > +
> >      ctx = blk_get_aio_context(dev->conf.blk);
> >      aio_context_acquire(ctx);
> > -    s->qdev.blocksize = 2048;
> > +    s->qdev.blocksize = blocksize;
> >      s->qdev.type = TYPE_ROM;
> >      s->features |= 1 << SCSI_DISK_F_REMOVABLE;
> >      if (!s->product) {
> > --
> > 2.25.1
> >
> >

