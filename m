Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAD6A42A0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcII-0004SL-VK; Mon, 27 Feb 2023 07:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcHt-0004JQ-Lg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:07:29 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcHn-0003Ev-98
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:07:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id az36so4094991wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z3gCLoUkribQGCtvyEIUnbHdg/yAqoNdMqyPIw7xYY4=;
 b=J7ugnbkjdzL7luOr5iN6q3f7f9jbwJkIVdW4t5mpqEJ1WKV9hCs1gLA58S/HHSFACW
 /jOPIxt1JXJ9unvJuYeDJ8CJDlw+0lKaetzfP4fC20qWaerJE+cLIJlzSmAoldPoQZFW
 m9bsg094EC0/9AhWgDuSWRNY2q40SKvl1PdCscW28LQljLz0P3dN0yln0f9Ab2zUhzEN
 RX9bxVl4pVuzpGOzIgr8liNWLLXQtHAp15pzRjRKRoq0b7aPMymMM/qMpXhJlKpSWGMq
 jkoxmOalO0wDZvQXpyEW9XXAyvy1ZT3gs4BbHKSS/gaT9Cbcz9N5BGT+Bhuw7t9fkiQ6
 6ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z3gCLoUkribQGCtvyEIUnbHdg/yAqoNdMqyPIw7xYY4=;
 b=U5WX+0dCpoxeyugLBM41eF1mgfWLciiQqPMuQs7JgtreK1G3Mlwd0Mk40AljPm9gbP
 JDglYD5XurDF1EIKsJsa8ca3OEdJO03Yu1sWQJ0KT4rijde1V1fRh+gqLbUc8/vKUFKv
 eFnRzNAGhgHbFQKeQPaTNzwX9asc72CZd0zpNpJy0Gfaf/siBRkxTWBoPksktoNRBd4X
 AX7fmQImelvQHPH/UVt5xh7lGUx8p5IdHbrDN9x0/h96cFz9X+V11lmMBgWFhzRLvGS6
 rwVQHk4kPihOETJfyshHAW1Kol1F/evlVnrB7Rmquj7JaVhmO7vzq6AjlhnhWrwK0Vhs
 g7wQ==
X-Gm-Message-State: AO0yUKVmnuM0BLKpmOL2WCE9xKkSVx2BfhOrcVpmCQ1jC/Ov07c7OEQG
 KMKLxg4H8b1y20pQtQ9nOboCOA==
X-Google-Smtp-Source: AK7set82+/3935zyBiIrbpzQpRB9gr1ToVY8/WWJSuS/AjAhWV67WgN7jkr1G3vUUIU5AYBH9VhLvQ==
X-Received: by 2002:a05:600c:310c:b0:3ea:f6c4:3060 with SMTP id
 g12-20020a05600c310c00b003eaf6c43060mr9150562wmo.18.1677499637018; 
 Mon, 27 Feb 2023 04:07:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iz10-20020a05600c554a00b003e2243cfe15sm8889526wmb.39.2023.02.27.04.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:07:16 -0800 (PST)
Message-ID: <dbbf57ca-cc03-6af3-3d83-341dade25314@linaro.org>
Date: Mon, 27 Feb 2023 13:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/12] hw: Move ioapic*.h to intc/
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/2/23 18:30, Bernhard Beschow wrote:
> The ioapic sources reside in hw/intc already. Move the headers there as
> well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                                 | 1 +
>   include/hw/i386/x86.h                       | 2 +-
>   include/hw/{i386 => intc}/ioapic.h          | 6 +++---
>   include/hw/{i386 => intc}/ioapic_internal.h | 8 ++++----

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   hw/i386/kvm/ioapic.c                        | 3 +--
>   hw/i386/pc.c                                | 2 +-
>   hw/i386/pc_q35.c                            | 2 +-
>   hw/intc/apic.c                              | 2 +-
>   hw/intc/ioapic.c                            | 4 ++--
>   hw/intc/ioapic_common.c                     | 4 ++--
>   target/i386/whpx/whpx-all.c                 | 2 +-
>   11 files changed, 18 insertions(+), 18 deletions(-)
>   rename include/hw/{i386 => intc}/ioapic.h (93%)
>   rename include/hw/{i386 => intc}/ioapic_internal.h (96%)



