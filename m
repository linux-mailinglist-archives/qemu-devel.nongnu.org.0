Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A123EE5D2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 06:46:32 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFqzf-0005Zt-DE
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 00:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFqyF-0004aQ-Qc
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 00:45:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFqyE-0005qD-6k
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 00:45:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id l11so23403593plk.6
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8tttkbUxKuusxB9w6I46dtIKckY6h/KahExYq8PSW7I=;
 b=AZ+spmf8KlZ+CelCa8GFd3V/wtfv5w2OM1wwCHp8fhRPZ0ysZWt2V7HoJ0Iz4SLudn
 Ge3dqt3mmGzBAJR3pDuHTR9q9b5CTJw7gzUiiWpju3K4wto2B3bby/j66HRBtVmzr4uv
 5usVk/894LVmmVrCX8rk7jQAXHnAh0JLHj3P8Klalq2gbXpVAFvH4c6PcFEWr2yudpPI
 Nit9hbU/NTtBmXuxJpnJYhjqI1v+HMtJpsDAzG2gBgXVLw7/icQliCJa8XxOjzbnWUWU
 gQQkOitMI5vZ9InE8eLrR1gIQyzrglhbGdeiH1K4axiBX6dHBrFbiOTkzeYvfdXqbz3o
 BVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8tttkbUxKuusxB9w6I46dtIKckY6h/KahExYq8PSW7I=;
 b=Tpz861w2I+cS5eN0d8AgJIe6bl1Qd8IWQl7zdlqTluGZDiLde3rCfdWFjt74V6pOcR
 0ub7wjQO/LaDMdwwsE1dMg9A8hZkMdJlfBh5MSVTrW/lcXI48ArbReNDEEP81amhEjY2
 MBt9xsTbBqBNzX6tX1UWE5s1El42u8GCEyD/ZFkD+eB8bvIGGq59HebwckZgytzPyJA5
 kqD+OGd29BlnBWsqXbJhzURtud8Fhu6ZWskz8Yf78T/qH3JN5kC9kuWNKlyW2F0jiPFG
 hJWYVtIjE+eWHwN8QKVMlGweeDm9wFKUR0U8w7TMgzXP3r4vQd+66XHE+vPMHPrAt1aP
 I94A==
X-Gm-Message-State: AOAM531iY0yXzsZ8A/GTCiGdrFTGxvgsc2WoTdxRHERJNhF9gzmBYv5H
 IGwKutclsvlCzBzlixi1zZpiQg==
X-Google-Smtp-Source: ABdhPJz1a9dstNr8p5COgD987Fbm4m+/OJalHnxF/SDn0hoTOLtVmZF+L2P7EVo3AYJGtCWhJMSlKQ==
X-Received: by 2002:a65:5342:: with SMTP id w2mr1639875pgr.333.1629175500550; 
 Mon, 16 Aug 2021 21:45:00 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.245.86])
 by smtp.googlemail.com with ESMTPSA id m2sm807719pfo.45.2021.08.16.21.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:44:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 17 Aug 2021 10:14:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <20210812033405.362985-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ...

On Thu, 12 Aug 2021, Ani Sinha wrote:

> ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> explicitly. This is a minor cleanup.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/arm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4ba0aca067..38cf9f44e2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -25,7 +25,6 @@ config ARM_VIRT
>      select ACPI_PCI
>      select MEM_DEVICE
>      select DIMM
> -    select ACPI_MEMORY_HOTPLUG
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
>      select ACPI_APEI
> --
> 2.25.1
>
>

