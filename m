Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0625F48F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 10:07:23 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFCBO-0001bc-DY
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 04:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFCAW-0000xL-Nw
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 04:06:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37794
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFCAT-0008P1-Rb
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 04:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599465984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tS2Qq1anleUR4l3gZyt5zexQbh7rzVaDOovLt7uzP6s=;
 b=dPJuOeGwXS8V+BQwg7xVkkH6/EVvWghzTd9l+/fV4XgU8+z4pkbCvIRF5vKA2X4PcXNkjs
 vlm+VRpqKNfQr3td0ApwjXtagIRqIGG6TLsEbWig0S0ohuNSJT+/L6DMww0Mvkcyk6Kuxr
 8htaaRFZ6YXkp9cTzaJVN+FVxGD+5Dw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-JamzOjTOOw2TOXZ5G3WRXw-1; Mon, 07 Sep 2020 04:06:17 -0400
X-MC-Unique: JamzOjTOOw2TOXZ5G3WRXw-1
Received: by mail-wr1-f71.google.com with SMTP id g6so5442441wrv.3
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 01:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tS2Qq1anleUR4l3gZyt5zexQbh7rzVaDOovLt7uzP6s=;
 b=j59THYscG137XjPLEbHVANTo45F1lxNwNhXXkdUpiwzfKihnDknFYz8NGVi1iYBId3
 +w97WFs+SXuKX8d8QSYJK/xpvmhSdPvBp2dmmPDZuM4ORS/L8seS2KdhfdXncUSf81jH
 VMCxu1PM60pxDFYtWp4IX4mUHSfEQerLdS919RUXZIurFb3VzsNPtT/KtXCj/fRqW12/
 CKDEKsBZOEpwedXL1CMeTuIsyoobEK3GmOYwVTd8MrPVrH7MdA9pv+MpqZBpNGMyyail
 kjpPSb13+SG717JaTZTTsG4t8kxuAnMv18Q5UWRsWGV5jc+Yo8RwVL+Z4m+33Zfgq72C
 hFKw==
X-Gm-Message-State: AOAM533FXfRL7JV+A3MlOJT4f93ymQUHa0lyHfmC9BdPs0vnYNdaABkE
 T50xapdeIoJruuv8xBYS2+xUsZt1zLYGVg03szSd+4scfDKaG+w0kpwnMT1gVEr3H3tr6YwibZ6
 KvVcT2/ExWo8Zwww=
X-Received: by 2002:a5d:6305:: with SMTP id i5mr6940175wru.337.1599465976423; 
 Mon, 07 Sep 2020 01:06:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKRPzsgmgUgD6L5axfEVOH9K8/q1uBPdkzyoViosfpJ149tRUFHQjIKKZwXImM8BQYA4i4Ng==
X-Received: by 2002:a5d:6305:: with SMTP id i5mr6940126wru.337.1599465976077; 
 Mon, 07 Sep 2020 01:06:16 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id w14sm10891918wrk.95.2020.09.07.01.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:06:15 -0700 (PDT)
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
Date: Mon, 7 Sep 2020 10:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907042000.415931-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.69, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Cc'ing Daniel who usually have good ideas for that
kind if project-wide problem]

On 9/7/20 6:19 AM, Cleber Rosa wrote:
> Which means a newer kernel version.  Expected output was changed
> to match the new kernel too.

Nack.

Acceptance tests are not to test the latest Linux kernel,
they aim to assert a specific kernel tested by some developer
still works while QEMU evolves.
QEMU doesn't have to adapt to the latest kernel;
QEMU should keep boot an old kernel.

Testing new kernels is good, you are adding coverage. But
this break the acceptance testing contract "keep testing
the same thing over time".

The problem you are trying to fix is the "where to keep
assets from public locations where they are being removed?"
one. Two years ago [*] you suggested to use some storage on
the avocado-project.org:

  For Avocado-VT, there are the JeOS images[1], which we
  keep on a test "assets" directory.  We have a lot of
  storage/bandwidth availability, so it can be used for
  other assets proven to be necessary for tests.

  As long as distribution rights and licensing are not
  issues, we can definitely use the same server for kernels,
  u-boot images and what not.

  [1] - https://avocado-project.org/data/assets/

It is time to have QEMU assets managed the same way.

[*] https://www.mail-archive.com/avocado-devel@redhat.com/msg00860.html

> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 44 +++++++++++++-------------
>  tests/acceptance/replay_kernel.py      |  8 ++---
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index aaa781a581..751b47b8fd 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -490,12 +490,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -522,7 +522,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>                                                  'Allwinner sun4i/sun5i')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> -                                                'system-control@1c00000')
> +                                                '1c00000.system-control')
>          # cubieboard's reboot is not functioning; omit reboot test.
>  
>      def test_arm_cubieboard_sata(self):
> @@ -530,12 +530,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -573,12 +573,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:orangepi-pc
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>  
> @@ -598,12 +598,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:orangepi-pc
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -629,7 +629,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>                                                  'Allwinner sun8i Family')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> -                                                'system-control@1c00000')
> +                                                '1c00000.system-control')
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> @@ -641,12 +641,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=machine:orangepi-pc
>          :avocado: tags=device:sd
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index b79fc8daf8..80a460814f 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -132,12 +132,12 @@ class ReplayKernel(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> 


