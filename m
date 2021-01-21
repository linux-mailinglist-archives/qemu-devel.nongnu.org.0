Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B102FF5C0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:23:21 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gUC-0007h9-DV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gS8-0006ss-EG; Thu, 21 Jan 2021 15:21:13 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gS5-0004AK-Sn; Thu, 21 Jan 2021 15:21:11 -0500
Received: by mail-ed1-x52f.google.com with SMTP id bx12so4017342edb.8;
 Thu, 21 Jan 2021 12:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NSTvq2STd6U2RpvgIeu3fQA6GEXSLfXZ1us/azMianM=;
 b=k8Mxl0U0Xw2T/lcSfR0KBb2sttFYTuXZ9oo4vgg+oNjdfz3gkRfj8xyd6aeA9vPdZZ
 3guWWEOb2HKiuxtOpz2gQctfUGqO6kaAQdgO3pvzOFvvM4DJWaCK3Z1iszH5vzQxsyb/
 /ag6WbMMbosTDTvqVudxHm1xhqHezoTL9PP1zeUPeaZ6nybwFrjjW8CF+rV9qSL5RWI9
 u0hbaUYf2SMezi1zNBgaIdpykxNRQkMsXsPNop75wcNaHAtRJgnOC8cXMHmFINTjK1dh
 ubjMsskvLHSPxmDcKSETAatJjM0S9i2MVDlcjzb3qRi9Ylj81DKhaZYI0GPpiwjBo7wb
 +gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSTvq2STd6U2RpvgIeu3fQA6GEXSLfXZ1us/azMianM=;
 b=W14r+GZJ91QjSSdE/kpsB9s7ExdyldYSgeT4An0rktJFavOV8WtnERXbYqoQ4fxw3m
 RhXifCDm75838bUijA+Uz8jZxlVJSxyeIUSx8cDec7O+uPA5dJWGz4KGn6rzdLZYzuEL
 ueBh9QSydMeAX2OTfxlBr47S0vDXwnO3ErPvNgIU93zNVdJhoDpPjZR4W97gO/aZHP/A
 4nyJ05ALV7/RISMpsjSD324GfbpuVgMLHQ/jnbo7yU00ek02OMxbu/W2lK9QazIQNnG+
 g6clyoch0+iPwk9noZB37v38uhbwCHGIYWwZ5lrSA4YQXa11OEe/xS7qNn95QyNhHlNU
 ChdQ==
X-Gm-Message-State: AOAM530ExZXp9pjhDDXHO/tQpPxf9TGx61FdDqg1PsDW51Q+DXs9lYC1
 CgZW80ToD8q3Ua7CF7AJMuU=
X-Google-Smtp-Source: ABdhPJwGNKPjirRmOk9E6VhEXe8YF2PPENn1UCJtwkm6i7R6ytI6QupwMq+EiaO+uP4phcxk92/zsQ==
X-Received: by 2002:aa7:c34f:: with SMTP id j15mr700520edr.120.1611260465751; 
 Thu, 21 Jan 2021 12:21:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm3343214edm.6.2021.01.21.12.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:21:05 -0800 (PST)
Subject: Re: [PATCH 06/25] hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER
 struct to CMSDKAPBTimer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0541fd0b-28be-b0f1-aafb-5a30a1bd1f96@amsat.org>
Date: Thu, 21 Jan 2021 21:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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

On 1/21/21 8:06 PM, Peter Maydell wrote:
> The state struct for the CMSDK APB timer device doesn't follow our
> usual naming convention of camelcase -- "CMSDK" and "APB" are both
> acronyms, but "TIMER" is not so should not be all-uppercase.
> Globally rename the struct to "CMSDKAPBTimer" (bringing it into line
> with CMSDKAPBWatchdog and CMSDKAPBDualTimer; CMSDKAPBUART remains
> as-is because "UART" is an acronym).
> 
> Commit created with:
>  perl -p -i -e 's/CMSDKAPBTIMER/CMSDKAPBTimer/g' hw/timer/cmsdk-apb-timer.c include/hw/arm/armsse.h include/hw/timer/cmsdk-apb-timer.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h            |  6 +++---
>  include/hw/timer/cmsdk-apb-timer.h |  4 ++--
>  hw/timer/cmsdk-apb-timer.c         | 28 ++++++++++++++--------------
>  3 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


