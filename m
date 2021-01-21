Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF762FF7D6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:18:41 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iHo-0007uD-8L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iCS-0002u8-IM; Thu, 21 Jan 2021 17:13:09 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iCP-0001hs-Ak; Thu, 21 Jan 2021 17:13:07 -0500
Received: by mail-ej1-x635.google.com with SMTP id rv9so4828818ejb.13;
 Thu, 21 Jan 2021 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lcpszUVkJpoXgMWaOzutK+jh7v2iR8cuwcMoxYzVo1E=;
 b=L98LJyHYhFsvHmexdj649+FSpfltU0XU1glqrASTfmpeJh6vvJCeDmWxhki2qR1j3B
 7wUt8/le0Wd/fiasFA9nHLodqB8M/WtyQl9Tvnpj3aUFp5bWjBJCkcLy/BzztvBc0XPN
 wI3nQ9zCHNJhFWGae6Pk97wGXNPSjBBStbF/hOb/cduV1fEPtneaxNzFC00S3xIXSJo2
 X5UaWYH+TXp1dX05XcuvmpPkX5kneiQEcJxp1Lb5o2gxIhApRKTEqvlP6kXfdp01d6I4
 NjfZi8g1K3XvYCP49pMRtZXOkdbp1C4QheNyQCNXtbfP/Hk1b8Ug1yA/YuFRDmNP9Xwn
 NCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcpszUVkJpoXgMWaOzutK+jh7v2iR8cuwcMoxYzVo1E=;
 b=byFrDlTD3ZKJKG3Z4BpU3lKJ5g4g6klkRkx3VAYfMujxTUZFvZ9tESf3gx5dwvMw7G
 lu/T2r++9UqHVVPkM3x2acJGobV1iJeBkwxLOr/Aa41566Nsh/9Mt8BUYBWfuH9sNj9Y
 Ol2ipmQErRLGkgKf+0kkVpsOMe61i9+KPgpEyUkqOog7TbYuhERhW8kqEG7ZmnW3wGez
 tVC0iO/chJ1kUImCsFbvkn3MM0wo0NsMALhiV4v7CEuTMLlCAEgkQRPk3PcveWVUa6NQ
 Z3YbHaPqmWcu55rZiieLVL/oKB+0aNwszRa5uz7PIdGCTGxEeo7P1AQVNVxV0KBDd2Y3
 d/gQ==
X-Gm-Message-State: AOAM530wUxl8Of62lZfb2nNaUd8u4gymCnXo+nLx2aAt9n2vIs42g5dN
 ObW8ykDKQpNzyrTyQTBX95g=
X-Google-Smtp-Source: ABdhPJwBCRE3wG8drUy3DgWl7kWwpXwnWsW41Ri8vLnxRcyKnu2mPF3dr5P+0gj8JUGsl5HWGbYHEw==
X-Received: by 2002:a17:906:95cf:: with SMTP id
 n15mr1082883ejy.178.1611267183507; 
 Thu, 21 Jan 2021 14:13:03 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id hs18sm2758287ejc.45.2021.01.21.14.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:13:02 -0800 (PST)
Subject: Re: [PATCH 16/25] hw/arm/stellaris: Convert SSYS to QOM device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-17-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eaebe605-7ec3-ca26-9003-4619680bb43b@amsat.org>
Date: Thu, 21 Jan 2021 23:13:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Convert the SSYS code in the Stellaris boards (which encapsulates the
> system registers) to a proper QOM device.  This will provide us with
> somewhere to put the output Clock whose frequency depends on the
> setting of the PLL configuration registers.
> 
> This is a migration compatibility break for lm3s811evb, lm3s6965evb.
> 
> We use 3-phase reset here because the Clock will need to propagate
> its value in the hold phase.
> 
> For the moment we reset the device during the board creation so that
> the system_clock_scale global gets set; this will be removed in a
> subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/stellaris.c | 132 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 107 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 652823195b1..0194ede2fe0 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -357,7 +357,12 @@ static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
>  
>  /* System controller.  */
>  
> -typedef struct {
> +#define TYPE_STELLARIS_SYS "stellaris-sys"
> +OBJECT_DECLARE_SIMPLE_TYPE(ssys_state, STELLARIS_SYS)
> +
> +struct ssys_state {
> +    SysBusDevice parent_obj;
> +
>      MemoryRegion iomem;
>      uint32_t pborctl;
>      uint32_t ldopctl;
> @@ -371,11 +376,18 @@ typedef struct {
>      uint32_t dcgc[3];
>      uint32_t clkvclr;
>      uint32_t ldoarst;
> +    qemu_irq irq;
> +    /* Properties (all read-only registers) */
>      uint32_t user0;
>      uint32_t user1;
> -    qemu_irq irq;
> -    stellaris_board_info *board;
> -} ssys_state;
> +    uint32_t did0;
> +    uint32_t did1;
> +    uint32_t dc0;
> +    uint32_t dc1;
> +    uint32_t dc2;
> +    uint32_t dc3;
> +    uint32_t dc4;

Shouldn't these be class properties?

> +};

