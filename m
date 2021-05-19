Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21344389349
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:11:10 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOmq-0003kD-Tu
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOiC-00069V-VI
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:06:20 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:41809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOiA-0003kG-Jl
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:06:20 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id u188so6993621vsu.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xom1It42oRKlw9M3w/rXlu3YUUp4w/l1+6yi5YVwn9Y=;
 b=cWCOY3LizHRyNz1kbZfsFFrk2PG+zmWt6me8PqjhAvNB8n43/TXuyGFQQ8uPLxvm59
 kQnocjMtEJbC25QiXGqjFk1vmdHwkRDfPjPob6MqO/VigWFCh4uK482DZH7JjrvS7ZZM
 7pJcKacpKVp7kUZkOqfduaNYcm1a1eYSNujFQG/tCi16fYo538MkNv463A7oV2W/5b4+
 HbEmlcpGpo4VXJ3pvvPaFeSoh/bcwThrnqg2td4VlmpL5BHL354ayn3M4d3mmyvGVcUa
 RzFqazby3FmwraOClYPFAGjG6nWarv2ipuxNX9K/BpSxCV/kJHEKTpQpyUf3A7SRvIMe
 PYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xom1It42oRKlw9M3w/rXlu3YUUp4w/l1+6yi5YVwn9Y=;
 b=hjMor1jDnbHepkIxX/lcWDMGe/iti5iN6ULpGm0IafJKFvWG8QZ3fq5ZJ45BIheQBi
 ZMfkuD6qWtB4JchQSl9B5t5jfA4vuRpZ2GFUngCXvvogkp5plbBqaYzQ46zNp9YR+f15
 zLq6oQg2MpuWrA8WFEn0I24/IW/hPwhzUAzy4aGaG1f9wB2oD2VF7vQkA6KAsS0pmyrS
 jHsNKolz+AVFqqb6dbxduYWd1Rf2EFYuqlBHy4s4K2QNUolwEPi3j7pHyCV8zaPdYK2L
 nbltgO+J1cs33XNlLQI3WUCfaj7lAyA4Y6uZaKAftkBctBFYG1LfDREuU1QrTTRtp6R8
 JdEA==
X-Gm-Message-State: AOAM531gWJ8VzLCIxGC/5GMOVb/8pNpHLXjOx2lMTPXzDoq3cFshXlPg
 ExCuZvfxyMKCG5zYTdGNmgNlR8O5C2R2a5cU
X-Google-Smtp-Source: ABdhPJxNyD/gQkGe2KBm+woe0q41PzeSfNHDv6PofGDi/qkHPayjO06Qy4Qvu8LVKak/b87nF9wswg==
X-Received: by 2002:a05:6102:2f3:: with SMTP id j19mr22214vsj.1.1621440377433; 
 Wed, 19 May 2021 09:06:17 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id k79sm5275vke.56.2021.05.19.09.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 09:06:17 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] target/ppc: removed unnecessary inclusion of
 helper-proto.h
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-6-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6df1dd2-6e6a-2bd0-c0f8-f1985836efbd@linaro.org>
Date: Wed, 19 May 2021 11:06:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518150515.57983-6-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:05 AM, Bruno Larsen (billionai) wrote:
> These files included helper-proto.h, but didn't use or declare any
> helpers, so the #include has been removed
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/cpu_init.c    | 1 -
>   target/ppc/gdbstub.c     | 1 -
>   target/ppc/mmu-hash32.c  | 1 -
>   target/ppc/mmu-radix64.c | 1 -
>   4 files changed, 4 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

