Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD48505AAF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 17:13:05 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngT3l-0007Zx-LD
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 11:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngT2M-0006t1-5F
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:11:34 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngT2H-000261-5f
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 11:11:30 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k62so13312275pgd.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j8kItJuM4HcheunkAW12OhrQ6PeJIAq894vGtJZl4iQ=;
 b=qzcK9tJ9kgN/p5yyVVA08uz4mncEqUuxFUclThBNChK8uVS7ofkO/k6tGHZuoeQLkO
 S/me67Y6MqzFJQfu4EeaKhNYJslvHYpVYah9AyFS2kX+8dak4AZcc9RC2c+xsNriKTlf
 QFE/S1wPui0zCG32Qhu80Zaj+5YNbdqQ4NqOQBo4IHuDjGgePSqjoVLSnEYstBN6XsVG
 UlXPIoejW3z4mTrOx8oo3VkontROAU9MiZbKiKSvfGmMXK6VM8G8SBNg9j+NNc8q6aZH
 2wBw/cUiCsDqXjxX94wUpXPYsthkAd1WZIURxHeKSYNgP7cJceUKloUonhCGp1+/yVro
 bfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j8kItJuM4HcheunkAW12OhrQ6PeJIAq894vGtJZl4iQ=;
 b=Egw0qo5bHjrnf2g97oQ0DNydZCqLyy44GDnuHbWdBrmHlKze0q5i6OQysRoUP0nEMp
 GLgWDIpdWfBCLVrzCFamFz524APdsqXnarDotIGU2POGCEu5b4urL6eR8YCOqUPnJKkw
 4rL8GtymjxJyJ0Y7ca8ZPWqiPwUS4/x0oVuq7uZakaQnsTOgQ8XqfsH7I2W0cXRy/9Fw
 vAeGSCB1Ije+lz9lUTZbr1+UTd1Q06+JDn4AHrvzE2tiOjK0nwjFH8Pzh+cIeHqXS/8l
 CsQPySNAgxFW7l2aT0rUC2yv5OMvKVh44jcQOnZoY5KuJF7+IidtOJpkYnQ8JAnIfV1h
 ap2g==
X-Gm-Message-State: AOAM531Qxx+c66Y8es7BNjAnbLaoMlI6cZPEKv48iA82tppyuD9CkRSI
 g9+jYQoio5jL9TcKfQZwdqTXXA==
X-Google-Smtp-Source: ABdhPJxL1R5T4ok6ahrHw74xHjX9yarufP1wa9Eevdbe3+m+7hTulhJ06Pt1R21mbOoOC2SJp4o9jA==
X-Received: by 2002:a62:1581:0:b0:50a:587c:ba07 with SMTP id
 123-20020a621581000000b0050a587cba07mr8528644pfv.58.1650294687165; 
 Mon, 18 Apr 2022 08:11:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 nm5-20020a17090b19c500b001cb9ba78d39sm13244562pjb.9.2022.04.18.08.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 08:11:26 -0700 (PDT)
Message-ID: <1a2eeef8-ddbb-e07e-d3bf-ed8da97bba54@linaro.org>
Date: Mon, 18 Apr 2022 08:11:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 40/43] hw/loongarch: Add LoongArch boot code and load
 elf function.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-41-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-41-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +static void ls3a5k_aui_boot(uint64_t start_addr)
> +{
> +    unsigned int ls3a5k_aui_boot_code[] = {
> +        0x18000064, /* pcaddi  $r4, 0x3    */
> +        0x28c00084, /* ld.d    $r4, $r4, 0 */
> +        0x4c000080, /* jirl    $r0, $r4, 0 */
> +        start_addr, /* elf pc address      */
> +    };
> +    int bios_size = sizeof(ls3a5k_aui_boot_code);
> +
> +    rom_add_blob_fixed("bios", ls3a5k_aui_boot_code, bios_size, LA_BIOS_BASE);

This only works on little endian hosts.  While you could fix this, it seems better to use 
a reset hook to cpu_set_pc() directly.  E.g. hw/arm/boot.c, do_cpu_reset.


> +    memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
> +                           LA_BIOS_SIZE, &error_fatal);
> +    memory_region_set_readonly(&lams->bios, true);

This is exactly memory_region_init_rom.

> +#define LA_BIOS_SIZE            (4 * 1024 * 1024)

qemu/units.h has MiB.


r~

