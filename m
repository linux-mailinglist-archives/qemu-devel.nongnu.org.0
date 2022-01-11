Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6548AEFA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:56:44 +0100 (CET)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hdj-0003M6-Bp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7HHt-0002xF-Cz; Tue, 11 Jan 2022 08:34:11 -0500
Received: from [2607:f8b0:4864:20::92e] (port=40773
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7HHq-0002tV-Lk; Tue, 11 Jan 2022 08:34:09 -0500
Received: by mail-ua1-x92e.google.com with SMTP id v12so29696989uar.7;
 Tue, 11 Jan 2022 05:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mcbXvJA4aiFk7lAHKD0DhqgxTQT+YiX8S4ZiPnJ3IUM=;
 b=RVx/JOMo3snBm7g0mPyYZPEccJA9JmNJVLMk3QVdbVeVpiDNQ2NZxREDqImNbqfqhM
 pGCMXi19X3qJycMG+trXsoxFfJV1oUH7ti9rxBa7wGmkiNj6yUB+I+FOzCDZoCliQXVR
 zCLZj/68KNnSloO+/kNsQeF2jxHbzwj+fN3G6s1GdWB3ihpr9s3waIu9ZhYVB35XV/kt
 QU4SSKUfAGeY65ZjPP/BIdKQQIOUF+8rCeiYIh1R8+Gt7vDEsdLbRVn5KOPut1z8lipN
 m6WAbw4EfkMzqwL2+JLgSngEvArfHTfiGOloqoMAW8CEzsW+eTSjXGy+tWdFTeoFM7uc
 JNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mcbXvJA4aiFk7lAHKD0DhqgxTQT+YiX8S4ZiPnJ3IUM=;
 b=pnDbOmoTCQf49UXOJxsLKxHZVeVzVjYBbYmFWSLfI+amtasqpj9p5B43ghEN9gRtkA
 lgChqjyoxv2k4shkrc8HH4JQ/u3PiqhO2ScYNEwq2fnZnE7m7rv/Fd0trxzPGE+jOkI/
 n1jixyk9WXOGpcpbRm6L63gpzB/hU3BYS2U8564CuEJfP3gfnR/JDKz64s4GabGdzImN
 GfQbK/Wfb/9o8XfNGA6PlECbhVD1VnUsx256TQm6uAAZ4k84J6dSz4ilqLLbXeUbHoic
 msYosjZsTFa+tYUPcpqMiDPp9ZWZXBcDU7cavVivhVk+F8tL10waC1XdzJN4TfUYlAr/
 3+4Q==
X-Gm-Message-State: AOAM533VcDaFiDs9sRbK05TyxXJNda7yu43mnrtp+KRqYeZoIWthKiIt
 qWJPhrdFWDIqYDj5L53ZlT8=
X-Google-Smtp-Source: ABdhPJy1pP7tKEgSSPaVExefkIQVpc9qzdmhCvYNuCr1mL/0g4YBp5FEmD335WjMVyGK5fBIoiGBWQ==
X-Received: by 2002:a05:6102:7cc:: with SMTP id
 y12mr1960132vsg.29.1641908045325; 
 Tue, 11 Jan 2022 05:34:05 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id p187sm346960vke.34.2022.01.11.05.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 05:34:05 -0800 (PST)
Message-ID: <785b3735-4106-82da-dbe8-6d76e94e0665@gmail.com>
Date: Tue, 11 Jan 2022 10:34:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/18] ppc/pnv: Extend the powernv10 machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

