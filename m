Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8852069F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:26:57 +0200 (CEST)
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAu8-0004HH-TH
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAl1-00037r-41; Mon, 09 May 2022 17:17:31 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noAkz-00083W-AA; Mon, 09 May 2022 17:17:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id bg25so9055626wmb.4;
 Mon, 09 May 2022 14:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MTmrWp5oLzo0nrsyxqfsf0JwIInxBz4x9ft1fvDHRzk=;
 b=jMkpWtaOYb5c3G8xms0TFUmkhJM94jBPcz7/hitjnOZPw0reIsc+0Zbk210yrExhQr
 Q3YAPr8u5v50TTGleiTm3FO+JkUTWjVwNzxuyjk+ulGiPwqi9Rssi7Z4nyAENPzCO7T4
 MHvafGsZLJqAf1XmgD1LnaiV6KMnilspwcz06AvZVHrJMZKAkfKHMMSRwCvN8LWfY13q
 rnkRys9UXJ/UCeFZz2HMnai9KttGItIsaHugTcDTdNXheHVssOWhq1AJuJ54E74ADFcp
 CaCD6g0RMGRUtLQ0N7vV/NjcTQ08CsL0lc9rWpm1q6mll2E/Fe4XEeR+XG3+r4EwuzV8
 r6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MTmrWp5oLzo0nrsyxqfsf0JwIInxBz4x9ft1fvDHRzk=;
 b=2spJNnlt0Hz4V91seL+eMmg+L/djZbS7wTW+Hsn3YMAlrrZtiZP+wAR2rt5SStESLY
 3PDCDx23P1QX9YYoEGkUdRXOksn4e8sKfHPPn3Z+Dd7HGXcfB3VSokt7xcO5FFuqPGd0
 Tq95KmQ8qeq6H8W3qDzweKYHuUrwo6TMk2M2W1dp2sQt40FcA8PeUmLezO4qn67JMbRA
 GJqH2nF/Byd5CEBOiM4XkTe2QrXBlUlUOcHI9o6zpHNl/QrOEMvfauy9rfF9ZQajuSrC
 rDObPN3UI+DvqQAuWtFqZna4PDscXz9i+qlbkpKzV84AIwndUyjVzM1SOAekBXiF5MAn
 /VjA==
X-Gm-Message-State: AOAM533LshkoxhdNeYhYVsCuUzGbt4ilVm7d10lgaw9tMOAemi7BiFro
 X/F9I98NWzXRu5mcuC+5JAk=
X-Google-Smtp-Source: ABdhPJxNq7U4G2q6wY0Kuk183JxpRSBTVoDwUM8GCn7D8yCPyHZC6hgSZEGE1evKkANcUEJSk1M2Iw==
X-Received: by 2002:a1c:f207:0:b0:38e:9aac:df41 with SMTP id
 s7-20020a1cf207000000b0038e9aacdf41mr24398603wmc.14.1652131047142; 
 Mon, 09 May 2022 14:17:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d4887000000b0020ca0c35b80sm11138011wrq.58.2022.05.09.14.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:17:26 -0700 (PDT)
Message-ID: <ce8fcf3f-c56b-ed68-bd5a-7e599b951aa6@amsat.org>
Date: Mon, 9 May 2022 23:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

Do you mind splitting as:

- Add TYPE_EMMC, emmc_class_init and sd_proto_emmc[] with
   already existing handlers (1 patch)

- Add new handlers, from smaller to sd_emmc_set_csd(),
   and finally mmc_set_ext_csd() with the EXT_CSD definitions
   (various patches).

Otherwise LGTM!

What is your test suite?

Thanks,

Phil.

