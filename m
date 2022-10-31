Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD461356F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:13:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTdr-0006Rd-QU; Mon, 31 Oct 2022 08:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTdp-0006PG-Nl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:11:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTdm-0004Vi-DJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:11:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y16so15641887wrt.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ymouxuz0jlLfMigQOX7KDLxkeU7n93+jMyY3p5Z3n8U=;
 b=svpBLiJhk2UeqlV9PVW5hmuHH4M++QslFzjenFautXGaZaOdbrgnIEuVD5NAQ8Ko+P
 di4hHXZ++uIax1hZWRlXyWtO2AQ2tjqu8ttVuDdDI4Q1gu7tElenb175gHj0y5YdJVL8
 4Mkfg3v97uJjWmhvJi1XljVMieB0yIPBgXBs04WHLBj0uxDKFVLsPMHstmZ1+e4aXg0O
 RWJZy73V88rdABXoIt2/MBdnrTI8HNeffO2Czye3A4KV/jMjC0AuseQob3x8Vuh3hDeT
 sO4/AswNlX0JtkipZaHgH2R7wXfbUlYzMYlli0HjYbn9ko0LfVcu7pNPGemrpubW9xh4
 MPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ymouxuz0jlLfMigQOX7KDLxkeU7n93+jMyY3p5Z3n8U=;
 b=Jlx2p+q3bddf3mDVPtxp1ewzeC2YJDolYuECGbcDJi75CRNI3vYZDUnuhElfU0Zmw4
 DRzsftc7QLsFKqoxH2DpbVKg9dElEZIjt06mRBF5VvByA+qG/g6SXbRvIbrM7kPBXE1w
 7gzpDnsvoSTw8MrIOwsNP+ISLaEWcjANKzUEmTxUqSTozHtWljEraQvmF5xr8lMDhyxm
 CBKvTrrip8rz0AsAfXTVnyJdDhcVeLSCZdXdub27a1XXf9NMNOqmq+9Rcx4v6U5DwAcx
 46ThhQh0ZnptmM+mmHMY5UivABDEZBlYQzlt11+dL947HRB4RDPP5l4digEkLNudmBlO
 TVoQ==
X-Gm-Message-State: ACrzQf2KO2chz6tG/Cd0JWrR+cx3dRpXSkx43T+vHrX+d57PqTQDwxDd
 omNPLxWCD6LDs5z+a8r9CG5JeA==
X-Google-Smtp-Source: AMsMyM4nM8xhugWNEohdEwft3Q267EPgB0EJRilNzr0IVPpyESgFJBpCq2NIzhQD/HFRO9dwj5YacQ==
X-Received: by 2002:adf:da4f:0:b0:236:cdd4:4ce2 with SMTP id
 r15-20020adfda4f000000b00236cdd44ce2mr2418381wrl.626.1667218299775; 
 Mon, 31 Oct 2022 05:11:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a05600c3b9c00b003b4a699ce8esm7329092wms.6.2022.10.31.05.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:11:39 -0700 (PDT)
Message-ID: <3629cba9-0eb7-1f9e-4bcd-030e1edb8745@linaro.org>
Date: Mon, 31 Oct 2022 13:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 6/7] hw/sd/sdhci: Implement Freescale eSDHC device model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
 <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
 <45be44c0-766b-07c6-be8a-c21d46da7f72@linaro.org>
 <CAG4p6K5qvJFRihrZV3Gku_fYsxWFzEN4UfGf4xySQyfzkv9q0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAG4p6K5qvJFRihrZV3Gku_fYsxWFzEN4UfGf4xySQyfzkv9q0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 30/10/22 12:46, Bernhard Beschow wrote:
