Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73777584363
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:42:51 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5f0-00010h-4V
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oH5bK-0005XJ-4N
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:39:02 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oH5bI-0007pX-Bi
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:39:01 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ef5380669cso23404697b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Di0grPF1seMpXylS1+G2vQHA4Il0bgTLgKHvwVL3Yqs=;
 b=W089mdqXUUalNqmcTx7SmlS9LOlisc+j+VlJKMBUPpVTDIiBU+/KX+TK/ij+0VGayB
 +tqdJEZPhCj8df2UuctHRTzZbr8JVk1/tUv5crK4+KkJIssQgDbx2uWghLrxsPmz1eoP
 jIU9tH430lqX3Os+KanBbggZ/Th1GRPdrvbq1m1QxyQNryJVHdD92Bpt8AkGr1FQvnYd
 thMhxS7ofBs+MC7TtjDskePPQOLe1sCSlF8zWYpDtOi1ssyEjF0e9NPPlMwyUg42/CuA
 knqe4UzQCTXN0I9X62qm/uYm0eQnbQ1koN0PbxYmLCqHiLKzfp0+9Fr/WFXY+WjDjXFo
 eRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Di0grPF1seMpXylS1+G2vQHA4Il0bgTLgKHvwVL3Yqs=;
 b=X4O0zLqZY4PqjA4bMTjYd/sjU/Pt/C43CD76do3fJMp8uYRz+ne7+d112k4tCkC4OT
 jzaf9ge0yBCnj3bNq9AtMEpuAfwybZFHZEFWDl7yL62Eblz9aij5ruyukt0Two2s8Eb1
 Y4zCJ9xddHyCFqH+MUJpLgRkNAq28YGvKpUpmDfsMgloJClmXzYu9ASrEK9WifeZ+Zzv
 iZLzzBifgRYiANW7GN/0/v19VYtciy769umUlNkQGaoiNYfskMJtitRsxchprhaA3MqX
 rIscPZ9DHYqoL5I2nhGU3g6Sf2an6fw6XOwVTsOLsP8Pl5v5W86DuG+OQB7xgTf3MrSU
 ztkA==
X-Gm-Message-State: AJIora+OmJIib/9IKYolQSfNBARqUlIMIIF/gQZ3JNxC+VGWiWh/mqhA
 Qz5PqnPtfp3eY1qnEVnf9c45vFYO/u1LjXJNdsI=
X-Google-Smtp-Source: AGRyM1uDf2qPdcN1d5iU/bhdp7R/JwVXlsg9pQK6mqhBm7b2XbOop6Khou2xZUPFENLW7phwTE1ftO/YFCMIgfsYxbw=
X-Received: by 2002:a81:8746:0:b0:31d:c5a6:ad8f with SMTP id
 x67-20020a818746000000b0031dc5a6ad8fmr24217347ywf.206.1659022739041; Thu, 28
 Jul 2022 08:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
 <YuDmwhKBpllXNG1i@apples>
 <CAJSP0QVzhvQ4zeS5BemoxYahuWfMY-Yqt9P+O=uxGVayM8Ms3A@mail.gmail.com>
 <6DB3F56B-0C33-4C13-8AD9-07144B36CB63@ict.ac.cn>
In-Reply-To: <6DB3F56B-0C33-4C13-8AD9-07144B36CB63@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 28 Jul 2022 11:38:46 -0400
Message-ID: <CAJSP0QWVOLw76g=1mc3EN+_eo9YJ9yJO9Hzv8K7TUbxkn4_Uyg@mail.gmail.com>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel <qemu-devel@nongnu.org>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000008f15b05e4df5547"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000008f15b05e4df5547
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022, 11:34 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> at 11:18 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > I think that is incorrect. QEMU has guest notifier emulation for the
> > non-KVM (and non-MSI-X PCI) cases. When there is no irqfd support
> > available, QEMU sets up a regular eventfd and calls
> > virtio_queue_guest_notifier_read() when it becomes readable.
>
> Thanks Stefan. I finally understand why there is a `with_irqfd` parameter
> for virtio_queue_set_guest_notifier_fd_handler.
>
> But if `with_irqfd` is false, it seems OK to directly call virtio_irq().
> Why
> still bother using an eventfd? Is it for interrupt batching?
>

virtio_irq() is not thread safe so it cannot be called directly from the
IOThread. Bouncing through the eventfd ensures that the virtio_irq() call
happens in the QEMU main loop thread with the BQL held.

It may be cheaper to use a BH instead of an eventfd when irqfd is not
available, but this is a slow path anyway. We might as well reuse the
eventfd code that's already there.

Stefan

>

--00000000000008f15b05e4df5547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jul 28, 2022, 11:34 Jinhao Fan &lt;<a href=3D"=
mailto:fanjinhao21s@ict.ac.cn">fanjinhao21s@ict.ac.cn</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">at 11:18 PM, Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@gmail.com" target=3D"_blank" rel=3D"noreferrer">stefanh=
a@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I think that is incorrect. QEMU has guest notifier emulation for the<b=
r>
&gt; non-KVM (and non-MSI-X PCI) cases. When there is no irqfd support<br>
&gt; available, QEMU sets up a regular eventfd and calls<br>
&gt; virtio_queue_guest_notifier_read() when it becomes readable.<br>
<br>
Thanks Stefan. I finally understand why there is a `with_irqfd` parameter<b=
r>
for virtio_queue_set_guest_notifier_fd_handler.<br>
<br>
But if `with_irqfd` is false, it seems OK to directly call virtio_irq(). Wh=
y<br>
still bother using an eventfd? Is it for interrupt batching?<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">virtio_irq() is=
 not thread safe so it cannot be called directly from the IOThread. Bouncin=
g through the eventfd ensures that the virtio_irq() call happens in the QEM=
U main loop thread with the BQL held.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">It may be cheaper to use a BH instead of an eventfd when irqf=
d is not available, but this is a slow path anyway. We might as well reuse =
the eventfd code that&#39;s already there.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Stefan=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000008f15b05e4df5547--

