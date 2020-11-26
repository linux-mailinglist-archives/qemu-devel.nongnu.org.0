Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381452C4BDC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 01:14:20 +0100 (CET)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki4vS-0000ri-SR
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 19:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4u5-0000PF-RS
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:12:54 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4u4-0006wy-7l
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:12:53 -0500
Received: by mail-ot1-x341.google.com with SMTP id h19so413190otr.1
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MK+NVomyr9MJjhBEDq/7VmeiodIXm/V2yc/xY6BP5EA=;
 b=F8208WB/e23PvUOEY70nR02eIo+JwncB/x84UtidEMSLXxA20MvpL2kbJ6dvVMLHYq
 7JPTXstuwCSb6pccgJIuBnSEZh30dXdtJUV60bim7Oaccg6ykOicLmg/Lmm35W35dV0X
 GK/Zes4H1heS5zlhePsf/1MDocDLQlQzPzBPxbZ5oaarAkZhQXL9rNcoFvFDtIVl2oyD
 WR2MYHpVH1nss5xTECy3ZBfWib54pDDl+5m/T+WlsovtvD32vG9d+yd4rkZyIM/1Ecoi
 kqQ9C708qJUm4VJUvWj+yXze2TO1PaaqaC8htIJJYdQo2pi9uFsKDYz8AyhiIWytB7z8
 +GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MK+NVomyr9MJjhBEDq/7VmeiodIXm/V2yc/xY6BP5EA=;
 b=RnW3HTM6v7HotK6EHn2XEnDnMq5cbkiScij0xYFgARejJpAC/nlzOTTFPlcwobS9Lo
 Sl10jz0tNkPdiOTz1VRk9Mj05kV8GpikFWCCP2tC/w/qtj5PVqXXq2YZoFS1oEFEKMle
 rFyEuU3XC1qqq/LWW+YQVZ495LCnUt9LhCQOp5lklPv7tEvie107umL9HmIAyED/8Cum
 DPP1w+kaVoI9lLt6KR8u4BCWfLMpNsQfI6gppcO9GQdTJediSqST9NUVnc5u0m40IWeW
 HFEKzF/fcETMUYBzp7XkdzX0sZ1ee+KbdFezH6u4oBjZ9JKJW1qonkHlC7hao9s/DvxG
 yR+A==
X-Gm-Message-State: AOAM533IceP7ov+9KkRnWToKCjMJasbPr9PNjok3qpcp2wAHxTjjJ00D
 Zg3Q1In8pJduZsRogtm/iJvROQrgvy9ttg==
X-Google-Smtp-Source: ABdhPJwt4JfJOZrXJcljUiTpQFefHsPxfIeD+sg3WujKTC7TxifkKpnINL+4bizARdjgWt33c0rERQ==
X-Received: by 2002:a9d:68cf:: with SMTP id i15mr555027oto.255.1606349569994; 
 Wed, 25 Nov 2020 16:12:49 -0800 (PST)
Received: from [192.168.20.233] ([12.220.158.163])
 by smtp.gmail.com with ESMTPSA id 64sm1998876otu.62.2020.11.25.16.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 16:12:49 -0800 (PST)
Subject: Re: [PATCH v2 01/28] target/mips: Use FloatRoundMode enum for FCR31
 modes conversion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff2669aa-2ba4-59f8-90ee-2a7a894faa2b@linaro.org>
Date: Wed, 25 Nov 2020 16:12:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/23/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Use the FloatRoundMode enum type introduced in commit 3dede407cc6
> ("softfloat: Name rounding mode enum") instead of 'unsigned int'.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h   | 3 ++-
>  target/mips/fpu_helper.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

