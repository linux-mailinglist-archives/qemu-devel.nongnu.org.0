Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171E640AE2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 17:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p18xg-0002tW-70; Fri, 02 Dec 2022 11:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p18xM-0002om-T6
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 11:32:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p18xK-0000Am-31
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 11:32:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id w15so8577005wrl.9
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 08:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMcXz2RsnhT9TNrW2EhBFAT2x7c9/rQmHCw+cYOt29E=;
 b=nP2XQIgZiBnaasNqExzAUr5bzWIq+Q0kgR9McFT18lYLkZLxpaqBWbot33PZl+wTkK
 VfpxFJu7y4Gl1NEWKY4WTLKTiIkzY2akVDVOqdOsM4DhtzmDJJqCDbiglXmeGeVVmu8Y
 DSCkpLk6qj8nvWodMwaStMPWsIaEQhNCINMRccQWNxWX7cfi34ttuVZ9Od5KXMYan3gE
 9CaNNKnBTlLicnIN0yoUUh6htOUccAszbF1gkZSqyT+wveigjXss1L/4Kih+uHZidciv
 dY/B4cFLrj229dE43kSYZmWlVmo1Wwn2XYHNqLdpXR572Gwey4UmphxpXMoWj2f8EUK/
 dhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMcXz2RsnhT9TNrW2EhBFAT2x7c9/rQmHCw+cYOt29E=;
 b=dZPYSScvJ23yh9NIBkos7NggAh+PMmsdOQeUKwWvyPXxHCZmNBta/aCjwGldnmQgaV
 zMaok6+p4G7qOixZ1Xk6idZZfmmU2GH7eN/58i3WUvJOGYMCDbem4cOG0cSlAFhmiKBa
 twRx41wRr6NbrxaaEuaMAWlp8Lfdih3aAQoAa4dpu3VFoIjGBk/W08Tq60Jd0f50LUx2
 iEAhwAR9CkRV/ASmYvoCj/L2J6ku5MlwPQzmUVVzg4HBPyNh6yloZyn1Z+YXaM1mGP3X
 TLiK87hz6M6FJiPU1949O0ELlEueIi0gzVlzH93mLgbnQfB/scEwvNuW/X68jvpfuLb3
 hyBA==
X-Gm-Message-State: ANoB5pl2CoDzpkrLgOZwGI5O93T0wH8aB3uqXunXbCgtrCR0Hh7x72Wp
 9dhYgcglhJv9W+vpyTN4BZgBHA==
X-Google-Smtp-Source: AA0mqf5nWxq/6XYijep1ZD+HZXwiBaJkG0A6KVO08kP0/N8YauODBDTHAB8RaznjDrvZgd5Vabgjdg==
X-Received: by 2002:adf:fe46:0:b0:242:13dd:c4a1 with SMTP id
 m6-20020adffe46000000b0024213ddc4a1mr16127867wrs.669.1669998723911; 
 Fri, 02 Dec 2022 08:32:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020a05600c4e4e00b003b95ed78275sm9071927wmq.20.2022.12.02.08.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 08:32:03 -0800 (PST)
Message-ID: <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
Date: Fri, 2 Dec 2022 17:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20221202154023.293614-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202154023.293614-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 2/12/22 16:40, Thomas Huth wrote:
> The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as

typo "target"

> poisoned in common code, so the files that include this header have to
> be added to specific_ss and recompiled for each, qemu-system-arm and
> qemu-system-aarch64. However, since the kvm headers are only optionally
> used in kvm-constants.h for some sanity checks, we can additionally
> check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro,
> so kvm-constants.h can also be used from "common" files (without the
> sanity checks - which should be OK since they are still done from other
> target-specific files instead). This way, and by adjusting some other
> include statements in the related files here and there, we can move some
> files from specific_ss into softmmu_ss, so that they only need to be
> compiled once during the build process.

Cool!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Use NEED_CPU_H wrapper in kvm-consts.h instead of avoiding to include it
> 
>   include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  2 +-
>   target/arm/kvm-consts.h                |  8 ++++----
>   hw/misc/imx6_src.c                     |  2 +-
>   hw/misc/iotkit-sysctl.c                |  1 -
>   hw/misc/meson.build                    | 11 +++++------
>   5 files changed, 11 insertions(+), 13 deletions(-)

