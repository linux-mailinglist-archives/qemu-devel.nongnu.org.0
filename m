Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C660AE0E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:47:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy3Y-0005wz-LC; Mon, 24 Oct 2022 10:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3O-0005je-3q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy3M-0002DH-FK
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:03:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so10043406wma.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZ4I+rQl9muDcptgnBdqaQGhq6cXX1w3OUo8A0bKsyA=;
 b=yJ/2gxTDcxPlD513hdGtdrCxRYk8tq8D//uYLkTWNc9MGg1YTS21Yr7mFJYTBCpzTi
 uXwiJC2qsH5dSDd178Z9tbBmQBWxEvWrW3+0lD5dUeQFqR0aZ1C3i7uGdOPhU5Ije3VN
 dy90+tFSSifELOIo6LsTAbwplB9Imz8ck7IB1SijcWcqbG08Yp9u9hVrS5KIJctNk+sQ
 /O7Zr3ACBZsOFzi7e9etwwAUQ6UJNoqk96cWFsy7BvwuLvC3f/8EtISsLISllSFAtey5
 ReebB2JC2m+ESInRA4at3eyeG9U45iuUAMuHAi9KNx4t2nRfFaOdNo2B3rYU5ZCQZv/G
 8hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZ4I+rQl9muDcptgnBdqaQGhq6cXX1w3OUo8A0bKsyA=;
 b=kBBvMAX27X7gD+LCu6jD7cudkFewauUemLyP48rl1HPD6XKZsBq+XWvPWImdIdurd9
 BJAyzXNG/vMADTilXCSQASzP3cB6+3rtd9S6JY61kJevF2QB7PRbaMqvwG9ckH4kkyi2
 Ai7WtWQwOeA9yS6rjMpji4BtMql76v5a5AKfiXYHw7wXzSWpkxoHxCE37IN2NOPm+Kxd
 lvIMxKtG28kkdS0onksHA+1M3yzDbYHzk2ri81SfKSupdtsJpOSM1gKHNEeaPcINH2oM
 agEUJwmCBBnSh1ad8Yebg8jp2904P6htnJcYbugDaWeG5uxlSF2jvn3f5pK+hOwbN0Ob
 twzQ==
X-Gm-Message-State: ACrzQf08VnJA1o21M3s1SjcAqinnyFL8RDy5ulzmTzMdEvyVr5kO0Tw2
 njKQ63rKEyeRi97yHSouF6j62Q==
X-Google-Smtp-Source: AMsMyM6I8aA4pBKjl8vPizudwMAsDH4xnwzy8OneN7ai8dJN6faA0U1nwx4oWMc0AU3jvdN5bMNa+A==
X-Received: by 2002:a05:600c:4194:b0:3c3:d0ed:2d44 with SMTP id
 p20-20020a05600c419400b003c3d0ed2d44mr44973681wmh.151.1666620222941; 
 Mon, 24 Oct 2022 07:03:42 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a05600c4a1100b003c409244bb0sm23956wmp.6.2022.10.24.07.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:03:42 -0700 (PDT)
Message-ID: <5dd5df34-51d5-93a5-1a17-343c187511e7@linaro.org>
Date: Mon, 24 Oct 2022 16:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 17/29] target/rx: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/cpu.c       | 10 ++++++++++
>   target/rx/translate.c |  6 ------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


