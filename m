Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942CE433F11
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 21:13:21 +0200 (CEST)
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcuY4-0005XL-7o
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 15:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuVA-0003No-28
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:10:20 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuV8-0007JF-Gv
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:10:19 -0400
Received: by mail-pf1-x434.google.com with SMTP id f11so787441pfc.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=keuKbhgIhUNl4ajky70elvabJ7nlgRdaE5IsH3NEjeE=;
 b=utVShZgGZmSwTl6FfdUIupQAeh5CEiL0XZ0AHvI568jaYhrignA/8XWXk9jHtGn9yS
 IO1Yc9U+RNUwmIm6AB/cwjNBuhDq1wqtajWtJasI4yqQaiBsaPVG/8kxKYfeH0Cuaoho
 wXzwbgMpw3g8NBpj+mAa6CEa2Kzx0wuhFj9pm+wMlTxf5am3qz7l3s6aQa4eDxMmKSQH
 yLsdZU19C/JQEiWMaonaGWxvTsJ1qzWwLpQVeXbxp7ngc8NCpSKzacEZs+RxxVwbj0UM
 3A5CsY3dRNIHpNVm+VknXV2TpWQnCaSj8EW3zfdjilYFa7PkmYGDKir3QRCeUHXu8sdD
 ZU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=keuKbhgIhUNl4ajky70elvabJ7nlgRdaE5IsH3NEjeE=;
 b=di5EMU7st9IouqJwVjq9pllqcAOB4StFdr30wJ/15SuGGGkCdOuE1iPo4TUllHGP3w
 JbqPdTkP/ufunAXbukLQYU1PSGZNyyuNhqlWlXW4/zAIIO9QiWs8LhpGwCGwneZRZ5nN
 XPt9zfmoiUVn09oLK7hQi6WQXqJCleQqPlKfkVzTP3GkaMkquRqD4LfHwQQ7/Q3jmepG
 0r/MBvRsnt95qwMQl1CsDGs6NuL5sNpWU1Nku8bfdHKuZN4sGopUmBUmeyLUbzUGUNzs
 9F5ztX/V9j43OsLTt0Rlw9Pdj0Vl6SqIaR16CwHeZjw4H2FcOME4JUk5x+Ig3i39EWto
 Y2Zw==
X-Gm-Message-State: AOAM5327IsQ0C+kLT7piV7FHA51+ehWsgd2fRbRN/WAEVb8L+zrXCslk
 hfQydK00YJayQ1QFwIrNiuj1NA==
X-Google-Smtp-Source: ABdhPJwNucwXVlrsnHqvy8vHk/7b1PMhytP1VNoSx5pdWM+v0Zy5AY1qy3VjiorrX1PsqLfeyDK6qA==
X-Received: by 2002:aa7:94a8:0:b0:44c:f3e0:81fb with SMTP id
 a8-20020aa794a8000000b0044cf3e081fbmr1696093pfl.6.1634670616603; 
 Tue, 19 Oct 2021 12:10:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q10sm16830738pgn.31.2021.10.19.12.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 12:10:16 -0700 (PDT)
Subject: Re: [PATCH 02/31] target/loongarch: Add CSR registers definition
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-3-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a5d3208-e9a8-0dd0-f41d-18678ae50b9b@linaro.org>
Date: Tue, 19 Oct 2021 12:10:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-3-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> +/*
> + * All Possible CSR registers used by tcg
> + *
> + * default value  in target/loongarch/cpu.c
> + *
> + * This macro will be used only in:
> + *  > target/loongarch/cpu.h:CPULoongArchState
> + *
> + * during translate:
> + *  > helper_csr_rdq()
> + *  > helper_csr_wrq()
> + *  > helper_csr_xchgq()
> + *  > helper_csr_xchgq_r0()
> + */
> +#define CPU_LOONGARCH_CSR    \
> +    uint64_t CSR_CRMD;       \
> +    uint64_t CSR_PRMD;       \

I don't see the point in this macro.  Just put the structure members directly into 
CPULoongArchState.

In addition, I think you'll want to include these members unconditionally.  We have found 
for ARM that it is easiest to minimize the differences between system and user emulation. 
  Having to ifdef each use of the csrs does not help.


r~

