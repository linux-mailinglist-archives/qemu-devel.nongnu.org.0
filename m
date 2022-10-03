Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BC05F38F2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:23:04 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTq3-0002Ac-Kd
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSit-0004Sr-6O; Mon, 03 Oct 2022 17:11:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSiq-0001X9-6W; Mon, 03 Oct 2022 17:11:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so11001978pjr.5; 
 Mon, 03 Oct 2022 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=43OFOcN04QWfANHa/PyVfp6FdN/jOGHaho9qDkByn9A=;
 b=AJ6VE+0TxZMntzgt1TQsuJ7qTvnPJ1gPATQnVEMUL4wcDlLL8Nptvaf/iHALt2q2Ii
 cgtgADE/0rWp7y1aqP4+vadIt9OighZDgnh1EjS48LPLjTOBkdo+EF5nDWsoN715EyYX
 h+FNMReuWmkH+NgMJVJU4JFpb2z5KHRZphP/7HiRDNGyaOb8nnKReOoUNHhsIF3gDErh
 /WRPftxY7eT+LEvE5FlV8CwCWy4hQG5WEqLSnIcKVws4+GKmKquiNgQ/5J+JUHyBcu7n
 VB7LDb1YtNPavBYwuNXGfGIem3ZhIGLfNE/ivKBPnX9j2p5X6HdhGM7xeDWTo0nEMaEN
 rJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=43OFOcN04QWfANHa/PyVfp6FdN/jOGHaho9qDkByn9A=;
 b=7dO/e2e2SE89Eb7kkizv1B/fTGDAbF58a/8fMhm3EvE4cp2lJ5wulFonNp8WUyR6v/
 m9XSirNsSzHvt73fvS3wIiV83ETfscxBEcyC2gRiV7tEDS4O2SCVe7SURmlU6DXGODBO
 RgZIdn7qq6cnbE9TqssVXWyUgQFLvmBtmQ1LrYZDdO3J5E0NXnVBq3aLrhgaEqSqn4Uh
 uLZl/cvbNVyGLweSJtp775g/MM1aQYrBjHXUpfqhoBtgrTJgoKsVA7KalGP/MtNDKjQI
 e+Pxt4nuDKG6ovfLC5tgA+odaZ1g1McK8H831Mu6n57SoL56JPwuDcFmugZNUBK1HKjo
 L2UA==
X-Gm-Message-State: ACrzQf0ZJtFz4eBhfRVkbKQcCLy3c/SSZeiK0xGI3jnqkZA45IBJhNNx
 LaAA2Zz9nAXffGnsnfZA66E=
X-Google-Smtp-Source: AMsMyM7UcWoRgoPhvNA1WyN3lDdfc9EZJnEGQohl6kwn2TWoCbTLb1/9m+xYLVPRk36HOfjYzHvWQQ==
X-Received: by 2002:a17:902:8bc3:b0:178:8563:8e42 with SMTP id
 r3-20020a1709028bc300b0017885638e42mr23852725plo.0.1664831488518; 
 Mon, 03 Oct 2022 14:11:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 66-20020a630945000000b00412a708f38asm7060746pgj.35.2022.10.03.14.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:11:28 -0700 (PDT)
Message-ID: <aa253d5e-a2e3-e7b2-dace-87f21e64dc93@amsat.org>
Date: Mon, 3 Oct 2022 23:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 12/13] hw/sd/sdhci: Implement Freescale eSDHC device
 model
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-13-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/10/22 22:31, Bernhard Beschow wrote:
> Will allow e500 boards to access SD cards using just their own devices.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sdhci.c         | 147 +++++++++++++++++++++++++++++++++++++++++-
>   include/hw/sd/sdhci.h |   3 +
>   2 files changed, 149 insertions(+), 1 deletion(-)

> +/* --- qdev Freescale eSDHC --- */
> +
> +/* Watermark Level Register */
> +#define ESDHC_WML                    0x44
> +
> +/* Host Controller Capabilities Register 2 */
> +#define ESDHC_CAPABILITIES_1        0x114

Not used?

> +
> +/* Control Register for DMA transfer */
> +#define ESDHC_DMA_SYSCTL            0x40c
> +
> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
> +
> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t ret;
> +
> +    if (size != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " wrong size\n", size, offset);
> +        return 0;
> +    }
> +
> +    if (offset & 0x3) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " unaligned\n", size, offset);
> +        return 0;

Isn't it already enforced by esdhc_mmio_ops.valid.unaligned = false?

> +    }
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_RSPREG0:
> +    case SDHC_RSPREG1:
> +    case SDHC_RSPREG2:
> +    case SDHC_RSPREG3:
> +    case SDHC_BDATA:
> +    case SDHC_PRNSTS:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_ACMD12ERRSTS:
> +    case SDHC_CAPAB:
> +    case SDHC_SLOT_INT_STATUS:
> +        ret = sdhci_read(opaque, offset, size);
> +        break;
> +
> +    case ESDHC_WML:
> +    case ESDHC_DMA_SYSCTL:
> +        ret = 0;
> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " not implemented\n", size, offset);
> +        break;
> +
> +    default:
> +        ret = 0;
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
> +                      " unknown offset\n", size, offset);
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
> +                         unsigned size)
> +{
> +    if (size != 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx wrong size\n", size, offset, val);
> +        return;
> +    }
> +
> +    if (offset & 0x3) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx unaligned\n", size, offset, val);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case SDHC_SYSAD:
> +    case SDHC_BLKSIZE:
> +    case SDHC_ARGUMENT:
> +    case SDHC_TRNMOD:
> +    case SDHC_BDATA:
> +    case SDHC_HOSTCTL:
> +    case SDHC_CLKCON:
> +    case SDHC_NORINTSTS:
> +    case SDHC_NORINTSTSEN:
> +    case SDHC_NORINTSIGEN:
> +    case SDHC_FEAER:
> +        sdhci_write(opaque, offset, val, size);
> +        break;
> +
> +    case ESDHC_WML:
> +    case ESDHC_DMA_SYSCTL:
> +        qemu_log_mask(LOG_UNIMP, "ESDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08lx "
> +                      "not implemented\n", size, offset, val);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
> +                      " <- 0x%08lx unknown offset\n", size, offset, val);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps esdhc_mmio_ops = {
> +    .read = esdhci_read,
> +    .write = esdhci_write,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +        .unaligned = false
> +    },
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};

