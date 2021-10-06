Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C762424633
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:43:01 +0200 (CEST)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBsZ-0006Zk-7C
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYBqH-0005E7-Mn
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYBqB-0001rr-IJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633545630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lstt+Pz4bOZvRVt5dNRZMoquSClJeUeQL4BcHrf2QRs=;
 b=NQKNXJr1mBjg9Ecc7tO7yzSJdaNUX1HWP19kMyKOIsjEPM1X02QAdM1Et04+KfHTm043ZO
 Z3QeP8ZVJo9SotsIsDEJ2/BLh7nJPe+PzFoHNdhmtFCpMadMUPjFhtUI2MBWseMNWKbtYe
 LpqP1AG2t7KAIaL/WEvmdqCsFSWKO00=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-mdGaimwqOd6VJOHnJFBFHg-1; Wed, 06 Oct 2021 14:40:27 -0400
X-MC-Unique: mdGaimwqOd6VJOHnJFBFHg-1
Received: by mail-pf1-f199.google.com with SMTP id
 z22-20020aa79596000000b0044c8c01b7a9so1835869pfj.5
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lstt+Pz4bOZvRVt5dNRZMoquSClJeUeQL4BcHrf2QRs=;
 b=3Oiot9GvtLys/8e0tIQ1H1fUdJ4AhSdpZI3MQ3IWPcgzIOOm/tFIQMMLHf+K7pZx05
 TVuwGeIZYET0AcL0RtioH+Yjl0SFT8CnVUN+7gydTURf/3XEzcSX4dzIYuTOoQSVR+7J
 skjX+c2w/09THhwil5D6AvR3iXZEdejvYwO+rv/X0UO4dcx+aH0EHQojbqcdWH5PnFXX
 b8QHz/ZYBSxOOe54HrJoXXsFUZlrEuFBxNeRCOPile006vRSuMz/z5lNznkayfEM54hF
 p5jCGRu9FHt4KWGuHcO5HQ1JVt/9T1WQB1oV3KyKnnvnChardcPukvtOo25En5bAfi08
 Jv+Q==
X-Gm-Message-State: AOAM532O8+nW7IrQUpeZWWKrmExkHmtMCxyul+wzUfxN/4GthESPs/IS
 0ciXsm+vcbjwZnW8I4MODWTY+fGqLcPGK7CwUcg0rhgb1sbH8BXHmoyKKrguW4Vb8e+T3amvvpW
 dnKVvsribSlR9iw0dw9PWpjQKlWTs8FA=
X-Received: by 2002:a17:90a:8a18:: with SMTP id
 w24mr308192pjn.123.1633545625832; 
 Wed, 06 Oct 2021 11:40:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR65s/LHlMII84R9VplNt9bqEFbRvJDkEtnsdWd0Pu/Jl5BaRAPMxmLlJS66cHWB0kSo9s6F6BUX/PXLSNBuI=
X-Received: by 2002:a17:90a:8a18:: with SMTP id
 w24mr308165pjn.123.1633545625531; 
 Wed, 06 Oct 2021 11:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-2-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:39:59 -0300
Message-ID: <CAKJDGDagReANLxsA5tnqQ0sjU6qrx=LiMbB4Jq2LUc-UtHpdMA@mail.gmail.com>
Subject: Re: [PATCH 01/16] Acceptance Tests: bump Avocado requirement to 91.0
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:57 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Avocado 91.0, brings, among other changes, a switch to a new runner
> implementation, known as "nrunner".  While my personal testing shows
> that it's suitable for running the QEMU tests, there are some
> considerations that should be addressed before the change.
>
> For instance, the "nrunner" implementation will run tests in parallel
> by default.  With more tests running, and resources shared, some tests
> may fail with timeouts on some environments.
>
> So, for now, let's bump the Avocado version to allow for the other
> features to be used.  And the "nrunner" implementation to be used by
> those that choose to do so.
>
> More information can be found at the release notes at:
>    https://avocado-framework.readthedocs.io/en/latest/releases/91_0.html
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/testing.rst | 12 ++++++++++++
>  tests/Makefile.include |  2 ++
>  tests/requirements.txt |  2 +-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4a0abbf23d..2818c58ff8 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -740,6 +740,18 @@ may be invoked by running:
>
>    tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
>
> +Running tests in parallel
> +-------------------------
> +
> +The current ``make check-acceptance`` target continues to use the
> +Avocado runner implementation simply known as "runner".  But, it's now
> +possible to opt-in and choose the "nrunner" implementation, which,
> +among other things, allows for parallel execution of tests:
> +
> +.. code::
> +
> +  make AVOCADO_RUNNER=nrunner check-acceptance

The examples in the documentation are all setting the environment
variable at the end of the `make` command. For consistency, I would
move the definition of the AVOCADO_RUNNER to the end of the command.

> +
>  Manual Installation
>  -------------------
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 6e16c05f10..ac289a2e41 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -92,6 +92,7 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>  # Any number of command separated loggers are accepted.  For more
>  # information please refer to "avocado --help".
>  AVOCADO_SHOW=app
> +AVOCADO_RUNNER=runner
>  AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
>
>  $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> @@ -128,6 +129,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>         $(call quiet-command, \
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> +            --test-runner=$(AVOCADO_RUNNER) \
>              --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
>              $(AVOCADO_TAGS) \
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index a21b59b443..40af24c664 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework==88.1
> +avocado-framework==91.0
>  pycdlib==1.11.0
> --
> 2.31.1
>

Apart from a tiny documentation change, the code is welcome as it
allows using the new Avocado runner.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


