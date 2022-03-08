Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89104D200B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:22:33 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReTg-0001NS-Sc
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReQ0-0003RG-SU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:18:44 -0500
Received: from [2607:f8b0:4864:20::636] (port=33493
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRePz-0002rg-7i
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:18:44 -0500
Received: by mail-pl1-x636.google.com with SMTP id m2so11844615pll.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2Gpg1kk9TAnA8k22VnLjamGo48aFRo0/nZtzqkXXD8o=;
 b=vDLDrW3Agapm1340HlcRgPsHRjf7LfG1KeuY+GWY0Aq8BsfYCTEsV9SrvVhWi/pZe/
 hpBNn2bQNmeRhAqzHjLLFtzxyRqEKWyNz1h1dDd0gSESaBi3bklHZHqgi4ZnHVZW959B
 dYVbuUT1HO5RXZXmwu051Rl4TSeRDmQku7gi2ZjG9mWnlA7AyN8/cTSEraL45zxzsFbS
 sic+ce7/bYRhcrwPS9gbBNqe+P+FcOMb9CqSvExPiiri4CFI0kloSyfrKzCU5PUz5BRE
 lDMd/b6wFu63wCI/bHAKvdmCoovzu1Y2hAASKSF//sDQMN7fNC6CNP7y61f0x3b2UHzd
 JgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Gpg1kk9TAnA8k22VnLjamGo48aFRo0/nZtzqkXXD8o=;
 b=X00N6S9VhUYixXYiiORS2wcCkek2A9Mt14riutriJv4ydZuQIedOKn3uvRUrvG5GKF
 3fgUEcbFThuC+2GzvkTjat77cw4kkWK09TYeHZ0ACyiYTnCKN7BnBo+TW+8qdqtZCBH2
 EykrwHakP/H+W9LjJ2zI0N/3T8YHCff/QADgFjX39voajUY4pA38+fIFGXoJjx4EXD+b
 /xfkFpCP3IqmRbgxFvyq0OYn+AVrRGWtp5X1JWLSJroEXO7njY89xDCHsYjqwy8qAgC4
 aA23VL4RKZUqVD909rpv71T5BO+3v7lPB1Y/gai7MgiXCcehO1PLE4GKf5g+eBoREUPs
 SI1Q==
X-Gm-Message-State: AOAM530r55ehpMb/FfL6+D4yYUZFsfTIo/yOn4Kdmps5BNmJatO+0mM+
 /i4Cg8yJ4WG2H0WqMD0hlx6pFi6UXB2KkA==
X-Google-Smtp-Source: ABdhPJx2+su0+ThCOY5sutb3OuV6igANKeQPr6Scz/QkameIuDwE1wawyvbNj8X1GrGHqeHcj9QlAw==
X-Received: by 2002:a17:903:22cd:b0:151:a884:d444 with SMTP id
 y13-20020a17090322cd00b00151a884d444mr18993379plg.141.1646763521786; 
 Tue, 08 Mar 2022 10:18:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h10-20020a62830a000000b004f73c34f2e8sm1747097pfe.165.2022.03.08.10.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:18:41 -0800 (PST)
Message-ID: <5439b085-8cd1-9415-5545-362a7582c4e5@linaro.org>
Date: Tue, 8 Mar 2022 08:18:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/13] hw/isa/piix4: Resolve redundant i8259[] attribute
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-4-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-4-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
> PIIX4State to make the code movement more obvious. However, i8259[]
> seems redundant to *isa, so remove it.
> 
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin<mst@redhat.com>
> Message-Id:<20220217101924.15347-4-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/piix4.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

