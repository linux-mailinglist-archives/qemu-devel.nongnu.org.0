Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCDD2F3C44
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:22:13 +0100 (CET)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzS3I-0007tO-Bh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzS0B-0006cK-T4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:18:59 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:40013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kzS07-0001Kh-Kz
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:18:57 -0500
Received: by mail-io1-f45.google.com with SMTP id r9so7507724ioo.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GG9UAuFnZ/29cRZy18Bvt03NhxvC/y8PtmzS/mcO23g=;
 b=Vx26grU71nz1vxhdDsUu9nonMmyuVwv8kTC4nPYPSWotxH9VnvTN9V9MbFh2oticV+
 q7f03ucNt+6dK/8spH2AyO53ae7Iqr3x8trhWqohFDaGxgGqydIvkRR/IM4c6aLpbbP7
 Xuq2YYdi21mmVZ0x5DNQ9w6wMhlYOQIeoh+FMJyoAehKR6V+RwMfs5SlVYiz1fxh4ZNs
 H80f54fxmNF7n0H2HP0vMJ2zebgJY++F6I84Ozob70tkeyhuQs7kDV9CEhlMKUO3qbu8
 O8lDhht7Cu2o/Z1L5v3iU8fPwsatVkP57wsA4mFIX1qRz+YoSgzxXjT2w3AkimqQGM98
 VVlA==
X-Gm-Message-State: AOAM533tBZL3aRPiJCTTLcLLSq+l/j+wFfRzHORgvjVSrNPpPdRrgGYK
 zTCT4KI8ZaL04ptd5qBa5RpU30H6i+Q=
X-Google-Smtp-Source: ABdhPJy/r0JGn+jwtIP9sKfVBhX6/Qd3G92PRyRQIGIyA1H4x9njyYGv5ueC8rIHHbEgRCchD1Nk2Q==
X-Received: by 2002:a92:d58f:: with SMTP id a15mr1198600iln.291.1610489934537; 
 Tue, 12 Jan 2021 14:18:54 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id x22sm74104ion.3.2021.01.12.14.18.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:18:54 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id q137so7506295iod.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:18:54 -0800 (PST)
X-Received: by 2002:a92:cccd:: with SMTP id u13mr1239970ilq.273.1610489933994; 
 Tue, 12 Jan 2021 14:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-4-j@getutm.app>
 <f8134df0-6896-9112-1465-4698081a9981@redhat.com>
In-Reply-To: <f8134df0-6896-9112-1465-4698081a9981@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 12 Jan 2021 14:18:43 -0800
X-Gmail-Original-Message-ID: <CA+E+eSD5v0bnN=hHqW87F0X-L7TdpVo5FKk3msQ1xTtLyH=9fA@mail.gmail.com>
Message-ID: <CA+E+eSD5v0bnN=hHqW87F0X-L7TdpVo5FKk3msQ1xTtLyH=9fA@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] qemu: add support for iOS host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.45; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this was discussed before but the main issue right now is that
there's no packaging system (like homebrew) for iOS cross building on
Mac. Stefan suggested caching built libraries in an external location
to use with the CI. I think this can be done but would require some
thought to it. I am open to other ideas as well (like pretending to
build for iOS while actually building for macOS).

-j

On Tue, Jan 12, 2021 at 3:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Joelle,
>
> On 1/5/21 3:20 AM, Joelle van Dyne wrote:
> > This introduces support for building for iOS hosts. When the correct Xc=
ode
> > toolchain is used, iOS host will be detected automatically.
> >
> > * block: disable features not supported by iOS sandbox
> > * slirp: disable SMB features for iOS
> > * osdep: disable system() calls for iOS
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  docs/devel/index.rst    |  1 +
> >  docs/devel/ios.rst      | 28 +++++++++++++++++++++++++++
> >  configure               | 43 ++++++++++++++++++++++++++++++++++++++++-
> >  meson.build             |  2 +-
> >  include/qemu/osdep.h    | 11 +++++++++++
> >  block.c                 |  2 +-
> >  block/file-posix.c      | 31 +++++++++++++++++------------
> >  net/slirp.c             | 16 +++++++--------
> >  qga/commands-posix.c    |  6 ++++++
> >  MAINTAINERS             |  7 +++++++
> >  tests/qtest/meson.build |  7 +++----
> >  11 files changed, 127 insertions(+), 27 deletions(-)
> >  create mode 100644 docs/devel/ios.rst
>
> >
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index f10ed77e4c..2cc8a13ebe 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -35,3 +35,4 @@ Contents:
> >     clocks
> >     qom
> >     block-coroutine-wrapper
> > +   ios
> > diff --git a/docs/devel/ios.rst b/docs/devel/ios.rst
> > new file mode 100644
> > index 0000000000..b4ab11bec1
> > --- /dev/null
> > +++ b/docs/devel/ios.rst
> > @@ -0,0 +1,28 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +iOS Support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +To run qemu on the iOS platform, some modifications were required. Mos=
t of the
> > +modifications are conditioned on the ``CONFIG_IOS`` and configuration =
variable.
> > +
> > +Build support
> > +-------------
> > +
> > +For the code to compile, certain changes in the block driver and the s=
lirp
> > +driver had to be made. There is no ``system()`` call, so it has been r=
eplaced
> > +with an assertion error. There should be no code path that call system=
() from
> > +iOS.
> > +
> > +``ucontext`` support is broken on iOS. The implementation from ``libuc=
ontext``
> > +is used instead.
>
> Do you have a CI testing plan for these builds?
>
> Is it possible to add a Gitlab-CI job? If not, on Cirrus-CI?
>
> Thanks,
>
> Phil.
>
>

