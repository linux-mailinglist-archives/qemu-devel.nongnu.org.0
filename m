Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D756A4242
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcWp-0008K4-JV; Mon, 27 Feb 2023 07:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcWi-0008Ib-DK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:22:44 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcWg-0006Xg-DU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:22:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bv17so6005293wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CsT2YahkPmHQgEosCLjW9UC9/Yxb8K/Hl5ul7F+hJNQ=;
 b=fmBDnKdOkH9DJr9QFJ/aOvA4Pc7533h2alFApmDJxTx0feuJkY0D53sB4fpdiYGXIT
 wJZembClcOcVnx39/jqctJdDiI7IVacTDfc+wI7FX7ovhH+yVIAJRhBSH65+1DavD/GU
 JxieMzDWnkAskXHhWbCEXss+A9ulLcnFTEL0qWmiZQRL+B8iKEuKXoF2hbCeD8WUFtKN
 m5mtF+EUHwijy+FxpwFEGpoTby5BY1EA8s6Ie07C2HGTLHOIf7mbxxkQyz8Cg4jgJO7f
 3hU1BVjTtMTRsvAq0e1PQh51Hinbh9UD8D4ZLBBVjOm6/NjaXpfAkdL9GZnumo6xrpV3
 3lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CsT2YahkPmHQgEosCLjW9UC9/Yxb8K/Hl5ul7F+hJNQ=;
 b=6rDFRjKaO8+yzuePJ5aeR8/DpAhjhUjOoIadDxB1pDLDEDuEWL/jO6+BJezR6emsg3
 rUTM+unO2wY2cBWBujt2GSz6YgYM2JEN0cjP74yVjXpnYrXgbEUKZ6+Sl5FoS6YoBXb1
 z5TuKp53QBr/SW8tp97L88jsGwUOo+4w+S9A/F50LeiFBDseKbEb0a6a9A4ujPnnhCih
 4CL9mtKHlcA+4JXszDDfO0th/Uvkn0Yjr8UI3YeXRBcgUE3q5gw09Rk89hf3rk9aldYP
 Wk2ag9r6W8TfOJfDhtXFA5x2qo0nBEcPAVJ+vpA2/5qg5g9tapFirtJ1etHpWbpQx64A
 dsaQ==
X-Gm-Message-State: AO0yUKXs7HhlZYUmo9Bi06PAOM/grUZmilpX0IbAaslynlxFWX92bFWI
 tVOQnlFlMoqNpONLu+LgJk0ShA==
X-Google-Smtp-Source: AK7set8VCjOX//mMK6uAzOiLRLLQ+T4hI/dqUdMWcKfSTZvcYG5ifA84I6L2Oxa/Va5agzR9DK3svQ==
X-Received: by 2002:a5d:6245:0:b0:2c9:57a8:eeac with SMTP id
 m5-20020a5d6245000000b002c957a8eeacmr6073308wrv.25.1677500560812; 
 Mon, 27 Feb 2023 04:22:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b002c705058773sm6928161wrs.74.2023.02.27.04.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:22:40 -0800 (PST)
Message-ID: <554823d7-7437-d164-a93c-29faeef7857e@linaro.org>
Date: Mon, 27 Feb 2023 13:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 12/12] hw: Move ich9.h to southbridge/
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-13-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
> ICH9 is a south bridge which doesn't necessarily depend on x86, so move
> it into the southbridge folder, analoguous to PIIX.

However it is still tied to it due to:

hw/isa/lpc_ich9.c:315:    cpu_interrupt(first_cpu, CPU_INTERRUPT_SMI);
hw/isa/lpc_ich9.c:462:                cpu_interrupt(cs, CPU_INTERRUPT_SMI);
hw/isa/lpc_ich9.c:465:            cpu_interrupt(current_cpu, 
CPU_INTERRUPT_SMI);
target/i386/cpu.h:1145:#define CPU_INTERRUPT_SMI 
CPU_INTERRUPT_TGT_EXT_2

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                             | 1 +
>   include/hw/{i386 => southbridge}/ich9.h | 6 +++---
>   hw/acpi/ich9.c                          | 2 +-
>   hw/acpi/ich9_tco.c                      | 2 +-
>   hw/i2c/smbus_ich9.c                     | 2 +-
>   hw/i386/acpi-build.c                    | 2 +-
>   hw/i386/pc_q35.c                        | 2 +-
>   hw/isa/lpc_ich9.c                       | 2 +-
>   hw/pci-bridge/i82801b11.c               | 2 +-
>   tests/qtest/tco-test.c                  | 2 +-
>   10 files changed, 12 insertions(+), 11 deletions(-)
>   rename include/hw/{i386 => southbridge}/ich9.h (99%)


