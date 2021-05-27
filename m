Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CB392B46
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:58:45 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCmq-0002P6-8E
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmCiP-0007wK-Ng; Thu, 27 May 2021 05:54:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmCiO-0004ZF-1I; Thu, 27 May 2021 05:54:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id p7so4065244wru.10;
 Thu, 27 May 2021 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4sisNMx84BvPjXsvgOybQwXvbQ/NVRTfcXmO0r697pE=;
 b=j9wM28oopqgjLJvGO6zIe/s/nDa31iY5VBJ1SFuBfFWSjDOOR2Zd3wbU70vWVjD79Y
 TgKuSNhE23WoLfSybQEpLumisCe2znz8FDZIOj5J3RSroiXbJ4Wef85BCQ3KFq6tWQcT
 95aFoFvBRVii6jN45TQJXV86Ex5bZUY4CxhtErJPg53LgYneksuuZDuGGFGZQlsFLEbd
 nW8quqL+4sHCSTm2JVSj+V7A9JUNBl5SDMDbWH3cWcKo6o5zs1c6n7+LBcQiCpsEE3BP
 Jrp6QeQ+Ckcuu2HGxOZO8/H8GEXOzMu2LTVm7QeN513JN1OHvfalKZ7BiO5APa3eYVL9
 qw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4sisNMx84BvPjXsvgOybQwXvbQ/NVRTfcXmO0r697pE=;
 b=bZKPS0s+OjH4PIZRN4fpsMKqIfFZD5Oqbg/v3d9JAeld6WORpDe06U50RyZuaQHzIx
 1Z2Mdpxa9bSJSR1pHhIgGY0gxjtdQ3yKNCeAeUg4mqEK/THDGeqikS4H92QzKUaZko12
 8JrVQLAYLbC2qCxk3efVOT9q88EelHpSI3Voxl/M7UKn97D3ahPwg89wJGtSpj8gAbLo
 x7x5SszcG+/maEc8gafgzv6nfI+GxyO2dEAWjfwz/zeHkVdIYg2DO12C2/f03/7qjPC4
 XgWvGiMrQPmuZTWmDfYE4N0OFcHEreIKHaklbLx8c3Vd4A8+ZIKJHrSIj7EpkDUqj+wQ
 bV1A==
X-Gm-Message-State: AOAM533LeTSZC2UGQdjov16iCUX9pDLCAr0mg+kyE7+564OE7Ns9rTZv
 d6pRVZRZrnO6//lkRgLi/iP1LKzXCh1IdQ==
X-Google-Smtp-Source: ABdhPJzd5WqqVNdmHKx/5FMecOth36QT7kFEZ9Omo7qECGMO9vthUxUja9d+TTU6CRuMMSNbm8VOaQ==
X-Received: by 2002:a5d:4f03:: with SMTP id c3mr2393202wru.158.1622109245538; 
 Thu, 27 May 2021 02:54:05 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j18sm2136045wmq.27.2021.05.27.02.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 02:54:05 -0700 (PDT)
Subject: Re: [PATCH] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210527095152.10968-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b57c6656-7344-bdc3-2461-d1c60bc08d8c@amsat.org>
Date: Thu, 27 May 2021 11:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527095152.10968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 11:51 AM, Peter Maydell wrote:
> The official punctuation for Arm CPU names uses a hyphen, like
> "Cortex-A9". We mostly follow this, but in a few places usage
> without the hyphen has crept in. Fix those so we consistently
> use the same way of writing the CPU name.
> 
> This commit was created with:
>   git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/aspeed.rst    | 4 ++--
>  docs/system/arm/nuvoton.rst   | 6 +++---
>  docs/system/arm/sabrelite.rst | 2 +-
>  include/hw/arm/allwinner-h3.h | 2 +-
>  hw/arm/aspeed.c               | 6 +++---
>  hw/arm/mcimx6ul-evk.c         | 2 +-
>  hw/arm/mcimx7d-sabre.c        | 2 +-
>  hw/arm/npcm7xx_boards.c       | 4 ++--
>  hw/arm/sabrelite.c            | 2 +-
>  hw/misc/npcm7xx_clk.c         | 2 +-
>  10 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

