Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92733C84C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:14:04 +0100 (CET)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLuXL-00030a-6X
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLuWF-0002ap-Dp
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:12:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLuWE-0007gc-56
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:12:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id o14so5592299wrm.11
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0zxZBgUlbORmzGXE9gtIXxdZorj/QROkkiveXBSqbSs=;
 b=fj0WZ40oU04DATZw5NuCKEBfrjUD2O3FeZoNyxrRr8wheeRSIPYbEYGNkaXZjeSPRm
 qXVgLQj2GMRzQVnwSfmUtGkAdquVpSJTcpChPtEXape76bW5eQldzCnrB9PBkULD/f4O
 FTW3GBJo2Goi/qc+0leFE27crRJMT3aqwWaTiwPmCI91oy+RsWsqxCKFQq46c1aKm9YP
 PAZWdOqOqL6RPX7IuG8SXPVQbLSgBitj9TKa0RmFddmBVwswZizFvVTvXrwSBwhG5d58
 Wn8QtSumbGY5u4WxI193WJQ0W/7BpdG1Hcr81m6fJMAuG5SQgV2Ce+TzrJG07RwpehbG
 JduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0zxZBgUlbORmzGXE9gtIXxdZorj/QROkkiveXBSqbSs=;
 b=U9j2QiNdotDd13By45cNyuBMN2d0g9ccpuDFml34w2/kZr4bwffERpoSFBGvmgdDPa
 95yEFwnH/GtQb/7XbVHPnhgd9a3crMGsqa7ZKuVaoPnL19iay52yXWIGAj/LKDMjhxvW
 VtLjpf4aP7ZfXojm1ENQAmDaAZ5jzXbom9SG4zb5TknDM6pJ3cfmfRCZqGmBVZCyS5gZ
 zkGAsiNDFgg6AHYYcViHzynYFfkJ4xaEkRThqVYFBtNt0QhRwfKVtl94AYeuQioKdCWj
 C1iZdrUkZxiNAI+iac1QKY6tOCW7R8HXeSB2pY9QrX6mO9F32Dws8lYq3SIIMLSpYiGM
 ovdQ==
X-Gm-Message-State: AOAM533rTYaqZ2kW8TGsRhqaQfQ1VWnHRz3Bx7k8URD+iJ8Fm53fmWtx
 qbv+Dna/ZYUwEzL6IVkXxWgA+IARPxZqsQ==
X-Google-Smtp-Source: ABdhPJxv9w5xFzjbVj5xjszHd2iKoVx9FKIQSiUwRcwWEHPFVTfDxym1ROJP23g6LqVRa971QQ+Nog==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr1466795wrn.226.1615842772283; 
 Mon, 15 Mar 2021 14:12:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o11sm19772386wrq.74.2021.03.15.14.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 14:12:51 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) fix typo in comment
To: Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
 <f228097e-68d1-2e4e-9ff6-443fb734a4f1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0313f837-6eca-d2c2-8dd7-db367fbe24a7@amsat.org>
Date: Mon, 15 Mar 2021 22:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f228097e-68d1-2e4e-9ff6-443fb734a4f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 8:46 PM, Richard Henderson wrote:
> On 3/14/21 10:55 PM, Taylor Simpson wrote:
>> Signed-of-by: Taylor Simpson<tsimpson@quicinc.com>
>> ---
>>   target/hexagon/op_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Queued.

Can you s/Signed-of-by/Signed-off-by/ ? ;)

