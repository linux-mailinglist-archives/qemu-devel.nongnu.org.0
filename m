Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1A649C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gCf-0008Ab-2M; Mon, 12 Dec 2022 05:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gCR-00087Q-Nx
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:38:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gCP-00017T-U8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:38:19 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso4739289wmo.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Bq1eXk5vfv6cL8hn41sVCsPx37VdPs12j9eGjEbOl0=;
 b=Ahj7Hsj1CMzO4X6jtc2Vq7rrSR42lEj25wQIC8DNs+R4fZENDmN3i/wylBu26MyV6m
 yWazcNp15xpgicTwIkLNez2pfjGiwnkP+VopmY0GlK+4WdOWc2IzB+L0E5a8KqXNUyQw
 Fl8X0eeu/N5j0t/4mgzOntoO6AeAGf6Vbb0HHfVNIFUh+1VicISbmQNCWGtgKnN5OT2M
 MrtJ6miplwpO+obal3R0v7GZtWwGUvfGTlgRkdMmY1tH+ozPUoqOF18eEL34hrWDn/w8
 JOyYdav9idEhi8pj7pYPe6XtwGSZe9UFjuTSksv7E9jTxudWPLDO3C60CDlL+PU6s84X
 pDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Bq1eXk5vfv6cL8hn41sVCsPx37VdPs12j9eGjEbOl0=;
 b=KcoUW59rch2EPCcqKKKa1g+18T1P76u0cULJXHC35F7N9t9op2/lCM6JqukC5S2Vg8
 XqivFJADjRLyn3opOFnpJssL58vdrgxDvSE8TfpcpkCFFmBpHFtH6h+vrF2pUlQrazmd
 q4uTSdYilcHmKpsm+B4i8nLKv0QjMq1kvreYwjp9poqGzCW9tD8M+oNNteZ6c7yvI3W/
 98FrE0jCeq4R2N11wcyMzJgzBHN7FJqpC6F9OVa/1liVRKKBUcQvMpOMxpIl6zPNHjHa
 kOBd6SXs89QLuC8HJkr44wsrQK7ug+iAr0PhTp/TCGpIWKzrmzLV2UwmfIE+C+ItmRSp
 8COQ==
X-Gm-Message-State: ANoB5pkg3r1365yv63Tu5q3qFkU9lUnx6HCpv9l0xYubtK3LMPA/40oF
 X7aevB1OC8nUsZ461+yfkb+08Q==
X-Google-Smtp-Source: AA0mqf4KoUJHaQKYfhSbRroQjUKjBT1oxxVpfmbWTW/XKosVICqYFykIORC1Up+1ZLZHnvelqWNPiQ==
X-Received: by 2002:a05:600c:3493:b0:3c6:e63d:b8a1 with SMTP id
 a19-20020a05600c349300b003c6e63db8a1mr11643532wmq.16.1670841495546; 
 Mon, 12 Dec 2022 02:38:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az25-20020a05600c601900b003cf9bf5208esm9142064wmb.19.2022.12.12.02.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:38:15 -0800 (PST)
Message-ID: <6c870242-7047-7d2d-3945-80da9cb93cc1@linaro.org>
Date: Mon, 12 Dec 2022 11:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 5/5] hw/ppc/Kconfig: Remove unused dependencies from
 PEGASOS2
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>
References: <20221207231205.1106381-1-shentey@gmail.com>
 <20221207231205.1106381-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207231205.1106381-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 8/12/22 00:12, Bernhard Beschow wrote:
> Removes the following dependencies from ppc-softmmu:
> - CONFIG_ACPI_CPU_HOTPLUG
> - CONFIG_ACPI_CXL
> - CONFIG_ACPI_HMAT
> - CONFIG_ACPI_MEMORY_HOTPLUG
> - CONFIG_ACPI_NVDIMM
> - CONFIG_ACPI_PCIHP
> - CONFIG_ACPI_PIIX4
> - CONFIG_ACPI_X86
> - CONFIG_MEM_DEVICE
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index b8d2522f45..0ab77177a8 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -77,7 +77,7 @@ config PEGASOS2
>       select SMBUS_EEPROM
>       select VOF
>   # This should come with VT82C686
> -    select ACPI_X86
> +    select ACPI

With the previous patch (fixed) you can remove both the comment and
the "select" line.

