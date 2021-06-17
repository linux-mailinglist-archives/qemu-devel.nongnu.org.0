Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447793ABAFF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:58:22 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwHV-0002JV-Bu
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltwGC-0000EO-6d
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:57:00 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltwGA-0000In-Cn
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:56:59 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ji1so5203360ejc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mvnueIfOlxUaMZhSDLp2xr64SocIA78t2RecLQt9hSc=;
 b=WQsRZp5ZiuaHF9HoE8tDDObqqoXt4KO26IE0y3z0WJEY2N+kjrhR7gB+ckitoySb7S
 ECaz54f9ROSj7Bx0q8ZDmQOFicuBuuf8TF7zjEkA5iSoeJZs3vzCLDOeUXRsasf+eV/y
 ZyKoDqTAHxDQZx6zAcLK0K0HdY6MjeF1EpDtichbsJl1t/hRhxu4G/OOWMH/UuIDrYrK
 2LM0zC9fkn9vBmQNga6X1sBqrYmvhxkw7D2moP1Wd4rhSsSZYoYNeog81AT2WU3IZgaR
 9MG71+V0ktYn88sD/RASmToUm28oxas8yHm2eQSgXsToLhXA+y60zMimyLu/WUNjYxov
 WS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mvnueIfOlxUaMZhSDLp2xr64SocIA78t2RecLQt9hSc=;
 b=lE9lkQLzcUVCsIvC9tC01BI44Yw+712sKHzwqmSIpXg74xCttDQXnd6V4bcr/gO+PT
 tXbwDOfx4+DPQfsyFxKLu/ft9AZZkMpwJtVqSmToN/9inhKpltvt5hBHJ8skTH/7FsI6
 RO09nyYAZMuNfzvHce18EU1hBFWTrcGqq0Gf3wKW85tak0tx2MX2nJY970486On6wap6
 8wvjf0hfRLTD7NUoaR2Wc2MmX6RFGo7sP1wl9gXEKmU6uNJIrh92Bm5YtU5kK/FoTeF3
 v1PkDubQZ7aAUd8a4+7595OFX6KB+oRlGs7Ghox41RG7Dg3Bqsuhu28O9Fg4TCEr2xbY
 xV4Q==
X-Gm-Message-State: AOAM531ZsYl2x1VKrsME/JaogxAdfuUSz/CFRIXMflX/+U26Stg+oUQY
 HGaqitScXMqmZ7t1AMXTcKP/Khu2zOh4i4o85kc=
X-Google-Smtp-Source: ABdhPJywlVAHbOCmSBrzW62z0LAEU6LcJqm219aIyNkkrUXAVpCpZnt4SgTcApX/f5/BYB8gnQIZVzvapVsl2/H+lj0=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr8349351edc.319.1623952617042; 
 Thu, 17 Jun 2021 10:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210617171958.34606-1-akihiko.odaki@gmail.com>
 <e8aa2d4c-520a-543f-f12f-b4cf702ab6e3@redhat.com>
In-Reply-To: <e8aa2d4c-520a-543f-f12f-b4cf702ab6e3@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 18 Jun 2021 02:53:06 +0900
Message-ID: <CAMVc7JVg8aPRB1AcRimamnBdfVwBXh1Njh4N=YYLkh1ZSKPbeA@mail.gmail.com>
Subject: Re: [PATCH v2] meson: Add gnutls as a dependency to libmigration
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B46=E6=9C=8818=E6=97=A5(=E9=87=91) 2:39 Philippe Mathieu-Daud=C3=
=A9 <philmd@redhat.com>:
>
> On 6/17/21 7:19 PM, Akihiko Odaki wrote:
> > qemu-file-channel.c may depend on GnuTLS.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> >  meson.build | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meson.build b/meson.build
> > index a2311eda6ec..29d854699ca 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2090,6 +2090,7 @@ libio =3D static_library('io', io_ss.sources() + =
genh,
> >  io =3D declare_dependency(link_whole: libio, dependencies: [crypto, qo=
m])
> >
> >  libmigration =3D static_library('migration', sources: migration_files =
+ genh,
> > +                              dependencies: [gnutls],
> >                                name_suffix: 'fa',
> >                                build_by_default: false)
> >  migration =3D declare_dependency(link_with: libmigration,
>
> Please see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg816565.html
>

Thanks for letting me know about the patch series. It should indeed
make this patch unnecessary.

