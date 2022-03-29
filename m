Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E44EA609
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 05:28:26 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ2Wv-0008Vl-1d
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 23:28:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2Vu-0007py-5w
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:27:22 -0400
Received: from [2001:4860:4864:20::2d] (port=43950
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2Vr-0004xw-Nu
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:27:21 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so4957794fac.10
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jPc1lp1yWfBiWMC9oy/W4nVvqbTJEeDUK6NcDdCtiYE=;
 b=t0AkUsi8D1s9v+GzOgnhhod+ThX2E5tTaN5NTbHsthh6Lyp6HgFSiq/73GDLa6BK98
 4RW/p3JWfPfXXOEnebmN0RzicYNkB/ATSpCkUqeKCw23v4ofwuhTkENLjX8DqZmdt9F2
 ftIS9Sbzg7u/TE3emhsDbOGOYeo33GdZ7faLTEUhwRNksYCRlswccVV+mVF5mCiojx2B
 1tXIz1qTQqmONkSVEpUQsG6t+KJ/4UqjXwYhDhlLF4h+pjsZos1w56zzTfU0nqrBFcA8
 YdACdxR0bFBYoHrAbpvwX/5sU1alddy9uAvfGJU3l0f0AdSQPp0ZVeJC+ghpnaa1qCCi
 kkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jPc1lp1yWfBiWMC9oy/W4nVvqbTJEeDUK6NcDdCtiYE=;
 b=BAm+u1ooXl2ajIAuV9Go/Y2DFZMwIdcVay2FKJLoQafUIqrf9QF2PQA0BTDxZ3zKtD
 seJLX4GwTASuotbpELOsV8Bp43ZgPe5/JDWq15g2L7+Vf8ePKL0a8dvTk9gidHiS7NEF
 MnqRE7HvebahIFTUBMuRAHQi6treCKEiOnL643962M3gsK74eLOb1gHFVrCb1rrRqDb1
 r+PDgZYq++yaYyqR9WZ5LznOHZFWbQqsyDoOLvoEtLxk73zPt54A1WbfyIX4C7stB0kH
 6nA5lCRBV2MObcDB+5HfovesTY+bX5LVrAgEWYB+hWb9wHlX455pRW5N10SAn1TwBDhl
 b9Mg==
X-Gm-Message-State: AOAM530np07K31hmuvyOn12LGYn36sq98t4lNQbPcym0arVE1kqjiDSJ
 OI/67WKvUXKhed7l+mT6BxXcDQ==
X-Google-Smtp-Source: ABdhPJypwK8e1ZIVF1eL1aLuDbUp8fZr0g3CZUt084OrvxEYlxuwbyGOPAJzGj0+HJV8X48gtnlw+Q==
X-Received: by 2002:a05:6870:611e:b0:de:d210:9d2f with SMTP id
 s30-20020a056870611e00b000ded2109d2fmr1207977oae.141.1648524437708; 
 Mon, 28 Mar 2022 20:27:17 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm8119914oiw.39.2022.03.28.20.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 20:27:16 -0700 (PDT)
Message-ID: <c4de3c30-201e-4227-4d45-2e624b8b80ed@linaro.org>
Date: Mon, 28 Mar 2022 21:27:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 24/29] hw/loongarch: Add default bios startup
 support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-25-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-25-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   hw/loongarch/Kconfig             |  4 ++
>   hw/loongarch/fw_cfg.c            | 33 ++++++++++++++
>   hw/loongarch/fw_cfg.h            | 15 +++++++
>   hw/loongarch/loongson3.c         | 76 +++++++++++++++++++++++++++++++-
>   hw/loongarch/meson.build         |  1 +
>   include/hw/loongarch/loongarch.h |  8 ++++
>   6 files changed, 135 insertions(+), 2 deletions(-)
>   create mode 100644 hw/loongarch/fw_cfg.c
>   create mode 100644 hw/loongarch/fw_cfg.h

Not within this patch, but you will want to create a submodule for this bios image, as we 
do for roms/edk2 etc.  You will want to commit a pre-built image as well, like we do for 
other targets.

> +    /* load the BIOS image. */
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
> +                              machine->firmware ?: LOONGSON3_BIOSNAME);
> +    if (filename) {
> +        bios_size = load_image_targphys(filename, LA_BIOS_BASE, LA_BIOS_SIZE);
> +        lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
> +        rom_set_fw(lams->fw_cfg);
> +        g_free(filename);
> +    } else {
> +        bios_size = -1;
> +    }

While loading the efi bios may be the most common usage, it's not efficient for simple 
tests.  I think you should attempt to load an elf image, and only if that fails treat it 
as the firmware blob that efi builds.

Or not require a bios image if -kernel is present, or something.
At the moment one cannot run the tests/tcg/multiarch tests without loongarch.bios.


r~

