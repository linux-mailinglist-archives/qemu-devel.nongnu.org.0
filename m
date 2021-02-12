Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA931A45E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:16:02 +0100 (CET)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcz4-0003dR-1u
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcwC-0001yf-KQ; Fri, 12 Feb 2021 13:13:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAcw9-0000z8-Sv; Fri, 12 Feb 2021 13:13:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id v14so248650wro.7;
 Fri, 12 Feb 2021 10:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QTIQxVcQdZMCnT1R7h9A8/d8SlzHG/X3PLwx+scETqY=;
 b=BEQV8FC55E/FWTbit4zmrcstgo70hhGvOlu/WeSicpA7j9MziehbkZNEb/IJabx0B3
 zLiyBOZn03h8ask0RKhL+LEY+XO8SAI9X6UxJv8gQcv2K+UfdUQUWU1sGBHpSzCQhpxb
 abzdSORk0z13kf+tr6bFEpEjx2zTWBEYRCt1BcCUysAS4GhXg3nelhbjtv+JnktU6tNb
 G2OKCZExrrC5OrMryXjqh3cVKundHxOSWifursM+FByNQD2UCaWIZK7151FAfNrUxpwN
 cIuV0+wWv1bUkqdef5HQwUuNj4ZVzDOJrmDVMI0eFh9FY/DeZ3OlHolHSpLZw/WEZDoc
 027Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QTIQxVcQdZMCnT1R7h9A8/d8SlzHG/X3PLwx+scETqY=;
 b=XMraW/26aKpALtiZefFvXc7vuYE5mUWGh5gOxUYOKUs5BHoVrF/7ZVomjyjAOIspdM
 ttvP/6IZn3EUPcW8kddAdsNgTOD9cobycGkVvBSYJ7kJI9qwhDJvIn1ksIovsJBRtxlZ
 6i7jwGENF1rrxJjawdJ1IKf32BlbB+OTYY+ZLz4douFOmmaE9GB8wSiUhE7I3UstuGdj
 1DIKi+HzMhZiqqLradNWLJZvSMdmjn1j5cf3cLHw6wtuXJhfSXM2o33woP/6sOjBrKWI
 /AhacUPqUo+sYnpZ8Zm/k1cWfoW1T3De+yW+7MY33WA5Hqo/intDtmxw7jYl8s0C4bWf
 WiYg==
X-Gm-Message-State: AOAM533KzBG+IK0eoSmCgYzUW8tQJszFnA9q3K8zDxISuMOXVLJ5yXvQ
 3wHkdknD29LsLGye10F3C7gzlZadQA4=
X-Google-Smtp-Source: ABdhPJyKbN4PulXcQlID0Vao3FyoeGr4ZAeeAjjFKpCiu78i+s8IY8GgmT2S80tii1JUuDMANztElA==
X-Received: by 2002:adf:e484:: with SMTP id i4mr4863036wrm.358.1613153579886; 
 Fri, 12 Feb 2021 10:12:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t74sm5451428wmt.45.2021.02.12.10.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:12:59 -0800 (PST)
Subject: Re: [PATCH 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <691e9394-1b31-1882-3153-204a0fc19993@amsat.org>
Date: Fri, 12 Feb 2021 19:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:59 PM, Peter Maydell wrote:
> The AN505 and AN511 happen to share the same OSCCLK values, but the
> AN524 will have a different set (and more of them), so split the
> settings out to be per-board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

