Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA21B51FF67
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:24:42 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4JV-0007eA-PB
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no2D2-0005Ov-OH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:09:52 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1no2D1-0003G0-4F
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:09:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id 7so11846131pga.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kagD1Vxj+fpjsKOKtPHHAaHhT/bk0wz63NTd8FuFJio=;
 b=hNPjfP6lW2Uitl6VTY4+Oz0XGygvq4uwT3PwQJrKy+ref9bVzxmC/mzhPMp0+uPA+N
 1iMTA+CjRaBC8XxUw2YSX+CnqLs8dOurKDHCoPZp1nAiSn19EkV5F6UYBycoVnjHQ/e8
 oL34mx2fc9QifhIa1sIrN5yXpysyBkbWgVU7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kagD1Vxj+fpjsKOKtPHHAaHhT/bk0wz63NTd8FuFJio=;
 b=7zzU6LyE0e8yH/3ckYmsaXqjZHMrHUQIib1MP+NsuYZTIol9AkBY6BZKcGUle7n6ac
 Q1SjY3FRbKXPDwUvsiT628cB9p+BJICaY1J0uGyzac/bzuP+e1nzMIyDLLwKsB1o1mjX
 /lMau5D61Kg0VkY6HsD6X19VZU5dZw5QGJarc7NCo+t5G/iPqTqESMrTNd0/l4luwbv1
 YfXqYEJLrqRMDJHf5wbJRwU7TPkR6GeEbAW+otfBsuBWkBLGReqsCbivCBj1Dm7yOXAD
 g/Sax0NWLlwk0Kq7JppdnW9rI/pIC5/RUIK66wW3GwrNX6G3wHHog6QA8JyY52VBu60i
 KKRQ==
X-Gm-Message-State: AOAM533iP13Wlb8lBwF5ixfGRbwmJIR6XX75+rCEbVm2kA8+6UAU08dO
 OJTPZVqVMfU6sB/6FtwAFW+yrQ==
X-Google-Smtp-Source: ABdhPJx/cROHSaEG6k4u7PtZi96StGpKnUKPoZn4N+tk1vpe6e4W1M+HGImeBDBOYlDqMVXAzES/eg==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id
 j2-20020aa783c2000000b00505723f6acemr15767104pfn.86.1652098189544; 
 Mon, 09 May 2022 05:09:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a458b00b001dd16b86fc0sm2366180pjg.19.2022.05.09.05.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:09:49 -0700 (PDT)
From: "=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?="
 <philippe.mathieu-daude@fungible.com>
X-Google-Original-From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <a3748d2d-cdef-9c9b-35ad-16714df71adc@amsat.org>
Date: Mon, 9 May 2022 14:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 01/11] hw/rtc/mc146818rtc: Inline isa_connect_gpio_out()
 and remove it
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220505161805.11116-1-shentey@gmail.com>
 <20220505161805.11116-2-shentey@gmail.com>
In-Reply-To: <20220505161805.11116-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 May 2022 10:16:49 -0400
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

On 5/5/22 18:17, Bernhard Beschow wrote:
> Commit 250263033c5343012b2cd6f01210ffb5b908a159 'isa: introduce wrapper
> isa_connect_gpio_out' introduced it in 2016. Since then, its only user
> remained mc146818rtc. Remove this one-off solution.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c     | 6 ------
>   hw/rtc/mc146818rtc.c | 3 ++-
>   include/hw/isa/isa.h | 1 -
>   3 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

