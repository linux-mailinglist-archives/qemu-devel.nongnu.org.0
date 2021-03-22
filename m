Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E13438C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:49:26 +0100 (CET)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lODRN-0007eF-0A
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lODQM-00079N-HH; Mon, 22 Mar 2021 01:48:22 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lODQK-0006Sw-P3; Mon, 22 Mar 2021 01:48:22 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id z1so5322479ybf.6;
 Sun, 21 Mar 2021 22:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbkMMSTrhZJ63IVNAym0gPAKU7Q4rG7/TthZrg0Zgkc=;
 b=XKdmLOMqRDad/ksqErej3ZFLQPk/D4wygm2x4hmz6WxnIjiB4vr3H6X0+ciwag3uV+
 NMJ0RHxMjRkTm8osq/8jOgEvvCYdGYmS/g/5cHeWWmnAqD0eYZ7QktOUn5pElAHWfFdu
 /mO4kHMW/W9HNBVbYS7BHHqR3gQ0bqCxRfRri+TYsPs2ET7ml2c/phuVxx3IhKgBMxvy
 rhydMlCDGRuMDpa7oZyqruyVybM3XoTxdbevzVeqhTF9+qzfyl/37C9Tjf7GIQGspueH
 rbou+XvyLEI3mB2IqPfD33oz/b98yU4uheR/UJaltS4By++GBkOVyPyCmcVd2C2l0QDu
 oxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbkMMSTrhZJ63IVNAym0gPAKU7Q4rG7/TthZrg0Zgkc=;
 b=Hp+zbF3AwJV60OX8hyxPKefMJXnGHypqR7WtNRU4IPdwxyCXU7jvChgdBE7A2sqnSL
 N01PTN3PwjED2PtJwcgXq/sem/MwOkYmLnoGx9IdUyNt/dtgDyrRZGspuMDn5atdJkua
 mqOK0bNK18WMEkj2QXn0IUKvV2v5tpq2MBdcX+cP29bZVLqHoPaoAuTVmrg58denPXEY
 SmvsoBizG2s5lZoI9a26QC2HizfDdsJ6AuoC5a7yUUI2c40Vb2BY5UYLxzArNO7s6E38
 9dtS+JPAnko7Ies2QfgnIFe3YlCnjVW766SY43lV0AZXDcpp95GhDT05j1vLB12AL5J2
 EqeA==
X-Gm-Message-State: AOAM531tP3IFGMRQlEjy2wkg/ldGRDcWgU/UALw5RooTq1oNg0B4j2Hu
 ihrzbobgYLkM4Sd1V3NS1jRsSy6b/4918P5ZBTY=
X-Google-Smtp-Source: ABdhPJzIYBqMLNk31hwFQylOy+QQhK+5Pcah6ZmzG1PVUkc6zZ92PS8io2yAsDJI901aTXTcqlicFZPoo5tFPfC3EBQ=
X-Received: by 2002:a25:ed0a:: with SMTP id k10mr23280257ybh.152.1616392099241; 
 Sun, 21 Mar 2021 22:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
 <YFgNZFAKjVhder2R@yekko.fritz.box>
 <CAEUhbmV4=yz1Df9YDxsM1Evjd4dJA2rM8xoiSUvxEtOoL2z2xg@mail.gmail.com>
 <YFgoXU8tRCKWd0pk@yekko.fritz.box>
In-Reply-To: <YFgoXU8tRCKWd0pk@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 13:48:07 +0800
Message-ID: <CAEUhbmUrJYx-yOyVTVOV4M-+9gS5VtaSbTzMzvHVTvDqEkb8Lg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Mon, Mar 22, 2021 at 1:24 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Mon, Mar 22, 2021 at 12:33:06PM +0800, Bin Meng wrote:
> > Hi David,
> >
> > On Mon, Mar 22, 2021 at 12:11 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> > > > As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> > > > min_frame_len should excluce CRC, so it should be 60 instead of 64.
> > >
> > > Sorry, your reasoning still isn't clear to me.  If qemu is not adding
> > > the CRC, what is?
> >
> > No one is padding CRC in QEMU. QEMU network backends pass payload
> > without CRC in between.
>
> Ok, but the CRCs must be added if the packets are bridged onto a real
> device, yes?  Where does that happen?

I've never used it like that before. What's the command line to test that?

> >
> > > Will it always append a CRC after this padding is complete?
> >
> > No.
>
> If that's true, then won't the packets still be shorter than expected
> if we only pad to 60 bytes?

In QEMU packets are transmitted without CRC between network backends,
and when a NIC receives a packet, the minimum required payload length
is 60 bytes without a CRC.

Regards,
Bin

