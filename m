Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B527966B9F6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:14:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLYN-0005EE-9X; Mon, 16 Jan 2023 04:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLYI-0005E5-Np
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:13:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLYG-00027g-Mk
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:13:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so7382330wms.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aDRVfpdEE+QjogmqhcdjGD42xJadkC4Jh6TL11ZOfxI=;
 b=JqblL97g8t36aW4y1d4X0US4E0jsPxaGmFhpbjsYTiu6x1ZEpP+7y9pPMyAigULmp3
 o3MaoTtka9awLZVicNzDZNd79ZTZFpMsgr7EjcN1Mc8YiUff4KUoXbw2VWzAWtvlrhDY
 FRRX8psTfoLBiecHPEltOkxmtg6x5ZKLsL2N/ZQj0PgS2Lzxv658HOYPIhxcV8ZasBzu
 SP/Sb9n3L8d9/Ui/9UO8OF9Q0kW5WbX61Zag9PzJrcgGRXqspfS27e5AuCaT9kIoMNVW
 uLQkVzZLHA53csGg6tvP3vq4MQ5/ZRkDBeWm/+KM87oxqxx0C/P5fnSmQChF2gvYVqdD
 kvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aDRVfpdEE+QjogmqhcdjGD42xJadkC4Jh6TL11ZOfxI=;
 b=6MfAzE7aOCrei9qNBRlNqe/iZsyXfTsLfWCkb7TDXe/u5SqnbVmrUbwJ99h3HOR6xw
 ka8SQXXhyoPfP+YXpf4bwEyAAKsIgMFIPhDf5nkgmrnsKAQt6jz2+UI/1J7Fw9IUZna7
 6W5i8VTqYtxdSEaLD7WQMlelQsrK0VL5Dxb0MLGKFcXZgOK5LXhXuTELixiKvRrPFon1
 +OO4rLMEthmprc5bQoMe8t/8oAB3SwM7GnCgWVxJ8gD8lgrRbX2u7KQvbRMdKX8L8KHR
 w9L5zN9SC3ZkDyCWGSe2gmnqddKEpoPpT0uk7hMydbSECfczDhOJRv1uCSD7K4S+mQ69
 pKCQ==
X-Gm-Message-State: AFqh2kobWAPllveQLtAsdTISAwgNZgapVt3R2ZyekmP2FpYxA6H0qSel
 XvjGYmjOcxRfKhYY6n7+HK8Xig==
X-Google-Smtp-Source: AMrXdXsdQ40wHxVAJEOPTzHG7+WBW2R0pjGWgYPQmzVHSMG0w5S5T4rnwj5sjChY14yfBLJFuCZkNA==
X-Received: by 2002:a05:600c:5405:b0:3da:632:a8d with SMTP id
 he5-20020a05600c540500b003da06320a8dmr16910190wmb.10.1673860390997; 
 Mon, 16 Jan 2023 01:13:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm37737724wms.0.2023.01.16.01.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:13:10 -0800 (PST)
Message-ID: <c9168fc5-81e8-0182-18bd-4aed67c51221@linaro.org>
Date: Mon, 16 Jan 2023 10:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/7] hw/acpi/acpi_aml_interface: Extract qbus_build_aml()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114222738.282478-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 14/1/23 23:27, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/acpi/acpi_aml_interface.h | 11 +++++++++++
>   hw/i2c/smbus_ich9.c                  |  5 +----
>   hw/isa/lpc_ich9.c                    |  5 +----
>   hw/isa/piix3.c                       |  5 +----
>   4 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
> index 436da069d6..cb2f1c9910 100644
> --- a/include/hw/acpi/acpi_aml_interface.h
> +++ b/include/hw/acpi/acpi_aml_interface.h

> +static inline void qbus_build_aml(BusState *bus, Aml *scope)
> +{
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        call_dev_aml_func(DEVICE(kid->child), scope);
> +    }
> +}

Inline not really justified, can we move this to hw/acpi/aml-build.c?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


