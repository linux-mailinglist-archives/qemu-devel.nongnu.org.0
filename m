Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F6490C84
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:30:08 +0100 (CET)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UtS-0002rq-ON
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:30:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9UpH-000056-GK; Mon, 17 Jan 2022 11:25:50 -0500
Received: from [2607:f8b0:4864:20::433] (port=37632
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9UpE-0000m8-Ja; Mon, 17 Jan 2022 11:25:47 -0500
Received: by mail-pf1-x433.google.com with SMTP id p37so10626402pfh.4;
 Mon, 17 Jan 2022 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TZehxr3cXA0FupR5PGQife3goB5pn5WCSnWsEBXzmGI=;
 b=XHHBnYjG8ivIa+/bGO6+L39miab+/hOhngRblP9MlU+zG5txlQsVaow4vAduDOZTTl
 S96+6g9De1Kx29fepwt2qtuMMBUSa5TYf/HHzMXar0b9kCZpeuDEKUTc34JwXT6xAHoH
 Iu+SsR7BgA780n20ot+jaW20LD/i8YpidqEGqxWj+Ott/CVPrZ08tiQEo6xRKv/hpmA3
 n/kBaXlWLkd9baKimd+UwQTaMpBIqzt0J7zLQ0kvGavLqvBwmt8P+NUAOZNfgudX5oTC
 YyUUqea2Dbr3er15r1zQMuqEwXa8enFX/rxxFxiqIC6DbzatfCNheoe4Vi6fvxGGmeuV
 Knsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TZehxr3cXA0FupR5PGQife3goB5pn5WCSnWsEBXzmGI=;
 b=kyTMJtCNSXpUq8VZT6/i7sKvbdIhgy32aXXYwt8uH3k+vNimLjSgHjH7IxEI9Ivxe9
 g1jPvnoH/1lMrT6PRscelmeCqMUV0jOl6sT2b5kYCnRoK02t9ogPU9RLlSJ6IULZNJ9b
 5gNt8vbqvz3RnlM5zSHmtQ0stF9Oyr1QynY29nTQv9jOfJcS5Fzuj+sjk3JNDMPTb/AK
 fTUNCuSAl9H4QqHBZgD1RzcNLFqgxrdg6x4L3aS0SPt62Spk2EiZjLMwdW19zxI8Esh0
 TYTf5/xkr3uWay7pAGi69Ejh5eX88pl9Z6Gl+yDjXU63xnZA8RfcXS1X+li9+S0e6ZkH
 5hrA==
X-Gm-Message-State: AOAM530aAObJsgut7rQTimnANaFp2fxmHNyn9TcMN7c5xUQbch1OTGx9
 JgIdBegEXLSmtx7Lkaxixh4=
X-Google-Smtp-Source: ABdhPJzqEVF+rDzRUbUfVQqkKSImLX6k/MlFFTTo1iwxXyRlsqVBT10gHsthoth31uvnPrfXAVefAw==
X-Received: by 2002:a05:6a00:1a15:b0:4c2:838d:e9b4 with SMTP id
 g21-20020a056a001a1500b004c2838de9b4mr16110459pfv.66.1642436742836; 
 Mon, 17 Jan 2022 08:25:42 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id c11sm14663428pfl.134.2022.01.17.08.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 08:25:42 -0800 (PST)
Message-ID: <d9faf6bf-5e67-20fd-2fd8-2bf880dae9fa@amsat.org>
Date: Mon, 17 Jan 2022 17:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org
References: <20220117144757.782441-1-farosas@linux.ibm.com>
In-Reply-To: <20220117144757.782441-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi,

You forgot to Cc the maintainers [*]:

% ./scripts/get_maintainer.pl -f tests/avocado/ppc_74xx.py
Cleber Rosa <crosa@redhat.com> (reviewer:Integration Testi...)
"Philippe Mathieu-Daudé" <f4bug@amsat.org> (reviewer:Integration Testi...)
Wainer dos Santos Moschetta <wainersm@redhat.com> (reviewer:Integration 
Testi...)
Beraldo Leal <bleal@redhat.com> (reviewer:Integration Testi...)
qemu-devel@nongnu.org (open list:All patches CC here)

Doing it for you now. But since the patch is already reviewed,
it should normally be merged via the PPC tree (see commit 6634f1c43d0
for rationale).

[*] 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer

Since you are contributing various patches, you can see in this link
a tip (via git-config) to automatically call get_maintainers script.

On 17/1/22 15:47, Fabiano Rosas wrote:
> These tests ensure that our emulation for these cpus is not completely
> broken and we can at least run OpenBIOS on them.
> 
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
> ---
>   tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 123 insertions(+)
>   create mode 100644 tests/avocado/ppc_74xx.py
> 
> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
> new file mode 100644
> index 0000000000..556a9a7da9
> --- /dev/null
> +++ b/tests/avocado/ppc_74xx.py
> @@ -0,0 +1,123 @@
> +# Smoke tests for 74xx cpus (aka G4).
> +#
> +# Copyright (c) 2021, IBM Corp.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +
> +class ppc74xxCpu(QemuSystemTest):
> +    """
> +    :avocado: tags=arch:ppc
> +    """
> +    timeout = 5
> +
> +    def test_ppc_7400(self):
> +        """
> +        :avocado: tags=cpu:7400
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7410(self):
> +        """
> +        :avocado: tags=cpu:7410
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
> +
> +    def test_ppc_7441(self):
> +        """
> +        :avocado: tags=cpu:7441
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7445(self):
> +        """
> +        :avocado: tags=cpu:7445
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7447(self):
> +        """
> +        :avocado: tags=cpu:7447
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7447a(self):
> +        """
> +        :avocado: tags=cpu:7447a
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7448(self):
> +        """
> +        :avocado: tags=cpu:7448
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
> +
> +    def test_ppc_7450(self):
> +        """
> +        :avocado: tags=cpu:7450
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7451(self):
> +        """
> +        :avocado: tags=cpu:7451
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7455(self):
> +        """
> +        :avocado: tags=cpu:7455
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7457(self):
> +        """
> +        :avocado: tags=cpu:7457
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7457a(self):
> +        """
> +        :avocado: tags=cpu:7457a
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')


