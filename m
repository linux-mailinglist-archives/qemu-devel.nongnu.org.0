Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5F2FF755
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:33:41 +0100 (CET)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2haG-0001GC-7n
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXK-0007sQ-GV; Thu, 21 Jan 2021 16:30:38 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXJ-0002iJ-2U; Thu, 21 Jan 2021 16:30:38 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so4746196ejc.1;
 Thu, 21 Jan 2021 13:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sXZlqrgkOFwHCKdSvPskOVNqifgwnVfhLMXVsd1Xjlo=;
 b=rOuJsSGUcsHdMzADX0+UsSdjO2T7uDb81yV5kL1YK6t9K+el0uT6swta1LOSa5zBbz
 lRmp68Xl/0H+9kVFtCeU9BEy3Or3guUnqF1eOQslL50RQr6nlOivdF8QUiUrg2Zsbhgw
 +9TOHXTUa0IsFz0UcPA3XcuKSc7ROg7g5D/y7m3stvBUZmI+W20b9MuWJqg7KY+u/YZG
 BZgsIQAzK0yBaU3i7Z9LeH+ovGRGeVadr10PnpN6JjqCDq/E3h263Wa6JqN8PML1LkEf
 LvYUm/vLABqNLuRRhhvoxNZjsyuQlwkXe+gWJ3n2jYox9rLUnkOedW08HmrrKwCTl0Ys
 AjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXZlqrgkOFwHCKdSvPskOVNqifgwnVfhLMXVsd1Xjlo=;
 b=uZxaOM9toYu8h07gOIeB6hOItkeLoy3F9PeSl47YYT7ea6clzIFoZkVX/gWMu1c+2u
 akUP0uVH/1ejc9qPsJb+0MwPicqnW2xmYUBOeiWcMqHuN0FXiU58DBC/csB6rudU125q
 3iOxPU12V7XNZtKLaBcyJlEADhlgYp4/Pz9sFUAiYNJ+niUM+JdNodUqaxYWY5XhyZEi
 BSmA0+FxDqXEHRHXmwd6WtGmOxihgDL5XIO0c0HlfAajqGBVItVMJDFzlfHVCNijUzM3
 POivgQqQ7zsrXCwiyoOF7Pd8cpQi51tAQ4SBfCzaQS7KO9qcxIMOXm4lj3+VGGZB/g1F
 avpA==
X-Gm-Message-State: AOAM5324rkdS/pXdV60jAvqP7QTFdiEGOKBFvk903O7WJaWhu7IMjCQ3
 4EgjrU3P25mlUk41ZDIwhKQ=
X-Google-Smtp-Source: ABdhPJyBlK4W7fY3QOjjC8Do6SB9mKzYl3USWQFn9b/Y0LFuL8SVQeMXs0LgpIjYpOsF8NArMoo0mw==
X-Received: by 2002:a17:907:d27:: with SMTP id
 gn39mr911811ejc.152.1611264635467; 
 Thu, 21 Jan 2021 13:30:35 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i26sm3482324eds.55.2021.01.21.13.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:30:34 -0800 (PST)
Subject: Re: [PATCH 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-15-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14467f6f-97c5-37e5-2371-118af184ca41@amsat.org>
Date: Thu, 21 Jan 2021 22:30:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
> Create and connect the two clocks needed by the ARMSSE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


