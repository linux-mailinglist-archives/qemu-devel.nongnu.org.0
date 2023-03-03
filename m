Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A795D6A9FD1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAaN-0001Fn-HZ; Fri, 03 Mar 2023 13:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAaL-0001AQ-Eo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:56:53 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAaJ-0004DC-SP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:56:53 -0500
Received: by mail-pg1-x536.google.com with SMTP id d6so2088460pgu.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677869810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5ryzDIXjWooDfihwcjJShLv155tep/9hE/Wl0d2jw4=;
 b=Aib52SZqv/ZPAgTx9FJfW/PvcZfVdz/jeoJXFkOAE2sP7IhcgTbUGCbfHkQoWLUuuF
 fD8mGS9iJrKaR9YTLDgVtjrA9CWzM/r9GJRHKMfE9RqPEb8EMGC8v8c188YeD7OgZ6RK
 j39n0c14MM4BZDJUtA/EBwe8872juty0EAYBWhQqdaB5vo/eZA3s5+6yFMUXicu+eX8S
 Zwxc/UBvEl7W+y+Boao0fneitkC9c+assLt2MlDOTnM9QLSOH3yqX/blw4DeAPuJXADv
 7ASYp7f/VORtIi3sv3TPUuD7IfnSWNxtqAC5MDdzlEdM0g2xa5FHNJLwkNpKw+HpQy+5
 C7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5ryzDIXjWooDfihwcjJShLv155tep/9hE/Wl0d2jw4=;
 b=LT1kPIBUU8s5D3l0v/B39Dj5LD64D/k4xS+g7pOeYPwZxMqdO4FcttLLbcAxTU9Ra9
 VIFeFKUjg8xV9uxhzpNW96FQXHNcRtLGDnf1ljhQ420JGROG+eL/nibNwDwlJeEDWbDg
 8I2+PaTjNUaMqsM3WNFO4WMH4g27l5gWIcI6UzYCH7LRrseGraQKTXSq/IljLay0lwwL
 zE6+in8WKZCteN8LHzQMYPUZWyFqDVD9Oy5gD7JMEF+090y+MJclWvRGf+kN0m6edneP
 FshtjXip3GzxL/9N2z+9xqqUSzVUXOJzR4J+Ww/piY1nyPiIYJO0hzj0cN5qHfseav4S
 gQKA==
X-Gm-Message-State: AO0yUKV/rvua66Urk4CsoXCfT3zvXVapTH0Gn1zcg3AKNzlXIumaiRIM
 R0MAJ4bihHnCQ3fH9Zam1eMU+ieMnFzZP5VC4Hv3SA==
X-Google-Smtp-Source: AK7set8ybM9Bf2hOB9dsgin749VmdLHLtnRzkcYF4ZqRtcKFouw2FriJEoemsk2QadY68gMj0LjsEMhbUlloTJU3BjI=
X-Received: by 2002:a05:6a00:8cd:b0:593:e110:9582 with SMTP id
 s13-20020a056a0008cd00b00593e1109582mr1108007pfu.2.1677869810357; Fri, 03 Mar
 2023 10:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-5-hshan@google.com>
 <84a59aed-04e2-e1fc-6862-591164473ea8@linaro.org>
In-Reply-To: <84a59aed-04e2-e1fc-6862-591164473ea8@linaro.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 10:56:39 -0800
Message-ID: <CAGD3tSw4bQZ8iEx8Tb6hYYW9Ag-_c_ANRV65LjRHDo2zp92F3A@mail.gmail.com>
Subject: Re: [PATCH 5/6] Add the aehd-i8259 device type.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "open list:Android Emulator..." <emu-dev@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=hshan@google.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 3, 2023 at 2:09=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 3/3/23 03:26, Haitao Shan wrote:
> > The aehd-i8259 device type represents the AEHD in kernel PICs.
> > The irqchips should be always in kernel when AEHD is used.
> >
> > Signed-off-by: Haitao Shan <hshan@google.com>
> > ---
> >   hw/i386/aehd/i8259.c     | 165 ++++++++++++++++++++++++++++++++++++++=
+
> >   hw/i386/aehd/meson.build |   1 +
> >   hw/i386/pc.c             |   2 +
> >   include/hw/intc/i8259.h  |   1 +
> >   4 files changed, 169 insertions(+)
> >   create mode 100644 hw/i386/aehd/i8259.c
>
>
> > +static void aehd_pic_reset(DeviceState *dev)
> > +{
> > +    PICCommonState *s =3D PIC_COMMON(dev);
> > +
> > +    s->elcr =3D 0;
> > +    pic_reset_common(s);
> > +
> > +    aehd_pic_put(s);
> > +}
> > +
> > +static void aehd_pic_set_irq(void *opaque, int irq, int level)
> > +{
> > +    pic_stat_update_irq(irq, level);
> > +    aehd_set_irq(aehd_state, irq, level);
> > +}
> > +
> > +static void aehd_pic_realize(DeviceState *dev, Error **errp)
> > +{
> > +    PICCommonState *s =3D PIC_COMMON(dev);
> > +    AEHDPICClass *kpc =3D AEHD_PIC_GET_CLASS(dev);
> > +
> > +    memory_region_init_io(&s->base_io, OBJECT(dev), NULL, NULL, "aehd-=
pic", 2);
> > +    memory_region_init_io(&s->elcr_io, OBJECT(dev), NULL, NULL, "aehd-=
elcr", 1);
> > +
> > +
> > +    kpc->parent_realize(dev, errp);
> > +}
>
> Again, this should be drastically simplified by adding a some fields &
> handlers to the abstract TYPE_INKERNEL_IOAPIC class:
>
> struct InKernelAPICCommonClass {
>      APICCommonClass parent_class;
>
>      void (*pic_put)(PICCommonState *s)
>      ...
> };
>
> Eventually this could even belong to APICCommonClass, but I haven't
> checked in detail.
I got your idea now. I will address it in the next version. And this also
replies to the APIC and IOAPIC patch too.



--=20
Haitao @Google

