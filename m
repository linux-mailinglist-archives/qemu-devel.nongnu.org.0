Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC743901D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 09:11:46 +0200 (CEST)
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meu90-0004HN-Lr
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 03:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1meu6V-0003Mi-VF; Mon, 25 Oct 2021 03:09:07 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1meu6T-0005J9-JT; Mon, 25 Oct 2021 03:09:07 -0400
Received: by mail-lf1-x12a.google.com with SMTP id l13so11092109lfg.6;
 Mon, 25 Oct 2021 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bvx6eLm3KyFd08/ERZVX4YP5tTxtbmmY+S8nOpoX87o=;
 b=m62jZnV4ajlhcqCeFdV6+0u5r52+3OsTt/bWSMeKvSW/2lFjzEdSD2/d/eR/ozyd/3
 b0jBlDz+euOGnlCYlE5PuHx7QRerfTdNxGM4LsC8XFQry36EL7PgASN49IZ5NXuvGLxz
 /W0YFQF/+UFUTjJ69gq1ZxBbpKLBUC1BzIjHtUIpLwHL5UjfXCYCTOZf0c7VaOhE5bo9
 HjLSHO8NE8UQQ2htC8dqoJ26OzS59To8T5xvY6kCk9l2oOUxK4G94hFjb0aXFZuaFacI
 Ygvf1WoyE3t8TW7qO5mCVxiXb3aYHl9fjEdAUKdNt3Zs2LBdXemlibPdqwXZ3OKXEVrz
 l+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bvx6eLm3KyFd08/ERZVX4YP5tTxtbmmY+S8nOpoX87o=;
 b=wBMxUp11wUN5G5OvbWOG4VHhVkyq2eVpYuXez4Xd/jqoUvn9Znr3tq2s1a6cbqVprq
 yMxWkhdKULEf0uKj1RIoeC+p6khJUoLAvmAE2hIJn1brT+DAvjfHl2NRsRPSB7mm1qLW
 BgCHGQQOWLwjsiKbS7ymGK5H39mYkzvgQd38zrTIBNK/5mE8q5LWruGkh+mZKYvOcy7+
 QyvzE8FY2YyN+IvpPIddBrH6r14fyMM0qSExVsMruWMDqyNH/oVH9nkhTUxhuPdV3TBp
 FPDarDX+b4HYRKXtMTEStWR4sO6Hxq9p5S9LKEmhdlidYO2eN+njSfXu/emkd2SykMxH
 wTIQ==
X-Gm-Message-State: AOAM532mvX/mRxyyvDz7dgn5n7aDr4uxMMJi1pjzevlGbHrVBVya9O6u
 GFRD/uQztFB6cmTGAyiDabvoaYGVBS+Xet4C84A=
X-Google-Smtp-Source: ABdhPJwxCafMSqDYCBffJ2zDXbSg9FZ9Gm8JWhi7vrib3+QZUf7ZWHiMM96yXyvGUWrhcrrkEoJom6tHSY9xGrKTP0Y=
X-Received: by 2002:a05:6512:1284:: with SMTP id
 u4mr15733059lfs.614.1635145742559; 
 Mon, 25 Oct 2021 00:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
 <6168250e-9bd6-a672-4f1f-b1ecf8f8cd4c@msgid.tls.msk.ru>
In-Reply-To: <6168250e-9bd6-a672-4f1f-b1ecf8f8cd4c@msgid.tls.msk.ru>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Oct 2021 09:08:50 +0200
Message-ID: <CAPi7W81D3odjCd0-sTyrE8jUP+fkM6F7u0neW+aLGHDh97r6sg@mail.gmail.com>
Subject: Re: [PATCH] block/export/fuse.c: fix musl build
To: mjt@tls.msk.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-lf1-x12a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le lun. 25 oct. 2021 =C3=A0 08:31, Michael Tokarev <mjt@tls.msk.ru> a =C3=
=A9crit :
>
> 22.10.2021 12:52, Fabrice Fontaine =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
> > https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea=
73c985c4e9d9bbb
> > and avoid the following build failure on musl:
> >
> > ../block/export/fuse.c: In function 'fuse_fallocate':
> > ../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared=
 (first use in this function)
> >    643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
> >        |                     ^~~~~~~~~~~~~~~~~~~~
> >
> > Fixes:
> >   - http://autobuild.buildroot.org/results/be24433a429fda681fb666981601=
32c1c99bc53b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >   block/export/fuse.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/block/export/fuse.c b/block/export/fuse.c
> > index 2e3bf8270b..823c126d23 100644
> > --- a/block/export/fuse.c
> > +++ b/block/export/fuse.c
> > @@ -31,6 +31,10 @@
> >   #include <fuse.h>
> >   #include <fuse_lowlevel.h>
> >
> > +#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
>
> shouldn't it be "if !defined" ?
Nope, here is an extract of meson.build:

config_host_data.set('CONFIG_FALLOCATE_ZERO_RANGE',
                     cc.has_header_symbol('linux/falloc.h',
'FALLOC_FL_ZERO_RANGE'))

So, CONFIG_FALLOCATE_ZERO_RANGE is defined if FALLOC_FL_ZERO_RANGE is
found in linux/falloc.h which is fine.
However, because linux/falloc.h is not included in fuse.c, a build
failure will be raised on musl (which does not define
FALLOC_FL_ZERO_RANGE)
>
> /mjt
>
> > +#include <linux/falloc.h>
> > +#endif
> > +
> >   #ifdef __linux__
> >   #include <linux/fs.h>
> >   #endif
> >
>
Best Regards,

Fabrice

