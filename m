Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30660447C46
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:52:03 +0100 (CET)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0Nm-0005Fg-9N
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mk0Lc-0003GF-1r
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mk0LZ-00036A-Sy
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636361385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XS+90Pjb/xpeTjapuicUeWUORpnxFAz2F08BYj8cTIo=;
 b=DvA0R+Iu4zjim7Ut9ut9906lWf7uhGizeUtsVfE86CCR1YxGGzh02VIAWpefw0QZwKPK7n
 AU4nS/5FD4VptyVJUR28bcEEkTf3b36hAW/VteG4YE9P0IXdJ0I3+aLllRSP3vs9rsBtdG
 Rg+cq50pA/GXHdpg7ARM0Cc1Da2Z+6A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-3CYvKK0KOiODOr117VHAcA-1; Mon, 08 Nov 2021 03:49:40 -0500
X-MC-Unique: 3CYvKK0KOiODOr117VHAcA-1
Received: by mail-pj1-f71.google.com with SMTP id
 lj10-20020a17090b344a00b001a653d07ad8so6988412pjb.3
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XS+90Pjb/xpeTjapuicUeWUORpnxFAz2F08BYj8cTIo=;
 b=4sZCChP/zcSkE/bRtG421pmpkYMM0yZNBZJ6ZHdDD1lyfEGZut91Q38Ky61Vp3Dghe
 X+vF7N2jJKvA2ulFC8Y2GCxz3ggYqrjScNv+3w72ZbwF9FF+mWJr+B737Pz27NWCvtvT
 ucDrrsw+djGuMq8BdRfUtns/V3AHsRyGJBuuHGC7yGOD6FKlqMFGBbN35x4DUM17+0fe
 TphQzyPPl/mWDuad/0UI7SEvJW2QaQ8ye60MXbtKiS1cZKxjPpYNVRyXAJgZX0qfrEoF
 pCR8+700h6i2mFX/k5r5UE3ru4kdLN0qg9h2FW1qf0cTy7HGd/5MqDFXWlpgAcr/VzTm
 ekxg==
X-Gm-Message-State: AOAM531iUG13r0DcHBen//myf0nt99nf+Hpj3jD7hyXhpokPW1p/i6uN
 P006TkVc+xLLRRhh/iI9DuPHx67EnQfy3CE5lkFHKf1BG+CO6hknb6HclQG9p2WScW2THaZQnkT
 zu5BeGF3d8WFVRb0biFpq6kgl/fr5Ui0=
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr58827718pgs.312.1636361378873; 
 Mon, 08 Nov 2021 00:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0NvlBElxBkBQTcPOy6jOjIljw1ESIxJZ+9W3XGh0DAQ9PqtnxZ++AU4V8lPIvrtZDNOM4g15NzFXdk/GzkTY=
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr58827694pgs.312.1636361378533; 
 Mon, 08 Nov 2021 00:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20211105133222.184722-1-marcandre.lureau@redhat.com>
 <a27ebb31-cd29-4af8-6600-379e0abf5bd9@linaro.org>
In-Reply-To: <a27ebb31-cd29-4af8-6600-379e0abf5bd9@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 8 Nov 2021 12:49:27 +0400
Message-ID: <CAMxuvay0R1mL=EJnrkzU7-bmQyc-awd6zJ=sYnm6s03q1dbNKw@mail.gmail.com>
Subject: Re: [PULL 00/11] Sphinx patches
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Nov 5, 2021 at 10:07 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/5/21 9:32 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following changes since commit 18e356a53a2926a15343b914db64324d6374=
8f25:
> >
> >    Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-0411=
21-2' into staging (2021-11-04 08:33:46 -0400)
> >
> > are available in the Git repository at:
> >
> >    git@gitlab.com:marcandre.lureau/qemu.git tags/sphinx-pull-request
> >
> > for you to fetch changes up to e6e89422ed6907d14ea67f2b99269e6b5554d6be=
:
> >
> >    docs/sphinx: change default role to "any" (2021-11-05 17:22:04 +0400=
)
> >
> > ----------------------------------------------------------------
> > Some Sphinx improvements
> >
> > PR for 2 series:
> > https://patchew.org/QEMU/20211015105344.152591-1-marcandre.lureau@redha=
t.com/
> > https://patchew.org/QEMU/20211004215238.1523082-1-jsnow@redhat.com/
> >
> > ----------------------------------------------------------------
> >
> > John Snow (3):
> >    docs: remove non-reference uses of single backticks
> >    docs: (further) remove non-reference uses of single backticks
> >    docs/sphinx: change default role to "any"
> >
> > Marc-Andr=C3=A9 Lureau (8):
> >    docs/sphinx: add loaded modules to generated depfile
> >    docs/sphinx: add static files to generated depfile
> >    docs/sphinx: add templates files to generated depfile
> >    tests/qapi-schema/meson: add depfile to sphinx doc
> >    meson: drop sphinx_extn_depends
> >    meson: drop sphinx_template_files
> >    docs/sphinx: set navigation_with_keys=3DTrue
> >    docs/sphinx: add 's' keyboard binding to focus search
> >
> >   docs/conf.py                           | 12 +++++++++++-
> >   docs/devel/build-system.rst            | 16 ++++++++--------
> >   docs/devel/fuzzing.rst                 |  9 +++++----
> >   docs/devel/tcg-plugins.rst             |  2 +-
> >   docs/interop/live-block-operations.rst |  2 +-
> >   docs/meson.build                       | 10 ----------
> >   docs/sphinx-static/custom.js           |  9 +++++++++
> >   docs/sphinx/depfile.py                 | 19 +++++++++++++++++--
> >   docs/system/guest-loader.rst           |  2 +-
> >   docs/system/i386/sgx.rst               |  6 +++---
> >   qapi/block-core.json                   |  4 ++--
> >   include/qemu/module.h                  |  6 +++---
> >   qemu-options.hx                        |  4 ++--
> >   tests/qapi-schema/meson.build          |  6 ++++--
> >   14 files changed, 67 insertions(+), 40 deletions(-)
> >   create mode 100644 docs/sphinx-static/custom.js
>
> One of the meson.build changes creates something that ninja does not like=
:
>
> ninja: error: build.ninja:47298: multiple outputs aren't (yet?) supported=
 by depslog;
> bring this up on the mailing list if it affects you
>
> Makefile:162: recipe for target 'run-ninja' failed
> make: *** [run-ninja] Error 1
>
> which fails across multiple CI jobs:
>
> https://gitlab.com/qemu-project/qemu/-/pipelines/403133805/failures

A workaround is to keep a single output: in "tests/qapi-schema/meson:
add depfile to sphinx doc", and inline the doc-good.stamp argument.
I'll send v2.
thanks


