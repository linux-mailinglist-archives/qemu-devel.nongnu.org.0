Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670461715B4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:08:48 +0100 (CET)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7H27-00042E-GT
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7H1D-0002zK-3x
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:07:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7H1B-0002xp-My
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:07:50 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33254)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7H1B-0002t8-Fm
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:07:49 -0500
Received: by mail-oi1-x242.google.com with SMTP id q81so2919626oig.0
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jlFJBUsqj+JQPOYk0ZBE3OyjjHhNHksjLoZAjYRPg5Y=;
 b=yykGGPhPHeZKJ93cA0Z6/Wik4D8iQh0f34yub4EIfnVGg/SU0Ee8cIFKDW6n3qUQUI
 BtSwm4MX8346dF9oPy/TJX54aAHcD6EGcCHBk6r+W6iSeefh6KaCU2mVJuWpdN3+1spa
 9VL/9FzClT1iji36UWqoNZLYr3t6XUDnjSkrLQPd//a2E+bvaT8f1lxs0n1xgyZJOKo9
 bSgbX4I8rgGXlMFab2R/N8lD3CGso/X4AUyiF3aEaMwPvWw55ArE45ufCC9aGnZO2yzL
 mjZmqq4CRWowDNB0sW727/N4ZwPu9JSrGSD/W2pKLvkQlPCPWB5d26rZdRrzAaOCkOKl
 o4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jlFJBUsqj+JQPOYk0ZBE3OyjjHhNHksjLoZAjYRPg5Y=;
 b=L9gkZaHU454QeNKlEcqfqpMtn90VwLdVBJEXR6ihCYRur64kIoYdYFJYqTvMf8cgi0
 LF+5ntxSWluRwcLjqBxaNixso/3tp0jG3uxlB+T5REFdt0MfxWTSid9DGPTobO8/lC65
 I6ag2zpKaSw+QjWfD/fHiGhZfTnpRqJO/4NjT+AQjeFk23AGZjRmR/AcPRsR5KwK0cPo
 hceBUvrfq9qJgu/wIvvPZeCIWzqCmU5d9/eJ+cbBcAVTQGxD9myJoda1fN7lcCpFGqcP
 ZPCJxzxvii4rvJ0Tf/lYFB5BymGwHEuqU0BLqWtK40r8PPZqPSwHXB6rl6cdUEk4I7Uq
 y5QA==
X-Gm-Message-State: APjAAAUV/HRDJQoK52o7QLafj3KT0I9V/dLfxkGxSfDxMnOnVbzSy0Mx
 xpHJK8s/lnsg9Fbvzz+g4RxvZSinxBES6wBzZLm9Lw==
X-Google-Smtp-Source: APXvYqxMA6WZkZ8j1KufiWKeLqkPS0T++ew6q4w0bN7a6rcauN95VNRV+X+24+Uf6nSmv7GuqGalwwhqovILgRx+CxE=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr2858634oid.98.1582801668341;
 Thu, 27 Feb 2020 03:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-2-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:07:37 +0000
Message-ID: <CAFEAcA-Qf_rC-EFNvmiFZtF1hhipL4qcPt8iOeK9pjAwOsPC2w@mail.gmail.com>
Subject: Re: [PATCH 01/18] qemu-doc: convert user-mode emulation to a separate
 Sphinx manual
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The final addition to the set of QEMU manuals is the user-mode emulation
> manual, which right now is included in qemu-doc.texi.  Extract it and
> convert it to rST, so that qemu-doc.texi covers only full system emulation.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I'm going to wade in and start making review comments, but
I'm happy to just take on this series and clean it up myself
for a v2 (I'd like to quickly get to a base where I can start
on dealing with the last bits of qemu-doc conversion that
deal with hxtool.)

Did you do the conversion to rST automatically? If so then
it would be useful to give the runes used in the commit message.

> ---
>  Makefile            |   8 +-
>  docs/user/conf.py   |  18 +++
>  docs/user/index.rst |  16 +++
>  docs/user/main.rst  | 295 ++++++++++++++++++++++++++++++++++++++
>  qemu-doc.texi       | 337 --------------------------------------------
>  5 files changed, 336 insertions(+), 338 deletions(-)
>  create mode 100644 docs/user/conf.py
>  create mode 100644 docs/user/index.rst
>  create mode 100644 docs/user/main.rst

