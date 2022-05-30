Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E803353872C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:18:58 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjyk-0008BS-18
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvinF-0004UW-Ra; Mon, 30 May 2022 13:03:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvinD-0007gb-Rk; Mon, 30 May 2022 13:03:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so14324102pju.1; 
 Mon, 30 May 2022 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I+OKD14AcbNDHjL/VsFD8tXDulrtgK7eUDk/Z+yvQmk=;
 b=O+bw9awym9lR6PjG3f0o3gj6PU/M1T9V+EE955wVfx/xbeFCFJJ4Ca/f2yS5KRzfrs
 5JdC85jVRl9R5EmwzHl59qUd9oyVWm1ND9/ZuBMOPI3KSaJPcTtMa7wRsiUwzPhY0XmZ
 dyI+w2BFTg8EG6T1bGLW3dP+DYSCKPP0rtE4gF8j10ucCXcqmxeGytzFomieX1+Fc+o3
 YEp+9hzJqm/+MDX/G+0nYgJU1JGiLaA3NlfygsKf1ow40/HDnccXKJkfULNvbPQ60fYm
 gKHuPNzwNVhmJcBLdJM9BSJaV5/ObtMwtH4FQ4DvRvN6WM6Z/6jhSjHuwrQHrUHzvlQZ
 jBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I+OKD14AcbNDHjL/VsFD8tXDulrtgK7eUDk/Z+yvQmk=;
 b=h+x2tWNhalmjc5T/nHS6LPt12x8MY6F0eWyNDdegVzJjc6CYsng/L4gIFkLIR1qjzk
 mgHlwqcE4Bsa65u2SnGozF27Nl1Ua9GT5VLbT3JAueSZfwZiJk8Tjk6mo++9awruIMcm
 ruuGUWa0gbJtk1oYdij5jo4hb0o++wectduj0D24ujDPSnljxu7HqSiYWr75h8Lhzurv
 ifyM4AUZpASms+2LGu2wOfEq6BG6nCTH0bKLV2WaBpcbp5EU5MI4cqNwP/4jd72rnFNR
 E7GlOp+oHv64z0OnCjxv3He5ufUyDBC/jz7SaGEpFb0aAwc1I1k23PFhotvmqMMMyE7J
 4QPQ==
X-Gm-Message-State: AOAM532HTi5gAStlNQFPOxXeD6h4sxaOydPfa6B3gCu98k+oMTL6Ghos
 jds8APPUi8ZZwytbmglyc0I=
X-Google-Smtp-Source: ABdhPJyvuOEMCw6zv/zZTQjjyQkuFS0h9Dqyy46mcT7LT2e0A0TkPJ7zkvFaaT9Rrol61XKeXxELSw==
X-Received: by 2002:a17:90b:d98:b0:1e3:2a7f:4ce1 with SMTP id
 bg24-20020a17090b0d9800b001e32a7f4ce1mr1276973pjb.226.1653930178175; 
 Mon, 30 May 2022 10:02:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a056a0000db00b0051810d460adsm9144488pfj.114.2022.05.30.10.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 10:02:57 -0700 (PDT)
Message-ID: <12033fbf-e511-f0ac-4078-e8e532b698a1@amsat.org>
Date: Mon, 30 May 2022 19:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Cédric,

On 18/3/22 14:28, Cédric Le Goater wrote:
> The initial eMMC support from Vincent Palatin was largely reworked to
> match the current SD framework. The parameters mimick a real 4GB eMMC,
> but it can be set to various sizes.
> 
> This adds a new QOM object class for EMMC devices.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org
> [ jms: - Forward ported to QEMU 5.2 ]
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: - ported on aspeed-7.0 patchset
>         - HPI activation ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>   include/hw/sd/sd.h     |   9 ++
>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>   hw/sd/sdmmc-internal.c |   2 +-
>   4 files changed, 311 insertions(+), 2 deletions(-)

> +static const SDProto sd_proto_emmc = {

What about renaming as:

                     ... emmc_proto = {

> +    .name = "eMMC",
> +    .cmd = {
> +        [0]         = sd_cmd_GO_IDLE_STATE,
> +        [1]         = sd_emmc_cmd_SEND_OP_CMD,

                        = emmc_cmd_SEND_OP_CMD,

> +        [2]         = sd_emmc_cmd_ALL_SEND_CID,

                          ...

?

> +        [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
> +        [5]         = sd_cmd_illegal,
> +        [8]         = sd_emmc_cmd_SEND_EXT_CSD,
> +        [19]        = sd_cmd_SEND_TUNING_BLOCK,
> +        [21]        = sd_emmc_cmd_SEND_TUNING_BLOCK,
> +        [41]        = sd_cmd_illegal,
> +        [52 ... 54] = sd_cmd_illegal,
> +        [55]        = sd_emmc_cmd_APP_CMD,
> +        [58]        = sd_cmd_illegal,
> +        [59]        = sd_cmd_illegal,
> +    },
> +};

