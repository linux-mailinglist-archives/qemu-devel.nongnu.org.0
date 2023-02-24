Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4186A17B2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT5m-0004HV-Dk; Fri, 24 Feb 2023 03:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT5Z-0004Fi-V0
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:05:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT5Y-0002vk-2f
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:05:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so12607535wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pMC/lEA3i6rRPBdERHs3P9korhpD1CNatMtn1N5xoKs=;
 b=eqm8SS4pK5sw8NnXCcmkjEzJqCV7s6jUi4hLyKR7hthExerPYbPUcTZyoC0zGXTAKQ
 7raavPq8yockDk+P1FAc+4QbIh6zl1mNM0yXsH3cA8+1NjyP/vINxjAOLLU1caH7zR9G
 19TfOt8H3/OQAU1E4qgi+zZZYSUU/c6rfcoTGK1dkr40r+u4f2we6fQ9gmuZ7m4QSbV/
 UtPAjHCJI2DN7WVj7mDOBtd/sinXypV5CrOX3XUUE8nRpo1ObF6+8WsT3zaxIsWXg70K
 5SmLdAle6C8cxzMY9rKSqjN2BbIKlV8W1Vx019/1AADFSr8PO5T+KgfxwkGPySdqGs4M
 AM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMC/lEA3i6rRPBdERHs3P9korhpD1CNatMtn1N5xoKs=;
 b=vDI8YvLUwOK0uIdiWmIoae5WIuOyTopgvqMJPYfQ2d3xC0XpUDY+Emhr/Cbg/BFItH
 qUUDskXB3otuGlTayDQOwBnzh6p5ZFyVnwIk38eAiIfb4U0e0uQ7giFQkjf/5C6IP+1C
 sZSDDJJMTonjk1k/vITgOvIFO7Pb4qA8eSh1WmQ04Mla9xYq0sUHIWtH2Cd98PAiwdCN
 CPhjO5QTD1w7YPFU9KBVxi2UKXdYaPut81yT8ux2PSGjNrGLaHErd8x2M/1MfeE5Dl0W
 g6u3W4KpV5aMz8yRSQRz01gCoWfAtbyY5Sacrozd2Xda6YbBWinCfW2qApXuRXZxtTDH
 iR+A==
X-Gm-Message-State: AO0yUKXkF7rdN06wzWqpI1Tn0BK0kAEmz0ttcb+TYiSYswCGc0YbJ6qj
 d/wWj+1JCVy/SUU116KMWnPFrSeWgbXFWdND
X-Google-Smtp-Source: AK7set/T7JzdFl9Gk0Qm2NLWTU5trtC/J9RI4ZGWPmQ4Rxz90WK+dTE2L5T2EMcMON9MYsl49+AA1g==
X-Received: by 2002:a5d:6d0b:0:b0:2c7:cc8:782e with SMTP id
 e11-20020a5d6d0b000000b002c70cc8782emr8346883wrq.33.1677225953655; 
 Fri, 24 Feb 2023 00:05:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600001cd00b002c6d0462163sm11129862wrx.100.2023.02.24.00.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:05:53 -0800 (PST)
Message-ID: <c7346818-248d-f88b-0e32-978d7d673a69@linaro.org>
Date: Fri, 24 Feb 2023 09:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 28/28] tcg: Use noinline for major
 tcg_gen_code_subroutines
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222232715.15034-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/2/23 00:27, Richard Henderson wrote:
> This makes it easier to assign blame with perf.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


