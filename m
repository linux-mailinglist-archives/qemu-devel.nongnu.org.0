Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B54910E4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:11:29 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YLc-0000da-Ts
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9YId-00080u-ST; Mon, 17 Jan 2022 15:08:19 -0500
Received: from [2607:f8b0:4864:20::232] (port=40509
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9YIY-0002DR-AV; Mon, 17 Jan 2022 15:08:19 -0500
Received: by mail-oi1-x232.google.com with SMTP id bx18so6764581oib.7;
 Mon, 17 Jan 2022 12:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lNY59be8Pfza9HOVUy0rFQ1yaOjEx9SbGukIsQdhFi4=;
 b=FkKr9mEUMWjVBBiTeTGPQdCjfGwQ/vvco3ow9EjVnUG61pFor2Eb8xrYjFVaOYgEBi
 XPeonvH1W9zObnGPPVD3SKj7WakCQH0JRS+ndbSX6RT0uzG41cu4L3hlxhFoOTSexE2D
 8SGc0tESQ7YP6kruvpu1tYH4ACHhNV/72qJlRfr4Kd7YlBlL193Uh4GcrbWhDfrY8377
 btYptgV3x6lhap662n+PXDdhHMR64mIpmuxA7s5K5NCs222dJYffFv/slN7gpx01jpSD
 iw+j//OuCQJxg9xoPiLtt9FrXfb99nSjQLNj/aU3GSpovJNYbYEfJWL9JfbU1izCzdZJ
 XKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lNY59be8Pfza9HOVUy0rFQ1yaOjEx9SbGukIsQdhFi4=;
 b=BHHaPqJJNc5GlV8tA1Xxa8bK27Q5LcMNEfzHNHd9/Me6AGg0l1zNMpYnh1UDSl2vH+
 s2P5tsKGdUVRJ4u1Yxc5YDYBZfF9E9uFUqDqtlGYRLFDa6YodbHnBwvNR7HorPMqFOEt
 GMPBzJjKnkrWkEtXeJMaQo7UfSmwZJ6HPatVYjuSnocEz5Jhxm0LN4tuxZ0XV0QkdGmX
 suHO5QIMllu++Ks9VbHOpHx3kLdFwBbBnRU7/Q5oHq0jWMclb2iZUYT5X54cZB7XDbcH
 QAHygNdoXwFp1frQEP1FXluciFmDEYfeQSN6IVUPQPG9Hzo6YAUGbU3xgtwO4onzffnC
 4aRQ==
X-Gm-Message-State: AOAM530lrAHqZWyV1ayvXqGhPoiY4JWE6BQ3UKLrRk2d1OoZ/EASDPIr
 6E0PC1KJNII6VlVtLoFB6nI=
X-Google-Smtp-Source: ABdhPJwz7yORYKFaMszIp0KxQctk701LwnLEGFXQOWnJHwbc3SopnteLY9LTcOBPxcBFY99hkqJQTg==
X-Received: by 2002:a05:6808:1828:: with SMTP id
 bh40mr9950400oib.31.1642450092375; 
 Mon, 17 Jan 2022 12:08:12 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e26sm5667899oog.46.2022.01.17.12.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 12:08:12 -0800 (PST)
Message-ID: <e83875f1-70bd-2a5b-ba4e-39baa4cc3c6e@gmail.com>
Date: Mon, 17 Jan 2022 17:08:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220117144757.782441-1-farosas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220117144757.782441-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/22 11:47, Fabiano Rosas wrote:
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


Not sure if the copyright year must be changed to 2022 (the year that this is going to
be published) or 2021 (the year that it was developed). GNU docs isn't clear about
it. Our COPYING file is also not clear about whether we should put the code creation
or code publishing year in this header.

I don't mind leaving it as 2021. I'm just curious about what is the semantics involved
here.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

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

