Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC9307FBE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:37:44 +0100 (CET)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5E2x-0008SD-8m
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l5DzN-0007Vh-5X
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:34:01 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:35219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1l5DzL-0000an-J4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:34:00 -0500
Received: by mail-il1-f174.google.com with SMTP id g7so5408142iln.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 12:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F73T67E164+f+xRz/1/bvfhZFdvN9eryZC3z5wN2fgk=;
 b=pTCGY+VTz2bK9cP/Ih/HHCCJ4JOkXsuhSEuagC18LTHpowImQNxegcXLMKR3hWK7BY
 wJG6qmN/8c9j+bhVxYy8aIJ7ufBWwyMwSGeGjop8AJjdYhrI9HRlzoFEfGeeL38/q61g
 qXl6dNveAK11ptmRShcVXxGKH6Txz7vpJyn5rWVa+pgdIE2IL/ONDJW5dA8YNwXTuA0b
 jxFXZOGw3y2+QTHEhzKaertzvNOm5QWLFzCFOjRBdj3oCuHGvDyTGnqDhDHkpbNVKpg4
 XnL4mlMAOUZfZNfk1kudL9jnxiaDoPcoEdjGWBKZC+yVvLFF/PFJiD86Q/xh96E5uxpc
 Boeg==
X-Gm-Message-State: AOAM531ofF8LkvoMnWH/ika9feiuwtw+ak/vO56+rN4hxjPbAQDE/Nbg
 TRp3EvutRmXt+sxreD8r4ULaYSp3lXA=
X-Google-Smtp-Source: ABdhPJzxLtA/6RdzQBgEgeQ6YsLtFqpnFdyUCWGF6EcEsQ7jgN51OSRjrFGNh7jU1dHA5uObF+Gm3Q==
X-Received: by 2002:a92:874d:: with SMTP id d13mr662948ilm.270.1611866034384; 
 Thu, 28 Jan 2021 12:33:54 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id h11sm2985755ior.19.2021.01.28.12.33.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 12:33:54 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id u7so6969599iol.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 12:33:54 -0800 (PST)
X-Received: by 2002:a05:6602:1550:: with SMTP id
 h16mr1079431iow.204.1611866033783; 
 Thu, 28 Jan 2021 12:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20210126012457.39046-1-j@getutm.app>
 <20210126012457.39046-5-j@getutm.app>
 <3431d35b-774d-9c49-b6ef-615866b8341e@redhat.com>
In-Reply-To: <3431d35b-774d-9c49-b6ef-615866b8341e@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 28 Jan 2021 12:33:43 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDXBd_Ewxa6SHjXvTLhQECmknZ1d-dr-SbPkyQvhp7oGg@mail.gmail.com>
Message-ID: <CA+E+eSDXBd_Ewxa6SHjXvTLhQECmknZ1d-dr-SbPkyQvhp7oGg@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] slirp: feature detection for smbd
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.174; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Joelle van Dyne <j@getutm.app>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 11:30 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 1/26/21 2:24 AM, Joelle van Dyne wrote:
> > Replace Windows specific macro with a more generic feature detection
> > macro. Allows slirp smb feature to be disabled manually as well.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  configure   | 22 +++++++++++++++++++++-
> >  meson.build |  2 +-
> >  net/slirp.c | 16 ++++++++--------
> >  3 files changed, 30 insertions(+), 10 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 8d8a4733d7..d72ab22da5 100755
> > --- a/configure
> > +++ b/configure
> > @@ -464,6 +464,7 @@ fuse=3D"auto"
> >  fuse_lseek=3D"auto"
> >
> >  malloc_trim=3D"auto"
> > +slirp_smbd=3D"auto"
> >
> >  # parse CC options second
> >  for opt do
> > @@ -845,7 +846,18 @@ do
> >      fi
> >  done
> >
> > +# Check for smbd dupport
> >  : ${smbd=3D${SMBD-/usr/sbin/smbd}}
> > +if test "$slirp_smbd" !=3D "no" ; then
>
> Here slirp_smbd is always "auto".
>
> > +  if test "$mingw32" =3D "yes" ; then
> > +    if test "$slirp_smbd" =3D "yes" ; then
> > +      error_exit "Host smbd not supported on this platform."
> > +    fi
> > +    slirp_smbd=3Dno
> > +  else
> > +    slirp_smbd=3Dyes
> > +  fi
> > +fi
>
> So this check ...
>
> >
> >  # Default objcc to clang if available, otherwise use CC
> >  if has clang; then
> > @@ -1560,6 +1572,10 @@ for opt do
> >    ;;
> >    --disable-fuse-lseek) fuse_lseek=3D"disabled"
> >    ;;
> > +  --enable-slirp-smbd) slirp_smbd=3Dyes
> > +  ;;
> > +  --disable-slirp-smbd) slirp_smbd=3Dno
> > +  ;;
> >    *)
>
> ... should be placed after the cmdline options processing,
> isn't it?

That's right, good catch.
>

