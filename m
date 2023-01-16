Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35466BDCB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOYX-0006Gd-K8; Mon, 16 Jan 2023 07:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOYP-0006EX-KK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:25:35 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOYL-0002MD-R4
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:25:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so3877522wml.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PxrSwJn3xHYJQzVnpx+GliH7CEhPTpcMAXG6g8beOKM=;
 b=iwAtGXPFRK1Nfta1c903tpvdz0QoWXDfW6gcBdityep8NRQA3vr6fgnqwa33uS1jL2
 V0xtL3wrhLi+fyEbMjw5U0zMct8Rn2qxQwz69ZOJeAu+oqfakTY0HJV8190Dqnosyib6
 0hB671UBAA8h7ffAe6UntMETVOfWJoudxqotZ7Ezq4S4IVoFI06fmdQPYDfN6iolHcNR
 zNqE744uLkWJ1LtzEw8oezouwqkm1mAIDS2p94gHM8j7cE6Ndf8SFSrqHJgmQoWj3u8p
 o/RjbuwuHVqyz11JLeodNdxNOKdOiYD6CP6WgfCnSoKQ6pN0sBQtcv2AwLL871yYPab9
 Snew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PxrSwJn3xHYJQzVnpx+GliH7CEhPTpcMAXG6g8beOKM=;
 b=h1SYGAW6Ia1z4wklsnAe9qWmEmAFopFt+orRQ0dqlqVXdfgaHtgWEL67kumJUEDp60
 96tfCiCakTnpnDiDayv/xdOlFsU5jiXka1PfiFQdavW4XKLWBv9FZxosHX4gNtB2l+4r
 D5ipTzNpkXwsb9rEHsyny5XR9gbUZKE1LaNpsPxukhi7fU+ZsOi9mlhBxWSVtIOo7oUY
 0lM6OAgbCTevfoJQnI14QmKq5iJz7hs3g3g8mduUqvhOW4nGdQDAoZO2bow4WYEUE5wB
 BMfiQPzyK3arcBzBxeEXQC1VmOVugiuroJNWHh0BozEt73IOsfZIYlhMjBkoQsho02n0
 6YrA==
X-Gm-Message-State: AFqh2kpl16iYBbLO0v6I2MbOn9h8sndF4SRw4tgh8lLcAfq6gje1McuU
 25RuWOGucFn/Cqm8i3OLabtWHLjLy0QxsDWk
X-Google-Smtp-Source: AMrXdXvmZJcdt+2zX5PBKN1agmstjkNtgx3BGLGLuhK9ym3H6D1GnQhmggt7ocGNcNhxE6/mNsOLpQ==
X-Received: by 2002:a05:600c:3109:b0:3da:e4c:2a3c with SMTP id
 g9-20020a05600c310900b003da0e4c2a3cmr15815081wmo.41.1673871926973; 
 Mon, 16 Jan 2023 04:25:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003b3307fb98fsm32744728wmc.24.2023.01.16.04.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:25:26 -0800 (PST)
Message-ID: <2cbb102f-2f67-a688-6f3f-f4593bbe8fa2@linaro.org>
Date: Mon, 16 Jan 2023 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/6] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-4-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-4-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
>   1 file changed, 43 insertions(+), 52 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


