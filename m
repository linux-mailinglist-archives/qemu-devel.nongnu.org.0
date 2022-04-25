Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC850EC21
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:31:27 +0200 (CEST)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7Es-0000sx-1M
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7Db-0008WF-0T
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:30:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7DZ-0006ei-G1
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:30:06 -0400
Received: by mail-pg1-x536.google.com with SMTP id k29so14469438pgm.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BxdbBk8JYGXof/nG9ugtyfr/HFuKG0q6gTvNTSVdTg8=;
 b=WiRW5sYy/zawmopW27XOdKFPCbAuJROWixarFhco2lIASTz3yOcCqOyvqXKnhdz7Tc
 il/kAPrY8W45PWBJliT5HGOOMHyFIvGi60fINAZZHsCXOM1VhFcT+PU/GmGpHKhL7P/7
 yelGonMR1RO9dUp9+i0+XazN6Nvi9n8fB9ifFTiU/bJ1tRgcPnrfDlwUe4Xxi9ay0Qux
 ng9nqJHBvD1Y4LuzPKrY6spHHCM2U9QsL4jWTw8s5XrqqZ5yxBxu5R7s7skE4/rt0qQQ
 HAjv1fIbzve9+8PPP4aQvnoul4wd3QWUt0qM1ejv564HkKBo7dvXTs2A7n7kDHCrtorw
 6KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BxdbBk8JYGXof/nG9ugtyfr/HFuKG0q6gTvNTSVdTg8=;
 b=Y8bb4O2xH2AXFFg2tzJuqAvl6Pp0sREVNs1vQs3RRjZr+vsmdxkdcPp86jVWiodza7
 XiPRq+qmpxVybiQHKG2zf2gdxVRA8BdaYXt2CwShuHyrHon/SItCMLTiCDuYpzDGuRlt
 fhR7H+Op9N4YILc5A7TAe9JAqHp8fiY5TVo6zKmJM2c9gAuhrmuHvP+kVNAQSwEAeB5S
 JW+dgCbdiIo2MLdAmR6fm/R76yR2InGe3uLYBoKCjz33bkGh6Z9KYjnTlV4CBdUCAhEr
 vmaR88wmltkDtNksO9ndS1opn2Q4+FTpxY9xSvoI9ditHFKqj+ZD0aF00XdVeX1HxtpU
 pnZw==
X-Gm-Message-State: AOAM531a/FAmP5hmpTYqWV1uJa/I2RoEXPerTVYur9psjhRG3uZg0LrC
 hXRlhniMOkxW+7y5kC2rW7TKiEYlEl4VdA==
X-Google-Smtp-Source: ABdhPJxCCvF+K3UJrFwKATn115AE/rWyL1D4YfTGl2+1Uq7n7zhgedOUHJ7E7bhD2zUFN5wHAn5Kbw==
X-Received: by 2002:a65:6146:0:b0:384:6471:db2a with SMTP id
 o6-20020a656146000000b003846471db2amr17143211pgv.4.1650925803371; 
 Mon, 25 Apr 2022 15:30:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a634202000000b003a0c6ec24d2sm10818826pga.89.2022.04.25.15.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:30:02 -0700 (PDT)
Message-ID: <6cb0fbee-43bf-63d4-460e-e5e033d164d7@linaro.org>
Date: Mon, 25 Apr 2022 15:30:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 23/43] target/loongarch: Add LoongArch interrupt and
 exception handle
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-24-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-24-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c       | 229 +++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.h       |   2 +
>   target/loongarch/internals.h |   2 +
>   3 files changed, 233 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

