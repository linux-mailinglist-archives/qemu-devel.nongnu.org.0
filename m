Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D457B48D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:29:36 +0200 (CEST)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6xU-0003pg-37
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oE6v0-0000gh-Io
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:27:02 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1oE6uy-0007v5-8n
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:27:02 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B28273F128
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658312817;
 bh=yjWyxNfqibwNLTrVVFeM0tUV2yo0VS7Z9NRhZI9/+T8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Hnv5OCUc6Z1KCNuJrjs6GJkK7xUVVE7BZ+uuLJwWM9bJSq+9ZdthqUHsFJKQiSITg
 h8m4i1bBtHuGo9ZruvwlYmC9/ALUxbbsvj22PsxtQN/Nda0tu/s7VhqBZgyO4uICG6
 FmC4wU6M8aD6Q2B4lYo+bcor9jaDj+cL5vLzEVfafqI/HsmbrPE/4KY/y/LGY3OFCQ
 d2BNShwxJOOXjOyXUnCqBE+XajY5VnMPyoncPP8ilnwosN2QsJgGEwgsinE8Xn141W
 sNKAn2xSICP+9fa6aw9HI8/rjzdaSx99aXm9Wx9+DHivqHxc9jVuXg1H3IHYP/lKQU
 EOwsnwBpnS76g==
Received: by mail-wm1-f69.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso1021425wmh.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:content-language:from:in-reply-to
 :content-transfer-encoding;
 bh=yjWyxNfqibwNLTrVVFeM0tUV2yo0VS7Z9NRhZI9/+T8=;
 b=P+cyAkGOuodLDiOGM1AQBuIzVPZmmKETlALzAJ7aQTWdsBgW3ekyFNA4eE5ZE9dumH
 XvYsiDKuc54mLSVsLvp4HOmrCYWK1MwolLQQxUKwGGhg19fWJpI9d0PC4cH3hpWvrpEF
 D0o0o4E5ZR4NPcndY9btZN5oGuWEvzWyKNuS5VSpQeh3rqP0SYshMkxp+dJDBKoO5C7h
 rBCY7JAkCVZoEw/hZl0HdUmjnvqc22SgOJPhKf/K3BLd5IESEN31UpcRmB9FeUwgdXiu
 wQZc0Zqi08yPCfVtkTS1ssUUstF7dc2cwzgNaf3aglJLurMP8f+w4oTdxwpW7DWqFvi4
 V6nQ==
X-Gm-Message-State: AJIora+zDeSgiEaRodvJHnuBUzgHgNciuEZFsv4gh0lL+qQVbFDF5ef+
 i38PBqnZv//n+cimicHpaJYpig/O/bYvWCamjSRYJDYpSALzWc6C6TTKD12Uh2C7tIFJxD9l0QO
 4WGeWvc/VwoG0lPPRYmpVJsbdzAK+Gq/O
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr3174244wmh.154.1658312816292; 
 Wed, 20 Jul 2022 03:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXK4mLVoL9FsZoFourAPK2r1M7Q6N4HRcxKf9QQf/ShvQpBJhT0M82APkFlxlwy7lmodxK9A==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr3174218wmh.154.1658312815952; 
 Wed, 20 Jul 2022 03:26:55 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de.
 [62.143.94.109]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b003a305c0ab06sm2228648wmq.31.2022.07.20.03.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 03:26:55 -0700 (PDT)
Message-ID: <4bf188ea-885d-f8c7-d166-4fb72df44fa7@canonical.com>
Date: Wed, 20 Jul 2022 12:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [PATCH 1/1] docs: pcie: describe PCIe option ROMs
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220720064234.93576-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220720064234.93576-1-heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/20/22 08:42, Heinrich Schuchardt wrote:
> Provide a descriptions of the options that control the emulation of option
> ROMS for PCIe devices.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   docs/pcie.txt | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/docs/pcie.txt b/docs/pcie.txt
> index 89e3502075..a22c1f69f7 100644
> --- a/docs/pcie.txt
> +++ b/docs/pcie.txt
> @@ -292,6 +292,31 @@ PCI-PCI Bridge slots can be used for legacy PCI host devices.
>   If you can see the "Express Endpoint" capability in the
>   output, then the device is indeed PCI Express.
>   
> +8. Option ROM
> +=============
> +PCIe devices may provide an option ROM. The following properties control the
> +emulation of the option ROM:
> +
> +``rombar`` (default: ``1``)
> +  Specifies that an option ROM is available. If set to ``0``, no option ROM
> +  is present.
> +
> +``romsize`` (default: ``-1``)
> +  Specifies the size of the option ROM in bytes. The value must be either
> +  ``-1`` or a power of two. ``-1`` signifies unlimited size.
> +
> +``romfile``
> +  Defines the name of the file to be loaded as option ROM.
> +  Some devices like virtio-net-pci define a default file name.
> +  The file size may neither exceed 2 GiB nor ``romsize``.
> +
> +Some QEMU PCIe devices like virtio-net-pci use an option ROM by default. In the
> +following example the option ROM of a virtio-net-pci device is disabled. This
> +is useful for architectures where QEMU does not supply an option ROM file.
> +
> +.. code-block:: console
> +
> +    -device virtio-net-pci,netdev=eth1,mq=on,rombar=0

If no ROM file exists, this is good enough.

If it does exist and I create multiple virtio-net-pci devices with 
rombar=0, I get an error indicating that the same ROM is used twice:

qemu-system-riscv64: -device virtio-net-pci,netdev=eth1,mq=on,rombar=0: 
duplicate fw_cfg file name: genroms/efi-virtio.rom

I ended up using to solve the problem:

-device virtio-net-pci,netdev=eth1,mq=on,rombar=0,romfile=

I guess some input from the maintainers would be helpful here:

- Why is the file read if rombar=0? Is this a bug?
- Why can't the same option ROM file be used twice? It is read-only.

Best regards

Heinrich

>   
>   7. Virtio devices
>   =================


