Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0C330B02
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:21:15 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD0k-0004en-VB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJCzS-0003uw-8U; Mon, 08 Mar 2021 05:19:54 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJCzQ-0001Nr-Nd; Mon, 08 Mar 2021 05:19:53 -0500
Received: by mail-ed1-x535.google.com with SMTP id b7so13824001edz.8;
 Mon, 08 Mar 2021 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ORILKYRo49fZNikJ3pyNQMiug7zjbzkGFX9KhB5Vng=;
 b=Qvr5cmRRAM208VHTmGx/U6yxNeEulHKL+nDRApFvUXvNK2S1QxGSCZoz2AbepX7M3V
 qgNdCBaxKOBoH3aj/OQW6RKKjSe2Uh2M2zLrtv+kDYE4KDpki76zDVUlS/iMRwM2ApPS
 ydd4U/qWR3yfCfsTFuj5bshGDm9k0Bo5veGEZIYOiQqiNgXH9qq2B5Q61369bJrRkVT5
 VMyUkB9F90EAS33Djs/RJBZeTTDVIU3DkwCsIqyVkzRpLAyFI8DL3YeGWys8jz9OBBck
 PM0NspXxw89iHRIFum1HCUx+wGOrHedWOgeJ9EXq+Jo7Km9ijGOVN5Igk/siZsWDMjSq
 H1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ORILKYRo49fZNikJ3pyNQMiug7zjbzkGFX9KhB5Vng=;
 b=i2vvmlsUvgdWrbVJgbD937vs12VCWQH30c3Fa9lljPVXgMtkWZ6HRwsordfRpUjua5
 hs/UQnEuXu2dImvTN02iHFP6UktU6bG4XB7K09MthAZ4yIP4WV1NGIbtrJAa9tlEYjBH
 A3mzNuGuL/6CRH38ig+iEvv4DhqJ2FKn4fuIh+QoLnjUmpOc+vRWDDbxpgfixMUcu03D
 eU8y6InpTMEdBp6zpbqSXeyVJPiJqu4hp5rB2c9GRU1MoyhZUfEyrZ3oK0q1lRChtjxg
 4r7Xowjx0A3dXQ8//q0A3GoM6LU4Z83n6kYtCXuLNjAv+j/5n86b82XtYf/tP3ukaolv
 54tA==
X-Gm-Message-State: AOAM5317qnokbHLfSncf8a/7bjRKMnA3b37rg5i8O3oQq924bKiPjRGi
 LgFU6ZCPETz2md5tkLBjYLo=
X-Google-Smtp-Source: ABdhPJxR18g57wWjgPX5jPsyvsW3pvIK9D+gt71M5V+CG1I9KRzCGXDtGN+Pfh3OgqXr58c2bwo12g==
X-Received: by 2002:a05:6402:1853:: with SMTP id
 v19mr21128625edy.179.1615198790586; 
 Mon, 08 Mar 2021 02:19:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r24sm6736711edw.11.2021.03.08.02.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:19:49 -0800 (PST)
Subject: Re: [PATCH v2 0/3] hw/lm32: Kconfig cleanups
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20210221225626.2589247-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d6c1b8a-e450-110e-c8e9-94623fa44220@amsat.org>
Date: Mon, 8 Mar 2021 11:19:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221225626.2589247-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 2/21/21 11:56 PM, Philippe Mathieu-Daudé wrote:
> Hi Laurent,
> 
> This series is fully reviewed. Since LM32 is not very
> active, can this go via qemu-trivial@?
> 
> Thanks,
> 
> Phil.
> 
> v2: Rebased
> 
> Supersedes: <20210208135048.2601693-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (3):
>   hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards
>   hw/lm32/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_DEVICES
>   hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES
> 
>  default-configs/devices/lm32-softmmu.mak |  2 +-
>  hw/char/meson.build                      |  4 ++--
>  hw/intc/meson.build                      |  2 +-
>  hw/lm32/Kconfig                          | 10 +++++++---
>  hw/lm32/meson.build                      |  2 +-
>  hw/timer/meson.build                     |  2 +-
>  6 files changed, 13 insertions(+), 9 deletions(-)
> 

