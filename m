Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5A68DA9B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOtF-0005zp-8x; Tue, 07 Feb 2023 09:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPOtD-0005zT-KA
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:24:07 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPOtB-0005ko-Kb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:24:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h3so5882929wrp.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hax/XOz6L1HwvWdYp3TmUzlLwg3i5L7wNEbwhLs97i0=;
 b=xU9L/CufPrpEJQeoIEKk0f/LfRTnrb7OAI6AXlB3jyvC+uC1U3x31QS3OfRr5nkWkW
 VyRXFPW0dfSN2KIW2Eng6wRZRJInd8eWf/rK4zzBYbCAonM0jUN9IdvySGw33IQbgGX9
 0PCiGswnmieURiPujlf2PGkNKFKC2PqdbAnKl33rPLeOlK7d2zyKZrf2pk2sPMl6EHew
 EcPqa41rs8uo2Ml8HHrA5kkvIpG+BUosxGZReonv2ZdWg5jpGYqkQ/ccdraJhFU62eFP
 EULN9atVYJFenlNUxboxpvGsOzpZNPhk3dC0notwCPNKUREOhvsEBd8UuDrOvLUE25PF
 aw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hax/XOz6L1HwvWdYp3TmUzlLwg3i5L7wNEbwhLs97i0=;
 b=3TqOcuS/1bSVNXqIR/ExuzAJtD51bKyKzvHvpgC3kmJRy80ShfiRJy9c/uW1NeNVwt
 g5cOG9blTYEraP/NTmB+KJKRpmLZbfRbslh/rMLfbroWfufadrTBPGGDD6H4J8q8fGUb
 QXgWflhTQYc8Z0RY9AQhHFv//0pPMNZ8QrVyDtmQVNoRWuu86Bym9GQmoEihJiGxlS1x
 8eh4/H3+9GvaF83AWbcX31fi8XwH+G9sHxkM6GqneS5A+90nkqo5m5CIiU6PjPIvgrDD
 H0np1advVu0iLUtAqHHndhPFQtF4OAMzDhTf0uap6GxVB74JwRd1o32CSa4gihnEblSe
 AygQ==
X-Gm-Message-State: AO0yUKX/jr9o6PMXTSRattbGrCsyy1Mc4N3vxwN6PtYkL17Ug+mT6XnD
 YfvQQmhseoAhIZDTCJ8o9Ju/WA==
X-Google-Smtp-Source: AK7set80AjZcNd2rjhy7uAaSO0ToODxDqACZphTSdCMAQyP7LWCQTgU7JuXFttMtB11ILszB/K+yeA==
X-Received: by 2002:adf:ea03:0:b0:2c3:ee27:457a with SMTP id
 q3-20020adfea03000000b002c3ee27457amr2929067wrm.33.1675779844002; 
 Tue, 07 Feb 2023 06:24:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d5645000000b002c3efee2f4bsm3224188wrw.80.2023.02.07.06.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:24:02 -0800 (PST)
Message-ID: <5e82a829-0348-e73f-4351-21caa396e402@linaro.org>
Date: Tue, 7 Feb 2023 15:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] gdbstub: move update guest debug to accel ops
Content-Language: en-US
To: Mads Ynddal <mads@ynddal.dk>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mads Ynddal <m.ynddal@samsung.com>
References: <20230207131721.49233-1-mads@ynddal.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207131721.49233-1-mads@ynddal.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 7/2/23 14:17, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
> 
> Continuing the refactor of a48e7d9e52 (gdbstub: move guest debug support
> check to ops) by removing hardcoded kvm_enabled() from generic cpu.c
> code, and replace it with a property of AccelOpsClass.
> 
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>   accel/kvm/kvm-accel-ops.c  |  5 +++++
>   cpu.c                      | 11 ++++++++---
>   include/sysemu/accel-ops.h |  1 +
>   3 files changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


