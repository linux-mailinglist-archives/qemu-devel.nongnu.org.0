Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00C58709D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 20:56:31 +0200 (CEST)
Received: from localhost ([::1]:43608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIaab-0003U4-Ua
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 14:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIaTj-00008F-B8
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIaTf-0005lg-VJ
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659379759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DyuBJvY+MrGZL/PBVorid0eqH2nEtTinQv79WS6skc=;
 b=atWuD9qJkOMuikQT6bk3MSwfagTMGJKKGheUt7PdB0MVAtVmWMBNhW6i815zYm6zNk3g0w
 +qeEbTcqk3h/8ELPP/ji4rLrsov24HfQsKhKQu2z9ck8jlQdh9Ig33wgdchG44cNicxYLO
 XEYCPW0Dy4bG5fyz0uakma/GQ1Zaf3I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-Odh-Xa6APm2Q8G_hr_IpwQ-1; Mon, 01 Aug 2022 14:49:18 -0400
X-MC-Unique: Odh-Xa6APm2Q8G_hr_IpwQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 y11-20020a05622a004b00b0031f22fc45fcso7592220qtw.17
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 11:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1DyuBJvY+MrGZL/PBVorid0eqH2nEtTinQv79WS6skc=;
 b=SqFIZQ6/WODiyPzMSBLqRFZHfn/7L3jlDDQlS+veB5eVowq1SUpn+aswj2g/joRZuM
 k0m0Hbip5/vlXa7W/nH808iegST6rBLzvzjmXqgXhVVMCZsf2h6Ol8XSJH6XHEG8wnN/
 AatWWHkuiQZVvqIx44/gXskUNdW1sXfgPTcXjP4yk4YxijfmqBalt5Mzx3VuMeaaQLyY
 qy04g25lvfR/3IUPfN1FGHCcpaku/nktbwfmhDhknAj9Yp4GE2pEnzaH1TCz1lwzMnEM
 541G933UzaQ61zeksmybcXRaGID413M/PzDjfLaWN/SQ3pvfqxEKNhazScg93L2k9aHY
 bi+Q==
X-Gm-Message-State: AJIora9LPJZXjzbyaaHgqtystxD4NPp5C67UpOGlHCsV0/gBj3IzWBxQ
 LB56N39rl2QlDcimiDH5mTSVColp9LvWT1Js59bVrkh1uDNCL5A2+GC7uuQX13WVVcFaqNT6TBE
 0YEsKtM3kbRYzSpPvgt0rWZhmobL6CAc=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr12695028qkp.255.1659379757812; 
 Mon, 01 Aug 2022 11:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMLT7te1kfOxDcVXaULYH0Wnz6f8c5fMA5qFaOxDAWQM80lIGR01Qga4nHcX44A45VLDMB7YL92eH9i3uVYs8=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr12695015qkp.255.1659379757570; Mon, 01
 Aug 2022 11:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220801144714.181644-1-eperezma@redhat.com>
 <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
 <CAFEAcA85_e8v+RoWM_29c96_bDV1OAbM6cq-vL_68ZX+AY07ew@mail.gmail.com>
In-Reply-To: <CAFEAcA85_e8v+RoWM_29c96_bDV1OAbM6cq-vL_68ZX+AY07ew@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 20:48:41 +0200
Message-ID: <CAJaqyWeCGRCKqULG9HOiOJmX+3v3P9h1B8x09k3aZbx7rJw5Jw@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Fix file descriptor leak on get features error
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-level <qemu-devel@nongnu.org>, 
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Aug 1, 2022 at 8:34 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Mon, 1 Aug 2022 at 19:31, Laurent Vivier <lvivier@redhat.com> wrote:
> >
> > On 01/08/2022 16:47, Eugenio P=C3=A9rez wrote:
> > > File descriptor vdpa_device_fd is not free in the case of returning
> > > error from vhost_vdpa_get_features. Fixing it by making all errors go=
 to
> > > the same error path.
> > >
> > > Resolves: Coverity CID 1490785
> > > Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_g=
et_max_queue_pairs")
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   net/vhost-vdpa.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 6abad276a6..303447a68e 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >       g_autofree NetClientState **ncs =3D NULL;
> > >       g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > >       NetClientState *nc;
> > > -    int queue_pairs, r, i, has_cvq =3D 0;
> > > +    int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > >
> > >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >       opts =3D &netdev->u.vhost_vdpa;
> > > @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >
> > >       r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> > >       if (unlikely(r < 0)) {
> > > -        return r;
> > > +        goto err;
> >
> > Why don't you use "goto err_svq"?
>
> This patch is kind of half of the idea discussed in the thread where
> this problem was reported, which is that by setting i =3D 0 you can
> then consistently have all the error handling be 'goto err' and that
> frees everything that needs to be freed regardless of whether it's
> called after or before the initialization of the ncs[] entries. But it
> doesn't do the other half of the job, which is making all the other
> error handling code in the function also use 'goto err', so it looks
> a bit odd as it stands.
>

That's right, I thought just fixing the issue about the leaked file
descriptor was the right thing to do in the hard feature freeze, and
that other part should be left for the next dev phase. Is the unified
error handling code acceptable for this period? I can send a patch
either on top of this one or squashed if so for sure.

Thanks!


