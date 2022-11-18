Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1862EEBE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:57:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwFI-0003Sv-BL; Fri, 18 Nov 2022 02:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwFG-0003QJ-Si
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:57:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwFD-0001zf-0m
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:57:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id i12so4139461wrb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/RnVMtPCD0meu3M2O6AH1t7clMNEhGA9cv5gt4zYXJo=;
 b=A3Mam2DsHeCD7RpJQYk3oTWSq+SwLuFetkbfKaV3v24Tnoe3/KMNq2AqITXBE+JKk2
 2eJnHhqtYtebbppPXGYLLrxc7i1Bqu3JMBgT/3+oMDsy6QMYm66y4qkdI+8mDA3Irtcs
 mc0ae2a4ZP7kh7HJJuT3lwBpJpVvIK1tmloa/UHPxs9E5sQFLXexA6WbN5Oayffip4ku
 J0tNAxdDEePTF5rDoZYsfZQJD3IwmhYro+Ai4qmuKacm/L4/70z71jhAXAfnS3YsH5nW
 QBOQrgU0K6ngA+7T3FymhQMWDjTfTwCld7SDTHG1wnvK+oU3Gk8rNl9ev8YTzryo8Mwt
 wHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/RnVMtPCD0meu3M2O6AH1t7clMNEhGA9cv5gt4zYXJo=;
 b=pKUp+C2jAQmVxTfNwucbQoA50CkaH4cBDt6nJJwHe+3OTjmqpAceNSVT60HSnKE9lJ
 8RdkXUKylWzOXy/LUv6hWZ6nIUScVERsq0voifcbVNgiB1w8o4VQdfq27WtmBblpQD7r
 VNVIvVCMigbY6k1WqxLg37v5/PFcQ+0iXSw8ABwx/SjjT8idAlwVFd6LHAVuhZ1TkfaY
 FkyOoodngmaVTNAl2CAjJIvLEaSxV126+VIKAkgsK1bBcgRhTAaeqBEnmVt4RA0zqMqr
 LqLP0WUKXDUjjaINVBfL9oyzGbvV6pfh03M5fwAD5CTS8X0qUGgGGX0u0yorh7KeNsYf
 5v/A==
X-Gm-Message-State: ANoB5pmTG1G4P9GK4t9AR7BIQnIkr0/5aiY644NsLQ30jMINiow3LMHO
 dt7uqUPj/rFXPih3eV10UMp7ig==
X-Google-Smtp-Source: AA0mqf5pHlyjH199sf90iJEe397c1DOsTM/NEHT8VFG9snskjjIRBsbb70sNx/BhV3UoAT8dqJwYUw==
X-Received: by 2002:adf:d851:0:b0:236:5d2b:d71f with SMTP id
 k17-20020adfd851000000b002365d2bd71fmr3530909wrl.492.1668758221558; 
 Thu, 17 Nov 2022 23:57:01 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfebcb000000b002368424f89esm2903105wrn.67.2022.11.17.23.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:56:35 -0800 (PST)
Message-ID: <ccb90b66-7e9c-1b6d-b9ce-e0ffd5e39011@linaro.org>
Date: Fri, 18 Nov 2022 08:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC 3/3] hw/nvme: add nvme management interface model
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116084312.35808-4-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 16/11/22 09:43, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add the 'nmi-i2c' device that emulates an NVMe Management Interface
> controller.
> 
> Initial support is very basic (Read NMI DS, Configuration Get).
> 
> This is based on previously posted code by Padmakar Kalghatgi, Arun
> Kumar Agasar and Saurav Kumar.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/meson.build  |   1 +
>   hw/nvme/nmi-i2c.c    | 381 +++++++++++++++++++++++++++++++++++++++++++
>   hw/nvme/trace-events |   6 +
>   3 files changed, 388 insertions(+)
>   create mode 100644 hw/nvme/nmi-i2c.c

> +++ b/hw/nvme/nmi-i2c.c
> @@ -0,0 +1,381 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-only

Just curious, is this restricted license choice on purpose?

> + *
> + * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co., Ltd.
> + *
> + * SPDX-FileContributor: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> + * SPDX-FileContributor: Arun Kumar Agasar <arun.kka@samsung.com>
> + * SPDX-FileContributor: Saurav Kumar <saurav.29@partner.samsung.com>
> + * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
> + */


