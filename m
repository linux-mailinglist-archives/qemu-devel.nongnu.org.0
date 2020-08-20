Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C239A24AC9A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 03:27:46 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8ZMn-0001zv-SU
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 21:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1k8ZM0-0001Zg-NX
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 21:26:56 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:38228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1k8ZLz-00020v-8J
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 21:26:56 -0400
Received: by mail-oo1-xc42.google.com with SMTP id z11so80855oon.5
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BIcNjxwYDZuCQlY3PTgeXtkLXeqp/s2h4eypjUrzup0=;
 b=ZGUVZUQLK+mhHkLWBrn6QqTDIR0jd4fST69HW8TrkFu7prLv0N6PTnfh2hj4A/XRzs
 7YR0PgfVghZa4mOup2Cuk1pglhfVJkHykKPHhkmARifW11Tj1RpbTc/NFghrzMJywjWj
 CT5qHIVRaLEdqisGnLawqQjor1SbeYmstAHvrKlWcrDAirKmAWeGslMZksj9Ulb1PgaC
 Zn2yVV4/rDWsZn06+65lofFDBSC1FKeFD9q3mai1OMRCsjYV8Pz2aH8DGJxwrmv5F6ie
 v74C1VRQZ1pyfvPsPptOyf4GrpIM2rEn90WSJ+DyL9zNauzvmaVlgnJf/bcTkTPOug1j
 wV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BIcNjxwYDZuCQlY3PTgeXtkLXeqp/s2h4eypjUrzup0=;
 b=KkExG6N5g9gGVom61IJ3VEfikq3RvSzKK43NT8V9f+cnBRAfoT1YPASbUUUDWqEVOO
 GGHOQ2r/i3alxR/flY04sMEUkS/2/l00dPWEr1laxr0ujIniVBHWwnLjw1KIBoLxAU7B
 0olAiPwH1SonhVbHxO1+S7ilLI/LUJ2/OINMSJBPJK2t9JmZDuhizyUNa4llLvC9Tb4J
 /DjVqNSwYT7ky8VWyDsyOgQvNXvINWl27p+iPixKlc1fBnTFewU6O+OB9Il9nadqcX8C
 f95xpEWEiPpQRZfp93/xCZbc/aV0FDT8cFs099fwecPFo5nRgy0bbwy+Acozu2NlS5Uj
 prLA==
X-Gm-Message-State: AOAM530mKd5BUlJRc7fv+W6MnP2RfvlsENYFOI8FPzfUXlzBU6D2VwiE
 HeN9HAQqk02dZopPFkllofQQHJ0Pu2Tc/iuvV6o=
X-Google-Smtp-Source: ABdhPJySon3l9O9hQkVtuiYXr1yrxh137h2mb4A3tQONTfpIOwLm3Lz1y+dbXNO5LGlcHoF3wG87Lar/2TFRiDHen1k=
X-Received: by 2002:a4a:c587:: with SMTP id x7mr653004oop.60.1597886814081;
 Wed, 19 Aug 2020 18:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200819144309.67579-1-liq3ea@163.com>
 <2a946eec-5158-0bca-e9c9-b7c81d557b1b@redhat.com>
In-Reply-To: <2a946eec-5158-0bca-e9c9-b7c81d557b1b@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 20 Aug 2020 09:26:18 +0800
Message-ID: <CAKXe6S+0D-jnrq602X-cNHuC7PZXGqpqJM0qXQ8jPe3pRtOSjg@mail.gmail.com>
Subject: Re: [PATCH] virtio: vdpa: omit check return of g_malloc
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B48=E6=
=9C=8819=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8811:07=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On 8/19/20 4:43 PM, Li Qiang wrote:
> > If g_malloc fails, the application will be terminated.
>
> Which we don't want... better to use g_try_malloc() instead?

I don't think so. If g_malloc return NULL it means a critical
situation I think terminate the application
is OK. Though I don't find any rule/practices the qemu code base uses
g_malloc far more than
g_try_malloc.

Thanks,
Li Qiang

>
> > No need to check the return value of g_malloc.
> >
> > Signed-off-by: Li Qiang <liq3ea@163.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4580f3efd8..403ae3ae07 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -320,10 +320,8 @@ static int vhost_vdpa_set_config(struct vhost_dev =
*dev, const uint8_t *data,
> >      struct vhost_vdpa_config *config;
> >      int ret;
> >      unsigned long config_size =3D offsetof(struct vhost_vdpa_config, b=
uf);
> > +
> >      config =3D g_malloc(size + config_size);
> > -    if (config =3D=3D NULL) {
> > -        return -1;
> > -    }
> >      config->off =3D offset;
> >      config->len =3D size;
> >      memcpy(config->buf, data, size);
> > @@ -340,9 +338,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *=
dev, uint8_t *config,
> >      int ret;
> >
> >      v_config =3D g_malloc(config_len + config_size);
> > -    if (v_config =3D=3D NULL) {
> > -        return -1;
> > -    }
> >      v_config->len =3D config_len;
> >      v_config->off =3D 0;
> >      ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
> >
>

