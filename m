Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335453B9BA0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:46:07 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzB42-00007n-3z
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzB20-0006oR-Gq
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:44:00 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzB1x-0007Qp-JJ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:44:00 -0400
Received: by mail-yb1-xb31.google.com with SMTP id c8so14493830ybq.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=25oPV1E3z6GVGaVvHTTJ4OU/umxGgLpB7Qf9EeL4ew4=;
 b=iuz3nuSQlJZ8Eqg87/oaf2vPsw3Hc+OnPcfv0NMYTLRDIVRzmtNUd6BodhCNPycCwD
 TOpDhfeYpnwyH4PWtWBsv9XVyo+4q+LjE2bJ2cBntEyevzJbP/QBsQLSKG/NZ1J397eR
 OriaNO9gplFkA9dSQpT2/1nt+R5l2zeqq11k8r4z6GD62tj9yxw+zBQ0yUPH07lKDzzi
 Z6/pzuj2PVLhB5OKyA+hVlVRhAuzkBLs6kxRzyH9stexJvlKjjslRFPOIWHBBWGGf7dj
 EdavK8Ocobn9HsfCk9BkxWkUy+2ET+WjeVIuqPwfOW912WPmn0SbByMXft7o+tsJxa9P
 sgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=25oPV1E3z6GVGaVvHTTJ4OU/umxGgLpB7Qf9EeL4ew4=;
 b=aqOvxCtKVakRWZe+l57Upg/dEirlTQSMBnZx60eqcVbr8sJ+jNpk3zr3/xq0Oe+JrA
 TLziQdsnhCBmgNDJvyth1pgOyZzsIleiYsJ+KUCRYoWvwG/ORrwwoFX1KzgTNTcW3l8T
 wO9RtpljuqySzNxRk9aLBw/QlaD10Xyx1t1HlnAZzOk/1esXxI9BLva8B0x4+Pds1xCG
 TKl7pxpCCopBrh8up/Iw/Q1cNuFr3Ql/H2aXJRuF5HidbG8kEW4F+JxYBZeCiDl+4rRQ
 vvAytK97ej49eAi0F6LMBK/jegunMcRvwnIMFtQBjaa5mPcarqM5HDk2zrkbgBIzZzCU
 hy3g==
X-Gm-Message-State: AOAM533y9NHPj7nCy79mN45AhvpwYPvQLU18lJs5XYHJI8g/xjQKVkK0
 B1npiF5c48d85oFBh6es2aPL4N2DAuDtZrYQsQ8=
X-Google-Smtp-Source: ABdhPJyyLAgENNQMHYSBvhuZXumBHGqZfnZOKW6RyA+e7fduRGrF4sfbP9cBnigOhc1dywShyo6X1CDSGJ85bl9Sch4=
X-Received: by 2002:a25:be09:: with SMTP id h9mr4621074ybk.239.1625201036216; 
 Thu, 01 Jul 2021 21:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210701094651.1258613-1-bmeng.cn@gmail.com>
 <20210701094651.1258613-2-bmeng.cn@gmail.com>
 <005fb7e4-c73b-41f2-a42c-3f416d3508cf@redhat.com>
In-Reply-To: <005fb7e4-c73b-41f2-a42c-3f416d3508cf@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Jul 2021 12:43:44 +0800
Message-ID: <CAEUhbmWcQRP4mH6DQcjx_Wv=d=EcdJzdhWYgQJYXY9MV6YGUJQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/net: e1000e: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 2, 2021 at 11:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/7/1 =E4=B8=8B=E5=8D=885:46, Bin Meng =E5=86=99=E9=81=93:
> > From: Christina Wang <christina.wang@windriver.com>
> >
> > The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> > the manual and real hardware.
> >
> > While Linux e1000e driver always writes VET register to 0x8100, it is
> > not always the case for everyone. Drivers relying on the reset value
> > of VET won't be able to transmit and receive VLAN frames in QEMU.
> >
> > Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
> > to cache the value of VET register, but the cache only gets updated
> > when VET register is written. To always get a consistent VET value
> > no matter VET is written or remains its reset value, drop the 'vet'
> > field and use 'core->mac[VET]' directly.
> >
> > Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> > Signed-off-by: Christina Wang <christina.wang@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >   hw/net/e1000e_core.h |  2 --
> >   hw/net/e1000e.c      |  6 ++----
> >   hw/net/e1000e_core.c | 11 ++++++-----
> >   3 files changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> > index 4ddb4d2c39..07d722bc68 100644
> > --- a/hw/net/e1000e_core.h
> > +++ b/hw/net/e1000e_core.h
> > @@ -105,8 +105,6 @@ struct E1000Core {
> >       uint32_t itr_guest_value;
> >       uint32_t eitr_guest_value[E1000E_MSIX_VEC_NUM];
> >
> > -    uint16_t vet;
> > -
> >       uint8_t permanent_mac[ETH_ALEN];
> >
> >       NICState *owner_nic;
> > diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> > index a8a77eca95..1797e4a7cb 100644
> > --- a/hw/net/e1000e.c
> > +++ b/hw/net/e1000e.c
> > @@ -602,8 +602,8 @@ static const VMStateDescription e1000e_vmstate_intr=
_timer =3D {
> >
> >   static const VMStateDescription e1000e_vmstate =3D {
> >       .name =3D "e1000e",
> > -    .version_id =3D 1,
> > -    .minimum_version_id =3D 1,
> > +    .version_id =3D 2,
> > +    .minimum_version_id =3D 2,
> >       .pre_save =3D e1000e_pre_save,
> >       .post_load =3D e1000e_post_load,
> >       .fields =3D (VMStateField[]) {
> > @@ -645,8 +645,6 @@ static const VMStateDescription e1000e_vmstate =3D =
{
> >           VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
> >                                E1000E_MSIX_VEC_NUM),
> >
> > -        VMSTATE_UINT16(core.vet, E1000EState),
>
>
> This is not the suggested way. We'd better not bump version in this case.
>
> How about update vet during post_load?

But core.vet is removed in this patch. Not sure how to handle this?

Regards,
Bin

