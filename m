Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962795B559A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 09:57:04 +0200 (CEST)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXeJT-0004uq-69
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 03:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oXeHS-0003Sm-Vk
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 03:54:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oXeHQ-0001vl-Nr
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 03:54:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fv3so7229379pjb.0
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=tF9TH+2RpUJvoXlWi9oxIj5GEaiM1WLihZa5oRfKdQI=;
 b=ToxZhgSKn5eFQ5dlq/KBVvk7TTP1gZkPwk/8aXfD6GHGQvRSloL+1YliiYHSk9dEe7
 /5kAaBjFfhsM8hnQVWMaDz5sxjXUHsLZfQ4xnpbeUfFRyfwQoTfAruax8odbrzG+K79Y
 ilrP8UDKQrQ22S+ZBJoZGSurQTsNLYkJrClsLAs2agL7OWICOU0d07S5CmRKNrt21r99
 TCpr5SSaEwtUCDLITTGTTcCAizlhKuCauHOx1UN6sCqh4ya1fqzAdL8gG+UIecORV1Pw
 vUwoJ/3vMXJO2xS1c12i8xc00+d+fixcUVkw8ZzCkVEUFVoOZTYJifiKJ0RUj/Ns0+i8
 vLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=tF9TH+2RpUJvoXlWi9oxIj5GEaiM1WLihZa5oRfKdQI=;
 b=xQZP2glYbSMVnoMFgn1cnXWz0l9RluA+Cdtcu7cO9BuevNBxHcfWcX2kNSItgAx03R
 JXCzEcgPAKQq8bCCGphk/RtaGSSijb0yMcbhEo2+CAFRzv7FqADWziVOHiejPRL4gN8U
 XfCRJBHGUSPLIjKu06LVNheJu1Ia3kEKMfYgfNSjzKGDDlnXLHdNuvjEBRkvIq4O3s+/
 oh2PiqrYU9hGSDqSsPWeH1HsuyV6WG1hj74ph3gXmg9LSvBYBe+UT8RDklBS4DzLIcha
 9k+5Mcqq39vEv+wCCOZMc7kjOZ38jOfgtUH+W9J8XK5FlmP2zgzd0Cb/zScfdsF9zV+X
 x5Fw==
X-Gm-Message-State: ACgBeo11nUICMXu47bGX9YwtoEYFo8Mo28woFNzFZTLchXdxQksvZ98q
 pFvyj3M1WUzgo3IuKt1ZqYNuFQ==
X-Google-Smtp-Source: AA6agR7JE5pxUNEiOf/hOl58i2eneyiFhRbfz5GcoLJpC6iSSRqcwqMU/hDNln2euEJ93LshHUjOsg==
X-Received: by 2002:a17:902:eb82:b0:178:2166:fe75 with SMTP id
 q2-20020a170902eb8200b001782166fe75mr8678245plg.31.1662969291723; 
 Mon, 12 Sep 2022 00:54:51 -0700 (PDT)
Received: from john-millikin.com ([2405:6580:98c0:1200:ad49:8eb2:5f01:76d3])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a1709028f8700b001708c4ebbaesm5042751plo.309.2022.09.12.00.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 00:54:51 -0700 (PDT)
Date: Mon, 12 Sep 2022 16:54:47 +0900
From: John Millikin <john@john-millikin.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2] scsi-disk: support setting CD-ROM block size via
 device options
Message-ID: <Yx7lx8I6BQdLYWZM@john-millikin.com>
References: <20220804122950.1577012-1-john@john-millikin.com>
 <CABgObfbKXjXUhNffdcKNTKxHcVcJS2W_nAh=nQeMvb-FPQ7rQw@mail.gmail.com>
 <YxVtWkzEJP7WotRe@john-millikin.com>
 <CABgObfb=nS0MEG2WWA3mu=LqiqJKSFxr0A53fPkYKvT+k10cZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfb=nS0MEG2WWA3mu=LqiqJKSFxr0A53fPkYKvT+k10cZg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=john@john-millikin.com; helo=mail-pj1-x102a.google.com
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

Gentle ping -- is there anything blocking this patch from going in?

It's been about a month now since I sent it, and it's not very big, so I
was hoping it would merge without much difficulty.

If it's breaking a test or something then I'd be happy to take a look
and send a new revision.

On Mon, Sep 05, 2022 at 09:43:20AM +0200, Paolo Bonzini wrote:
> Probably just my screw up, or it broke something when testing... let me
> check.
> 
> Paolo
> 
> Il lun 5 set 2022, 05:30 John Millikin <john@john-millikin.com> ha scritto:
> 
> > I notice this patch wasn't included in the [PULL] series last week, and
> > it isn't present in the `master` branch.
> >
> > Is there anything else I should be doing to get it merged in? Sorry if
> > this isn't a good question, I'm not used to QEMU's email-based change
> > management workflow.
> >
> > On Sat, Aug 20, 2022 at 09:42:25AM +0200, Paolo Bonzini wrote:
> > > No, I had not seen it indeed. Queued now, thanks.
> > >
> > > Paolo
> > >
> > > Il gio 4 ago 2022, 14:39 John Millikin <john@john-millikin.com> ha
> > scritto:
> > >
> > > > SunOS expects CD-ROM devices to have a block size of 512, and will
> > > > fail to mount or install using QEMU's default block size of 2048.
> > > >
> > > > When initializing the SCSI device, allow the `physical_block_size'
> > > > block device option to override the default block size.
> > > >
> > > > Signed-off-by: John Millikin <john@john-millikin.com>
> > > > ---
> > > >  hw/scsi/scsi-disk.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > This is the same diff as sent to qemu-devel@ about a week ago. That
> > > > first email seems to have been eaten by a grue, but replying to it
> > > > worked, so maybe the grue is gone now.
> > > >
> > > > See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
> > > > related discussion about SunOS CD-ROM compatibility.
> > > >
> > > > diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> > > > index f5cdb9ad4b..acdf8dc05c 100644
> > > > --- a/hw/scsi/scsi-disk.c
> > > > +++ b/hw/scsi/scsi-disk.c
> > > > @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev,
> > Error
> > > > **errp)
> > > >      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
> > > >      AioContext *ctx;
> > > >      int ret;
> > > > +    uint32_t blocksize = 2048;
> > > >
> > > >      if (!dev->conf.blk) {
> > > >          /* Anonymous BlockBackend for an empty drive. As we put it
> > into
> > > > @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev,
> > Error
> > > > **errp)
> > > >          assert(ret == 0);
> > > >      }
> > > >
> > > > +    if (dev->conf.physical_block_size != 0) {
> > > > +        blocksize = dev->conf.physical_block_size;
> > > > +    }
> > > > +
> > > >      ctx = blk_get_aio_context(dev->conf.blk);
> > > >      aio_context_acquire(ctx);
> > > > -    s->qdev.blocksize = 2048;
> > > > +    s->qdev.blocksize = blocksize;
> > > >      s->qdev.type = TYPE_ROM;
> > > >      s->features |= 1 << SCSI_DISK_F_REMOVABLE;
> > > >      if (!s->product) {
> > > > --
> > > > 2.25.1
> > > >
> > > >
> >
> >