I suppose you`ll want to rebase these patches with the changes done in pnv-phb4
models and the exceptions cleanup. In that case I'll wait for a re-send before
looking into these.

I also read from the [1] [2] and [3] about PHB5. I guess we can introduce pnv-phb5
with the same premises (i.e. user creatable) pnv-phb4 will now operate.


Thanks,


Daniel


On 11/26/21 08:53, Cédric Le Goater wrote:
> Hi,
> 
> The skiboot merged in QEMU already has POWER10 support. This series
> adds a minimum set of models (XIVE2, PHB5) to boot a baremetal POWER10
> machine using the OpenPOWER firmware images.
> 
> The major change is the support for the interrupt controller of the
> POWER10 processor. XIVE2 is very much like XIVE on POWER9 but the
> register interface, the different MMIO regions, the XIVE internal
> descriptors have gone through a major cleanup. It was easier to
> duplicate the models then to try to adapt the current models.
> 
> XIVE2 adds some new set of features. Only some are modeled :
> 
>    - Address-based trigger (AB5) mode. Activated by default on the
>      PHB5. When using ABT [1], the PHB5 offloads [2] all interrupt
>      management on the IC, this to improve latency.
>      
>    - P9 compat mode. XIVE2 can be configured to provide a strict P9
>      interface for the TIMA.
>      
>    - Automatic save & restore of thread context registers. Used in
>      KVM [3].
>    
>    - 8bits thread id. Mostly to validate the model.
> 
> Thanks,
> 
> C.
> 
> [1] https://github.com/open-power/skiboot/commit/2a7e3d203496a016cc90ce91eeb2c4e680ebd1d2
> [2] https://github.com/open-power/skiboot/commit/5b2d7c79a2049c1bedfaa8a9dfa19880f980b2ef
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5af0a978776
> 
> Changes in v3:
> 
>    - rebased on upstream
>     
> Changes in v2:
> 
>    - Most comments on v1 have been addressed independently and merged
> 
> Cédric Le Goater (18):
>    ppc/xive2: Introduce a XIVE2 core framework
>    ppc/xive2: Introduce a presenter matching routine
>    ppc/pnv: Add a XIVE2 controller to the POWER10 chip
>    ppc/pnv: Add a OCC model for POWER10
>    ppc/pnv: Add POWER10 quads
>    ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
>    ppc/pnv: Add a HOMER model to POWER10
>    ppc/psi: Add support for StoreEOI and 64k ESB pages (POWER10)
>    ppc/xive2: Add support for notification injection on ESB pages
>    ppc/xive: Add support for PQ state bits offload
>    ppc/pnv: Add support for PQ offload on PHB5
>    ppc/pnv: Add support for PHB5 "Address-based trigger" mode
>    pnv/xive2: Introduce new capability bits
>    ppc/pnv: add XIVE Gen2 TIMA support
>    pnv/xive2: Add support XIVE2 P9-compat mode (or Gen1)
>    xive2: Add a get_config() handler for the router configuration
>    pnv/xive2: Add support for automatic save&restore
>    pnv/xive2: Add support for 8bits thread id
> 
>   hw/intc/pnv_xive2_regs.h            |  442 ++++++
>   include/hw/pci-host/pnv_phb4.h      |   11 +
>   include/hw/pci-host/pnv_phb4_regs.h |    3 +
>   include/hw/ppc/pnv.h                |   39 +
>   include/hw/ppc/pnv_homer.h          |    3 +
>   include/hw/ppc/pnv_occ.h            |    2 +
>   include/hw/ppc/pnv_xive.h           |   71 +
>   include/hw/ppc/pnv_xscom.h          |   15 +
>   include/hw/ppc/xive.h               |   10 +-
>   include/hw/ppc/xive2.h              |  109 ++
>   include/hw/ppc/xive2_regs.h         |  210 +++
>   hw/intc/pnv_xive.c                  |   37 +-
>   hw/intc/pnv_xive2.c                 | 2127 +++++++++++++++++++++++++++
>   hw/intc/spapr_xive.c                |   25 +
>   hw/intc/xive.c                      |   77 +-
>   hw/intc/xive2.c                     | 1017 +++++++++++++
>   hw/pci-host/pnv_phb4.c              |   87 +-
>   hw/pci-host/pnv_phb4_pec.c          |   44 +
>   hw/ppc/pnv.c                        |  265 +++-
>   hw/ppc/pnv_homer.c                  |   64 +
>   hw/ppc/pnv_occ.c                    |   16 +
>   hw/ppc/pnv_psi.c                    |   38 +-
>   hw/intc/meson.build                 |    4 +-
>   hw/pci-host/trace-events            |    2 +
>   24 files changed, 4677 insertions(+), 41 deletions(-)
>   create mode 100644 hw/intc/pnv_xive2_regs.h
>   create mode 100644 include/hw/ppc/xive2.h
>   create mode 100644 include/hw/ppc/xive2_regs.h
>   create mode 100644 hw/intc/pnv_xive2.c
>   create mode 100644 hw/intc/xive2.c
> 

