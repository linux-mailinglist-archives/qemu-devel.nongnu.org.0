Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F36576B9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAW2n-0001jx-6W; Wed, 28 Dec 2022 08:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW2Q-0001dm-Ed
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:00:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW2M-0008Q1-Mz
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:00:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso4692208wms.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=844kbkEnp9o4+AaVH1vt05kFMxYhf24pDvrl/MtOXlI=;
 b=v0c3vuozIu2ZU8mRLFZilYRK103pkkAM3RLdiW1rSxfuv4TiJyHy8u/24vZSbnJEFv
 CJ/ZwUoRocBNeFDFe0JTSV9zQnw4kXFHJRQNwki7JY2G+0BsCp51u+9dPgbAAML1hBhD
 ytI037H9AlpuQD4hp8HhzPOaHdY+eT81rgtM7YFMBec1t49RiU/2SXdWwLx2pTdNTrwF
 0WLggg9zcFrmpX62iWnsvqCQMxwnAKIt6w7MmBhvVfude7VakowpuGrbHR08CNnPygRQ
 8KyTg6Wg6GmjtMtP1v8mHLGZlgVLVe8V9veGY1zls3kE/Mkz+rWDNwI/PJj/G906PUTd
 n/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=844kbkEnp9o4+AaVH1vt05kFMxYhf24pDvrl/MtOXlI=;
 b=C/50CopA06hxABel/jLt6xBNqZgbHJK5NMPcbUEuwVj7ZojXyuS/m3LWv0SsPka4qK
 De1SI1+8wsWhu3bNfHyE84ib2x1zDe20v/ipTO7B3PMW1s6AilUo90CsIC4DXo5OeOI4
 KXRP/XR/ES2eBcn+d5exegji7cLVhmHvZ3cRFTzSUPTyq9KSbOrp1d3MA/JEFpGn81OH
 Wk7ldICKh6LYOQWhETEXuetuLyePTA/SGBgfCpBz4AS6OYVuVd/ZtXJBtgPUkEClEHfj
 QUt9moU9kxyDK/aquSFuYTrey3kh7FhIHkYJ73GHzpc+j8J9Z5Vi8ioJen+d17SDbKpu
 ZjJA==
X-Gm-Message-State: AFqh2krkfBXS1WP2MiDp4fSLMoF59i94ZK9IzyrCTQcv0uWEy66qUBMf
 FM0VQmfTmWrvcqReUEDzsY4x5w==
X-Google-Smtp-Source: AMrXdXvphywdBJrw8wrxxpQR8/HzXS5VrMDpkLpfxvMx5xfpE/48C9995SpzxWoSKlZG05LD7BSiCw==
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id
 s4-20020a05600c384400b003d344068a3amr22626455wmr.30.1672232399511; 
 Wed, 28 Dec 2022 04:59:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003d34f170487sm32092769wmo.0.2022.12.28.04.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:59:59 -0800 (PST)
Message-ID: <1ff3c774-edaf-74cf-df57-ebcc7d75363f@linaro.org>
Date: Wed, 28 Dec 2022 13:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
 <20221228124242.184784-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228124242.184784-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/12/22 13:42, Daniel Henrique Barboza wrote:
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
> 
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
> 
> The riscv32 'spike' machine isn't bootable at this moment, requiring an
> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
> or add a 'skip' test to remind us about it. To work as a reminder that
> we have a riscv32 'spike' test that should be enabled as soon as Opensbi
> QEMU rom receives the fix, we're adding a 'skip' test:
> 
> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
>          SKIP: requires OpenSBI fix to work
> 
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   tests/avocado/riscv_opensbi.py | 77 ++++++++++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 tests/avocado/riscv_opensbi.py
> 
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
> new file mode 100644
> index 0000000000..64fcf3c774
> --- /dev/null
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -0,0 +1,77 @@
> +# opensbi boot test for RISC-V machines

s/opensbi/OpenSBI/

> +#
> +# Copyright (c) 2022, Ventana Micro
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado import skip
> +from avocado_qemu import wait_for_console_pattern
> +
> +class RiscvOpensbi(QemuSystemTest):
> +    """
> +    :avocado: tags=accel:tcg
> +    """
> +    timeout = 5

Easier to review common code once:

        def boot_opensbi(self):
            self.vm.set_console()
            self.vm.launch()
            wait_for_console_pattern(self, 'Platform Name')
            wait_for_console_pattern(self, 'Boot HART MEDELEG')

> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:virt
> +        """

            self.boot_opensbi()

> +    def test_riscv64_spike(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:spike
> +        """

            self.boot_opensbi()

[...]

> +    @skip("requires OpenSBI fix to work")
> +    def test_riscv32_spike(self):
> +        """
> +        :avocado: tags=arch:riscv32
> +        :avocado: tags=machine:spike
> +        """

            self.boot_opensbi()



