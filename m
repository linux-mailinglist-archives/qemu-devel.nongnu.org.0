Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5246908A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 07:51:52 +0100 (CET)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu7qo-0000vg-T4
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 01:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mu7oq-0008CC-Tu
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mu7oa-0003jo-2v
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638773370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuBJaH/m/URWuCIfneKTFOwvRaG4yASWdzMhDvinf0Q=;
 b=IZvYkcZHzA2EwjPt8YXKhEkoRZbwzgnK/IA2QWVfYFmD4scs0CNehblclAVh3dCUxeXBtR
 L7TSFtG+mfjbitd365cBZncgax0swYqST4jlu6vfmT2wBVimcl9v/ux14vCoCb7fZDxKHq
 bfQD24w2klyC2jrwCB4YevbN3jOjvts=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-8KLwZjZqNr-smLA-zUAmow-1; Mon, 06 Dec 2021 01:49:28 -0500
X-MC-Unique: 8KLwZjZqNr-smLA-zUAmow-1
Received: by mail-lf1-f72.google.com with SMTP id
 m2-20020a056512014200b0041042b64791so3480408lfo.6
 for <qemu-devel@nongnu.org>; Sun, 05 Dec 2021 22:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RuBJaH/m/URWuCIfneKTFOwvRaG4yASWdzMhDvinf0Q=;
 b=MjKcrRaxomXuuiufD2q33ND4lEZvZN4rzKrJT2Au6eOBxeDrAc90+KRu7OnEzejbuV
 Q13T8rfxWxR7JvJLfX46z9ghPohild1u3BJJsPXME6VqJ7kb35b3lGxmNKgQzT4Bbobm
 5dwNbJ8bOEPj98YR7eUT5jutsT4P1C2IX4EfuvBHuSCswsQVV5Pf70SwQej5vib5cl1M
 f3NVdGLdZF4+FTsroor1jk9g1yd6FRfSFPkz2e8IotEieFB7/3HIp9xWZjjOIyFe49wU
 W34jj8fyIn7npZgJU5hOax9cbN4x7AIfVP5vtaHz1urEVuFjX/FrQi8EHFxyPUdd0f6x
 SrFQ==
X-Gm-Message-State: AOAM5315yoFpgAl27p+pSjOjOTXUO4p3m/6ioZJVjkPodnoCeh5eijz4
 z0SmH0RMV77UhLtrtVLuX42KKkG3oJ1y86v+UsF7Yi4SKM7tSTC7yLC5d8KsIhq5YDYgfELcs/C
 /gW+oZTNieDKNpvhiw9Qy/iwaU3iuLDA=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr33436818lfr.348.1638773367145; 
 Sun, 05 Dec 2021 22:49:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUXaT/Yo8QGRh+FYz4O4MNGUjHChz2t9STdrOHy1IKTX1iMrh7ClRvdgDQ2EhmWB1JAavxzKBU9Vyx9CBaUyA=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr33436798lfr.348.1638773366906; 
 Sun, 05 Dec 2021 22:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
 <YanJkBiLtxzt04Hn@xz-m1.local>
 <e5d91ce70d40caa4d91e29d2227ad72ccf1a1bb6.camel@infradead.org>
 <YaoKHPR/SiRoAteV@xz-m1.local>
In-Reply-To: <YaoKHPR/SiRoAteV@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Dec 2021 14:49:16 +0800
Message-ID: <CACGkMEsg_7Tzsik71t_W4VZU+TwKTPzA0LZjPwO-xHxxHx_-SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA
 translation
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 3, 2021 at 8:14 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Dec 03, 2021 at 10:46:46AM +0000, David Woodhouse wrote:
> > On Fri, 2021-12-03 at 15:38 +0800, Peter Xu wrote:
> > > On Thu, Dec 02, 2021 at 11:49:25AM +0800, Jason Wang wrote:
> > > > On Thu, Dec 2, 2021 at 4:55 AM David Woodhouse <dwmw2@infradead.org=
> wrote:
> > > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > > >
> > > > > By setting none of the SAGAW bits we can indicate to a guest that=
 DMA
