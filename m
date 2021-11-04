Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906944538E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:08:46 +0100 (CET)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micU1-0002OP-Jr
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1micCM-00020q-1B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1micCH-0001Jb-P8
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636030225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwK70Z9P9mY30F+cwnX4Uy3wW0E93dxpKhGZ3NP1Ptg=;
 b=UJEJzGyR0s/cAnqh5G8TOqGWwNgif24Jaq1Gto2QiOfhyGj2wpZzmsrmCcw2zc0kqunAl2
 z7o+pm3Rmr6wsRMB9PSpGRKu/NmEaoQCtqSMM/kjCihrl6Sm1BbBzM4+7h645f0boCny49
 lAkkpIlwQA/CA9WUofbRvkjh2sm1PGM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-wW6JP5J6O8qpnFli50YkHQ-1; Thu, 04 Nov 2021 08:50:23 -0400
X-MC-Unique: wW6JP5J6O8qpnFli50YkHQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso4363108wms.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UwK70Z9P9mY30F+cwnX4Uy3wW0E93dxpKhGZ3NP1Ptg=;
 b=Y9JPn89qlcTDg/o6ULr0dDx9Ulx70WhkHHqV6Z5cCp1ls4mTG2UduDrq5FIqMnf6HV
 rq8nkN9+BDJeQVj43Nw/5YbkL85Qdty1wRXdd1WVX1enAwhfdpu/YT3nzUeTpDCYOSEh
 u0barYPmqOTfF2gZpXkzDfGeJ4fqMHV35gMvqlQ/jtfm+YFrAJXxk2RWFMLb6JY4m6UG
 /+JHs9elr1B9qTYsvdFJTM4aPjDv+UjvWdqoEwLA4kqxvzDmVeZGNbTUDKLlFbwn6yv3
 c/ctKY8+Ll3KCUbjOzsZwwgFL7gAvoJRRiY45WrQVuLhYjPJBhb450pbxN1jkWFFr26E
 qWTQ==
X-Gm-Message-State: AOAM532ZuKiah6LtLvImIDxUmINHZluqTSzaWRiaVoU4cCZ0DNZverVC
 +4mGfsHmhD4Nt4L0r8HVPqceFybXR+qKrJ8CkUM6JQzDVlXFMDOjTYH0hIDJpQTutLS6ifuveqN
 UtUUJDU4UdZMbrVs=
X-Received: by 2002:adf:a389:: with SMTP id l9mr53615047wrb.121.1636030221993; 
 Thu, 04 Nov 2021 05:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0aEdqpdFx5rYgl53fG+ir2eOm3n165Tqq5LfspUZdEi8pCLsUo3knM7z+TY1e/BTyHK/RpA==
X-Received: by 2002:adf:a389:: with SMTP id l9mr53615014wrb.121.1636030221777; 
 Thu, 04 Nov 2021 05:50:21 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id c17sm5357267wmk.23.2021.11.04.05.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:50:21 -0700 (PDT)
Message-ID: <3f261dc1-aa3c-affe-1d56-1e41e2ccf6fa@redhat.com>
Date: Thu, 4 Nov 2021 13:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] tests/acceptance: rename tests acceptance to tests
 avocado
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211103211404.79953-1-willianr@redhat.com>
 <20211103211404.79953-2-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211103211404.79953-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 22:14, Willian Rampazzo wrote:
> In the discussion about renaming the `tests/acceptance` [1], the
> conclusion was that the folders inside `tests` are related to the
> framework running the tests and not directly related to the type of
> the tests.
> 
> This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the
> CI related files and the documentation.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  64 files changed, 113 insertions(+), 118 deletions(-)

> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include

> -.PHONY: check-venv check-acceptance
> +.PHONY: check-venv check-avocado

> -check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> +check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>  	$(call quiet-command, \
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \

We should keep check-acceptance, eventually printing a deprecation
message. Smth like:

  check-acceptance: check-avocado a
      @echo "Note 'make $@' is deprecated, use 'make $<' instead" >&2

> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/avocado/ppc_prep_40p.py
> @@ -13,6 +13,10 @@
>  
>  
>  class IbmPrep40pMachine(Test):
> +    """
> +    :avocado: tags=arch:ppc
> +    :avocado: tags=machine:40p
> +    """
>  
>      timeout = 60
>  
> @@ -24,8 +28,6 @@ class IbmPrep40pMachine(Test):
>      @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>      def test_factory_firmware_and_netbsd(self):
>          """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
>          :avocado: tags=os:netbsd
>          :avocado: tags=slowness:high
>          """
> @@ -48,10 +50,6 @@ def test_factory_firmware_and_netbsd(self):
>          wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
>  
>      def test_openbios_192m(self):
> -        """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
> -        """
>          self.vm.set_console()
>          self.vm.add_args('-m', '192') # test fw_cfg
>  
> @@ -62,8 +60,6 @@ def test_openbios_192m(self):
>  
>      def test_openbios_and_netbsd(self):
>          """
> -        :avocado: tags=arch:ppc
> -        :avocado: tags=machine:40p
>          :avocado: tags=os:netbsd
>          """
>          drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'

Unrelated change, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


