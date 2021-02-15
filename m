Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689E31C344
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:54:25 +0100 (CET)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBksy-00008N-6A
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkqC-0006vH-GL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:32 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkqA-0000tx-PL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:32 -0500
Received: by mail-pg1-x535.google.com with SMTP id n10so4877161pgl.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kG3ejHDLO3lwB4GNDyhxvpA3T7UVrG+dH1aI+9+4PKU=;
 b=y3N6d2ntFjDdZ5EQpKSTArT26U86K8sSydqWvZRi8G0MtRkXeGOkDXmzV+h4y1NlEn
 UK1Ru7yYaVuWxXTFBcWhGvJaKWp+zUmnGrIQM10mIWliolgpbS5mouIDrY9T3+/LRhGe
 FVsy1kaoaUPsyZFMQh9Eb68lbf4P9//ngSHYJW8Jvxucys/SDKYG2AtwyPBOXhvEp4E+
 GtpONaCwpwXgOFgStTFwYBs4ouSsoDIafHdlrL5xVCTJtlmxaQaUHLClEFAWYLDCwvop
 2kz3/hnM+71QKbZbvKrtg9xpgwwJeCbpduFagxIbBdYGDMY0EHdGTmLv99qTFzZZBbOO
 79NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kG3ejHDLO3lwB4GNDyhxvpA3T7UVrG+dH1aI+9+4PKU=;
 b=tc0en78aQIIQCoz/y6xrVY4270Uc69vRptTryIXnyjzHtIQrUcais2twd4b32jJiwC
 He6PDPsA5vnNIyA6z9VsfZyg/ZUPdMh1gcH0lax7coPfqzqleQMHz4zFyHHaCQXGAZfd
 Xx8oVEM4qzDGvwcxADdTlmP3M8hQHSGX9NAylP+FJkzRzOmHD7yweVhr1T9x/n4jmJSM
 BaVvzrNw6ytceHdbNHp392o24Xct/6GkfYYBaYRZJGqkktzvCIySEucHEAKThi0VzcXr
 sWCn14UqOoKdsiU3HKC5u9gpCOnEiWnOODOuDxUr6W57LrqSfyO0gt4M/3NxaUO3Wm5/
 s+7Q==
X-Gm-Message-State: AOAM532o7jvkDvXIz2ZC3qLeIEI+cV/k3DLEjmCL85hjlYF+n3xtBUwG
 5OWGmnZ8c0iWYSjGOGlRrz0XmQ==
X-Google-Smtp-Source: ABdhPJzY+tI2BJxsJGHxW6vQ5jFtn7JYJiUQQihK/6m+eugeZj7egsG3O8861XOJg+1xNe7cv0jzDw==
X-Received: by 2002:aa7:8d8e:0:b029:1d1:f9c9:cff6 with SMTP id
 i14-20020aa78d8e0000b02901d1f9c9cff6mr17047582pfr.31.1613422289404; 
 Mon, 15 Feb 2021 12:51:29 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r4sm18851931pgp.16.2021.02.15.12.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:51:28 -0800 (PST)
Subject: Re: [RFC PATCH 26/42] target/mips/tx79: Introduce SQ opcode (Store
 Quadword)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <286ccf2c-8ad5-bab3-4d0b-63534fc61c0e@linaro.org>
Date: Mon, 15 Feb 2021 12:51:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Introduce the SQ opcode (Store Quadword).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tx79.decode      |  1 +
>  target/mips/tx79_translate.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

