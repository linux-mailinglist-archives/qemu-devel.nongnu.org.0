Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58610323940
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:14:45 +0100 (CET)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqFo-0007VQ-D2
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEqDU-0006UQ-UB; Wed, 24 Feb 2021 04:12:25 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEqDO-0003yC-PE; Wed, 24 Feb 2021 04:12:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id d11so1118529wrj.7;
 Wed, 24 Feb 2021 01:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xi31VHeY2Vwtyjxiv7zgjRawGcKBZKx7JNn6+ERWZIg=;
 b=oIN2g8tuBaTAAvwmNv5cHcds0y10gCS7h1M2G/E12N4RGT2zuCy3zwIdyeSI4PDKnz
 Qk+ZEMxwi0FG5TPF9awkuxuUfGjjOjG0QM6qcDb3zZNlAetKkP+TJmE2rQs3npPrPOC0
 GpHOWtW8yDfvdFt0Jw82VGFMbZKhACXu7iDu8d+eIZSK5MT8/Nvs4njkYjlBwYXZM1fg
 mMriWGkZIHBnQNS8k7gC31UvRUH1de2V8xQVSGTh04cJqubP6glCU7asWTM/fSjkx6vH
 TCTqfOhBh6iDhXKGtnmR/V7svcVqfEJ4WN4KqhXsDrAkgHpj6neqFtLNXBG9mSmqSBLf
 Fg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xi31VHeY2Vwtyjxiv7zgjRawGcKBZKx7JNn6+ERWZIg=;
 b=X7IQRtgQQmao/67bosQrFPiptw//ZYjFY8hctmN6eXwTh0uI22yeR0cFWHo/27rH+b
 P+0200Dsl3g8covHNcPUiTBYQOkJN1xqLa8pszp1ih9qsiMy+Kji1q0n5uYiPOw00ehM
 TMC5fk+zsalp1+U1XzprHbEHovA3g3iNP5h1CwRMsDJn9/+RlfnhrCUMgsBPkM0qIjdb
 EqxRoMruL37T9qs15KqKbPN+B++B8TXV4/iE1jmZqS+9fZ08myaaIq+JIPuJNnaFyxg1
 0A+GyYe2fIM5vjiZPd5LYRPb3WmKiKymvQz146fwCM/268aCW7S00cX4AzH4e1c271Lh
 z8nA==
X-Gm-Message-State: AOAM530vyh7f26B+DPSUeGE99gNAZqxv00YzJGq2D/fVS10G1zx/F7Qg
 n4lC9TGaeMa28DJQs6AuCjw=
X-Google-Smtp-Source: ABdhPJxAuhIcLyVyXzRph2YPrqKMXJtNoqvEJyWTgqSkXx57XyfW1iU55ooNQy+PjRrZDPpqiTKiMw==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr23979307wrq.345.1614157932451; 
 Wed, 24 Feb 2021 01:12:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a131sm1778087wmc.48.2021.02.24.01.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 01:12:11 -0800 (PST)
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
Date: Wed, 24 Feb 2021 10:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223225327.26700-2-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, b.galvani@gmail.com,
 qemu-arm@nongnu.org, Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niek,

On 2/23/21 11:53 PM, Niek Linnenbank wrote:
> Currently the automated acceptance tests for the Orange Pi PC and cubieboard
> machines are disabled by default. The tests for both machines require artifacts
> that are stored on the apt.armbian.com domain. Unfortunately, some of these artifacts
> have been removed from apt.armbian.com and it is uncertain whether more will be removed.
> 
> This commit moves the artifacts previously stored on apt.armbian.com to github
> and retrieves them using the path: '/<machine>/<artifact>'.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

> Tested-by: Cleber Rosa <crosa@redhat.com>

Did Cleber test this new version?

> ---
>  tests/acceptance/boot_linux_console.py | 49 ++++++++++----------------
>  tests/acceptance/replay_kernel.py      |  6 ++--
>  2 files changed, 21 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb01286799..0f8a824c61 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -507,15 +507,13 @@ def test_arm_exynos4210_initrd(self):
>          self.wait_for_console_pattern('Boot successful.')
>          # TODO user command, for now the uart is stuck
>  
> -    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> -                'Test artifacts fetched from unreliable apt.armbian.com')
>      def test_arm_cubieboard_initrd(self):
>          """
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> +        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
> +                   'master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb')

Can you replace 'master/' by 'ed9829b/' please (other occurences).

With it:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

(using both master / ed9829b):
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>          deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> @@ -549,15 +547,13 @@ def test_arm_cubieboard_initrd(self):
>                                                  'system-control@1c00000')
>          # cubieboard's reboot is not functioning; omit reboot test.
>  
> -    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
> -                'Test artifacts fetched from unreliable apt.armbian.com')
>      def test_arm_cubieboard_sata(self):
>          """
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> +        deb_url = ('https://github.com/nieklinnenbank/QemuArtifacts/raw/'
> +                   'master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb')
...

