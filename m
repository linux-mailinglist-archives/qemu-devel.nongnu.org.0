Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD56B7C08
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkAL-0002Xr-Pd; Mon, 13 Mar 2023 11:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbkA9-0002ID-F2
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:32:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbkA7-0003n0-Sg
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:32:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v16so11770785wrn.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Ne3/sHKBeCLX1lQpncpUUeCizp7q0taEQIAsg8zF6I=;
 b=Xs/DqU2c+K9d3xb4/MaNd4ncIkLOxWG0Tobs08F1h0QtHBEfAjf+4PO5un6TbD/8VO
 CnjgieYpS6VBMEUkPkqafF1kN/uqueKq00bHAZQovgTVxky+ZUmVxQrqj6Y3/1Ivt8S1
 pyoyVmrRqN7W6RE9fGCHa/WGowTVPTAM+g6pImUJmZ8PzaumjRDwg+0LS8uJjRgoHo/w
 VYKStJxt+O9fgoONDR+TS5clq68JfqdMCWZNMA8WlxAKPybBXh9aF0zWQ/gFHALLSsWR
 pQPHEJ8nNr45FoyxXyY+EJNXyr+qqCZUqm0NB7PL1RYpKg2p1NjO0afPQdc1EYEUBA8v
 uK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ne3/sHKBeCLX1lQpncpUUeCizp7q0taEQIAsg8zF6I=;
 b=hWspE1XzdCPmrl0SINB7QbVBPKvXeN2WZeRaYkdDViCoGk3j6giOpKUIla3KDFFvlG
 nYk6vGUERtHm0PBVLwlkQDHcp6ITwmrNHw3qQS/QeCjqrcvt/816N7qV+xoNkGfVXenu
 zxBe7hMTeqstcCoaG+U5BZ+/Zw6CDbygs/pl9F4Fo7lZiOiRwPdyCe3MElVYTB30lSRa
 21r0D9+tNirgXa/8n/lwDnNFfk4/PhmUmXfjZLPpj+Ld7ZysbNr7rvt3sagjZ6ktPT/6
 4TFBMDkYud1kd3FMHEPrTX9sBHLDK16bcb01HewZO59lGms8Fc10GttMtr91oafB1hga
 Vmbw==
X-Gm-Message-State: AO0yUKWht4wFB+xO9uKKis1ZnTJDAQ9Vk6ApboLGKE9JyI/ESTJ3KYj2
 2f7jE6X1ztVWrIbt5e/eadJyQQ==
X-Google-Smtp-Source: AK7set8wQbmWcRXYxXgjIAXEyzYeSM9CMfoD+s8WS9BgH//AqTCFUVg+28jdby83GZKOTGNw6DRjdQ==
X-Received: by 2002:adf:e546:0:b0:2ce:ad2b:bc52 with SMTP id
 z6-20020adfe546000000b002cead2bbc52mr3468926wrm.31.1678721554034; 
 Mon, 13 Mar 2023 08:32:34 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b002c55306f6edsm8163172wru.54.2023.03.13.08.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 08:32:33 -0700 (PDT)
Message-ID: <a2af5477-d124-e8f7-32e3-1b194769bf2e@linaro.org>
Date: Mon, 13 Mar 2023 16:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/6] hw/i386/amd_iommu: Orphanize & QDev cleanups
Content-Language: en-US
To: Wei Huang <wei.huang2@amd.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230313153031.86107-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

I forgot to Cc Jason!

On 13/3/23 16:30, Philippe Mathieu-Daudé wrote:
> Following [*]:
> 
>    "Last time I tried AMD vIOMMU it didn't even boot."
> 
> mark amd_iommu as orphan in preparation of deprecating it
> (or should we do that directly?).
> 
> Extract the PCI realize() code from sysbus one in order to
> remove the single case of calling pci_add_capability() and
> msi_init() on a *realized* QDev instance (in order to
> strengthen the PCI/MSI APIs in a follow up series).
> 
> [*] https://lore.kernel.org/qemu-devel/CACGkMEtjmpX8G9HYZ0r3n5ErhAENKhQ81f4ocfCYrh=XoF=5hw@mail.gmail.com/
> 
> Philippe Mathieu-Daudé (6):
>    MAINTAINERS: Mark AMD-Vi emulation as orphan
>    hw/i386/amd_iommu: Explicit use of AMDVI_BASE_ADDR in amdvi_init
>    hw/i386/amd_iommu: Remove intermediate AMDVIState::devid field
>    hw/i386/amd_iommu: Move capab_offset from AMDVIState to AMDVIPCIState
>    hw/i386/amd_iommu: Set PCI static/const fields via PCIDeviceClass
>    hw/i386/amd_iommu: Factor amdvi_pci_realize out of
>      amdvi_sysbus_realize

