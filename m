Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CE57F1AB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 23:05:31 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFMJW-0002XM-KV
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 17:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMHO-000877-KN
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:03:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFMHM-0001aQ-Q7
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 17:03:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id i3so2800740pld.0
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PQIpiNCJ4RXu0xP6hC5qy4RikTJEXuTulwWed1G6lZA=;
 b=QagWJjq55el0aIZ1oE3SUyyd6bqqazoJgCyxlhEYckQp53uW/z30BYabqs7hhfOCtb
 Q3eY3YosjVFmJg+eM3JQa8lhRUov6xEAWeS/u3iBWi0ShH1ppeP03rpjDmSzBODBAGVc
 CBSN8qwxD/4nc3uQGircfpF3PZfKUfVWWrfNnurunb8ZFp9MTrU98QhwcsV3Ka31yjRQ
 8xf5Pipwf4fEf1lLN+kOUFp8sSY/th2AFzUOkluAB7dc0ytokhFfFiB70ZVPZ4nHMphM
 +CWXg10qdRoijRE211hFBmqbny+cyU/wPY5v8vfMhCPibaWJ8ZoiM4iMpRNMfKFXtn0/
 xE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PQIpiNCJ4RXu0xP6hC5qy4RikTJEXuTulwWed1G6lZA=;
 b=cbjJeAf3TOv6RvW9WaPwRfipl66ktv8iYxGG6nkmFlu1jKnCD9GeCabUw4acyx0KPr
 OVWU05y4dT49I9/gJIsKrX2eMrZvkA8XgmKg3I4npldpErr9jki+eRJqgOvVLuWhMuqs
 4hDwS7Toi3XO+Cps4yI1N1BspwkkNa0Ru1q0CWT6hCU22VPavH2SoWrXItsj5cq+rG12
 0NwnHv15vS8VpihHfGgAORBiikNP5LawlC/aWVfXa0pE3hqEiYxrXXPYb8uJV7e37mmu
 VFvTTHMncKK9Wt5FGaV2+ZVRgWq+pm/gomtSKCEERBmvv3+ML4I5IIWUYnrtDAy35nmb
 0TGA==
X-Gm-Message-State: AJIora+K54NGCZ6IaeiaRpccoqRshz/QuKyMYIKxgBefzbC0urrHsEdY
 69NXpa71SVBjVvWY56qZQ1kM/w==
X-Google-Smtp-Source: AGRyM1sztlM4b8TrnkXcAOiJXgRA9HQmUSKultiLTpg6SW3bRWsWk/aTISpXchpqGPnuWdfl4FvhbA==
X-Received: by 2002:a17:90a:ff09:b0:1f2:67ac:7bbf with SMTP id
 ce9-20020a17090aff0900b001f267ac7bbfmr4816432pjb.139.1658610193150; 
 Sat, 23 Jul 2022 14:03:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:be5:d810:1e03:c4?
 ([2602:ae:1549:801:be5:d810:1e03:c4])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170903024700b0016c20d40ee7sm6240662plh.174.2022.07.23.14.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:03:12 -0700 (PDT)
Message-ID: <6927ceba-cc7a-867c-7d49-5ac4d648ba8c@linaro.org>
Date: Sat, 23 Jul 2022 14:03:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Use target abi_int type for pipefd[1] in
 pipe()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <YtQ3Id6z8slpVr7r@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YtQ3Id6z8slpVr7r@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/17/22 21:51, Helge Deller wrote:
> When writing back the fd[1] pipe file handle to emulated userspace
> memory, use sizeof(abi_int) as offset insted of the hosts's int type.
> There is no functional change in this patch.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

