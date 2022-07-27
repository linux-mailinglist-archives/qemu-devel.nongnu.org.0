Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A677858297A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:46904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiqK-0003eN-Lf
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGio2-0001k6-5E
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:18:38 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGinr-0003u3-8y
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:18:37 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31f64093c21so20177817b3.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mZkre0S3ymD4HMg+YenL876ZuL42lUPGx7aRb/bqTQI=;
 b=ER3sbIeUSk36589MSX5AOI4mA/2iP9qgEamMTUGF2Cbj3j8W8ktG+oua6Aeor3PpDw
 vuMqqvfvOeG6UY1WG3zuXLD57pA1SBqmoo057LEAwYVxYun2Lp2EAc4533RxbQNDk/DC
 DOBtIsVaYrCm0YMBScYeq9TM5oWICh6zIRheSjcgMZ+K15J2FXbBaQT6U8mYFTVkzMNj
 bo/fCHKJVpcYc4FM1lexwKscag6hIrxmh+JH2fdf9aUI0pXcCo9fc6tcUTtnmFR6lOzN
 YF61bKdFR35dIFxtf5sIYJKHJClL8fkyx/hEW0C4l7ROmAds8/jzUP8iR/J2Q8v800EO
 tqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mZkre0S3ymD4HMg+YenL876ZuL42lUPGx7aRb/bqTQI=;
 b=jnViE8Lr1peyuPWtt3LT3vHp97I+XxgMV8mL26hhGkDzs840l2fZJ4dpZcJUJjWYaN
 rRdy+BaEFgXVgkuC9LoytFJabWXMjKfSXJs9DFuOVpBLC/Q/92PF4OZYaQX9TI4RRmuq
 tWuFAC8ivLYBo7M3spt9BMsJ/agt4KA7ip4zXby5ViWGEMI+8uv1HpPUFeMDoyV840SQ
 z2UfEru6iCM2riTcKJ2IJn7Ptlp/2YZVvMiXnjPWi7twYAy7Fdm7WAzNeTfgOR87+CCr
 MVFeyqihH8fkB1HXp1PM15UcpkCyxQ2yNTyf2OWCy2C2UebraAsFBpnaZNctsWwvVv6D
 t17g==
X-Gm-Message-State: AJIora/Uu/tpiaD4VFZmhHRk9MtUFhg2qkwXn1d+D5/Pr8oPZ3jqdlID
 ANSYka5wH+7b6SNWkfSikdRYu4jVlZ6eUh1TV5Q=
X-Google-Smtp-Source: AGRyM1t+u23RHGpuGtPR0A+IjMedQ3wLxWHRD5mYmwieUoKCc0Xr1Q9uSob4OgA3WwON8PoGDrFexzo8cDHVrjCOY1w=
X-Received: by 2002:a81:d45:0:b0:31f:65a4:27ba with SMTP id
 66-20020a810d45000000b0031f65a427bamr2276229ywn.239.1658935106168; Wed, 27
 Jul 2022 08:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
 <YuDmwhKBpllXNG1i@apples>
In-Reply-To: <YuDmwhKBpllXNG1i@apples>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 11:18:14 -0400
Message-ID: <CAJSP0QVzhvQ4zeS5BemoxYahuWfMY-Yqt9P+O=uxGVayM8Ms3A@mail.gmail.com>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel <qemu-devel@nongnu.org>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, 27 Jul 2022 at 03:18, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Jul 21 09:29, Stefan Hajnoczi wrote:
> > On Wed, Jul 20, 2022, 22:36 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
> >
> > > Hi Stefan,
> > >
> > > Thanks for the detailed explanation!
> > >
> > > at 6:21 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > > Hi Jinhao,
> > > > Thanks for working on this!
> > > >
> > > > irqfd is not necessarily faster than KVM ioctl interrupt injection.
> > > >
> > > > There are at least two non performance reasons for irqfd:
> > > > 1. It avoids QEMU emulation code, which historically was not thread=
 safe
> > > and needed the Big QEMU Lock. IOThreads don't hold the BQL and theref=
ore
> > > cannot safely call the regular interrupt emulation code in QEMU. I th=
ink
> > > this is still true today although parts of the code may now be less r=
eliant
> > > on the BQL.
> > >
> > > This probably means we need to move to irqfd when iothread support is=
 added
> > > in qemu-nvme.
> > >
> >
> > Yes. You can audit the interrupt code but I'm pretty sure there is shar=
ed
> > state that needs to be protected by the BQL. So the NVMe emulation code
> > probably needs to use irqfd to avoid the interrupt emulation code.
> >
> >
> > > > 2. The eventfd interface decouples interrupt injection from the KVM
> > > ioctl interface. Vhost kernel and vhost-user device emulation code ha=
s no
> > > dependency on KVM thanks to irqfd. They work with any eventfd, includ=
ing
> > > irqfd.
> > >
> > > This is contrary to our original belief. Klaus once pointed out that =
irqfd
> > > is KVM specific. I agreed with him since I found irqfd implementation=
 is in
> > > virt/kvm/eventfd.c. But irqfd indeed avoids the KVM ioctl call. Could=
 you
> > > elaborate on what =E2=80=9Cno dependency on KVM=E2=80=9D means?
> > >
> >
> > "They work with any eventfd, including irqfd"
> >
> > If you look at the vhost kernel or vhost-user code, you'll see they jus=
t
> > signal the eventfd. It doesn't have to be an irqfd.
> >
> > An irqfd is a specific type of eventfd that the KVM kernel module
> > implements to inject interrupts when the eventfd is signaled.
> >
> > By the way, this not only decouples vhost from the KVM kernel module, b=
ut
> > also allows QEMU to emulate MSI-X masking via buffering the interrupt i=
n
> > userspace.
> >
> >
>
> The virtio dataplane (iothread support) only works with kvm if I am not
> mistaken, so I guess this is similar to what we want to do here. If we
> dont have KVM, we wont use iothread and we wont use the kvm
> irqchip/irqfd.
>
> Am I understanding this correctly?

I think that is incorrect. QEMU has guest notifier emulation for the
non-KVM (and non-MSI-X PCI) cases. When there is no irqfd support
available, QEMU sets up a regular eventfd and calls
virtio_queue_guest_notifier_read() when it becomes readable.

Stefan

