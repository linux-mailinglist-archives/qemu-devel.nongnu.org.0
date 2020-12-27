Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA22E31AB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:21:44 +0100 (CET)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXrb-0001xU-Ak
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXqQ-0001Ux-G1
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:20:30 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXqO-0000B0-Bt
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:20:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so7421437wmz.0
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4gL1zsAamTvSZJzc+izv2MFjL0DCvLpuRWzBVRDN1B8=;
 b=cXx4ivtHErVjMl0kQOn2drlMheia6ZkE4UuottH/JMy1jbCl3lduz1Kd0WXd8Gw8VZ
 dhduF8SmXG556K4PyYABLqrrodHEIqv2BwjI9KGeZFWnFzeWw9dgBVCsP3SewYEfr/s5
 Q4TQ4j+zedSE6+DNhuUbKcGzzmBOcHzZhKbsEkz6A7H8FEQNs9wiHARCctFc33skDzWh
 Rj6BUQoO+xndVtoyBy1j7W+vSajJJydsxRASY99D3MTBgIDbVWAAtdnkguYF87+7hpL3
 LKe/l3TIorZrdP59XThlSWVt+RABiDivA8OQW7AMkmUFR/iwSZk2G6JYLMT8h1Rf6CwN
 0Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gL1zsAamTvSZJzc+izv2MFjL0DCvLpuRWzBVRDN1B8=;
 b=Q1dyaWsz3aVZ/DffahmB6IzaS6cVCfXljMbUOcLHJkq4PS6bK3Ug3W3u7xEcATH4Fr
 WcMyS9apxRdLd79VoOeyWsSSH97DOvNPd4D4uqPFA8/RLZdbP+G8YbPgCOYjFbR6QM+0
 dXgfhUhi2Rh+WsH8HM0KGROI9HVabHjjhbs3SjLaUp6bjIDr5dTONPDB0lTxNWRksh9F
 5hUXw6/mdnBI2PVV236Zcd24b/+Pme3FaLCgNh6ZcbA+qnswaNPgOLsKJiktnss4tJN4
 mD0GdN8z6mF0Trikh0Fj9N/GpwJYEvB1A2lf6xdO1Q46s6q2/xzVmsfyYWWXQTsWkf7W
 y0qg==
X-Gm-Message-State: AOAM530AK1RjAFH10YwgdnOmTWanv5DVRYZ4gdG0cUNk8QVH15aKISd9
 jWZkVpVeD7Wc3GQgJ2vJMAi0fp8nH2o=
X-Google-Smtp-Source: ABdhPJwOus5IkZDiq0Zr3ydAgMOQFxlPHuMPt4tsuBzf2h31F92VG8a8eeJLH+SssXsQetLNgJjBsg==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr16181465wmd.2.1609082425335; 
 Sun, 27 Dec 2020 07:20:25 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id g192sm16022255wme.48.2020.12.27.07.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:20:24 -0800 (PST)
Subject: Re: [PATCH 01/16] tcg/s390x: Rename from tcg/s390
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201225201956.692861-1-richard.henderson@linaro.org>
 <20201225201956.692861-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d3c4dd1e-3b8d-bca7-54f6-f5456b6c29cf@amsat.org>
Date: Sun, 27 Dec 2020 16:20:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201225201956.692861-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/25/20 9:19 PM, Richard Henderson wrote:
> This emphasizes that we don't support s390, only 64-bit s390x hosts.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                             | 2 --
>  tcg/{s390 => s390x}/tcg-target-conset.h | 0
>  tcg/{s390 => s390x}/tcg-target-constr.h | 0
>  tcg/{s390 => s390x}/tcg-target.h        | 0
>  tcg/{s390 => s390x}/tcg-target.c.inc    | 0
>  5 files changed, 2 deletions(-)
>  rename tcg/{s390 => s390x}/tcg-target-conset.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target-constr.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

