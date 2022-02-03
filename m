Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E44A7E91
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:12:42 +0100 (CET)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTU9-0000z6-D3
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTRj-0008RP-6o
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:10:11 -0500
Received: from [2607:f8b0:4864:20::636] (port=46919
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTRg-0004ER-LL
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:10:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id u11so1076928plh.13
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rI6yvGjpYrIBV2NV/qzdImFGC/UMQWIzgQnwJw27qLs=;
 b=uHx5LoDt+2wYkWRCRdDUNCbdRzEQGYGEDAZZSv80aWiQbzxVypqaNPJMCFzHCeQbaT
 X/N5Gk4TK5ibvwmeFn28S6/Qb7bZdFMvCLqkDTNOOZa3WtVs74z1xRaSB3+BQqOjPfUb
 Ip+8vwKA8PhmYDFi27E4SAmWpz5vd6JRBhflmCJ6rU4dFIZjv/YNSOjLYY2b+bq2et/K
 F8PLGCymTYOKlsDgQD/xpvJ2KXo5jbRdLly5hA0TQXl09+B/RngQRTOUjswlHe3ClY4C
 uL688FkpcJTaApkIG9nbcUpESuF+DPZxvmmODOLbQzH6PiVqbCRfJ3ZvrwaPgC/N2JXb
 BmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rI6yvGjpYrIBV2NV/qzdImFGC/UMQWIzgQnwJw27qLs=;
 b=KgwAgexYa1Cod5S6wddMZUx52bK5/g/HMLbr5z43wg5sh/0hPNbVQfnZN5/ZhukTV0
 WOPauWzKYCC2Fc+5iz0o0ds3PZCmJKX4SVHzYrkboMQy5VNrwc4OAAFc50zFd9j9YhoH
 U2V+YuntY1Lgb79TOW7VSjTU8tdAp5B25J4buwStk+QHfUZQNwk0AqZZUtlac2wq7zIb
 eXACjbGyiErmCqwtGGA06dl0cbELuffy1rAaT2FTf8STQV8p4r+nda2v89TaLJ4B5y1v
 UZXlXgONSh9XF7kDBx0OZh046b8Ei3d8PzyjfFn5mQEVCMgpuX+UHvVUSOKg0DenpOok
 Puqw==
X-Gm-Message-State: AOAM532giWdkWQb1MNliNk4R7wqB5JTGoz+srH+Avf180JBAsOq2kXNX
 5L5UMOCkfdhneyFBss1HNxQn2Yyv2OvkFRZx
X-Google-Smtp-Source: ABdhPJz81keYV3Vdr7GTo8/kmo9CGDz8vEpxalW+8V56L8xYA2aJcrru5TVZefT8W7/jCj9wV3ofdw==
X-Received: by 2002:a17:902:dac9:: with SMTP id
 q9mr34119845plx.5.1643861403442; 
 Wed, 02 Feb 2022 20:10:03 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id oj5sm8610448pjb.53.2022.02.02.20.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:10:02 -0800 (PST)
Message-ID: <2f7134c8-568c-6b66-394f-6535c443de56@linaro.org>
Date: Thu, 3 Feb 2022 15:09:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/13] hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> Make the update_ite() struct use the new ITEntry struct, so that
> callers don't need to assemble the in-memory ITE data themselves, and
> only get_ite() and update_ite() need to care about that in-memory
> layout.  We can then drop the no-longer-used IteEntry struct
> definition.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 62 +++++++++++++++++++++--------------------
>   1 file changed, 32 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