A new manual also needs to be added to docs/index.html.in
and to docs/index.rst.

(Compare 0928523a1230a69 which added the system manual.)

>
> diff --git a/Makefile b/Makefile
> index 15f8e53d05..73d8ed2b6a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -786,6 +786,7 @@ distclean: clean
>         $(call clean-manual,interop)
>         $(call clean-manual,specs)
>         $(call clean-manual,system)
> +       $(call clean-manual,user)

This doesn't apply to current master because of the addition
of the 'tools' manual, but the fixes to the conflicts are easy.

>         for d in $(TARGET_DIRS); do \
>         rm -rf $$d || exit 1 ; \
>          done
> @@ -843,6 +844,7 @@ install-sphinxdocs: sphinxdocs
>         $(call install-manual,interop)
>         $(call install-manual,specs)
>         $(call install-manual,system)
> +       $(call install-manual,user)
>
>  install-doc: $(DOCS) install-sphinxdocs
>         $(INSTALL_DIR) "$(DESTDIR)$(qemu_docdir)"
> @@ -1036,7 +1038,8 @@ docs/version.texi: $(SRC_PATH)/VERSION config-host.mak
>  sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
>              $(MANUAL_BUILDDIR)/interop/index.html \
>              $(MANUAL_BUILDDIR)/specs/index.html \
> -            $(MANUAL_BUILDDIR)/system/index.html
> +            $(MANUAL_BUILDDIR)/system/index.html \
> +            $(MANUAL_BUILDDIR)/user/index.html
>
>  # Canned command to build a single manual
>  # Arguments: $1 = manual name, $2 = Sphinx builder ('html' or 'man')
> @@ -1069,6 +1072,9 @@ $(MANUAL_BUILDDIR)/specs/index.html: $(call manual-deps,specs)
>  $(MANUAL_BUILDDIR)/system/index.html: $(call manual-deps,system)
>         $(call build-manual,system,html)
>
> +$(MANUAL_BUILDDIR)/user/index.html: $(call manual-deps,user)
> +       $(call build-manual,user,html)
> +
>  $(call define-manpage-rule,interop,\
>         qemu-ga.8 qemu-img.1 qemu-nbd.8 qemu-trace-stap.1\
>         virtiofsd.1 virtfs-proxy-helper.1,\
> diff --git a/docs/user/conf.py b/docs/user/conf.py
> new file mode 100644
> index 0000000000..b3e1b2318a
> --- /dev/null
> +++ b/docs/user/conf.py
> @@ -0,0 +1,18 @@
> +# -*- coding: utf-8 -*-
> +#
> +# QEMU documentation build configuration file for the 'system' manual.

Should say 'user'.

> +#
> +# This includes the top level conf file and then makes any necessary tweaks.
> +import sys
> +import os
> +
> +qemu_docdir = os.path.abspath("..")
> +parent_config = os.path.join(qemu_docdir, "conf.py")
> +exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
> +
> +# This slightly misuses the 'description', but is the best way to get
> +# the manual title to appear in the sidebar.
> +html_theme_options['description'] = u'User Mode Emulation User''s Guide'
> +# One entry per manual page. List of tuples
> +# (source start file, name, description, authors, manual section).
> +man_pages = []

You can just not specify man_pages at all if the manual
doesn't create any manpages (devel and specs are like this):
docs/conf.py sets it to [] by default.

> diff --git a/docs/user/index.rst b/docs/user/index.rst
> new file mode 100644
> index 0000000000..c81d2898cd
> --- /dev/null
> +++ b/docs/user/index.rst
> @@ -0,0 +1,16 @@
> +.. This is the top level page for the 'system' manual.

Should say 'user'.

> +
> +
> +QEMU User Mode Emulation User's Guide
> +=====================================
> +
> +This manual is the overall guide for users using QEMU
> +for user-mode emulation.  In this mode, QEMU can launch
> +processes compiled for one CPU on another CPU.
> +
> +Contents:
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   main

The top level document looks a bit odd with this toctree
which has a single level 1 entry whose title is basically
the same as the whole manual's title, but it gives us a
structure we can expand later I guess.

thanks
-- PMM

