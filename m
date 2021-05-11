Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3D379DBC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:26:41 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJ2e-0004Zg-Mp
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJ1N-0003Ts-3M; Mon, 10 May 2021 23:25:21 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJ1K-0000sz-8v; Mon, 10 May 2021 23:25:19 -0400
Received: by mail-ej1-x635.google.com with SMTP id t4so27655276ejo.0;
 Mon, 10 May 2021 20:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kxy91eWnosuoCW7Sgr3+jRZV2zSBndIF29eZUKP5If8=;
 b=nEV4Qlm+ANXylcMeG5t2ze4KCe3dGr5HrCuLhccR6K9/cILB78K88Rga5SF58cr8h5
 TbG9NxdIPpiZEzerEkJxu05/d0R5xPSk02iDscYlgrSSzd0BdF17i/92ps8BjM7WU6NK
 krdUkvKeCmMkaQP+G2ms7v2FG84WgO/DyHrDeIf9IJsBjEdOogVjwWVa4XdQmVjQSAYf
 sTZ/iVYyoZHV7D1hIbx6wdST53ySW4eqFNW0fzF9SLlZNVsA9gtSpjrLnMKj/Lrb8irw
 iIi8Wjatq1vojwu7E4qjFdIhubBs31LfmDolk1gW393IJDKOs5tFp7FgLZnZVHC8O7XL
 4uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kxy91eWnosuoCW7Sgr3+jRZV2zSBndIF29eZUKP5If8=;
 b=lAh8gitKcS/Kk237hyQe/HAkXkKS3beyLXaAb0DL+cJ38bRpuDnjFQ2ApW/Q7KxX+m
 pp5TMuEL7bI8g3R2Vr/gLY9KzY0sxfbRI4+2k3Dl2+PGjcILW5OCjSuydJbdYPwaS1wD
 ZstpIL+SC4C1nvFA9L7zE6eMiFIbyf+DmoizCChNQMxUzu3nU7Otdf5Zr8pG4tNl09mG
 7d4gjEEPQ/hQVicg4+YhsbXIP2AT9hVnhKRVNOJSJi4Tp4x19fQC0gP70QVZfXhQq0vl
 MZj4kDrP6NoT0MvtGRwzOYk3SRD6nGHFann3ZNbpUqOQrxftazfgBi5bdmfPjSWRpTuB
 tF1A==
X-Gm-Message-State: AOAM530/f3imgU7tOErjoAAudap5dRxvgENWBQ9eZcBs8FXyIZg73Q81
 Rd6Sc0YTJnvR0Mw2qNcaslc=
X-Google-Smtp-Source: ABdhPJwtJ2TFOq3Zsd1Jmls/V7E+eSUfvPCFNk28ACgpcMY+c2kW9oWUlQKtkjBZ+lead0RbD6aACA==
X-Received: by 2002:a17:906:ce47:: with SMTP id
 se7mr29405385ejb.272.1620703516020; 
 Mon, 10 May 2021 20:25:16 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h13sm7431311edb.65.2021.05.10.20.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:25:15 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20210503105747.703149-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8ed8f29-ba55-0325-6916-faf0e3bcc67d@amsat.org>
Date: Tue, 11 May 2021 05:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503105747.703149-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Can this patch go via your qemu-arm tree (it is reviewed)?

On 5/3/21 12:57 PM, Philippe Mathieu-Daudé wrote:
> Remove the raspi2/raspi3 machine aliases,
> deprecated since commit 155e1c82ed0.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst       | 7 -------
>  docs/system/removed-features.rst | 7 +++++++
>  hw/arm/raspi.c                   | 2 --
>  3 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 80cae862528..7895bd4d849 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -238,13 +238,6 @@ this CPU is also deprecated.
>  System emulator machines
>  ------------------------
>  
> -Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
> -to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
> -machines have been renamed ``raspi2b`` and ``raspi3b``.
> -
>  Device options
>  --------------
>  
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 29e90601a51..8a8b8ca627b 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -312,6 +312,13 @@ This machine has been renamed ``fuloong2e``.
>  These machine types were very old and likely could not be used for live
>  migration from old QEMU versions anymore. Use a newer machine type instead.
>  
> +Raspberry Pi ``raspi2`` and ``raspi3`` machines (removed in 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
> +to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
> +machines have been renamed ``raspi2b`` and ``raspi3b``.
> +
>  
>  linux-user mode CPUs
>  --------------------
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 990509d3852..20bba0316f1 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -342,7 +342,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
>  
> -    mc->alias = "raspi2";
>      rmc->board_rev = 0xa21041;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> @@ -362,7 +361,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
>  
> -    mc->alias = "raspi3";
>      rmc->board_rev = 0xa02082;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> 

