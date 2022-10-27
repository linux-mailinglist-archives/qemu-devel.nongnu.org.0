Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57261042C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:13:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooA9o-0001uD-Sw; Thu, 27 Oct 2022 17:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooA9h-0001sf-2c
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:11:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooA9d-0002lI-TS
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:11:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id o4so4261517wrq.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7PCPypECvjj7tY1/i48/WVKNJxCsE5ZU7zFU9OledUs=;
 b=urTQFd2217HdJPEzu13RsIJwONkqv7+6d7b8o4Gbjwoy39IjfLzKxZ1MTHOar5Eb59
 LNQl4UlepyhZhQk5DyA+fdrsDBzsDnQNEg3Ea+2fgbgTwJYDcqUfwc8sl/JjhEq0mSPE
 CqhXrcglpjMpJq/SrJ++VcV/qDz2cG8EWOTbn0WN5u9KWwTzI/uOBTsHUZoIEhZbG6+a
 6tIlbMtmuuwdg+oITZ0hrW6OwhVLqJOGqKzR71hq/kp8O8fiXBwZHAGvH1bXzWIoHI+F
 4q1x31fZv7MEpL4bkWfaXfSvnGhqithnWPsYbENqxCMyc6jQppqfxeS38hxU9abW28JU
 oZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7PCPypECvjj7tY1/i48/WVKNJxCsE5ZU7zFU9OledUs=;
 b=iPpqN2KMD7/cND660vToh4CcqS+TtHyfpyanqa3dAV6GZHgvTfmIYtJVGH9MfN2V+4
 Ml457iEnQAcO1O2dX5tbfwXanIXv/eyjt5kO29jj20mYCo0FKPEaG/xZVI0yJ1wU+/II
 mW2a/f2eM9TEk78jeI8DLnJzVxrfYS7CaC72G7dUV8PQ/385kWRUpDPnICzKhQrpApI3
 xmJCPlT0qPVo5ZecbAxPq6jKtyZz0kXU9YNXs4KJM2LE+Ijhr8Iq60ZrEKQllrGuBX3M
 S3+68UnTcx3rwEsGIUg3xLI3BCDSjbDmiYGniReVtFGLOeeyiBz3Ej0gACbMQ8BVihkV
 vzBA==
X-Gm-Message-State: ACrzQf1Yef7jee+3otGGALfTofQLJvn1WR8SF0cGZucRD2XCzBcDHAJ2
 bcxeBxIqWVpG5/qeI2zueEJueA==
X-Google-Smtp-Source: AMsMyM463jYfoOF4OuXsnaaHL30dTX4Jdxdgk6epyf4mGJNp0I/6OrKx1nRf4k48wXsRnMKKRPngjg==
X-Received: by 2002:a5d:654d:0:b0:235:197d:72d1 with SMTP id
 z13-20020a5d654d000000b00235197d72d1mr27607557wrv.680.1666905067226; 
 Thu, 27 Oct 2022 14:11:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b003c6c76b43a1sm2326246wmc.13.2022.10.27.14.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:11:06 -0700 (PDT)
Message-ID: <48db0d2f-2d02-9d3c-2269-810256403a0d@linaro.org>
Date: Thu, 27 Oct 2022 23:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
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
 <20221018210146.193159-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018210146.193159-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 18/10/22 23:01, Bernhard Beschow wrote:
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
> 
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/ppc/ppce500.rst | 16 ++++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+)

> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>                                   pmc->platform_bus_base,
>                                   &pms->pbus_dev->mmio);
>   
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> +        uint32_t sector_len = 64 * KiB;
> +
> +        if (!is_power_of_2(size)) {
> +            error_report("Size of pflash file must be a power of two.");
> +            exit(1);
> +        }
> +
> +        if (size > mmio_size) {
> +            error_report("Size of pflash file must not be bigger than %" PRIu64
> +                         " bytes.", mmio_size);
> +            exit(1);
> +        }
> +
> +        if (!QEMU_IS_ALIGNED(size, sector_len)) {
> +            error_report("Size of pflash file must be a multiple of %" PRIu32
> +                         ".", sector_len);
> +            exit(1);
> +        }

Again, this check is unrelated to the board code and belong to the flash 
device (the board has no idea of the underlying flash restrictions).

(see below)

> +        dev = qdev_new(TYPE_PFLASH_CFI01);
> +        qdev_prop_set_drive(dev, "drive", blk);
> +        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
> +        qdev_prop_set_uint64(dev, "sector-length", sector_len);
> +        qdev_prop_set_uint8(dev, "width", 2);
> +        qdev_prop_set_bit(dev, "big-endian", true);
> +        qdev_prop_set_uint16(dev, "id0", 0x89);
> +        qdev_prop_set_uint16(dev, "id1", 0x18);
> +        qdev_prop_set_uint16(dev, "id2", 0x0000);
> +        qdev_prop_set_uint16(dev, "id3", 0x0);
> +        qdev_prop_set_string(dev, "name", "e500.flash");
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

If you want to report the error differently, you can use a local Error*
and display it with error_report_err() before exiting.

Anyhow can be cleaned later, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
> +    }


