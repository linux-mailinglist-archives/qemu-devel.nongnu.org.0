Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0565F645
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYBg-0005eV-Bu; Thu, 05 Jan 2023 16:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYBG-0005U7-5h
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:53:48 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYBE-00029B-ML
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:53:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id co23so37470491wrb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jBJVUwiOpTCbYxkjRCTfpJrIXdwB9wa3kiTwzH82xNw=;
 b=PvLzfN8GmB9S55x1qMb0vx0aZk/wyh95FiroTrI8aRYCjWIq10ZFkZF9s+BpA/hAxE
 8MR7LMKSQVqq4yuHO4R+xiQm5iEBZwGBm6PaXd9SyE0Z44fcf84Np/BFBAiq5tRoP/8J
 OpPZ1PifNjCo8q+bkWte7HXwYZYQjntqbjZvsgeBiHT4bjEWekiaJ6xCCxtdIsiocJUW
 HQhDUdxLrqVNFq7/6VBOneJZzDLFbGfaWIEABrUBM55CawfNSyWB0AuUc273ncxtbroI
 RpZHAlQ07Hb0XiTnVfWWfDr15GtPK5B09mtc3IwNKZYgDlZ2SkR60Zi1cq5LiO5SqbYA
 Z33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBJVUwiOpTCbYxkjRCTfpJrIXdwB9wa3kiTwzH82xNw=;
 b=o2WMAB8t0H0ujgc06dR1Ux5BQBlDvYW0wdXXAu5tKWaQD3uO1GLveUJJf/oEi/x4MH
 dqr7myhwqkDmnfwq6PHn6J8w27v8zCZfRHbbNa0KMfsbcpQeCCZq9XKo/tCGhc/l0NLn
 5d8f3vpCK3mp6AXHnBu0VAKMiJhB/12k4VkozoC9alQltXvN21QSXO5MKxBV6pJCULX5
 KuyKyzm7+L6z0PsPP/08wQecGdSlMKLGmhT9/Bst+q6hm8aC+IaWASZi2YKzWAQU4z/x
 BlN16rY1QVl7hPqinXXCcZBi9CsQaMUtugXaLmW6D2YvL4sasb6hnpxGJx8ncnGYfF1N
 YHNw==
X-Gm-Message-State: AFqh2kp1yIJIlaDBCg8D5olEklhaWXVq3ZcYy9QKikq1wWgvWF/nl9ns
 C11Ycw3XfF2KqPXoSe/x5ksbzA==
X-Google-Smtp-Source: AMrXdXs9gAUQRcPciQM62uxESCUcqGazgRP+LRVhioV7WXzk+p3APMnwKICLVy2ORscnHinR8bDS8w==
X-Received: by 2002:adf:de8a:0:b0:266:3709:5ce3 with SMTP id
 w10-20020adfde8a000000b0026637095ce3mr31769138wrl.0.1672955623138; 
 Thu, 05 Jan 2023 13:53:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u3-20020adff883000000b002423edd7e50sm38286716wrp.32.2023.01.05.13.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:53:42 -0800 (PST)
Message-ID: <df4445d5-ceab-aacd-09b3-ad420654e8a2@linaro.org>
Date: Thu, 5 Jan 2023 22:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 15/40] target/arm: Create arm_cpu_mp_affinity
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Wrapper to return the mp affinity bits from the cpu.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h          | 5 +++++
>   hw/arm/virt-acpi-build.c  | 2 +-
>   hw/arm/virt.c             | 6 +++---
>   hw/arm/xlnx-versal-virt.c | 3 ++-
>   hw/misc/xlnx-versal-crl.c | 4 ++--
>   target/arm/arm-powerctl.c | 2 +-
>   target/arm/hvf/hvf.c      | 4 ++--
>   target/arm/psci.c         | 2 +-
>   8 files changed, 17 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


