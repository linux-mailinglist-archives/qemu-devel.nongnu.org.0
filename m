Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE775A9233
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:38:52 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfit-0000Rm-Rn
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTf0l-0003QK-1h
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:53:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTf0j-0003kX-1Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:53:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b16so13562840wru.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gPeNL8HiZ8SVtFvmB+6JC4bTB7qSwHq7FgK5mXgqfb8=;
 b=n05few1EUdJ3hMIU33PejHu79a0kfsgn2UpeBbtxAD6I7eVVWgI8bRnMWpwrorUnQA
 1yYq4KABtdC/MMgg2V2eF7cJy/IdLuFWVkl78vq3KvwKbBlTF/pMW9ntxBA2qoXNRu43
 JMwIVW3d6qJqkkVroDKqt0JCLtC/CBrQaTN4BJflCyip5sopSpZnH1LJGko060p2TPIA
 0t+jQ1PgakssLmM0ih0xb8ODSkqejyflqduLywDVAqjBb/mqfbfQDyWpubasbp4FN2Bx
 oR36+wce/kaW7uHsmzsO4p3pBMzn+XRld4zx4TgYyzni3kCSnBELvjj9bQSmsYvgSvE3
 +Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gPeNL8HiZ8SVtFvmB+6JC4bTB7qSwHq7FgK5mXgqfb8=;
 b=hOqzqFHPyl/cbQBiiiSXbrvNdi8zpb5C4Ujh5+QTSMwC4ncDNUA9LD9F17flXk/PWZ
 SirA1aS4YW1awZ2QR7kvoKeoSdkBbESqc4maPDjEj16xWkm5ltaTHS6dX4xhFznhbIAs
 3bQaj6/XPzI8ftLqgoP5iAnamPZwAhT0FrXU/MNQQP3W2cic0qKoc9CLZyJ8rtifyYV3
 dMwUQfBiUxpWd+dGDc1UfI/qBAxIinbSNQYO2r4TFFU5N1fMj8dLqxdRGvIKp03cWQmt
 AfYxuIZgL3nh4w9rrZBEhpM262O2iwzHYvhOeLxMNwJVsNFqtIN9vJ7h9WsV9JS11JV3
 xQvg==
X-Gm-Message-State: ACgBeo0yBxx0WOKwTR2OEv+j26TtiS2zqVW9oRvcRuXTUcegiucvgtW/
 YxfmD168fXBsOsX9TrQ8n3/EGyEZBIP856Jg
X-Google-Smtp-Source: AA6agR70FyhEpeOM3CRsZPHWZ3a71QY0cMObb/kofjb+Gbe813d9IykFnPPiVen6g/TNbgQ0MAEMyQ==
X-Received: by 2002:adf:e711:0:b0:225:848c:d3df with SMTP id
 c17-20020adfe711000000b00225848cd3dfmr13663665wrm.552.1662018791453; 
 Thu, 01 Sep 2022 00:53:11 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6790000000b0021f0c0c62d1sm13930927wru.13.2022.09.01.00.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 00:53:10 -0700 (PDT)
Message-ID: <f55c7106-ee6b-d718-4d58-9ae7943fb376@linaro.org>
Date: Thu, 1 Sep 2022 08:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/i386: rewrite destructive 3DNow operations
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220901071111.43589-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901071111.43589-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

On 9/1/22 08:11, Paolo Bonzini wrote:
> Remove use of the MOVE macro, since it will be purged from
> MMX/SSE as well.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

