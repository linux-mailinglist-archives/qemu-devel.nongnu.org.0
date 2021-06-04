Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2C39C392
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 00:54:23 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpIhq-0000x4-GN
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 18:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIh0-0008WR-Kt
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:53:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIgx-00022J-Op
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:53:29 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso6733435pji.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jcLPWdnFVBxOXZ14nBEnxzUJHDMadqROTqpvCtQdgO8=;
 b=Q+Wr1ooDKGU+jm+bQgbOXbM/sksFEg8HL4OoZFe/2bWFOs4drOypPGoMm62hFy9WQH
 Cdjg0wKN8t4GofkVJbCYm9a/mTvUyzpCPLKP/OSkZbHkrpTq/TjEOf7x8ZaduaUACqq0
 hpSwGlHC7MnVBAfwoTdZqYIfCOQwWMeE5EZEneZOadL3liysqdsrXfFGM8M05UD5QdZf
 75cGp7AuR4fM0tojDd8G3VbUhN0CA6ajkNqFpSKZSSoQ5D6ibaOgPyskpFLFKRJ+A7q4
 wGGASXMzl3ifdSJrIZhDsqD1mb12g2cnkHjxw7UYMzKPDoEuo/Ios4RBQPP4xjN0Z2yw
 8bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jcLPWdnFVBxOXZ14nBEnxzUJHDMadqROTqpvCtQdgO8=;
 b=BHxtqOpzpjYFBpg2xCOx4iZHyukbzu1V8WIaLx5JwAp23y9HHoq8BJdXcttUq4FejB
 1THeFuxuQ0Uie3TrSrU24KRkUAjwrpTqFTa6d9i4cNQjCI9My4weEpgfF0eIeA4Y3tOo
 9Nnz9/kjFSDlspvqvJ7GR+Ve8zLqYWA0znr4oB7bNOA0tgezk66C5mm0NmhC1soQG9Xs
 vhAV02QFODAjKHo0QkLwa5rIpMjOb93SxdhQMV9krWYFEa5WpleqrKxbIqlPeo4I/hJv
 gkk3ydRGJ3j7lo3IuI74y5cOd97mq3TQRuQ+j6MKkZAwwWdHbYDq0Jtxysc+grc0Ys5E
 CZYw==
X-Gm-Message-State: AOAM530PddY5U5Vlos8Wijz/K8IxwfuOqocw7dI2+fy13AySfuw5Nset
 pLVlmffhGKcpC4XCznYF4Z4ppw==
X-Google-Smtp-Source: ABdhPJyf2IEowZheJscO8+8iezEKnrRHeq7g0IopPAAY+TCIlO+FM6KI+9eWD/tX54N4a5g5mY/+LA==
X-Received: by 2002:a17:90a:134f:: with SMTP id
 y15mr7343757pjf.89.1622847205805; 
 Fri, 04 Jun 2021 15:53:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u7sm2965475pgl.39.2021.06.04.15.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 15:53:25 -0700 (PDT)
Subject: Re: [PATCH v16 41/99] target/arm: new cpu32 ARM 32 bit CPU Class
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-42-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3059960c-02b3-c50e-9248-1afb534f0ae2@linaro.org>
Date: Fri, 4 Jun 2021 15:53:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-42-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> In the ARM CPU class hierarchy, the ancestor TYPE_ARM_CPU is fundamentally
> a 32 bit CPU Class. The child TYPE_AARCH64_CPU overrides the class to
> make it a 64 bit CPU Class.
> 
> Explicitly put the 32bit CPU Class implementation in a cpu32.c,
> along with the 32bit CPU Class model registration function.
> 
> In later changes, we will further split 32bit and 64bit code.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-qom.h   |   3 --
>   target/arm/cpu32.h     |  28 ++++++++++
>   target/arm/cpu.c       |  55 ++-----------------
>   target/arm/cpu32.c     | 118 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu64.c     |   2 +-
>   target/arm/cpu_tcg.c   |   3 +-
>   target/arm/meson.build |   6 ++-
>   7 files changed, 159 insertions(+), 56 deletions(-)
>   create mode 100644 target/arm/cpu32.h
>   create mode 100644 target/arm/cpu32.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

