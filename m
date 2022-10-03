Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A937A5F3899
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:06:24 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTZu-0003Ce-On
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSy3-0004ng-0o; Mon, 03 Oct 2022 17:27:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofSxx-0004xA-6d; Mon, 03 Oct 2022 17:27:14 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so218195pjb.0; 
 Mon, 03 Oct 2022 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=yMRKWuQ9XmTvqd+uJXv5jQFbuGwwC7Huz/MwYeSJ/Hw=;
 b=kQuu90UFeFaA1EmM60Zi4qeW1aWYumAOexhqCY2rXghEBaRa9tRdzIsyk0RYXkql2M
 k3tF6hiLmLWEzI8Qn/l85vulLeIHhYa1H/B1Wb5OHboFlJ1z1uKKYTV8JiICByta8cJS
 g1vOdn5Lp0vizFHVCe5PzgtFbOquaE0x719ritbRu3Wg+vdhyJ1IPFTVutL1562jQ02p
 LMQH30CzUgJ5kLFvZvszuyK0tBKgbqdbhGAoKmDwNZKoIw2Q99k7B1VsJQWq3f4aIN+A
 AmG1rz43GGScuReB6nEfKz502UcARHMKX0MidzxJyQf9eGY625LlkLd9m+q5IcAk7nyO
 wIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=yMRKWuQ9XmTvqd+uJXv5jQFbuGwwC7Huz/MwYeSJ/Hw=;
 b=Fnp4ZPx/hCBkGBhpfBGOoNnJTpasnTZ53omBYj+mRXS3rkRa+r1sFGXCmYRAtTB+MI
 7vzTkxZVVMgVGUmjPxd8oQkUaLIUS0qjdSfXeVNpQhlQqfgRQTIwc5MqtHqAlQYw7jMh
 oLcqPD3u9QsL/3DhxFgvCddErMQlbUWxMlXwwcQtWBOtZ/RbqLrMMtAV+6jWPCEXY3Q6
 5Q1WVZ2CECV5a5CcoAh66zIhrXzS/VhugzZrPczF6vMTkyjGbv9C2lVdSjnZ2Xer0xrw
 bcpqeehAFtWKtBx0i/SazndIi2ukabN+9NSBbDxPCzJEjc6nYC2+NQIPNfsrc0UU/Ycm
 vnCQ==
X-Gm-Message-State: ACrzQf3p9GF9qWWwt3aKuxba7u7L4Q/YwP6S+EAwXKKwT0V6zs8SZU1K
 KiWPzvboKoepePKyC+6F+ag=
X-Google-Smtp-Source: AMsMyM5vio1Vv9OpxYl6sUQfcZnLtEFYAd0ZQIDiJaTqtXhVNRo7clIckJ4i4GM9L0GxFBlyDqkUEg==
X-Received: by 2002:a17:90a:d48b:b0:20a:97fb:3eb with SMTP id
 s11-20020a17090ad48b00b0020a97fb03ebmr7863845pju.189.1664832427046; 
 Mon, 03 Oct 2022 14:27:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090a1f4b00b001facf455c91sm1686530pjy.21.2022.10.03.14.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 14:27:06 -0700 (PDT)
Message-ID: <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
Date: Mon, 3 Oct 2022 23:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 00/13] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
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

Hi Daniel,

On 3/10/22 22:31, Bernhard Beschow wrote:
> Cover letter:
> ~~~~~~~~~~~~~
> 
> This series adds support for -pflash and direct SD card access to the
> PPC e500 boards. The idea is to increase compatibility with "real" firmware
> images where only the bare minimum of drivers is compiled in.

> Bernhard Beschow (13):
>    hw/ppc/meson: Allow e500 boards to be enabled separately
>    hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx
>    docs/system/ppc/ppce500: Add heading for networking chapter
>    hw/ppc/e500: Reduce usage of sysbus API
>    hw/ppc/mpc8544ds: Rename wrongly named method
>    hw/ppc/mpc8544ds: Add platform bus
>    hw/ppc/e500: Remove if statement which is now always true

This first part is mostly reviewed and can already go via your
ppc-next queue.

>    hw/block/pflash_cfi01: Error out if device length isn't a power of two
>    hw/ppc/e500: Implement pflash handling
>    hw/sd/sdhci-internal: Unexport ESDHC defines
>    hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>    hw/sd/sdhci: Implement Freescale eSDHC device model
>    hw/ppc/e500: Add Freescale eSDHC to e500 boards

This second part still need work. I can take it via the sdmmc-next
queue.

Regards,

Phil.

