Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B962EEDF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwMq-00012b-TM; Fri, 18 Nov 2022 03:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwMo-0000xZ-8b
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:04:54 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwMl-000392-Vj
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:04:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id k8so8104894wrh.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 00:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IpX/ID5wjYZEraq2OpDMEh+qOqjGaXzhHouNsF/6wvY=;
 b=x8H6VD5dp+yc4PWRwQPIKsKV4vN7bz71bN/WBtPoOkT2xrFNeC7Q/HYcQRMm7UnNXX
 tR3E+Ti3Vq2+5/qfktrkteYLp3Pqg2nX/TEIrkTcxak31zq+LWY5XNexNdEoVMWjZx5R
 I4K+tbRx1/RY6m3HZ+HA3EyqCUFXnY/T/Gs9ZyMCKupDZbDD/Z7wGxd1fO/m7njPKMqb
 y0ezkz2OJxSWshAT8WW+syjJeWE36YPit8tqbyZd+633flDfB6yvBaawlPvnWwv55zDJ
 vXJ3Ni1driek196MM6kb7IrOgX46GdCBRVmMPG+Qp3y/tU0XftPuxVwBEsSir6e9OiYz
 19Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpX/ID5wjYZEraq2OpDMEh+qOqjGaXzhHouNsF/6wvY=;
 b=np7OClCUQYUs356+jpB0tOTCH4xGblxU6PuDsGqbiiSKVAt/af7Sjg0vUBt2qPJtr4
 svSLWyzB19NsPbwrKemOJpx/UQbITYzeMn/G/wsBUagvxGKDef8tAQUzedHWse5r3o4m
 COSW1pW8gTU9veErP/eh4doEJsHzDm14J4CvDP64IUvYwQCWEC65o7JPwZpViHAGwNJD
 lDo8+tKaSpHVaZ9gZT57WcpmMv2DOyA3Q3kzobb5LRkujt5BuPUEa9AQle5HnBawPICu
 36+K7xTIMgbcXLYguWAsLonEDmWSIjwOfys99vK+srtA11rAoiVmpwvhX2pIEUzOgGPz
 48CA==
X-Gm-Message-State: ANoB5pl7cw0rIKHjlC/oX69DE55gFDuNMKuX7sX28KR2gBFW/F91vzdA
 xq3Co+Cee9kxDFlXsbF6oqNKyQ==
X-Google-Smtp-Source: AA0mqf5m2tcqVtJpKMXuYzW+Mw4wo4l/+n9mTSXTf5E1RV8St/UcdI0maNBn7I506Higco5B/npMAw==
X-Received: by 2002:a05:6000:983:b0:236:aacc:ea07 with SMTP id
 by3-20020a056000098300b00236aaccea07mr3692007wrb.36.1668758690431; 
 Fri, 18 Nov 2022 00:04:50 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b002305cfb9f3dsm2857826wrt.89.2022.11.18.00.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:04:49 -0800 (PST)
Message-ID: <b3032db3-2b40-17ea-1b68-e331319c37ce@linaro.org>
Date: Fri, 18 Nov 2022 09:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 09/13] tests/avocado: introduce alpine virt test for CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:Virt" <qemu-arm@nongnu.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/11/22 18:25, Alex Bennée wrote:
> The boot_linux tests download and run a full cloud image boot and
> start a full distro. While the ability to test the full boot chain is
> worthwhile it is perhaps a little too heavy weight and causes issues
> in CI. Fix this by introducing a new alpine linux ISO boot in
> machine_aarch64_virt.
> 
> This boots a fully loaded -cpu max with all the bells and whistles in
> 31s on my machine. A full debug build takes around 180s on my machine
> so we set a more generous timeout to cover that.
> 
> We don't add a test for lesser GIC versions although there is some
> coverage for that already in the boot_xen.py tests. If we want to
> introduce more comprehensive testing we can do it with a custom kernel
> and initrd rather than a full distro boot.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v1
>    - use "virt" image instead (even faster)
>    - don't drop boot_linux (it is now disabled for CI)
>    - re-phrase commit message
>    - add alpine to the test name
> ---
>   tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
>   1 file changed, 45 insertions(+), 1 deletion(-)


> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def test_alpine_virt_tcg_gic_max(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=accel:tcg
> +        """
> +        iso_url = ('https://dl-cdn.alpinelinux.org/'
> +                   'alpine/v3.16/releases/aarch64/'
> +                   'alpine-virt-3.16.3-aarch64.iso')
> +
> +        # Alpine use sha256 so I recalculated this myself
> +        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
> +        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0')
> +        self.require_accelerator("tcg")
> +
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "max,pauth-impdef=on")
> +        self.vm.add_args("-machine",
> +                         "virt,acpi=on,"
> +                         "virtualization=on,"
> +                         "mte=on,"
> +                         "gic-version=max,iommu=smmuv3")
> +        self.vm.add_args("-smp", "2", "-m", "1024")
> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
> +                                               'edk2-aarch64-code.fd'))

I am not sure about restricting to BUILD_DIR, I'd rather use an
externally prebuilt image, i.e.:
https://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/4710/QEMU-AARCH64/RELEASE_GCC5/

(I'd like to use these Avocado tests with a distrib provided QEMU
binary).

Anyhow can be fixed later, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


