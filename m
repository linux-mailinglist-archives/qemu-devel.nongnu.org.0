Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4295B690A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:53:52 +0200 (CEST)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0jv-0005Dl-91
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0h7-00032w-KR
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:50:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0h5-0006GT-UF
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:50:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b5so19335629wrr.5
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=j6/Q1f4wtwAa8XbwzPVxkQJFqMbBEXv7jTq7YYmbUZc=;
 b=msmwVbXGrboLExPI63oA6NgOBv4YPjnL/tdpUdZd2mGwWaflwUDdLYtHeIzGSA+3N2
 UaWvsRU2u1j9jxpFoh4Cvgpze3s1MXGq/SQ4MjADZaVUCEcsMOh5gUCUBbNYlKaE+rPd
 RZP9wLPW6MxzPmLMUVG1/+FroBUTd+SNy+fT6KNqRea35F1el3n7MEhVQMVYsqkHALGE
 5qep9o68xj10h0Hy8bEvE8k6qRDSdNcZqYjk8Yw+PapvzJH7XftKHKX1pcrfX8eBAYu5
 6HzaOU2Erw1aNdHvRjjvemIedcly5bKlaoOh1ezwm+vu+N+AMuti8ayUXqgZsd99v7g6
 B/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=j6/Q1f4wtwAa8XbwzPVxkQJFqMbBEXv7jTq7YYmbUZc=;
 b=TJe0aAkPQlfY9ifufq7J0/xJQRD4F7GEGsiArLL0KrdKrkOEUUUW7iePNIHNwjqIk9
 klrjt4sugS0LG5eZbyVmUBdx1rfBZXc4ZYq21ywjyKhSjT4Vjw9Wf9d57vua6P9Ho5La
 u6gcabSoxN60gGxuIaPxzEInBwGmzPmCnIImMhc/LcwApKAv4GolPZ5hvxCyPe7gmUjL
 bMKn/IqQS4zZI6djMkC/vq5YIM07tB0+9Zpqv2mlBoMh0ql8iU8rY2hh+ZS24pBzy1oN
 EdrjR1k3bCkNdotCmThKHJM9efaMsRMV37JcmRDVSMbKG3/Yz+B8y7VPbRFZlOs0Hzdy
 i40Q==
X-Gm-Message-State: ACgBeo2wSWOR6pPf83ua1ESH9UdmKlcT+gIAgBjrkXbaKIzWr6kqI6iS
 A61fPcAbr/YscMUxA0dxDsCsng==
X-Google-Smtp-Source: AA6agR72O0GH4U/rL3Z9OUrV6AW3BvTmq1OgWnX4Qqy+TzeuwNkMzOgYmWvnMP5rNxPMz3wjYLV5mA==
X-Received: by 2002:a5d:64a4:0:b0:22a:8633:2d59 with SMTP id
 m4-20020a5d64a4000000b0022a86332d59mr5610035wrp.216.1663055454001; 
 Tue, 13 Sep 2022 00:50:54 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a5d6609000000b0021e51c039c5sm9609226wru.80.2022.09.13.00.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 00:50:52 -0700 (PDT)
Message-ID: <fc65a90e-4693-009e-f3c2-1c7c4bfc7b74@linaro.org>
Date: Tue, 13 Sep 2022 08:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/24] disas/nanomips: Delete NMD class field
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-4-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-4-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 13:26, Milica Lazarevic wrote:
> The m_requested_instruction_categories field always has the same value,
> ALL_ATTRIBUTES. The only use of that field is within the if statement.
> When replaced with a specific value, the if statement is always false,
> so it has been removed.
> 
> Now, when the only use of the m_requested_instruction_categories field
> is removed, we can delete the field declaration and initialization in
> the NMD class. Also, we're changing the way of the construction of the
> NMD object in the nanomips_dis function.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 13 +------------
>   disas/nanomips.h   |  4 +---
>   2 files changed, 2 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

