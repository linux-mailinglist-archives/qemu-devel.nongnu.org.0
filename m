Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A015837FD0F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:02:59 +0200 (CEST)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFfm-000565-Mx
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFcV-0002e9-6I
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFcT-0005M3-DR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620928772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAET5kRmNvhmKKqATmTVKJ0pFU4wqEqluRLKu7WzyDk=;
 b=Fb2bXLsaQXtDGb5Lb3pNXiIM5CnOMH9C2i6opbZc6ZksGQukZSz3pSERyB5OUiBvAdARlI
 Q0Itg+elufnyGrW9A36QRbXJFTmyPPL2Zs0VYDtfhBvG2Kvu0E+KIfWDU5QO/ic3Yn1VTg
 pbfVtXHcaGn/YSGn1uzPoukTM/k2vEw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-CzlnrGoMP_aD0DTrYO_AWg-1; Thu, 13 May 2021 13:59:30 -0400
X-MC-Unique: CzlnrGoMP_aD0DTrYO_AWg-1
Received: by mail-ed1-f69.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so15153899edi.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAET5kRmNvhmKKqATmTVKJ0pFU4wqEqluRLKu7WzyDk=;
 b=R80dn5V3n6I/VNyjEg8bI8zAUaXfsIVnvi8wrKenuV5mNHgkOblGnEnVSxdTm6mL+e
 J2zww49eembxcivYoV+43t2vM4JvLE5llSweH8iq2Wq6LQMTP8oMwQ+26aHOpvPges0N
 yiIZmlSQKBjg+0VCf9+lebcqGchM2comhr8F8s3qOD2+lEIrz9vxeHcd3e9zXaudnJ2Q
 pwa+S2Nf6UiOxGZEIEAQQ4eXuOWYZs6WeBr9KV/NE1CNZ1GhXazO5ujO7LujuSG/DLDo
 ZbmfhtuA7OUmG1S3646EK8SCxWqh6WlYFyhpLJsHDFfcAzyTk4ypaYqKslrJ6N2qnUPJ
 LXtA==
X-Gm-Message-State: AOAM531ozFhL7e3+lrRETA5qO+9snISkCWaB0ALZaL2gOtox1X3cUBuq
 4XZBTdLTG9nzpgAtbj3aDKAESGZf9SpMPkMYAuaJ5u/rwD2EE3OZQO/WMmPkvnpnWZNXup5XS/C
 Dq7nDntCivyeUuLO6JsHbzGPQKkCNbKNkxjle7TtTwJKe7cP0BjxKvR1SaKDD+NRxsec=
X-Received: by 2002:a17:906:2559:: with SMTP id
 j25mr43612827ejb.42.1620928769396; 
 Thu, 13 May 2021 10:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIcwoCyWCMb8tAGtrSgGUI3Box7d1uGU7nao0VF7+t8Ox4mKY2X7YGvGoSK3MsRP9qJh3HPw==
X-Received: by 2002:a17:906:2559:: with SMTP id
 j25mr43612805ejb.42.1620928769183; 
 Thu, 13 May 2021 10:59:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id eb9sm2152315ejc.96.2021.05.13.10.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:59:28 -0700 (PDT)
Subject: Re: [PATCH 00/10] hw: Various Kconfig fixes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210513163858.3928976-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <38628d45-bf4d-1121-189b-5d6bb2e63c5f@redhat.com>
Date: Thu, 13 May 2021 19:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 18:38, Philippe Mathieu-Daudé wrote:
> Various Kconfig fixes when building stand-alone machine binaries.
> 
> FYI I'm looking at a way to test this automatically, by generating
> all the configurations using:
> https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pipel=
> ines
> This way we could run this on release candidate tags.
> 
> Philippe Mathieu-Daud=C3=A9 (10):
>    hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
>    hw/ide/Kconfig: Add missing dependency PCI -> QDEV
>    hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
>    hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board
>    hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
>    hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL
>    hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
>    hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC
>    default-configs/devices: Remove implicy SEMIHOSTING config
>    default-configs/devices: Clarify ARM_COMPATIBLE_SEMIHOSTING is
>      required
> 
>   default-configs/devices/arm-softmmu.mak     | 5 +++--
>   default-configs/devices/ppc-softmmu.mak     | 1 -
>   default-configs/devices/ppc64-softmmu.mak   | 1 -
>   default-configs/devices/riscv32-softmmu.mak | 5 +++--
>   default-configs/devices/riscv64-softmmu.mak | 5 +++--
>   hw/arm/Kconfig                              | 4 +++-
>   hw/i386/Kconfig                             | 1 +
>   hw/ide/Kconfig                              | 2 +-
>   hw/mem/Kconfig                              | 2 --
>   hw/ppc/Kconfig                              | 2 ++
>   hw/riscv/Kconfig                            | 6 ++++++
>   hw/riscv/meson.build                        | 2 +-
>   12 files changed, 23 insertions(+), 13 deletions(-)
> 
> --=20
> 2.26.3
> 
> 
> 

For patches 1-8

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Feel free to send a pull request once the target maintainers for 
ARM/RISC-V/PPC have had a look.

Paolo


