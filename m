Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0895694499
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRX4Y-0006wk-JK; Mon, 13 Feb 2023 06:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRX4S-0006wN-Bw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:32:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRX4Q-0001Jm-3J
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:32:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so8171083wmp.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sg267DmTcuA/7PWApJ3X068m7qnJYCrCboR8nl1Np7o=;
 b=SnkwfcEgPdV4B0PkPItzhT7FmGek8j1BbbauTql0Y9Ykr1kSACQda2GkA7msZGN618
 7Zu/f8uDudxE63EWUfA9u2pskXkRoST95VV0maKO/33QIZ10P/bkBinfY5w7sjgVoFPC
 kA02PYr6eg3saGP+fGxJE7WPFXOOi7QzXmKxz7imgVaYlgt80QeRvm0esGRPYtiwE2Xy
 Jgk62Gx55AgYW0UXhBgUQf3E+42HVW4xP2en+Q1PvRZGXUgVmefQiCMBvwbiBEzbBiFy
 mWsdmR9jpj16R9bVawnc4V6LKgeK3+XaROOSk5isD/Wx79T/vB25q6ut1vsYXvTzNvyM
 beMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sg267DmTcuA/7PWApJ3X068m7qnJYCrCboR8nl1Np7o=;
 b=Tc48OuA670dBYT27yeWCoymic/elAQSL8Wy6RH0AVFgRy00VObBAtWQIbKedIu+RRs
 7nOIWZHsO7eGswIwlwb0dDJkGbJUE0aS7GF60urjXW4fPEN2njQyJvmh55CfqAaxb2SG
 PrTV/ry9jkRzD1EMiT5z5vlNEPm/T7zvX7WbTWxxQLaCfJPZPpTXO4e97jB9ihRX7J4U
 7h95gVRQ39zi6GhWYky1ORM+IIyXGcWB/ugSUULMMrUgavONYrUToe/QkXGdQyMIEspA
 BLn+4/3H6ng7gq9rCqWMQiB/zJte6GhmCk/Ot7fdZ3BQt+PRk0lGeKHoGaDiCtTtXe+M
 Ynyw==
X-Gm-Message-State: AO0yUKVk0NPtMCGZg2mqeMyKjLm1k9kyUr0cR1n7gq/A8XrnsHZXlWgd
 s9Ti9c1sTOC4fkCdUEj/Qv1dDg==
X-Google-Smtp-Source: AK7set8Al4zo7vQeRu4Cfw0NrGn++XcH8terWuUoKV78z4XUpToP2IEua0OK0X7vi246b6CRftLc0A==
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id
 n18-20020a05600c3b9200b003dfeedfdf1cmr22677032wms.38.1676287947681; 
 Mon, 13 Feb 2023 03:32:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003ddc781b1d4sm14601296wmq.33.2023.02.13.03.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:32:26 -0800 (PST)
Message-ID: <5df7ad90-5220-cafd-d1fd-e096d8d14636@linaro.org>
Date: Mon, 13 Feb 2023 12:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC PATCH] tests: add LKFT baseline test to avocado
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230207204433.752020-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207204433.752020-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 7/2/23 21:44, Alex Bennée wrote:
> The Linux Kernel Function Test (LKFT) project uses QEMU to test a wide
> variety of kernel configurations on wide range of our emulated
> platforms. They publish a known good set of images at:
> 
>    https://storage.tuxboot.com/
> 
> to help with bisecting regressions in either the kernel, firmware or
> QEMU itself. The tests are pretty lightweight as they contain just a
> kernel with a minimal rootfs which boots a lot faster than most of the
> distros. In time they might be persuaded to version there known good
> baselines and we can then enable proper checksums.
> 
> Total run time: 140s
> 
> Overall coverage rate:
>    lines......: 8.7% (96412 of 1106284 lines)
>    functions..: 10.8% (11515 of 106651 functions)
>    branches...: 8.3% (30685 of 370255 branches)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/avocado/lkft_baselines.py | 257 ++++++++++++++++++++++++++++++++
>   1 file changed, 257 insertions(+)
>   create mode 100755 tests/avocado/lkft_baselines.py

Do we want to skip the whole class on CI, or only some tests?

    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

> +class LKFTBaselineTest(QemuSystemTest):
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 root=/dev/vda'
> +
> +    def setUp(self):
> +        super().setUp()
> +
> +        # We need zstd for all the lkft tests
> +        zstd = find_command('zstd', False)
> +        if zstd is False:
> +            self.cancel('Could not find "zstd", which is required to '
> +                        'decompress rootfs')
> +        self.zstd = zstd

Requested in upstream Avocado:
https://github.com/avocado-framework/avocado/issues/5609

 > +    def fetch_lkft_assets(self, dt=None):
 > +        """
 > +        Fetch the LKFT assets. They are stored in a standard way so we
 > +        use the per-test tags to fetch details.
 > +        """
 > +        base_url = f"https://storage.tuxboot.com/{self.lkft}/"
 > +        kernel_image =  self.fetch_asset(base_url + self.image)
 > +        disk_image_zst = self.fetch_asset(base_url + "rootfs.ext4.zst")

Hmm no hash verification.

> +    def test_arm64be(self):
> +        """
> +        :avocado: tags=arch:aarch64

This tag is useful:

            :avocado: tags=endian:big

> +        :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=machine:virt
> +        :avocado: tags=lkft:arm64be
> +        :avocado: tags=console:ttyAMA0
> +        :avocado: tags=shutdown:nowait
> +        """
> +        self.common_lkft()


> +    def test_armv7(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=cpu:cortex-a15
> +        :avocado: tags=machine:virt
> +        :avocado: tags=lkft:armv7
> +        :avocado: tags=image:zImage
> +        :avocado: tags=console:ttyAMA0
> +        :avocado: tags=shutdown:nowait
> +        """
> +        self.common_lkft()
> +
> +    def test_armv7be(self):
> +        """
> +        :avocado: tags=arch:arm

            :avocado: tags=endian:big

> +        :avocado: tags=cpu:cortex-a15
> +        :avocado: tags=machine:virt
> +        :avocado: tags=lkft:armv7be
> +        :avocado: tags=image:zImage
> +        :avocado: tags=console:ttyAMA0
> +        :avocado: tags=shutdown:nowait
> +        """
> +        self.common_lkft()


