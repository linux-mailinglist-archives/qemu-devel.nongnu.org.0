Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2F569722
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:03:59 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Fvy-0004T9-L5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Fu7-00037V-4O
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:02:03 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9Ftt-0000Tn-P9
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 21:02:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j3so3602890pfb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8hNSUeAddb2G9nL+I4riXcCwOozgi13GNSPTg0q3Zn8=;
 b=y1wai+lB0jy0YBNV+t2oFt/9ypB4B6hF/wLsUut9F5WhN3fJCG9pUJ0/xn/xk22YD3
 fyMR6OGucOfH7hkU6JKghoSJ6kofRAlreWgXozC7rjL95DFJZZQZFNdWRK489T1Tgadr
 XUQj476jJRTPUz7ZMtXrjnnDmlwBUwJE0ok89B9uS6E+qeisqRgGh0lEDduvZR8u8SX5
 PV9goNq3HgbFio0BRuuPqMs1UxO4UipXQbgc7s6MUyjJztmRBCM8G33cik7QAkTaFV/K
 RB8e7Hf9fpyYGu/G+X3GHhKTqVjQ0pPWIz7cXz1Bx0yh6WEgOaLbSbtzewh0wb74nAiG
 wFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8hNSUeAddb2G9nL+I4riXcCwOozgi13GNSPTg0q3Zn8=;
 b=KW37fi8AbIiloF0S0/2+/QJij+kFPStqJOfhRZ6D+nndYvftQ3r+ZNcULHRpf+3O7Z
 UNp2K6RX7thgI48ORcJ4ZdQE00GOHbOicNueSNXi0+6QouHSAfiThgXUzlPQ9Gqh93V8
 Zc61RbGVkIfXdVUorfkcrRZ9GO25ggOlNzIrahbJsbMZ/GVrS0uRr1qTkg4VWdX1v/Ti
 9hXyF0RBo13vbz1TrDnoIwHGG7O7XZtXMAwU2/BbVZBPUIOjAW1Wj2C5V9EoyZJftM+z
 OzYF99kQHBF8NXDUrhGuEWACQ4/McidwMiJoUjQ4D6CxY8a9qmrAaZxjXW09vW3s+k6t
 NxRw==
X-Gm-Message-State: AJIora+HtgTS072D6bPUCXDUFpP3J5QsigPtt0lwgCCEz7LIZVqj3BEq
 8I2YA+TrDdm1TrC2/LVBXC8+ug==
X-Google-Smtp-Source: AGRyM1vp9F4dFcPyY1KJGVvZT6vV45a9KhNJ9RwwZ4x6hUYTOySTrcS1ajDkqqGNxw/rklCNcnTAZg==
X-Received: by 2002:a17:902:6b42:b0:16b:f27c:1c17 with SMTP id
 g2-20020a1709026b4200b0016bf27c1c17mr11752677plt.152.1657155707293; 
 Wed, 06 Jul 2022 18:01:47 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902f64a00b0016bf01394e1sm4848746plg.124.2022.07.06.18.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 18:01:46 -0700 (PDT)
Message-ID: <67d2eae1-ed2d-0ac0-ecfb-965c478ff5c2@linaro.org>
Date: Thu, 7 Jul 2022 06:31:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] configure: Restrict TCG to emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20220706153816.768143-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220706153816.768143-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/6/22 21:08, Thomas Huth wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> If we don't need to emulate any target, we certainly don't need TCG.
> 
> This should also help to compile again with
>   ".../configure --enable-tools --disable-system --disable-user"
> on systems that do not have a TCG backend.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> [thuth: Re-arranged the code, remove check-softfloat from buildtest.yml]
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure                  | 20 ++++++++++++++------
>   .gitlab-ci.d/buildtest.yml |  2 +-
>   2 files changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

