Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD469F7A4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqxD-0001TJ-7f; Wed, 22 Feb 2023 10:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqxB-0001Sb-As
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:22:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqx9-00031Z-5a
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:22:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id j2so7942631wrh.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KJBJbv+415OUDEInsqHVKsr9uhTboRbJCqoLtf+TGo8=;
 b=r7bT62SofzRC1bwNPO7hS5b4tzLwRJBGDe6Jt4K/cQ2jfNp6GKYuBuA/KCSK6e3Ogg
 t+D8J4tsUVarn/3aNBEsvSjhCg+cFIb32gMhMXD1Sh4r+iJIVIlr+dZ9rXtvam+vUNOZ
 AUsMffrz8jO+PKsBR3omgxVP5QMwmUCjPeXths2qOa3LB4ztEEp34QCX3J9xDVZiBJWr
 Kth18vub1slFTHuMd0EIli0sos4uTRUGIhoorL6RcX0dVye2aCrNJGL8Xt0dNW4YXjI3
 RIGevXj+L6uDaZMWJunYwUfySWrPYAhxUs8AFl1hsvdFeGBy8dWh7n0f78CtI52/FOib
 J/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KJBJbv+415OUDEInsqHVKsr9uhTboRbJCqoLtf+TGo8=;
 b=RDyKCxE1+KIL3YKsqCu7bttgM0xs67Mh8gZBadRapBEZ1cyCA/llm1pAXI6ixK79SI
 hlJm0ZAi1VWmQ4UEm9A6YOSi91WwpuAhT2Mm0mHZS2deAfXq+QwTgYcIcvNc+YAAYoJT
 bUTz5uH4uCZOW0OfiAh1nTwss8vD+oOLFQ3wXtitU4xLe4r0/yOuwBu6v1hp9stjyCj/
 WrIdq/DWuCWYz/aPp2SXC3C3koTzFzE51NWwRKj4Uc1YHH6glHEZwr1csCnMbbgWJ+WH
 JeRKFM9mdxgQd2zOF9+cfU3VKt9k1RftUMehhRl2VbsA7kB1BlXAExz9+kiaQDnijMGp
 s7vA==
X-Gm-Message-State: AO0yUKWX3+BUsOC4hIfIqdvWuIqK5xNuKLLpnZ4uVAVlmPIQZLjqzKOV
 maLjQ8mkJHAu64tdNw/lzjIWwg==
X-Google-Smtp-Source: AK7set8xOdcXl1xLbIbXsKDjNPR5bXIJZvKd44S9vlvPX8Do9p8wT9hl73Vm+xxxDV98pO+bRxYuuQ==
X-Received: by 2002:a5d:5e93:0:b0:2c5:5297:24ae with SMTP id
 ck19-20020a5d5e93000000b002c5529724aemr6829460wrb.2.1677079361050; 
 Wed, 22 Feb 2023 07:22:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb4f000000b002c55b0e6ef1sm8274104wrs.4.2023.02.22.07.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:22:40 -0800 (PST)
Message-ID: <40eb45d9-e51e-bbe9-bb09-40a5cb3aed24@linaro.org>
Date: Wed, 22 Feb 2023 16:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 02/12] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 15/2/23 20:25, Alex Bennée wrote:
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
> 
>    Overall coverage rate:
>      lines......: 11.2% (59584 of 530123 lines)
>      functions..: 15.0% (7436 of 49443 functions)
>      branches...: 6.3% (19273 of 303933 branches)
> 
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
> 
>    Overall coverage rate:
>      lines......: 11.0% (58121 of 530123 lines)
>      functions..: 14.9% (7343 of 49443 functions)
>      branches...: 6.0% (18269 of 303933 branches)
> 
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>    - fix checkpatch warning
> ---
>   tests/avocado/boot_linux.py           | 48 ++++----------------
>   tests/avocado/machine_aarch64_virt.py | 64 ++++++++++++++++++++++++---
>   2 files changed, 66 insertions(+), 46 deletions(-)


> -    def test_aarch64_virt(self):
> +    def common_aarch64_virt(self, machine):
>           """
> -        :avocado: tags=arch:aarch64
> -        :avocado: tags=machine:virt
> -        :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:max
> +        Common code to launch basic virt machine with kernel+initrd
> +        and a scratch disk.
>           """
> +        logger = logging.getLogger('aarch64_virt')
> +
>           kernel_url = ('https://fileserver.linaro.org/s/'
>                         'z6B2ARM7DQT3HWN/download')
> -
>           kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>   
> @@ -83,13 +85,63 @@ def test_aarch64_virt(self):
>                                  'console=ttyAMA0')
>           self.require_accelerator("tcg")
>           self.vm.add_args('-cpu', 'max,pauth-impdef=on',
> +                         '-machine', machine,

I'm surprised you had to add that, this should be handled by
avocado_qemu::get_vm which calls QEMUMachine::set_machine:

     def get_vm(self, *args, name=None):
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)

>                            '-accel', 'tcg',
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line)
> +
> +        # A RNG offers an easy way to generate a few IRQs
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +        # Also add a scratch block device
> +        logger.info('creating scratch qcow2 image')
> +        image_path = os.path.join(self.workdir, 'scratch.qcow2')
> +        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> +        if not os.path.exists(qemu_img):
> +            qemu_img = find_command('qemu-img', False)
> +        if qemu_img is False:
> +            self.cancel('Could not find "qemu-img", which is required to '
> +                        'create the temporary qcow2 image')
> +        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
> +        process.run(cmd)
> +
> +        # Add the device
> +        self.vm.add_args('-blockdev',
> +                         f"driver=qcow2,file.driver=file,"
> +                         f"file.filename={image_path},node-name=scratch")
> +        self.vm.add_args('-device',
> +                         'virtio-blk-device,drive=scratch')
> +
>           self.vm.launch()
>           self.wait_for_console_pattern('Welcome to Buildroot')
>           time.sleep(0.1)
>           exec_command(self, 'root')
>           time.sleep(0.1)
> +        exec_command(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4')
> +        time.sleep(0.1)
> +        exec_command(self, 'md5sum /dev/vda')
> +        time.sleep(0.1)
> +        exec_command(self, 'cat /proc/interrupts')
> +        time.sleep(0.1)
>           exec_command(self, 'cat /proc/self/maps')
>           time.sleep(0.1)
> +
> +    def test_aarch64_virt_gicv3(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt

(machine set here)

> +        :avocado: tags=accel:tcg
> +        :avocado: tags=cpu:max
> +        """
> +        self.common_aarch64_virt("virt,gic_version=3")

Ah, you duplicate as "-machine virt -machine virt,gic_version=3".

It would be clearer if you rename common_aarch64_virt() argument
as 'machine_options' and pass the option as:

          """
          :avocado: tags=machine:virt
          """
          self.common_aarch64_virt("gic_version=3")

to produce "-machine virt -machine gic_version=3".

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


