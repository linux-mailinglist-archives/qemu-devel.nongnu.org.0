Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB543B7753
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:36:15 +0200 (CEST)
Received: from localhost ([::1]:59784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHeg-0003UG-EV
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyHdU-0002eA-O0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyHdS-00079W-Cl
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624988096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VUYAEkyTYMnGNanrTQwRxGcQ0SrFYqX1SMgDGPgR4Y=;
 b=bM37UnT9BsCJCcAXSqG7n3/ckZKphEah2qnRLpj1Tkqe1Pii9ITRbWbZbjXu7H0naLNlnw
 SQtm0MwK4rOoJydHuy+lYqpwCWmNz5izlUlRo+sXzjQrNA5S/W1r8jeP0YER4yIsBuZL7P
 r6ihQVimACGa6SzQ3f1skIJrHmScqn4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-E0pkF8qLMommvrTWcOukqg-1; Tue, 29 Jun 2021 13:34:55 -0400
X-MC-Unique: E0pkF8qLMommvrTWcOukqg-1
Received: by mail-pj1-f72.google.com with SMTP id
 c5-20020a17090a1d05b029016f9eccfcd6so2714846pjd.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0VUYAEkyTYMnGNanrTQwRxGcQ0SrFYqX1SMgDGPgR4Y=;
 b=MDxrGOllrWGh4JJPiFTaIXXxPaL7a4zZKhNW9vEJ0vzvrCArQKq9ZN0b5HNWwAv03e
 sJ8jnqvS/KnUFkzgRxXrBQ2VrX4SLCb5NFdJv7EKPN3Vedmkr1HiUXjQDn9cv9JXRHWK
 Q5zii2Zr4qWNjDWjBq5urPSmw4dwkfJyXiJsoeSxLKt+TbXy+uGcOserIkp8fFkQrfFx
 WkSDO72/HitlTjjSpo3Ykm7Gb3iVDoe5pkfKtklh+ccMrGPpTtnt1Og/Uq/qNKKj8PTS
 4KI+mGUZ7Lxi4iWWXKRbec5SVndKGceTr33ORf5/wUUdxZLYxFiQDQzyLIFF2WqC14Tx
 Usig==
X-Gm-Message-State: AOAM5335TTh85sCUcqlxqpevxyoCDOYALaInBrnhrsrn3UWr+g2qqz78
 Pok/4Tf4lSeN5IHVjKFNAYtkaEZ5ZGeCjD5GHwzKs5aeUrc8Oqb61iOtennmnlCwKvMhRRRPT/a
 oBpeupn3fooSoCy0=
X-Received: by 2002:a62:9242:0:b029:300:6fb1:38b7 with SMTP id
 o63-20020a6292420000b02903006fb138b7mr30940062pfd.80.1624988094589; 
 Tue, 29 Jun 2021 10:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxJ+iigGUOLzkKk4WG6Tceaohg5aLY0RHTsx/SrMskopGU3gic3AY/84BTFPa2EiufW1K+dA==
X-Received: by 2002:a62:9242:0:b029:300:6fb1:38b7 with SMTP id
 o63-20020a6292420000b02903006fb138b7mr30940036pfd.80.1624988094327; 
 Tue, 29 Jun 2021 10:34:54 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id m16sm13776097pfo.1.2021.06.29.10.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 10:34:53 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] python: add 'make check-dev' invocation
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-10-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a63f357e-42c4-5385-fa40-82f291efac71@redhat.com>
Date: Tue, 29 Jun 2021 14:34:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629164253.1272763-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 1:42 PM, John Snow wrote:
> This is a *third* way to run the Python tests. Unlike the first two
> (check-pipenv, check-tox), this version does not require any specific
> interpreter version -- making it a lot easier to tell people to run it
> as a quick smoketest prior to submission to GitLab CI.
>
> Summary:
>
>    Checked via GitLab CI:
>      - check-pipenv: tests our oldest python & dependencies
>      - check-tox: tests newest dependencies on all non-EOL python versions
>    Executed only incidentally:
>      - check-dev: tests newest dependencies on whichever python version
>
> ('make check' does not set up any environment at all, it just runs the
> tests in your current environment. All four invocations perform the
> exact same tests, just in different execution environments.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/Makefile | 35 +++++++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/python/Makefile b/python/Makefile
> index d34c4e35d9..8f8e1999c0 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,3 +1,5 @@
> +QEMU_VENV_DIR=.dev-venv
> +

I gave `make check-dev` a try and `tests/flake8.sh` failed, because it 
is checking the python sources from the $QEMU_VENV_DIR itself.

Either we keep $QEMU_VENV_DIR outside (as in the v1 series) or ...

   diff --git a/python/tests/flake8.sh b/python/tests/flake8.sh
   index 51e0788462..1cd7d40fad 100755
   --- a/python/tests/flake8.sh
   +++ b/python/tests/flake8.sh
   @@ -1,2 +1,2 @@
    #!/bin/sh -e
   -python3 -m flake8
   +python3 -m flake8 qemu/

... to ensure flake8 parses only the files from the 'qemu' directory 
(btw, this is how tests/pylint.sh is configured). I prefer the later.

>   .PHONY: help
>   help:
>   	@echo "python packaging help:"
> @@ -14,6 +16,11 @@ help:
>   	@echo "    Requires: Python 3.6 - 3.10, and tox."
>   	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
>   	@echo ""
> +	@echo "make check-dev:"
> +	@echo "    Run tests in a venv against your default python3 version."
> +	@echo "    These tests use the newest dependencies."
> +	@echo "    Requires: Python 3.x"
> +	@echo ""
>   	@echo "make develop:    Install deps for 'make check', and"
>   	@echo "                 the qemu libs in editable/development mode."
>   	@echo ""
> @@ -22,6 +29,9 @@ help:
>   	@echo "make pipenv"
>   	@echo "    Creates pipenv's virtual environment (.venv)"
>   	@echo ""
> +	@echo "make dev-venv"
> +	@echo "    Creates a simple venv for check-dev. ($(QEMU_VENV_DIR))"
> +	@echo ""
>   	@echo "make clean:      remove package build output."
>   	@echo ""
>   	@echo "make distclean:  remove venv files, qemu package forwarder,"
> @@ -38,9 +48,30 @@ pipenv: .venv
>   check-pipenv: pipenv
>   	@pipenv run make check
>   
> +.PHONY: dev-venv
> +dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
> +$(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
> +	@echo "VENV $(QEMU_VENV_DIR)"
> +	@python3 -m venv $(QEMU_VENV_DIR)
> +	@(							\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> +		. $(QEMU_VENV_DIR)/bin/activate;		\
> +		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
> +		make develop 1>/dev/null;			\
> +	)
> +	@touch $(QEMU_VENV_DIR)
> +
> +.PHONY: check-dev
> +check-dev: dev-venv
> +	@(							\
> +		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
> +		. $(QEMU_VENV_DIR)/bin/activate;		\
> +		make check;					\
> +	)
> +
>   .PHONY: develop
>   develop:
> -	pip3 install -e .[devel]
> +	pip3 install --disable-pip-version-check -e .[devel]
>   
>   .PHONY: check
>   check:
> @@ -56,4 +87,4 @@ clean:
>   
>   .PHONY: distclean
>   distclean: clean
> -	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
> +	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/