> > > > > translation isn't supported. Tested by booting Windows 10, as wel=
l as
> > > > > Linux guests with the fix at
> > > > > https://git.kernel.org/torvalds/c/c40aaaac10
> > > > >
> > > > >
> > > > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > > > ---
> > > > >  hw/i386/intel_iommu.c         | 14 ++++++++++----
> > > > >  include/hw/i386/intel_iommu.h |  1 +
> > > > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > > > index 294499ee20..ffc852d110 100644
> > > > > --- a/hw/i386/intel_iommu.c
> > > > > +++ b/hw/i386/intel_iommu.c
> > > > > @@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMM=
UState *s)
> > > > >      uint32_t changed =3D status ^ val;
> > > > >
> > > > >      trace_vtd_reg_write_gcmd(status, val);
> > > > > -    if (changed & VTD_GCMD_TE) {
> > > > > +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
> > > > >          /* Translation enable/disable */
> > > > >          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
> > > > >      }
> > > > > @@ -3100,6 +3100,7 @@ static Property vtd_properties[] =3D {
> > > > >      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mo=
de, FALSE),
> > > > >      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalabl=
e_mode, FALSE),
> > > > >      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, tr=
ue),
> > > > > +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_tra=
nslation, true),
> > > > >      DEFINE_PROP_END_OF_LIST(),
> > > > >  };
> > > > >
> > > > > @@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
> > > > >      s->next_frcd_reg =3D 0;
> > > > >      s->cap =3D VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
> > > > >               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> > > > > -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> > > > > +             VTD_CAP_MGAW(s->aw_bits);
> > > > >      if (s->dma_drain) {
> > > > >          s->cap |=3D VTD_CAP_DRAIN;
> > > > >      }
> > > > > -    if (s->aw_bits =3D=3D VTD_HOST_AW_48BIT) {
> > > > > -        s->cap |=3D VTD_CAP_SAGAW_48bit;
> > > > > +    if (s->dma_translation) {
> > > > > +            if (s->aw_bits >=3D VTD_HOST_AW_39BIT) {
> > > > > +                    s->cap |=3D VTD_CAP_SAGAW_39bit;
> > > > > +            }
> > > > > +            if (s->aw_bits >=3D VTD_HOST_AW_48BIT) {
> > > > > +                    s->cap |=3D VTD_CAP_SAGAW_48bit;
> > > > > +            }
> > > > >      }
> > > >
> > > > Just wonder if this is the hardware behaviour as I see 0 is reserve=
d
> > > > for SAGAW in vtd 3.3 spec.
> > >
> > > Yes I have the same question.  But if latest Linux & Windows work fin=
e then it
> > > seems ok if we have explicit use scenario with enabling IR only.
> >
> > Bit zero is reserved. The *value* zero is just what you get when none
> > of the bits are set.
> >
> >       "A value of 1 in any of these bits indicates the corresponding
> >       adjusted guest address width is supported.The adjusted guest
> >       address widths corresponding to various bit positions within
> >       this field are:
> >
> >        =E2=80=A2 0: Reserved
> >        =E2=80=A2 1: 39-bit AGAW (3-level page-table)
> >        =E2=80=A2 2: 48-bit AGAW (4-level page-table)
> >        =E2=80=A2 3: 57-bit AGAW (5-level page-table)
> >        =E2=80=A2 4: Reserved
> >
> >       Software must ensure that the adjusted guest address width used
> >       to set up the page tables is one of the supported guest address
> >       widths reported in this field.
> >
> >       Hardware implementations reporting second-level translation
> >       support (SLTS) field as Clear also report this field as 0.
>
> I see.

Right.

Acked-by: Jason Wang <jasowang@redhat.com>