> 
> 
> On Sun, Oct 30, 2022 at 1:10 AM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     On 29/10/22 20:28, Bernhard Beschow wrote:
>      > Am 29. Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow
>     <shentey@gmail.com <mailto:shentey@gmail.com>>:
>      >> Am 29. Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow
>     <shentey@gmail.com <mailto:shentey@gmail.com>>:
>      >>> Am 27. Oktober 2022 21:40:01 UTC schrieb "Philippe
>     Mathieu-Daudé" <philmd@linaro.org <mailto:philmd@linaro.org>>:
>      >>>> Hi Bernhard,
>      >>>>
>      >>>> On 18/10/22 23:01, Bernhard Beschow wrote:
>      >>>>> Will allow e500 boards to access SD cards using just their
>     own devices.
>      >>>>>
>      >>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com
>     <mailto:shentey@gmail.com>>
>      >>>>> ---
>      >>>>>    hw/sd/sdhci.c         | 120
>     +++++++++++++++++++++++++++++++++++++++++-
>      >>>>>    include/hw/sd/sdhci.h |   3 ++
>      >>>>>    2 files changed, 122 insertions(+), 1 deletion(-)
> 
>      >>>> So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>      >>>> into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>      >>>> another UNIMP region of ESDHC_REGISTERS_MAP_SIZE -
>     SDHC_REGISTERS_MAP_SIZE (= 0x310) and map it normally at offset
>      >>>> 0x100 (SDHC_REGISTERS_MAP_SIZE). Look at create_unimp() in
>      >>>> hw/arm/bcm2835_peripherals.c.
>      >>>>
>      >>>> But the ESDHC_WML register has address 0x44 and fits inside the
>      >>>> SDHC_REGISTERS_MAP region, so likely belong there. 0x44 is the
>      >>>> upper part of the SDHC_CAPAB register. These bits are undefined
>      >>>> on the spec v2, which I see you are setting in esdhci_init().
>      >>>> So this register should already return 0, otherwise we have
>      >>>> a bug. Thus we don't need to handle this ESDHC_WML particularly.
>      >>
>      >> My idea here was to catch this unimplemented case in order to
>     indicate this clearly to users. Perhaps it nudges somebody to
>     provide a patch?
>      >>
>      >>>>
>      >>>> And your model is reduced to handling create_unimp() in
>     esdhci_realize().
>      >>>>
>      >>>> Am I missing something?
>      >>>
>      >>> The mmio ops are big endian and need to be aligned to a 4-byte
>     boundary. It took me quite a while to debug this. So shall I just
>     create an additional memory region for the region above
>     SDHC_REGISTERS_MAP_SIZE for ESDHC_DMA_SYSCTL?
>      >>
>      >> All in all I currently don't have a better idea than keeping the
>     custom i/o ops for the standard region and adding an additional
>     unimplemented region for ESDHC_DMA_SYSCTL. I think I'd have to
>     dynamically allocate memory for it where I still need to figure out
>     how not to leak it.
>      >
>      > By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I
>     was able to remove the custom implementations while having big
>     endian and the alignments proper. However, I don't see a way of
>     adding two memory regions - with or without a container. With a
>     container I'd have to somehow preserve the mmio attribute which is
>     initialized by the parent class, re-initialize it with the
>     container, and add the preserved memory region as child. This seems
>     very fragile, esp. since the parent class has created an alias for
>     mmio in sysbus. Without a container, one would have two memory
>     regions that both have to be mapped separately by the caller, i.e.
>     it burdens the caller with an implementation detail.
>      >
>      > Any suggestions?

See 
https://lore.kernel.org/qemu-devel/20221031115402.91912-7-philmd@linaro.org/

>     Can you share branch and how to test?
> 
> 
> QEMU branch: https://github.com/shentok/qemu/tree/e500-flash 
> <https://github.com/shentok/qemu/tree/e500-flash>
> 
> How to test:
> 1. `git clone -b e500 https://github.com/shentok/buildroot.git 
> <https://github.com/shentok/buildroot.git>`
> 2. `cd buildroot`
> 3. `make qemu_ppc_e500mc_defconfig`
> 4. `make`
> 5. `cd output/images`
> 6. `dd if=/dev/zero of=root.img bs=1M count=64 && dd if=rootfs.ext2 
> of=root.img bs=1M conv=notrunc`
> 7. `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append 
> "console=ttyS0 rootwait root=/dev/mmcblk0" -device sd-card,drive=mydrive 
> -drive id=mydrive,if=none,file=root.img,format=raw`

Could you add an Avocado-based test?

>    Welcome to Buildroot
>    buildroot login:

Regards,

Phil.

