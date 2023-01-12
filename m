Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A46670AA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:14:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFvJi-00060O-6O; Thu, 12 Jan 2023 06:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvJd-0005zj-5X
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:00:13 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFvJa-0007em-Rv
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:00:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so14702518wms.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bOE9uo+3okzb/GtbJ6MSE029oOBDTkg1opp82jEz3LE=;
 b=zrR8MHrCZO79nrgHEkyCnkiwkaqQBH1L9dOd3Q6/lHamI5XnRFtz2MdHzufhGlmSqU
 0O3lm02yp/fRPmNiDSp558wcGaRWMMVzEl2Yklmt69e8nFl9AekYytKNbkqJGxBaqiTt
 I9R6XO3MC5rXnm7PFbbNzw1rQCqmdHzZrVjAjUaDy2FPJBVoujTNFKGOZwJDHTZV3QKg
 HNvaT77JFggeUveKnLbt/QxjDUtRE1GlaehJH1XFbMaV6ck5dg7Ib7K9Zzckz0ziysva
 33OY7+gOHB7tbIim1jQCToZPF32SQhoT5ZpMWcjhaSXc7RWbcRGXHuVtQBwM38zVceKu
 DwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bOE9uo+3okzb/GtbJ6MSE029oOBDTkg1opp82jEz3LE=;
 b=EqVBu3NYQYUiB2HYlpCnRoJRaihITAnadta9P/dUM0P0GsMmGvyHbb8FuNVZs4Qsp5
 FNrYY/kkoRoN2JQVBWF2M/pteSUJfz+Xs5jJV1+ZRgl3Qzpp7IRHLUG0KUU+VMPAuRdq
 WWenHVMl91hUht2JJGGbG+H8p8s6AQHmXZGUqYkN26OLX+d3xPh/PZH/lnm6puAYfaYp
 9YlmqlJFeRPkyRPPB+rK4cs/VRxcPtEw+i5Hnjo5/f7IXOMVcDftH1XdQ5PK3AnHeoi5
 Zwchbs1eSExU0ivI/fhFxwZVLzBkVf6xFQl7r6qD4KGMtklNLusnTl+8OC0WSgIHXL39
 H07g==
X-Gm-Message-State: AFqh2krghycUJd5WlF1Y73W0ARqz3JMODDDY8dN0vcQQL2Nhyyzm0G8f
 zo1N0DJKZf0V+l5KEGd6V59g6w==
X-Google-Smtp-Source: AMrXdXs1vNTg8zzpbNZ36so8ytYuZqv8n5QiEtALNBSDBZJAJWeshkjEs0D42NRAGeWulW324wYO4A==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr56435278wmd.9.1673521208274; 
 Thu, 12 Jan 2023 03:00:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003c6bbe910fdsm30838496wmq.9.2023.01.12.03.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:00:07 -0800 (PST)
Message-ID: <e8064b93-db8a-86ac-cf32-f8b6e137065b@linaro.org>
Date: Thu, 12 Jan 2023 12:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 21/31] e1000: Split header files
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-22-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-22-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> Some definitions in the header files are invalid for igb so extract
> them to new header files to keep igb from referring to them.
> 
> Signed-off-by: Gal Hammer <gal.hammer@sap.com>
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000.c         |   2 +-
>   hw/net/e1000_common.h  | 104 +++++
>   hw/net/e1000_regs.h    | 927 +---------------------------------------
>   hw/net/e1000e.c        |   4 +-
>   hw/net/e1000e_core.c   |   2 +-
>   hw/net/e1000x_common.c |   2 +-
>   hw/net/e1000x_common.h |  74 ----
>   hw/net/e1000x_regs.h   | 940 +++++++++++++++++++++++++++++++++++++++++
>   8 files changed, 1051 insertions(+), 1004 deletions(-)
>   create mode 100644 hw/net/e1000_common.h
>   create mode 100644 hw/net/e1000x_regs.h


> diff --git a/hw/net/e1000_common.h b/hw/net/e1000_common.h
> new file mode 100644
> index 0000000000..56afad3feb
> --- /dev/null
> +++ b/hw/net/e1000_common.h
> @@ -0,0 +1,104 @@
> +/*
> + * QEMU e1000(e) emulation - shared code

s/code/definitions/

> + *
> + * Copyright (c) 2008 Qumranet
> + *
> + * Based on work done by:
> + * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
> + * Copyright (c) 2007 Dan Aloni
> + * Copyright (c) 2004 Antony T Curtis
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_NET_E1000_COMMON_H
> +#define HW_NET_E1000_COMMON_H
    ...

> +#include "e1000x_common.h"

No need to include this header here. Can we restrict it to the units
requiring access to these declarations? Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


> +#endif



