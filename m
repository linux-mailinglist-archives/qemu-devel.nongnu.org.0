Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE815587073
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 20:42:51 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIaNM-0005ZM-OX
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 14:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIaFX-0001nP-M5
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:34:45 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIaFU-0003AW-V7
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:34:42 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-32194238c77so118362567b3.4
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=MpGeQT6s0YX1+NQTP5j7T+A4ZNR6hwbDPB2RG6eBKSY=;
 b=iK/L8kXvcCTczHyZzw1JbJ9i06WDze+Rgco/YtnLLutdb4PNxT1pAEGe0Gr4hLu/Yz
 OGW2MBA+sPwWz7koLHBaM2HU4ft9K/NHOs9DYw5MCeCqwzS0DguIGV2rsyXbEvVybgUo
 3yaasLGrTcw+NX4oTTW7qe/XhkH17mu5hr4wgIe/kI01pGt8fsQc6xHeU7bxZkWpLrPG
 +m155nyMABnu5Ilg6f9LiZAD+U9P+HJhq+lA0CO7Hia+DVqBrXJG/WSIbjTfZfr4yeJI
 HU3rd2OECBafIIa4jS3Dwvd/jco5Bp8pZf7reyKaHOVq6ooua0mwZQRhSMZ3DP4NJi3n
 SeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=MpGeQT6s0YX1+NQTP5j7T+A4ZNR6hwbDPB2RG6eBKSY=;
 b=XdOTIqqB0/io78ZXxTAvRq2wXeyL+TzgW056A0z09UxQh8dGDj8UApa4CcTu9+mtd9
 FRVGtWbdCZ5ZhS5xHL1mVA1bclRG8IYcFAIrCKC+sqUUlZWhW3a8M5mEnzl3bA0qfI0V
 IYm7p6ZwM0RSKekD1JKiA/Od/2HXRYdlyls+6mw7FjQCQBKOLPXnihVsi1QlF3gwYia1
 yXfEFIdDbxjSxMJhN1J65J5D99JDnqAOvoMs8ywF74SWGCRUHtrb6Lc/SLc4Pq2whMsN
 H/BJyv/pQtMjQCn9JieXdx4SMPVJ3PuxjFexmCpIdDLFRladJc9kes7m2yHP02tzKYFK
 9HvA==
X-Gm-Message-State: ACgBeo2jgyZrFuzV60IkJtOioYZvHGwFDNmwS8LElnVC4WQhs2NtgL53
 zIHSX3C5aXa9xlv6eGANqu4X/+aeogiCGgCg+0vb1g==
X-Google-Smtp-Source: AA6agR59Sh4ARqMG6PKE4XsBkLm3ILRtf5HGDiaWbWvEO9PEGWuQdi1HAzVIiEEFmb1ByIfHmHM5k+YGqVOMlDcnO+A=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr14642572ywg.469.1659378879062; Mon, 01
 Aug 2022 11:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220801144714.181644-1-eperezma@redhat.com>
 <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
In-Reply-To: <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 19:33:58 +0100
Message-ID: <CAFEAcA85_e8v+RoWM_29c96_bDV1OAbM6cq-vL_68ZX+AY07ew@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Fix file descriptor leak on get features error
To: Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Mon, 1 Aug 2022 at 19:31, Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 01/08/2022 16:47, Eugenio P=C3=A9rez wrote:
> > File descriptor vdpa_device_fd is not free in the case of returning
> > error from vhost_vdpa_get_features. Fixing it by making all errors go t=
o
> > the same error path.
> >
> > Resolves: Coverity CID 1490785
> > Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get=
_max_queue_pairs")
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 6abad276a6..303447a68e 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       g_autofree NetClientState **ncs =3D NULL;
> >       g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >       NetClientState *nc;
> > -    int queue_pairs, r, i, has_cvq =3D 0;
> > +    int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts =3D &netdev->u.vhost_vdpa;
> > @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >
> >       r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> >       if (unlikely(r < 0)) {
> > -        return r;
> > +        goto err;
>
> Why don't you use "goto err_svq"?

This patch is kind of half of the idea discussed in the thread where
this problem was reported, which is that by setting i =3D 0 you can
then consistently have all the error handling be 'goto err' and that
frees everything that needs to be freed regardless of whether it's
called after or before the initialization of the ncs[] entries. But it
doesn't do the other half of the job, which is making all the other
error handling code in the function also use 'goto err', so it looks
a bit odd as it stands.

-- PMM

