Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07056A509
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 16:05:35 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9S8M-0007RD-L3
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 10:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o9S6I-0005BT-S9
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:03:26 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o9S6D-0005Ro-7e
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:03:26 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31c89653790so119746697b3.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OteogE6PGL46MmJLY4qGmLo72qNkonK3qDOWArKUZHk=;
 b=NwS9SbBdizVC+mvLrYz7kSa4ylvvDV4qTClKVCoJBoSrphiw+If/nfamUlfRsG0xh4
 eQep2XcNYJlj4e4Z2Db97HQ1ftzGuF6204yUoxmbHOzxDWa8+uRstu0c8/kLrq/PtZxM
 f7iC9LgMq7A63KPGVpkA2U4l7a5saOOc1JZeOYmbmfJMnVU4A9AlLekEBaE/qV2IDuFo
 Z9fa1A4ehm901SY2d8tTIxDCYp0RBGZkeIXqn4s286hZUV1L5s6UEjcZHWcu/EU4kw/6
 JMqMguhPq5E40vyd4n+fCTtvGT8imIBajjWirh3MvvqsVgG9qAH3FsqnPR1isYtnDLDi
 myoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OteogE6PGL46MmJLY4qGmLo72qNkonK3qDOWArKUZHk=;
 b=VbsbjJAXKG1Ct7/pf0jK7jmakjR488iVZsdKmf4I4MYXS1REe5q3KlxR2/L9aRc6c9
 C4W8cCCTHdCHguHRQ1U7Yh4yUMDqrmIXMXd2faV90lfT+5mWDDjJY3KzeRI19zQI0B2H
 qjdgyDprJ9xJpUGWIFwPgi9qkp9Q2N9MI6OmfLlCuLtLenBq7cz+Y4yjcxIon104TbvS
 fdtYXp28Q9M/7fXMCb1rXNBIZaOQs+ewt1Y4iiMRq7/eX8BBNUQqXziElRZppnXGvElu
 W9uueowDFZZ5Hf/Ej7JsBHS89ofeq+uu5yk2pX/S8wRpw3ERtkGZdNAoHVMdmIpm8vAc
 wZhQ==
X-Gm-Message-State: AJIora+Av2EXq7FEhGTtTSOhn+5uAhXrSAmY7eGOxCsT172ITY/t64+N
 RIxUaOkbXXhIQ04gVThwnzbkWxmp458L79PCNuo=
X-Google-Smtp-Source: AGRyM1uXdzM6TeFV+P6ikeGC5mI8mwT0K6wHsVcnks6AHELEPKL6etBOkdzzSPq+6dxc2ii45rqu2cEg5ZPuGWa7IBA=
X-Received: by 2002:a81:1a05:0:b0:31c:83fa:15de with SMTP id
 a5-20020a811a05000000b0031c83fa15demr30691483ywa.111.1657202598149; Thu, 07
 Jul 2022 07:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain> <87fsjdjayh.fsf@linaro.org>
In-Reply-To: <87fsjdjayh.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 7 Jul 2022 15:03:06 +0100
Message-ID: <CAJSP0QVDEKn9MHu431q8Qdy+z73MSoGR5DCRMir9xEndZZqnQA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] virtio-gpio and various virtio cleanups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 7 Jul 2022 at 14:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>
> > [[PGP Signed Part:Undecided]]
> > On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=C3=A9e wrote:
> >> Hi,
> >>
> >> This series ostensibly adds virtio-user-gpio stubs to the build for
> >> use with an external vhost-user daemon. We've been testing it with our
> >> rust daemons from:
> >>
> >>   https://github.com/rust-vmm/vhost-device
> >>
> >> Getting the test enabled took some doing most likely because the need
> >> for CONFIG support exercised additional paths in the code that were
> >> not used for the simpler virtio-net tests. As a result the series has
> >> a number of cleanup and documentation patches.
> >>
> >> The final thing that needed fixing was the ensuring that
> >> VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiation
> >> process. This was the hardest thing to track down as we store the
> >> feature bits in several places variously as:
> >>
> >>   in VirtIODevice as:
> >>     uint64_t guest_features;
> >>     uint64_t host_features;
> >>     uint64_t backend_features;
> >
> > None of these know about VHOST_USER_F_PROTOCOL_FEATURES and vhost-user'=
s
> > unfiltered feature bits should never be passed to VirtIODevice.
> >
> >>
> >>  in vhost_dev as:
> >>     uint64_t features;
> >>     uint64_t acked_features;
> >>     uint64_t backend_features;
> >
> > I don't think these should know about VHOST_USER_F_PROTOCOL_FEATURES
> > either. AFAIK vhost_dev deals with VIRTIO feature bits, not raw
> > vhost-user GET_FEATURES.
>
> So where does VHOST_USER_F_PROTOCOL_FEATURES get set before it's set
> with the VHOST_USER_SET_FEATURES message? Currently it's fed via:
>
>     uint64_t features =3D vhost_dev->acked_features;
>
> in vhost_dev_set_features() which does apply a few extra bits
> (VHOST_F_LOG_ALL/VIRTIO_F_IOMMU_PLATFORM). Maybe it should be adding
> VHOST_USER_F_PROTOCOL_FEATURES here? How should it be signalled by the
> vhost-user backend that this should be done? Overload the function?

A modern vhost-user server replies to VHOST_USER_GET_FEATURES with
VHOST_USER_F_PROTOCOL_FEATURES set. That's when the vhost-user client
encounters this bit.

The vhost-user client should then filter out
VHOST_USER_F_PROTOCOL_FEATURES because it belongs to the vhost-user
protocol and isn't a real VIRTIO feature bit. The client uses the
filtered VIRTIO feature bits and it now knows whether the vhost-user
server supports the VHOST_USER_GET_PROTOCOL_FEATURES and
VHOST_USER_SET_PROTOCOL_FEATURES messages.

I think vhost_user_set_features() should set
VHOST_USER_F_PROTOCOL_FEATURES if the server returned it from
VHOST_USER_GET_FEATURES. At the moment vhost_user_backend_init()
stores VHOST_USER_F_PROTOCOL_FEATURES in struct
vhost_dev->backend_features, which only seems to be used by vhost-net
code.

The other vhost-user devices set acked_features =3D guest_features and
ignore backend_features. As a result I guess they don't set
VHOST_USER_F_PROTOCOL_FEATURES in the VHOST_USER_SET_FEATURES message.
Most vhost-user servers probably don't care and still respond to
VHOST_USER_GET_PROTOCOL_FEATURES and VHOST_USER_SET_PROTOCOL_FEATURES
messages (although the vhost-user protocol spec mentions other
protocol differences when VHOST_USER_F_PROTOCOL_FEATURES is not
negotiated).

Does this match what you've found? The code is a maze so I may have
gotten something wrong. In general I think hw/virtio/vhost-user.c
should be responsible for VHOST_USER_F_PROTOCOL_FEATURES and no other
part of the QEMU codebase should ever see the bit since it's a
vhost-user protocol detail and not part of VIRTIO or even a common
part of vhost.

Stefan

