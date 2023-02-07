Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A492B68D564
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPM84-0004kH-87; Tue, 07 Feb 2023 06:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPM7y-0004h2-Vq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:27:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPM7x-0001Hx-EA
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:27:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so12906778wmb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=As+OIpCe6fvWfPVdKfMUvEibuyv1SP7NphtO9o8GadM=;
 b=lQ9gUO1q39laO9dDrgtQyxY8RKDgBEpnFEhu4zs7RnfknOiG3RPby6QQIGr5mDxgi8
 0n4dAeeH/ROQcavBMXngMYMDjjGzsfooOfYuIvjgKQYfOLzDwEc53uWbB6JB7wPZMCpO
 ML4F31htZ99T1szuvn8u34WQX7efE2lckkFbg7cW8087uO19X5He+dK/ewaQwGPc+MyP
 0XNstpEWymBDhBEMcEL0Ztr+ZTQVncLB318OsRj3Y/3RndksnXd9dLWfsX6TblnaMCHp
 XgWwClZ3fk9pnrlDiyDp+HxCSdc3gjM3JPkprkB1p7P5pmhFiOn1J9YUpJ1hzsh421Sh
 pC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=As+OIpCe6fvWfPVdKfMUvEibuyv1SP7NphtO9o8GadM=;
 b=6LhihroqcjAjHYZKKXcRthATnUugPue9vknBpLrCYJ2k+im0JBENdI+ppP5a9zBT60
 csMKNi0m8L2/qk3ZVFX2MGBufP8lzZmZP9a4Ooulyqx2JBaTfl2e84wrwm9KMi3ARhsA
 Otos8pfdTh5pDTTXmr65p3QTyhUC3V/R5DrY2hdLIBCoQmKGxtodH3pnb7lIIWnPN+MT
 TxanwUtB5P+LVJxyHyzu1NSFbPTTqE+kDIRvfNuoHNtTD/b0cUNkRNKrUZkK9fhw4akc
 q5LO6+mjZwE8izzU+FlOTMVDNXhpgw9GCMrukreZmHZWozPo9V0KbEeTItywncY1rLJ3
 XOJw==
X-Gm-Message-State: AO0yUKVqut+vk5jlft1y/RKj69TICB7xBIZIVk4odDla8qbksta+JCxc
 in++OjtnzxeTeDpNZNAa3zT7Kw==
X-Google-Smtp-Source: AK7set//7aVml1Pl3I9tjHu61neZ0lSxNZGVJCdS7HgCpAK8BwU97HPDY/SmJRQz18JCHSFzgPYJzg==
X-Received: by 2002:a05:600c:3513:b0:3df:9858:c030 with SMTP id
 h19-20020a05600c351300b003df9858c030mr13405946wmq.5.1675769228067; 
 Tue, 07 Feb 2023 03:27:08 -0800 (PST)
Received: from [192.168.46.175] (62.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.62]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003e00c9888besm2808859wmo.30.2023.02.07.03.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:27:07 -0800 (PST)
Message-ID: <56ef8dc0-d860-bf55-050d-3cf60ae18ee5@linaro.org>
Date: Tue, 7 Feb 2023 12:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] target: Set `CF_PCREL` for arm and i386 frontends
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-4-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207104352.11055-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 11:43, Anton Johansson via wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/arm/cpu-param.h  | 2 --
>   target/arm/cpu.c        | 5 +++++
>   target/i386/cpu-param.h | 4 ----
>   target/i386/cpu.c       | 5 +++++
>   4 files changed, 10 insertions(+), 6 deletions(-)

Better to split in 2 distinct patches since two different
subsystems are modified.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


