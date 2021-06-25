Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D13B48DA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:38:25 +0200 (CEST)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqie-0006Kw-74
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqgs-0004na-RX
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqgq-0006lP-Kc
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624646192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hSajvatipPrTZyb+7mw5hJf2bGRZAYCsigKtF1daz6w=;
 b=Zzn3OL1ThhT/5EpWZUF8Zc2poTv7aMN08qkm8BxID18DATG61JmlfvkJAGVVgaRYbK1JGw
 cEwVl2xHqvukqCnMNWKrTzAJ1R68WSqDBxWIaykYKvVgvsPcG3eR+b9DlZ/ypmYaz2S5x2
 YLWyiZpSidFFDV7H/qAsd6y0DizKmtI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-oBC18QsOP-mHl_3UUFf-_Q-1; Fri, 25 Jun 2021 14:36:28 -0400
X-MC-Unique: oBC18QsOP-mHl_3UUFf-_Q-1
Received: by mail-vk1-f199.google.com with SMTP id
 22-20020a0561220716b029024e75239721so2869645vki.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hSajvatipPrTZyb+7mw5hJf2bGRZAYCsigKtF1daz6w=;
 b=AhGoj37G3do0LnI4ynLOVSfxPYswdICusOj0ubKbF+/Z4Ut3YutCVrLVFUV1UiG7Z4
 AZ2nz2wve4uu74O2psQXa9aNb8TGAcGdrtbd0q30BgkTS47ET+uqAeubXZSZTnSXSRew
 YWmBef2odZ+mPW/+06N16fTaW+cQ9z2Mnlirayl5bvmVmyiXAeuVH+dRVYPc6/HpDqi3
 qBE4cz6mlos1v52BeUdDdSRWG08Ou+C8bjPcYKoumva+Swm5y9ZEzuDPGpyvvo4brxEr
 eprzNgNWdVQ410eAYWpvxPYI8LQrVxYj1t/pyZrjnU8qet5GeQqGyqaSSLhs8vAwVIAK
 ERWQ==
X-Gm-Message-State: AOAM532hUgfAHsNAToDdMDEYvn18aDiZO4pGtu25ZcrGAowFtSqqBp2p
 jrev7dpULUrHrILxL3iCPR3L5gvnFr5UbEftkcoXBt/wY0qWcqnJ+S5JeoEXWhVmTX8YJtBEdX6
 NSo8Brc6zghRQfSOTsO8qgEso5+T7NtU=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6550948uap.124.1624646187862; 
 Fri, 25 Jun 2021 11:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuZYmm0qZVh6/ZdYplAJ4O9umyxPDzKkWGEf6FQvMRHuzSXBkBbV5b1cWaqUV2XrE8qmOqccXq/yLwamwuS9c=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6550929uap.124.1624646187699; 
 Fri, 25 Jun 2021 11:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-9-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-9-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:36:01 -0300
Message-ID: <CAKJDGDa5DfPO5nw=PFAGnN00iJ7vzqM6QZajFsM6otMqan8JKA@mail.gmail.com>
Subject: Re: [PATCH 08/11] python: add 'make check-venv' invocation
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> This is a *third* way to run the Python tests. Unlike the first two
> (check-pipenv, check-tox), this version does not require any specific
> interpreter version -- making it a lot easier to tell people to run it
> as a quick smoketest prior to submission to GitLab CI.
>
> Summary:
>
>   Checked via GitLab CI:
>     - check-pipenv: tests our oldest python & dependencies
>     - check-tox: tests newest dependencies on all non-EOL python versions
>   Executed only incidentally:
>     - check-venv: tests newest dependencies on whichever python version
>
> ('make check' does not set up any environment at all, it just runs the
> tests in your current environment. All four invocations perform the
> exact same tests, just in different execution environments.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/python/Makefile b/python/Makefile
> index 5cb8378b81..76bb24e671 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,4 +1,6 @@
> -.PHONY: help pipenv check-pipenv check clean distclean develop
> +.PHONY: help pipenv venv check-venv check-pipenv check clean distclean develop
> +
> +QEMU_VENV_DIR=~/.cache/qemu-pyvenv
>
>  help:
>         @echo "python packaging help:"
> @@ -15,6 +17,11 @@ help:
>         @echo "    Requires: Python 3.6-3.10 and tox."
>         @echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
>         @echo ""
> +       @echo "make check-venv:"

Maybe, it may confuse people using `make check-venv` under `tests`.
Anyway, I'm not opposed to it.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> +       @echo "    Run tests in a venv against your default python3 version."
> +       @echo "    These tests use the newest dependencies."
> +       @echo "    Requires: Python 3.x"
> +       @echo ""
>         @echo "make develop:    Install deps for 'make check', and"
>         @echo "                 the qemu libs in editable/development mode."
>         @echo ""
> @@ -23,6 +30,9 @@ help:
>         @echo "make pipenv"
>         @echo "    Creates pipenv's virtual environment (.venv)"
>         @echo ""
> +       @echo "make venv"
> +       @echo "    Creates a simple venv for check-venv. ($(QEMU_VENV_DIR))"
> +       @echo ""
>         @echo "make clean:      remove package build output."
>         @echo ""
>         @echo "make distclean:  remove venv files, qemu package forwarder,"
> @@ -37,8 +47,27 @@ pipenv: .venv
>  check-pipenv: pipenv
>         @pipenv run make check
>
> +venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
> +$(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
> +       @echo "VENV $(QEMU_VENV_DIR)"
> +       @python3 -m venv $(QEMU_VENV_DIR)
> +       @(                                                      \
> +               echo "ACTIVATE $(QEMU_VENV_DIR)";               \
> +               . $(QEMU_VENV_DIR)/bin/activate;                \
> +               echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";    \
> +               make develop 1>/dev/null;                       \
> +       )
> +       @touch $(QEMU_VENV_DIR)
> +
> +check-venv: venv
> +       @(                                                      \
> +               echo "ACTIVATE $(QEMU_VENV_DIR)";               \
> +               . $(QEMU_VENV_DIR)/bin/activate;                \
> +               make check;                                     \
> +       )
> +
>  develop:
> -       pip3 install -e .[devel]
> +       pip3 install --disable-pip-version-check -e .[devel]
>
>  check:
>         @avocado --config avocado.cfg run tests/
> @@ -50,4 +79,4 @@ clean:
>         python3 setup.py clean --all
>
>  distclean: clean
> -       rm -rf qemu.egg-info/ .venv/ .tox/ dist/
> +       rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> --
> 2.31.1
>


