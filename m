Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC6472CD6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:08:55 +0100 (CET)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwl4U-0006Oj-HS
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkxL-0007mE-Fp; Mon, 13 Dec 2021 08:01:30 -0500
Received: from [2a00:1450:4864:20::42b] (port=44855
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkxH-0002ah-J6; Mon, 13 Dec 2021 08:01:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t18so26854497wrg.11;
 Mon, 13 Dec 2021 05:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Csu36sXR6qEuaYGpzFmdSiJPxadFaA86jlWo4F57irM=;
 b=Avh2IGGr3OCnt5TAhRsSzdpm9963mPebkTb5JbicZQpPtTwd45ygXevZkNcO8eTB8d
 9A5FCdY8DHO8cYwAu8Lue1kOjL1stUvBH4T9JcckdT1sZzNg+SDVzo68y6PGxzHAKub9
 qmThAjgHcrKTbkQNfaEqgIpnSkdQEAb+RxqRh0DKnQBU7M7jmPquT1Fj80OQTj4zDmXA
 0QbXWKNtpv+T/LpALHR0QrMTvDtK6RG3UrrkG18VRWmJA71V4+hCewzv1aPOJSIhOnmd
 h0uL8fLsvEljUMr3jgyIuo10sLIkgdALqmzsCt9BBjYUazJmdx/sQJR07ybfCGbXWfcS
 tlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Csu36sXR6qEuaYGpzFmdSiJPxadFaA86jlWo4F57irM=;
 b=hZUvysGmKAMfKnabxgChvVeSmCT64hiDwehrV5X1M9+XfK9gl6WO2lpQj6liltvAjV
 u5iDlM/rzCOx8HvCGpxDlFCyEDoauBaY3bsDqg8MGo9FkmIL+JNwpJf8JHwJZpuYhZcK
 XgeHP2n8DZ19w7o905bxDa6fUeK1OWbJskDXqI02fVzpr1BPpvbz0OSx1EQ+LXsOHxu9
 BO1f8tGMoOsiFMDotc/+N5jAyamvthNMOzGgLlbz42tbGChk6AK/Shbpe9820T9BAn9H
 Vcz7n5z5WZrf0lrn86J20oxqwueCCOrIXA8lbrP0AnP1LsJIgTDH5KUIuYY+kzAkMv2x
 1hKg==
X-Gm-Message-State: AOAM530wxGKt9lvi6g6v7NJGjVEj9On5z9ThIdV4z6lHC4RPMy7xQBlf
 UabVAlN+akoHmuLbBl90zhw6GSHX35w5EQ==
X-Google-Smtp-Source: ABdhPJx8Aqn9J5YD7gR58t0mzX8aIBXdwXLzkOhJlkiNLefsf4fsYaidVu/a4HUYgcdYnjjO7GatFQ==
X-Received: by 2002:a05:6000:1103:: with SMTP id
 z3mr16560296wrw.718.1639400481320; 
 Mon, 13 Dec 2021 05:01:21 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l8sm7795226wmc.40.2021.12.13.05.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 05:01:20 -0800 (PST)
Message-ID: <4c37d323-35d6-c3ba-4ba6-41e67c1bf9cf@amsat.org>
Date: Mon, 13 Dec 2021 14:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

