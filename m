Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E948D698
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:18:38 +0100 (CET)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7y7o-0001WF-Le
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7y5g-0000cK-08
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:16:24 -0500
Received: from [2a00:1450:4864:20::529] (port=44587
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7y5e-0007Sq-1O
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:16:23 -0500
Received: by mail-ed1-x529.google.com with SMTP id w16so21682565edc.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Fgl/fHD5VDp5pEYDxRluL09OJzR5qjuQ5FzApNeWmo=;
 b=Gtuf1Te53+dzc3dPYhP4KN9HiXlRlmpKQVWdqVAtkR0Fqsz+OK7gwvmZXQoEbp1+nB
 uj+Cd0/cBTC4WwbDsIaVNwCJURyLK/rwmFGE7+NvKUaDhO0papftM68WbYhUuAds+qPx
 yBECV7tWc0Ys9yxKyX1ZGc17Jw+VOuzKmBzMqtJXggh2zo6l9xZp+KV9q7iq8NMdb0D6
 85aPxUXPiQXfTOwNq7ua5EbYQaC+O2uCA4Ur00wS/EfBJWARAzbIBW7eQHUDXoP0zup5
 nVKYtVUF2UeRymOoxbECRxDnmjPgfIchms3m1519KTcRQrw73jHAw8NxcPJBca6eXjx6
 ZHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Fgl/fHD5VDp5pEYDxRluL09OJzR5qjuQ5FzApNeWmo=;
 b=iM+aF6TZ0oTDqEdursPMzOOUXb1EiKkZbxiYZhlwT+vHvUBB/yfvdU7oE2uoGMAsew
 6AS9NmGjL/5i/+3mEkNjEcyhnlJb9NbmrbkOZbf11n23gmrtgmoRqHCu8QrJA1lXkl9S
 dBa2O0ZNVS9aCVHjoVFie36Y7zIOjr/QAG53Rg3Aggjt885h6OJX+auzfeB4cJ4+OdA5
 qIIBkWYDZfBE3+YyZ0kcZ9tv99ipYqLmuLVsd0krp8EpoWmQC0uHPX7z8rnu2N7lF8kk
 menedKldBivdItKwbgMw+EDS42fTgQv2XJIa3rH1LwvXZBrwae2o6OQFGON19+QMxQuB
 3LkQ==
X-Gm-Message-State: AOAM530IdSeZJNAczPvQaIWU+aj6RSlfqX4kStjxofaZ8t1PanxHeevG
 K5d9hUk1aMjjZehgf6oT9fc=
X-Google-Smtp-Source: ABdhPJyQCuicqd+phDeXPnzZ6SpqVtiqrpF2zGqqjposYAi3XJ2yRU20hHGeBXh09FC5aA//y+WUYA==
X-Received: by 2002:a17:907:970d:: with SMTP id
 jg13mr3010180ejc.121.1642072580473; 
 Thu, 13 Jan 2022 03:16:20 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id z16sm1086023edm.49.2022.01.13.03.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:16:19 -0800 (PST)
Message-ID: <69e11e72-975d-4726-5334-d10c9eaba626@amsat.org>
Date: Thu, 13 Jan 2022 12:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
Content-Language: en-US
To: Patrick Venture <venture@google.com>, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, cminyard@mvista.com
References: <20220112232633.1811256-1-venture@google.com>
 <20220112232633.1811256-2-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220112232633.1811256-2-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-devel@nongnu.org,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Patrick,

On 13/1/22 00:26, Patrick Venture wrote:
> From: Hao Wu <wuhaotsh@google.com>
> 
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This patch implements a basic AMD SB-TSI sensor that is
> compatible with the open-source data sheet from AMD and Linux
> kernel driver.
> 
> Reference:
> Linux kernel driver:
> https://lkml.org/lkml/2020/12/11/968
> Register Map:
> https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> (Chapter 6)
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Doug Evans <dje@google.com>
> ---
>   hw/sensor/Kconfig         |   4 +
>   hw/sensor/meson.build     |   1 +
>   hw/sensor/tmp_sbtsi.c     | 365 ++++++++++++++++++++++++++++++++++++++
>   hw/sensor/trace-events    |   5 +
>   hw/sensor/trace.h         |   1 +
>   include/hw/sensor/sbtsi.h |  50 ++++++
>   meson.build               |   1 +
>   7 files changed, 427 insertions(+)
>   create mode 100644 hw/sensor/tmp_sbtsi.c
>   create mode 100644 hw/sensor/trace-events
>   create mode 100644 hw/sensor/trace.h
>   create mode 100644 include/hw/sensor/sbtsi.h

Since you are posting various patches, consider setting
the scripts/git.orderfile script up to ease on-list reviews.

> diff --git a/include/hw/sensor/sbtsi.h b/include/hw/sensor/sbtsi.h
> new file mode 100644
> index 0000000000..841891e89e
> --- /dev/null
> +++ b/include/hw/sensor/sbtsi.h
> @@ -0,0 +1,50 @@
> +/*
> + * AMD SBI Temperature Sensor Interface (SB-TSI)
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#ifndef QEMU_TMP_SBTSI_H
> +#define QEMU_TMP_SBTSI_H
> +
> +#include "qom/object.h"
> +
> +#define TYPE_SBTSI "sbtsi"
> +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)

SBTSIState is not declared outside of tmp_sbtsi.c, so I'd keep
SBTSI() there. Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

