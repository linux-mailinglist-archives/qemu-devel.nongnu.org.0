Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B315544E0E0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:41:26 +0100 (CET)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlNRN-0000xy-Aj
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlNQL-0000Av-Md
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mlNQH-0007fR-JW
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636688416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOvStpvh2o3RHAwopsigUNKxWZBhWRmAIhlDpbEy1aw=;
 b=AricLOYSu22QMaCx886ae8SqSLqNtA5lVLhiCSexs8SqC1Amm3dTaVJKe9JBH8K7w8iD7D
 gE87z4HO8pvFp2by+9rwlOrpDvzrbkGB1yCv2jTAikNUDp5zIe534/XQmr8LS5se5Fe9Fl
 1mKYONjdA0KX9aDie76T7GGlPgl2T6c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-QDM49UhLP9unwLOKDxC4oQ-1; Thu, 11 Nov 2021 22:40:11 -0500
X-MC-Unique: QDM49UhLP9unwLOKDxC4oQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 f15-20020a056512228f00b004037c0ab223so3279234lfu.16
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 19:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QOvStpvh2o3RHAwopsigUNKxWZBhWRmAIhlDpbEy1aw=;
 b=KkI7g71fIJTYIYSVDBb1SCN3kdRFjhnOYhaDNSGWIMTIZphn5p6OFl230Gb0b1zZZY
 Om3tI/OZX1y9f5Egkg1Qe7KOcyn4Z2FS4IJxz89+QCVN9u1fNq91TukCTtnx85Rn8a32
 iWXa4xRgDTgISNtx3EN9IWjHdqtJR28ni4n3tunSXmP41TyB9E8rSaY1PrLwC3fKeU0x
 lbpBIKKnqydlyPAMYMKivrt80d0w9mZdnM+Cs8l8kiX5WcSftAD73CO8nlj7hAJc4Cf6
 KlRkAgx9Pz/uuwJGI5y6A8kDFF1ZuUwVqz01go7CpwY5SmitRvLe9rBGgtVqmAEbAgY0
 o1Vw==
X-Gm-Message-State: AOAM530xlPp61crMeghrq8/tPF5inMLO8zNdfVCZW64/pZwNvPn5d8Bv
 vzJVfXUj4I12z80VuaO/jDPZjmgn7kH4WdPGtkcUKRpkh8o4h3WYd6AQ5lkh/4lOTS54i1ROWyb
 hdeJ0/xFjKXmB1iC+fXrrPhEGuIyYKZ4=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr11392983lfe.84.1636688410276; 
 Thu, 11 Nov 2021 19:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBz2ZakbDpZ3TN9P+12CDRGF7eBqzcZhmEJnbnpyUfkFg534eBCETmo3f2YXvY28+9ciRhnyCaKDLQQgkCW9g=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr11392961lfe.84.1636688410028; 
 Thu, 11 Nov 2021 19:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20211104164827.21911-1-lulu@redhat.com>
 <YYkBkGdlpeer18e9@stefanha-x1.localdomain>
 <00d446c0-b5a0-9477-4e63-fc4b768a6f92@redhat.com>
 <YYzgpa8rkaywN8pW@stefanha-x1.localdomain>
In-Reply-To: <YYzgpa8rkaywN8pW@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 12 Nov 2021 11:39:59 +0800
Message-ID: <CACGkMEte6cu1ox3SkLiLCj71cf+Jnaa67seKy3TtNUqg3JCSCQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 5:22 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Thu, Nov 11, 2021 at 12:41:02PM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2021/11/8 =E4=B8=8B=E5=8D=886:53, Stefan Hajnoczi =E5=86=99=
=E9=81=93:
> > > On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
> > > > these patches add the support for configure interrupt
> > > >
> > > > These codes are all tested in vp-vdpa (support configure interrupt)
> > > > vdpa_sim (not support configure interrupt), virtio tap device
> > > >
> > > > test in virtio-pci bus and virtio-mmio bus
> > > Hi,
> > > vhost-user has a configuration space change notification but it uses =
a
> > > slave channel message (VHOST_USER_SLAVE_CONFIG_CHANGE_MSG) instead of=
 an
> > > eventfd. Ideally the vhost kernel ioctl and vhost-user interfaces wou=
ld
> > > follow the same design.
> > >
> > > I'm concerned "common" vhost code is going to end up with lots of
> > > callbacks that are not available uniformly across vhost kernel, vdpa,
> > > and vhost-user. That makes it hard to understand and debug vhost, plu=
s
> > > differences make it harder to to correctly extend these interfaces in
> > > the future.
> > >
> > > Is the decision to a new eventfd-based interface instead of
> > > vhost_chr_read/write() deliberate?
> >
> >
> > I think this is a good question. Here're some reasons for using eventfd=
 from
> > the kernel perspective:
> >
> > 1) the eventfd is used for relaying interrupts for vqs, so we choose to=
 use
> > that for the config interrupt
> > 2) make it possible to be used for irq bypassing (posted interrupt)
>
> Interesting point. Posted interrupts aren't supported by vhost-user's
> slave channel message. Since configuration change notifications are rare
> it's probably not a performance problem, but still.

Yes.

>
> This makes me think vhost-user's approach is sub-optimal, it should have
> been an eventfd :(. Maybe the idea was that a slave message is less
> complex than adding an additional interface to set a configuration
> change notification eventfd.

I agree.

>
> Let's not worry about it too much. I guess in the long run vhost-user
> can be rebased on top of the vDPA kernel interface (I wrote about that
> here:
> https://blog.vmsplice.net/2020/09/on-unifying-vhost-user-and-virtio.html)=
.

Interesting blog, I think this is a good direction we might go. A full
"transport" of virtio instead of just the datapath offloading.

Thanks

>
> Stefan


