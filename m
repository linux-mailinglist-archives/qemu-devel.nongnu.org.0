Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3349252B3F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 12:18:12 +0200 (CEST)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAsVP-0005gK-SB
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 06:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kAsTS-00033D-SV; Wed, 26 Aug 2020 06:16:10 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:32896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kAsTQ-0004zg-8S; Wed, 26 Aug 2020 06:16:10 -0400
Received: by mail-io1-xd42.google.com with SMTP id g14so1557671iom.0;
 Wed, 26 Aug 2020 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B8xG5RlJvyOHoSk0yY3k6K12U3qnr4Bcj+P1T+wfO6A=;
 b=Jjwl6MIdGlmSHVbzgI302POMFKYzFQQCPgkn6TPESfWjTbS0v4slr180W+Btkhpxtw
 WDmoAKxdMrZ8gQu+43OBx/xqhuoI2kH4YKcIKu0MG+Yy1hNNlacz4YGwXgU7lTJIfpwb
 wN4SdQWNleMGxUfcK8+HXGSc4TuboK8uXMdEz2f1cHfVrAmsiGvPYcAXyjo4QZRzc/Jy
 I1jss8JWx3qxvMmFUi9Rr7vtH/fmyh4XRvmABBJrU58rNjsgR10Biy3p2OCX+LRaw+9w
 vmnTKtCWID+vzFTtXpLkt0YuIvOeccgmC/G6GgrcWfEOW2gDy5kWPJ0rEWG/D0pAcMBO
 +68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B8xG5RlJvyOHoSk0yY3k6K12U3qnr4Bcj+P1T+wfO6A=;
 b=kLsTFSq6MneJcdd7Xt4wgthbhe22Nq4syi/WmH3+pPob70y6dwwLyUontNb142ffMK
 Bu4h/oHBH0RdWG00uTpm/MYZfFQ3f8IQIo2MT1L3Aa7iz6y5j4f6cbAKNWKzvej0P+17
 G1aD2Xwew092Zxtpp7qYId4FlCR1gIjaw1DvB8SBB7PjBxVHPwTHJm6Lr8pZ035J7eq+
 YbKT7RK6N2bX+IHMa80UcR6lmVLIau+fh5ZoZAi84e8H7ckOC0TRFpAh5TQtF9goHill
 x8aF2+CXLOXpgoYasDmk8svmduBF3U7Reh0C+v/mQ6Ijcl17rRH9okuVNgLMdthRpM23
 XPfQ==
X-Gm-Message-State: AOAM5311FZzYIsi4kn1p91MNp0yRH7MlQq9k/0cq17FCBFO/EDqTsWf8
 +L33fADnPaBSQXXRSrcR3fzmRvd+Ciz6gcf837Q=
X-Google-Smtp-Source: ABdhPJxa1/8SLgXbCENqRBKPFA2eFymeM9FA66XECHzgZ/UvEBbPrQyJHHJDCeQx9B7TtVwzQyLbNdT5xrFdnm5O3VY=
X-Received: by 2002:a05:6638:298:: with SMTP id
 c24mr14534165jaq.20.1598436960678; 
 Wed, 26 Aug 2020 03:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-8-kuhn.chenqun@huawei.com>
 <CAKXe6S+BBKztHmBG0TLRTJH6bDntyz4=mWpgccctaZgYWn_TdA@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83B8E23ED@dggemm511-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B8E23ED@dggemm511-mbx.china.huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 26 Aug 2020 18:14:59 +0800
Message-ID: <CAKXe6SJFM44vxgY+YDtv9sL1pb1ekmT_L0sDQ1a6iV1diSoeDQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] vfio/platform: Remove dead assignment in
 vfio_intp_interrupt()
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=liq3ea@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Pannengyuan <pannengyuan@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chenqun (kuhn) <kuhn.chenqun@huawei.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=889:47=E5=86=99=E9=81=93=EF=BC=
=9A
>
>
> > > Clang static code analyzer show warning:
> > > hw/vfio/platform.c:239:9: warning: Value stored to 'ret' is never rea=
d
> > >         ret =3D event_notifier_test_and_clear(intp->interrupt);
> > >         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Reported-by: Euler Robot <euler.robot@huawei.com>
> > > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> > > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > > ---
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: Eric Auger <eric.auger@redhat.com>
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  hw/vfio/platform.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c index
> > > ac2cefc9b1..869ed2c39d 100644
> > > --- a/hw/vfio/platform.c
> > > +++ b/hw/vfio/platform.c
> > > @@ -236,7 +236,7 @@ static void vfio_intp_interrupt(VFIOINTp *intp)
> > >          trace_vfio_intp_interrupt_set_pending(intp->pin);
> > >          QSIMPLEQ_INSERT_TAIL(&vdev->pending_intp_queue,
> > >                               intp, pqnext);
> > > -        ret =3D event_notifier_test_and_clear(intp->interrupt);
> >
> > Shouldn't we check the 'ret' like the other place in this function?
>
> Hi, Li Qiang,
>
> Eric=E3=80=81Alex=E3=80=81Stefan has already discussed this point in the =
V1 version.
> https://patchwork.kernel.org/patch/11711897/

Ok I see, then

Reviewed-by: Li Qiang <liq3ea@gmail.com>

Thanks,
Li Qiang

>
> Thanks.

