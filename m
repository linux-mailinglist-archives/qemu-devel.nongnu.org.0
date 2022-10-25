Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A860C92D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:00:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGiL-0007Yt-CD; Tue, 25 Oct 2022 05:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onGiJ-0007Mv-2x
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:59:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onGiF-0003UO-SF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:59:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so19883574wrb.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGzsTXy/dr8FDBMARVBX15XuVSSW0WnhX4ku4hj2rcc=;
 b=hC/3/N9u+dbdVGi9GBDUAUiarRA/zJgEK24MQlECxoI0hX+INNc/bFu/KIZR+qjVs/
 PiaYnLvllYIN9PCd+n68CXJw9pJGZnfaBEoH0V1j1+bh9YfeNFnKkG49q144ODrixU0B
 ogs7nGpR67Iod/JGDG2n4Ff8LywscXmEjZ3auk0WuWFR9iWK8JXG1VTAd2NMs811SCGb
 OS0ozAip9+2dKALn/N5H38/TkqY5hPFdSw662SrMqDoOa1oLDi4IqA/zJYrWs2bJ5CMc
 yWhLPUq/4pSNb67jMgtoOm6xC6x97sIgOqsUmtvfJWjuAOSlOVWA+bsrVIZOWT1E1o74
 u27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGzsTXy/dr8FDBMARVBX15XuVSSW0WnhX4ku4hj2rcc=;
 b=LikJzrzU7qv860XbacPKriu7eMcMQjlSs0wzGmqLILgqaekhxlBaRfO1EZLdWVim+S
 srq4KSlB4B/EClSkFmoqH7E48Q/1HMcLM9wcTh08KBMCfww/SIX9NO3vzmQlnyLKpr1u
 g5ony8EG8qsY6w5PjQlMDCBKI4JySDZE8hgk4cL2rmPOTWWaX1UKKQqC7TkPz7wULBAV
 xkhEApDJvKZQfz7JdBTxdiUYGsFUb8rflMwyOZaNMFE6pALPtaT7asL+cYQgRL7MHtQd
 4O2RC3nLm1mRHah2mgZrY/uag+QmJoYsLf12aItzSPQwZ4J4E8vYbhYNP+NsbCKuBrJ4
 cmkw==
X-Gm-Message-State: ACrzQf1YQt2RBbx6/NUZF9XHDmm7Aq4hmrpe50NeMsB50OS6pkNOmftF
 mO9ryzPo73zTXIb8L7tgxDoddb5fJzOYCZQ9qeE=
X-Google-Smtp-Source: AMsMyM7NqOAD6uK7iJpENBlNYqjXodqdI9PnCFVp2cmo5/0BpvEIJXjK7RysJE2xJtpS+2H6C1O70A==
X-Received: by 2002:a05:6000:1a8e:b0:230:848c:416d with SMTP id
 f14-20020a0560001a8e00b00230848c416dmr25253653wry.264.1666691950385; 
 Tue, 25 Oct 2022 02:59:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b003a3442f1229sm11018460wmq.29.2022.10.25.02.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:59:09 -0700 (PDT)
Message-ID: <2aca97e8-ee18-ee1c-3d5e-74e08be3c508@linaro.org>
Date: Tue, 25 Oct 2022 11:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 1/9] target/s390x: Use a single return for
 helper_divs32/u32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 21/10/22 09:29, Richard Henderson wrote:
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h         |  2 +-
>   target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
>   target/s390x/tcg/translate.c  | 10 ++++++----
>   3 files changed, 20 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


