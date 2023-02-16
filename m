Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AEC6998F9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgGg-0004uL-Ee; Thu, 16 Feb 2023 10:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSgGe-0004tv-QV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:33:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSgGc-0001eD-SW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:33:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so2200888wrg.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GLqMAV246EiEs+SaxVLIakHudz2rTe6BXsGi9NL9aM=;
 b=SElC5kVIdebvNnCCe2c06jcXr4zwPG5yJNQkzGpHz8ee/jwbx/iZ5L/1ccXGFjICrW
 dSbgr8IVId4z7mTGhJgC5Lez1GRQ2wukTSNxFL+vl4TTJIhkvYIyobUcBtTQhT4K6Hfp
 u9Y+hQcTLsaZkNDz2FI2l3ExPjjpzJzcd6PBc788Xv107CNcAcpa9nQemEt+TPXF128c
 xqgF5oKLFGTM7/C4+8+jmdkmEilkxGEieq3NxgCKcj1X9c4YergkAPiV8yezvZa7qiai
 vO/f4SoCVLk92v2jvzkRVdJw2s4Ylqwjej3d9w4MBcKU44gutm3yVAb1eo/W73IhkoGM
 7FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GLqMAV246EiEs+SaxVLIakHudz2rTe6BXsGi9NL9aM=;
 b=GDnYXcy5q6Z8Hds3w6kU5xOB0GMnDp6iAJEcSnVrqTCVjBrT3HMTBQNJVHX2h55U9u
 IXaLw7CFjg1SQiPVrRFWA02SfLcRWgQx2nOCKUJ5+CTGB27zA8Ec8XkS22lij3wOK9wN
 wtUvYuOz1wzC8toG2v072teSaroHUtFtCEiquzB3xRpMBfNoqw6ToGOxFBC1CuoO2/qN
 K6INtP0BZ8MLo54/u0qJY9VZ/Ys/9y3A7akzfTp6HhWr/hgDwTpixdRR1v1WyQOVq5xa
 +H1o5pzThyYVAblHbTW8nT+pVn28SaxU8nqi4Q2zo/xpTh9Wx789wsuvvwgjoCXLuaFq
 myqQ==
X-Gm-Message-State: AO0yUKWnbIv8zBzm1KjI5q+0qZdH+XdplLrHQB7CEOKlChxwS7yvxv4u
 xJygiS+kem5DljHJtX3Wv6FmPw==
X-Google-Smtp-Source: AK7set9hDqcJiDjrqs/i2KtbZnjCcbUpQH/F3evJ7ZlY1TgDb2C3mFSFMkVn/SqwNuOCpApcGYtThg==
X-Received: by 2002:adf:de12:0:b0:2c5:98f2:5b1d with SMTP id
 b18-20020adfde12000000b002c598f25b1dmr943015wrm.63.1676561629241; 
 Thu, 16 Feb 2023 07:33:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056000124c00b002c54f367fe4sm1652179wrx.100.2023.02.16.07.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:33:48 -0800 (PST)
Message-ID: <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
Date: Thu, 16 Feb 2023 16:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 15:43, Bernhard Beschow wrote:
> 
> 
> On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     Ensure both IDE output IRQ lines are wired.
> 
>     We can remove the last use of isa_get_irq(NULL).
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
>     <mailto:philmd@linaro.org>>
>     ---
>       hw/ide/piix.c | 13 ++++++++-----
>       1 file changed, 8 insertions(+), 5 deletions(-)
> 
>     diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>     index 9d876dd4a7..b75a4ddcca 100644
>     --- a/hw/ide/piix.c
>     +++ b/hw/ide/piix.c
>     @@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>     unsigned i, Error **errp)
>           static const struct {
>               int iobase;
>               int iobase2;
>     -        int isairq;
>           } port_info[] = {
>     -        {0x1f0, 0x3f6, 14},
>     -        {0x170, 0x376, 15},
>     +        {0x1f0, 0x3f6},
>     +        {0x170, 0x376},
>           };
>           int ret;
> 
>     -    qemu_irq irq_out = d->irq[i] ? : isa_get_irq(NULL,
>     port_info[i].isairq);
>     +    if (!d->irq[i]) {
>     +        error_setg(errp, "output IDE IRQ %u not connected", i);
>     +        return false;
>     +    }
>     +
>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>           ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>                                 port_info[i].iobase2);
>     @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>     unsigned i, Error **errp)
>                                object_get_typename(OBJECT(d)), i);
>               return false;
>           }
>     -    ide_bus_init_output_irq(&d->bus[i], irq_out);
>     +    ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
> 
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
>           d->bmdma[i].bus = &d->bus[i];
>     -- 
>     2.38.1
> 
> 
> This now breaks user-created  piix3-ide:
> 
>    qemu-system-x86_64 -M q35 -device piix3-ide
> 
> Results in:
> 
>    qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not connected

Thank you for this real-life-impossible-but-exists-in-QEMU test-case!

Should we cover it in qtests?

