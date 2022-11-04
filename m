Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6A6193BE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:43:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtDG-0007Ff-KV; Fri, 04 Nov 2022 05:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqtD7-0007DB-Q2
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:42:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqtD5-00067G-3m
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:42:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so6208987wrb.13
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eyolgd9snAmDnylLxMB6aqZBFzrOFTsWRVnlOpBec1A=;
 b=oC9AyKYEyTf/l9SBwYmb/820cbO2DbUe5OToYyUkqftDw1Eb1dygGdSzGlp1jzOS2O
 l1Xhz5lFgor7I2JQaj3xcP41Jpk3A6gahzTAcTRkAYvuH+kV0oI0qTKZsE2aIFRqRnU7
 OAY1VgkvEvXYcX7D9SzXekz/SRP9WUPpfHEARPlLisQz4DT7vV8isQV45ZESAzIh3LDI
 1oP/bX2UAGotnNEObdPJPRlfQLPQeFCmQCRIGC7qOnI8sl0j7ENTKtJmf/N+ZxC/iy5y
 TRGDeTnvHv7+UogzHA5KmCgXMWbub4tebfnrwb8SvSPylKds+y0olP1A8lL+y8+jq0nH
 Bu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eyolgd9snAmDnylLxMB6aqZBFzrOFTsWRVnlOpBec1A=;
 b=1aabUTRcAdEQayGscSDUQTcHhm3ESEWX+NZmSZDxpTkLT7ECbFVRn2lqW0XwdhJevX
 t79DJJ0kOXK8OUw/DoCcmaSQc2ECg4uVLDnqPORGS7DtwCaENRtxMOSmQxRpVs6Vv4WZ
 99/KEEIu5KAx92aqh1KYSA46gfVv8f8ESivWpg24wXufM3P/tddl1xjvgAJ11D769cMQ
 OceMj1SuazOSAuvF5H3WpI2PfX2qbx61SFUFRxWavHXu6s3Tr5wiWQDdBDhZrEEaQcBB
 EIimqaziMybeXid07MGguyk6/vimcEB9InGTFqmKL7OZ1Ywe75VPHlpwt/bkLwVbGJ5X
 sG2A==
X-Gm-Message-State: ACrzQf12wDkq+Msw5vaWYiF4GV8hShSMNhgZwd2E8KdqilXqQBBdtxco
 m5qpN20eh2WJMk4fIhFhbZPcvg==
X-Google-Smtp-Source: AMsMyM6woUxGKSHSu0aPafJq9CLz+TJ9HagbLpUZH0EVLKRDGepuzz4F+dmDHl71bOjsxsw+y5bioQ==
X-Received: by 2002:adf:e804:0:b0:236:657e:756e with SMTP id
 o4-20020adfe804000000b00236657e756emr22083743wrm.452.1667554916356; 
 Fri, 04 Nov 2022 02:41:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003bfaba19a8fsm2223387wmi.35.2022.11.04.02.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:41:55 -0700 (PDT)
Message-ID: <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
Date: Fri, 4 Nov 2022 10:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Reduce noise on the
 console for SDK tests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221104075347.370503-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104075347.370503-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 08:53, Cédric Le Goater wrote:
> The Aspeed SDK images are based on OpenBMC which starts a lot of
> services. The output noise on the console can break from time to time
> the test waiting for the logging prompt.

IIUC OpenBMC uses systemd, so you can mask pointless services from
the kernel cmdline. See for example test_arm_quanta_gsj():

  # Disable drivers and services that stall for a long time during boot,
  # to avoid running past the 90-second timeout. These may be removed
  # as the corresponding device support is added.
  kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + (
          'console=${console} '
          'mem=${mem} '
          'initcall_blacklist=npcm_i2c_bus_driver_init '
          'systemd.mask=systemd-random-seed.service '
          'systemd.mask=dropbearkey.service '
  )

> Change the U-Boot bootargs variable to add "quiet" to the kernel
> command line and reduce the output volume. This also drops the test on
> the CPU id which was nice to have but not essential.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index fba6527026..1fc385e1c8 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -12,6 +12,7 @@
>   from avocado_qemu import wait_for_console_pattern
>   from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
>   from avocado.utils import archive
>   from avocado import skipIf
>   
> @@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
>   
>   class AST2x00MachineSDK(QemuSystemTest):
>   
> +    EXTRA_BOOTARGS = ' quiet'

Maybe less bug-prone to handle the spaces around EXTRA_BOOTARGS where
the variable is used.

> -    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
> +    def do_test_arm_aspeed_sdk_start(self, image):
>           self.require_netdev('user')
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> @@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>           self.vm.launch()
>   
>           self.wait_for_console_pattern('U-Boot 2019.04')
> -        self.wait_for_console_pattern('## Loading kernel from FIT Image')
> +        interrupt_interactive_console_until_pattern(
> +            self, 'Hit any key to stop autoboot:', 'ast#')
> +        exec_command_and_wait_for_pattern(
> +            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
> +        exec_command_and_wait_for_pattern(
> +            self, 'boot', '## Loading kernel from FIT Image')
>           self.wait_for_console_pattern('Starting kernel ...')
> -        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)


