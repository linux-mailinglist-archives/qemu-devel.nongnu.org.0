Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EAF6A413F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc7w-0007hh-1D; Mon, 27 Feb 2023 06:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc7t-0007hD-Hi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:57:06 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc7r-0001Cd-K0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:57:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso6501706wmi.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1psz/8Uq3Cck1e75PJsF3o0QYRsc7hR5kwyQcGQhTbU=;
 b=aufsagsVUmfCjboC10GPbrUIDcjRWTeOfaEtE0pLAdypWtsO045zvrb6bYLyAeDsDU
 /9AI/KPZoYnAx9vI1kQ/VqpoImOi5Ao1LpCdcpRxSueEEeWk1/EzrCrB9e/Xr2S8uU0Q
 2OAUe+za57Zp7IG00U8UQMcmlX4bGRVwl8DlZYkFnAQ2loTG9bHx5RHzTDuD1WWXGxo5
 HHLjJv6E0BXIq5IpMbyOeSeMEgKHAUI1oGcnM8HcR3mmbjfgHG9L5SK3L8CaY7gf5Aqd
 a7JFADSev4t8Rc2cXmKpNRTsmKUGQ9XliDlcn3tvuD8zo7SqVQcYdaZf2AU3C/hWbBFK
 IzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1psz/8Uq3Cck1e75PJsF3o0QYRsc7hR5kwyQcGQhTbU=;
 b=AhF6gzM2X8i8NmXi6CW4raQRYKRfUbIagAR7ulu1oAoxCgG6twTgqogLLyEB99CiUx
 nPuIBD4LOYVpEE0wVp7S77LMqD3Y4pOb94H9S7BPo05DaVQy9VR3GQZMOfDq2RSuRmdA
 CtgnlwEpGJzQ+xAA6Z6V1dLjvPvfTeMgR0VrX4uvQoONPRxcESeFUCeVF5/3mFXjPg/L
 FFyLKo4Ak3b5IXt14Y6fHIgy9tG5XLyDbXKsFtBA8KBIXFlB5JcAE38IJcBIttcYgBuc
 x47fczydh7gvRZxzCDqjM2Ux8qdf+IPPzdhklDtjS9zYCGOY44RxBKX6vbDjZZBNsPNC
 NWWg==
X-Gm-Message-State: AO0yUKVMufNYCFa6eij4UkqHJlFDOb/k0h8B6W4Uj3AvM3lpnXcizxo2
 1DhNRLV7JVEY0doO0uGpKEK3TQ==
X-Google-Smtp-Source: AK7set8tTVD07Z4EVm6T95lkwJfzwFL7st8OauJvzEjym+xHG+jGkyWkuFtwecGSHmMe8p9yzYXSDg==
X-Received: by 2002:a05:600c:3b9f:b0:3e9:9fc5:2c6d with SMTP id
 n31-20020a05600c3b9f00b003e99fc52c6dmr13112887wms.14.1677499021395; 
 Mon, 27 Feb 2023 03:57:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c56046a3b5sm6768548wrp.53.2023.02.27.03.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:57:01 -0800 (PST)
Message-ID: <11e7fddf-fde3-4bee-a6cd-9b166537fc60@linaro.org>
Date: Mon, 27 Feb 2023 12:56:58 +0100
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
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
> 
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


