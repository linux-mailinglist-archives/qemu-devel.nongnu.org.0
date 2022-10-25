Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89F60C34C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 07:34:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onCUU-0008NG-J1; Tue, 25 Oct 2022 01:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCUQ-00080c-Uy
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:28:38 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCUP-0000q8-6n
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:28:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id g62so6858173pfb.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pI8JTTWpt3DzMWsuIoc+QKZfrdpIUB2F7AdXzu7pqPM=;
 b=T9OyfA58o3hhTAU3QEyYHJzwjq3NwH3BfocIIRmqFXUZWKFPRi0zubcJ7SlseEP+Kd
 385HzlULXzODNQs4J7it9EaYZAnTnf8BCTcupMUKhKkTAK0h4D1lEp2e+eg4qWqoJC6i
 Pt4UVg6Zicm8/cd5TnKkQ7ITLZtNT04ALF+cCMOZ9jaKHCf4lYNmRGyUjkxPfStFIWPR
 WucLHdr0/iQNK5RNYMBQVHf4IUpIX4OO19y9mWi1spNmmyBith88uejdX0PQdIZmD9E2
 u9+U9ZHjVe7bGPRQTKVZ7LJacAiPoHVjp2pws/GPCjIdwRNniOByPft6w/rtVg9p5O1x
 bNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pI8JTTWpt3DzMWsuIoc+QKZfrdpIUB2F7AdXzu7pqPM=;
 b=JprPULYm3VPMPn0TidGTXUvUwYQ8PCKRILdmCCoGpE5gfU0NFF91BfvaZb6hEusCx2
 DMycj6v28A/2VPjo8v42zoy3e+p9JSGFr+tQ4fQlkhxw5eunPsOQlCEgPH+BbStojk3L
 xZOXK4HgZqagrGQs5fuLENpS7kAtjkLlgNRd9tgKtqZYAdyOcZ6nbcNo6o0Il6o6TRtj
 w9IU+GTU8CAeNMnMJ+qCDjfUEU8cSyIpmhHY8RyYNsY47s9/poHrmcDXKWlQ+ldGYrsp
 Yq6EIaP1X0xWiNHFUkMrEKZxHEP8hes0/3GCQF21P4cxDza+Vu+uMKeD+t5qHGLgX9b/
 r6yw==
X-Gm-Message-State: ACrzQf0q566Dobb4WJZZaMOhDeyjHlYBpUmMryWNDPxLui3ak9xXnBrN
 yV/dMsSSMPYxHrOVAGI/rWK3BA==
X-Google-Smtp-Source: AMsMyM7X1UlyoeNPyGdQArqUHDZf8DrmKn3ZfkkPiW7wKku6l0v4j3dCDXtrXlTPRIGnWamw+JfoAw==
X-Received: by 2002:a63:5b58:0:b0:452:2ba4:f86b with SMTP id
 l24-20020a635b58000000b004522ba4f86bmr30480075pgm.223.1666675715093; 
 Mon, 24 Oct 2022 22:28:35 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a17090a348f00b00212d9a06edcsm4273904pjb.42.2022.10.24.22.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 22:28:34 -0700 (PDT)
Message-ID: <39596a93-2fba-bff5-78b8-f6f837d6df9e@linaro.org>
Date: Tue, 25 Oct 2022 15:28:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
 <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
 <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
 <e3d81adf-d47f-98ad-9f41-f55c1f73e9c8@linaro.org>
 <f7136170-74ea-fe88-4053-4c38be1541fe@gmx.de>
 <187daca0-b513-9eba-05b9-5f07eeab634b@linaro.org>
In-Reply-To: <187daca0-b513-9eba-05b9-5f07eeab634b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 10/25/22 15:24, Richard Henderson wrote:
> It would also fix a bug in that the host page permissions do not exactly match guest page 
> permissions, and you're reporting host page permissions.

Gah, not true, we've already probed page_flags.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

