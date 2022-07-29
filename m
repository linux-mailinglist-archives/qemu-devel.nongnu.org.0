Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089158576A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:44:43 +0200 (CEST)
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZep-0001X4-Bw
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZcb-0007I6-3V
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:42:21 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZcZ-00009Z-Ea
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:42:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 12so5117376pga.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xjzot4uwjDESIz5XRcXeTU29yqN0JOKhmJUmpKq7gME=;
 b=a3Of1csiYDobmHvcnpICJhIAZDy76gYB2w2yTe4jqcoy7BePrmFhYPphLEz0VF9iEx
 cQ8Z7pFDICUXbwyzx9URJEZ51qjIxRBb9gKUUW8aH2CzOaUmfInI97KOYDN7gUB8oEVC
 bY4BlJ4OXBQhz3s6TJylN1ECKkGE3X2GYeNNuWaqvc6DaCVxfAzFyd1HUrbzYUicrqA+
 0q8VSk1SkD3ojm+hjs3bE63nAwAr81sPDaYohNeT/cg0pbruB64V4wTfpKthFYMy2dj9
 pRLqfjuwKlcDKuwE9KY4HRFrgn3dfCLksoBAZlHvXsFDAliiV9kbbR5DsyPw6r4P5Olv
 PfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xjzot4uwjDESIz5XRcXeTU29yqN0JOKhmJUmpKq7gME=;
 b=VNWFieS+hdvV16BU02nq3FPnAxcwXPR11Ob5EtGN7J1AshPtqkTzL2Jy0J+hOsLpXD
 vf/HSCTzfxk5y4H0a92ozwO+P2QSNTLEMVuZYv4tgsVubzdkHHuRjkMUHSKq9I4N2dLB
 Y/GEXPq7aq/eRRnNisojgdSjukDVLLW75p2X8Y0Pqf8jBvufdCuCDpACmaB8Dh7JTAP/
 rqwdLbWviuBgF4PnW+Zh5b+/1jPlc6njkBalgo2hSjR0TFUjmmfSPWqNsxXIKQ4eTBkx
 00zqm3no+jj8vIqfoE2bwgAK0p1zQglZ084FOD9QAAUoIk8Od3O7pekNnej8RT5Fel/Z
 D4IA==
X-Gm-Message-State: AJIora8Rovhdeeaz7Jqd49wUcR47tFY+d3dRyeq3U+u/VHQcQejx+uFX
 LJ06m94Jaq9cnBooGOV+ypD4/Q==
X-Google-Smtp-Source: AGRyM1sQYcX7Qb40DOYz7uSq3DYnNL2uRTPzEEo3fYSLtFMNoYs7mtW92tVDux+8b3+e5c+f6g0MjA==
X-Received: by 2002:a65:6a0e:0:b0:41b:51b1:5be1 with SMTP id
 m14-20020a656a0e000000b0041b51b15be1mr4768564pgu.574.1659138137819; 
 Fri, 29 Jul 2022 16:42:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ce8100b0016191b843e2sm4227639plg.235.2022.07.29.16.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 16:42:17 -0700 (PDT)
Message-ID: <d52bd8ac-0a83-d965-9373-038e755342a2@linaro.org>
Date: Fri, 29 Jul 2022 16:42:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/11] hw/openrisc: Initialize timer time at startup
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220729230117.3768312-1-shorne@gmail.com>
 <20220729230117.3768312-7-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729230117.3768312-7-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/29/22 16:01, Stafford Horne wrote:
> The last_clk time was initialized at zero, this means when we calculate
> the first delta we will calculate 0 vs current time which could cause
> unnecessary hops.
> 
> This patch moves timer initialization to the cpu reset.  There are two
> resets registered here:
> 
>   1. Per cpu timer mask (ttmr) reset.
>   2. Global cpu timer (last_clk and ttcr) reset, attached to the first
>      cpu only.
> 
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
> Since v2:
>   - Moved timer init from init to reset suggested by Richard
> 
>   hw/openrisc/cputimer.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

