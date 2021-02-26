Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C831A3266D0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:17:47 +0100 (CET)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFhgQ-0002z3-FJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFhQp-0006pU-QW; Fri, 26 Feb 2021 13:01:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFhQi-0004M1-O8; Fri, 26 Feb 2021 13:01:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id x16so8089318wmk.3;
 Fri, 26 Feb 2021 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FdE8dPu5JYCKsuB43tlA5pNyJSyT8qbf9d35g+XjM+I=;
 b=rhBr20rLnMlyr6qLR/GKKlODTXWvX8gUNDFwDdHh4XvVsjDmpA4WraKqFNEr4r/PwS
 BV9niL+6Fa/oQ3Cel8Rs2csA5coHNb4tqqBxNeCCBKkIU0VS7IJ/BW/CK1y/Oelqwrvs
 SgHZ0fcbT2kt4AU11o0wxeXHeAHyG8vTEXpgIiKuTom/Lz6ZBxCwa7q6meIJlg/a2FZl
 AaLeoZVlTEnU+0oJP/Uk03a0hhX6gIvvY1yP8CLtVij+a1dZsK60XHczc6oy21bmUyQr
 +isz8VY1nETIQGKgKK299YPDjYDDy66RGP7SV5v7bEjtQDe26Pn+LBBzhemqi0ozXBf2
 iuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdE8dPu5JYCKsuB43tlA5pNyJSyT8qbf9d35g+XjM+I=;
 b=pXQSyXRwqCqtBXYkwBWkR3uIFUT9K1FaaHYynpL09iIw7b//rpDw89eiLh6nSQ4hQm
 sS7jGHQHZqw3EpYVLz+SZizSM1efv0XQKCCi1tj0kwRPULX2cMk/AuBPMRtKPWAULDTH
 19d9adc2B1qAUg1P6E5P6OabLRyA54XqRK7xCMZ0WVDbtar+O/Dhfp1IbmPoIWqzG+VE
 hD1djyLkKhYsI/NhJAwUZVJ/XlAPRhiA2Fjc5/NMEnyQAu70T2wbR5mN9o/gdVPr9BfG
 jWKpI1NEfNyAZNZNvQeXfe1EY83jMZPbVJImSwO4bMan8S8bK/cQ9oiFLlWTRe8eMeZ2
 URyA==
X-Gm-Message-State: AOAM531LhKdFlaLqlfpqmyUsaPLamW5OwVCzA9HsvjMbhUuDEEkbSkjc
 9SxK1myOv8qU9wlzi7l2IBU=
X-Google-Smtp-Source: ABdhPJyYd90PB9SB4LUBohfT2MkADO5z+WaN90YZdrmU8Qq/E/tYWhihFiozO+JDKRAuGzbE9wZVJQ==
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr3613148wmi.179.1614362488100; 
 Fri, 26 Feb 2021 10:01:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm12627282wmi.48.2021.02.26.10.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:01:27 -0800 (PST)
Subject: Re: [PATCH v4 0/8] hw/sh4: Kconfig cleanups
To: qemu-devel@nongnu.org
References: <20210222141514.2646278-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63f0ccc0-5675-83e5-97a9-36219657d173@amsat.org>
Date: Fri, 26 Feb 2021 19:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 3:15 PM, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (8):
>   hw/sh4: Add missing license
>   hw/sh4: Add missing Kconfig dependency on SH7750 for the R2D board
>   hw/intc: Introduce SH_INTC Kconfig entry
>   hw/char: Introduce SH_SCI Kconfig entry
>   hw/timer: Introduce SH_TIMER Kconfig entry
>   hw/block: Introduce TC58128 eeprom Kconfig entry
>   hw/pci-host: Introduce SH_PCI Kconfig entry
>   hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
> 
>  include/hw/sh4/sh.h           | 31 ++++++++++++++++++++++++++++---
>  hw/block/tc58128.c            | 26 ++++++++++++++++++++++++++
>  hw/{sh4 => pci-host}/sh_pci.c |  0
>  MAINTAINERS                   |  6 ++++++
>  hw/block/Kconfig              |  3 +++
>  hw/block/meson.build          |  2 +-
>  hw/char/Kconfig               |  3 +++
>  hw/char/meson.build           |  2 +-
>  hw/intc/Kconfig               |  3 +++
>  hw/intc/meson.build           |  2 +-
>  hw/pci-host/Kconfig           |  4 ++++
>  hw/pci-host/meson.build       |  1 +
>  hw/sh4/Kconfig                | 12 ++++++------
>  hw/sh4/meson.build            |  1 -
>  hw/timer/Kconfig              |  4 ++++
>  hw/timer/meson.build          |  2 +-
>  16 files changed, 88 insertions(+), 14 deletions(-)
>  rename hw/{sh4 => pci-host}/sh_pci.c (100%)

As SH4 is not very active, I'm queuing this and will send a pull
request in a few days.

