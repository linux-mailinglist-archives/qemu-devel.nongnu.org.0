Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A676E8BF2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:58:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPAz-0000rE-KQ; Thu, 20 Apr 2023 03:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPAw-0000r6-5X
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:57:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppPAt-0005vw-6i
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:57:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o29-20020a05600c511d00b003f1739de43cso658824wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 00:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681977469; x=1684569469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGIg7/0OArYQIa6hzMMaFDLnt/sTCsfKVy9cBXL2P0g=;
 b=HsLWquY6HUqFETKQF7J4hoNO4A5B9eR6A6EPqpEo4LCJQ7NZ2R/WNBA2VNcZxiZSN2
 4eOMEaMSJDDWsOCXzRiBfB2fymX6ge+sMf6b2tQu3wfM0RbGFbMhD7Rc3exQHSNOPP3R
 MTti36XO65ydAIjz9WeKQc5zvM8+TvF4TZmrJbaPhPGurEEVKFlkaJjmJoxMak4WDXyH
 9zb6hTrnBgcravku/JgjNwhcvDcf9QUkHS+hTArjo2I0K/n3PpTQ7u7s5/9qWmELvQVy
 0tzEHc1PdcrwcTGZk0NlMeZmG9JXuasrBQ7VEHWE27tvpwK9GZvUJxfHT3doHf6o9NiR
 d/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681977469; x=1684569469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGIg7/0OArYQIa6hzMMaFDLnt/sTCsfKVy9cBXL2P0g=;
 b=b5a8t0KL0jA0cVtJqGadLFmM4j72kouPOAIk4/LpY+hn/WMmdgdfJdF/2outrq052T
 k/pOUzsuQ57B0p3dHst6UBdRkDDKUJWpZF0JMLXVsqIaA87BqKiqT7PyMvJ8xgpEXdNO
 fKgQoQSe4LzPB0McfTLj6igJYIqxKQQe99fXoiwIj6GZiUOnMxfLlWk6FtTrEkamU9Bp
 JDp682H/8CpIxzOd4BmURusWr2AOtg0nFzsBpzFID7shuvWMrWQ/ZQjpw5MqK1/WQOeY
 Lq9mbDZtid1J2kh+zLW5bWiPveP/HCDalDwFEiifs+YG/ArkKKG7DyTJBBDLa5xylGP1
 QlUQ==
X-Gm-Message-State: AAQBX9dUg5iz+7gytql9MR3hnyjLUxL+rFew3mfMF3kRcYrmtJ7VeQsG
 8kTE1wR1cDiJN9QTfdsADl6SJw==
X-Google-Smtp-Source: AKy350aui1AaxCIozY3T6itxdevRlopRD8EpyQlcqL1/cJAB7QbxOfurIipK1J3P4ld5mCU+4yFm9w==
X-Received: by 2002:a7b:c059:0:b0:3eb:25ff:3446 with SMTP id
 u25-20020a7bc059000000b003eb25ff3446mr495928wmc.4.1681977469237; 
 Thu, 20 Apr 2023 00:57:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c9-20020a7bc009000000b003ede3e54ed7sm1222663wmb.6.2023.04.20.00.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:57:48 -0700 (PDT)
Message-ID: <eced17f9-387c-ce07-233f-6c398840c936@linaro.org>
Date: Thu, 20 Apr 2023 09:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Kautuk,

On 19/4/23 11:22, Kautuk Consul wrote:
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
> 
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:
> 
> With boot_linux.py
> ------------------
>    lines......: 13.8% (58006 of 420997 lines)
>    functions..: 20.7% (7675 of 36993 functions)
>    branches...: 9.2% (22146 of 240611 branches)
> Without boot_linux.py (without this patch changes)
> --------------------------------------------------
>    lines......: 11.9% (50174 of 420997 lines)
>    functions..: 18.8% (6947 of 36993 functions)
>    branches...: 7.4% (17580 of 239017 branches)
> Without boot_linux.py (with this patch changes)
> -----------------------------------------------
>    lines......: 13.8% (58287 of 420997 lines)
>    functions..: 20.7% (7640 of 36993 functions)
>    branches...: 8.4% (20223 of 240611 branches)
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 124 +++++++++++++++++++++++++++++-
>   1 file changed, 122 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index d343376faa..f763ee5d50 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -11,6 +11,8 @@
>   
>   import os
>   import time
> +import string
> +import random
>   
>   from avocado import skip, skipIf
>   from avocado_qemu import QemuSystemTest
> @@ -308,7 +310,7 @@ def test_ppc64(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:pseries
> -        :avocado: tags=cpu:POWER8
> +        :avocado: tags=cpu:POWER10
>           :avocado: tags=endian:big
>           :avocado: tags=console:hvc0
>           :avocado: tags=tuxboot:ppc64
> @@ -316,21 +318,139 @@ def test_ppc64(self):
>           :avocado: tags=extradev:driver=spapr-vscsi
>           :avocado: tags=root:sda
>           """
> +        # Generate a random string
> +        res = ''.join(random.choices(string.ascii_lowercase +
> +                                     string.digits, k=8))
> +
> +        # create qcow2 image to be used later.
> +        process.run('./qemu-img create -f qcow2 '

Please take qemu-img from $PATH.

> +                    '/tmp/tuxrun_baselines_ppc64_' + str(res) +
> +                    '.qcow2 1G')

Do not use /tmp directly (i.e. Windows OS doesn't have it).
You can use:
- self.workdir
- with tempfile.NamedTemporaryFile() as qcow2:
- with tempfile.TemporaryDirectory(prefix='tuxrun_') as tmpdir:

Also, better to define the path once in a variable:

            qcow_img_path = f'{tmpdir}/tuxrun_baselines.qcow2'

> +        # add device args to command line.
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', 'virtio-net,netdev=vnet')
> +        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
> +                         '-device', '{"driver":"virtio-net-pci","netdev":'
> +                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
> +                         '"bus":"pci.0","addr":"0x9"}')
> +        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
> +                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
> +                         ',"bus":"pci.0","addr":"0x3"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
> +                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
> +        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
> +                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
> +                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
> +        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
> +                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
> +        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
> +        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
> +                         ',"bus":"usb.0","port":"1"}')
> +        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
> +                         ',"bus":"usb.0","port":"2"}')
> +        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
> +                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
> +        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
> +                         ',"filename":"/dev/urandom"}',
> +                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
> +                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
> +        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
> +                         '"id":"objcrypto0","queues":1}',
> +                         '-device', '{"driver":"virtio-crypto-pci",'
> +                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
> +                         ':"pci.0","addr":"0xa"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
> +                         ',"index":1,"id":"pci.1"}')
> +        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
> +                         ',"reg":12288}')
> +        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
> +                         '-object', 'memory-backend-ram,id=ram1,size=1G',
> +                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
> +        self.vm.add_args('-drive', 'file=/tmp/tuxrun_baselines_ppc64_' +
> +                         str(res) + '.qcow2,format=qcow2,if=none,id='

Using it here:

            self.vm.add_args('-drive', f'file={qcow_img_path},...

> +                         'drive-virtio-disk1',
> +                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
> +                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
> +                         ',bootindex=2')
>           self.common_tuxrun(drive="scsi-hd")
>   
> +        # remove qcow2 image
> +        process.run('rm /tmp/tuxrun_baselines_ppc64_' + str(res) + '.qcow2')

No need if using the 'with ...' syntax, automatically cleaned up.

