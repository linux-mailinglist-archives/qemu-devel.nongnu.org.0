Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA49447B84
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:04:04 +0100 (CET)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzdL-0002rN-9N
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mjzaY-0000v7-C9
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mjzaV-0001Jv-Iq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kkMb7kDsGzSofKV1UUTTx5Jp9cMER8zKuDMM54Zm9g=;
 b=WfXsI3j/WfGjkYRkH5Fle3tdHL/tE2+9K5hsuzv4oHK4UIr/6tUrigaZC2yQhqY6Vs5c+0
 DnJ4nabKDOJUTSUeyFD/3VKOtjOuWmu4ITzb7xQ92Ylx2KOgjhvy/52QQe2czGM5JsFKKs
 EO1NHRlEsG96hIIFdjgji4qDZQRhf80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-H6NM8yGVMt6rLgZbazGqiA-1; Mon, 08 Nov 2021 03:01:02 -0500
X-MC-Unique: H6NM8yGVMt6rLgZbazGqiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A5F1006AA1;
 Mon,  8 Nov 2021 08:01:00 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05B5B60936;
 Mon,  8 Nov 2021 07:59:52 +0000 (UTC)
Message-ID: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
Date: Mon, 8 Nov 2021 08:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
In-Reply-To: <20211105155354.154864-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2021 16.53, Willian Rampazzo wrote:
> This introduces a new `make` target, `check-avocado`, and adds a
> deprecation message about the `check-acceptance` target. This is
> a preparation for renaming the `tests/acceptance` folder to
>   `tests/avocado`.
> 
> The plan is to remove the call to the `check-avocado` target one
> or two months after the release and leave the warning to force
> people to move to the new `check-avocado` target.
> 
> Later, the `check-acceptance` target can be removed. The intent
> is to avoid a direct impact during the current soft freeze.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/about/deprecated.rst | 13 +++++++++++++
>   tests/Makefile.include    | 17 ++++++++++++-----
>   2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 56f9ad15ab..7bf8da8325 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -410,3 +410,16 @@ nanoMIPS ISA
>   
>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>   As it is hard to generate binaries for it, declare it deprecated.
> +
> +Testing
> +-------
> +
> +Renaming of the acceptance folder to avocado
> +''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``tests/acceptance`` folder was never used to store acceptance tests
> +in terms of software engineering. This naming can confuse developers
> +adding tests using the Avocado Framework to this folder. The folder
> +name change to ``tests/avocado`` also changed the ``make`` target from
> +``check-acceptance`` to ``check-avocado``. In this case, the use of the
> +``check-acceptance`` target is deprecated.

Not sure whether we need  to document this in deprecated.rst, too, since 
we're normally only listing the things here that affect the users of the 
qemu binaries, not the people who want to recompile and run the tests... 
OTOH, I don't mind too much either if we list it here... Anybody else got an 
opinion on this?

> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8434a33fe6..8e8ee58493 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
>   	@echo " $(MAKE) check-tcg            Run TCG tests"
>   	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>   endif
> -	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
> +	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
>   	@echo
>   	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
>   	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
> @@ -24,7 +24,7 @@ endif
>   	@echo
>   	@echo "The following are useful for CI builds"
>   	@echo " $(MAKE) check-build          Build most test binaris"
> -	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
> +	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
>   	@echo
>   	@echo
>   	@echo "The variable SPEED can be set to control the gtester speed setting."
> @@ -83,7 +83,7 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>   
>   # Python venv for running tests
>   
> -.PHONY: check-venv check-acceptance
> +.PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
>   
>   TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>   TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
> @@ -127,12 +127,12 @@ get-vm-image-fedora-31-%: check-venv
>   	$(call quiet-command, \
>                $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
>                --distro=fedora --distro-version=31 --arch=$*, \
> -	"AVOCADO", "Downloading acceptance tests VM image for $*")
> +	"AVOCADO", "Downloading avocado tests VM image for $*")
>   
>   # download all vm images, according to defined targets
>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>   
> -check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> +check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>   	$(call quiet-command, \
>               $(TESTS_VENV_DIR)/bin/python -m avocado \
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> @@ -142,6 +142,13 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>               "AVOCADO", "tests/acceptance")
>   
> +check-acceptance-deprecated-warning:
> +	@echo
> +	@echo "Note '$(MAKE) check-acceptance' is deprecated, use '$(MAKE) check-avocado' instead."
> +	@echo
> +
> +check-acceptance: check-acceptance-deprecated-warning | check-avocado
> +
>   # Consolidated targets
>   
>   .PHONY: check-block check check-clean get-vm-images
> 

Acked-by: Thomas Huth <thuth@redhat.com>


