Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F39569E46
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:07:15 +0200 (CEST)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NTe-0002cm-9Y
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9NQK-0000ij-MO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:03:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9NQD-0007yt-65
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:03:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id bf13so4264528pgb.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nTAG0sK3OZMFimG+6swbnNLwbrzl47FivSBbmLwwLEU=;
 b=swB4Ed3gCblkzSTUr+t41w/+PuJvvpMQzLoYR034NAqYPATgnS7LKOc+Dnz7xBrD1j
 +ZXBO5vKee80I9ExTtIly5b5f9wK5OTst+5Ta2OLPh13KQukMuzCIO65x6Cx6+VkT9m7
 Vb+hS9RledMFHnXpolv0IejQAwqCgu60djhWiHqyyzKm2SehXTLtpvbGYW1vGN2HiTBl
 g9sIOBP8UcOWOo6F9G81mL4W5FNt4dJ8dOnLNCm2wKvDZPQULLWuK5c/5xenf18lBk4S
 Sm3BxJndiUwKwiuYW3HizirJBoly2mcWs6pGfhCLXdRPquQSKroCwZZ25zbN+UumwZdw
 zv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nTAG0sK3OZMFimG+6swbnNLwbrzl47FivSBbmLwwLEU=;
 b=Js35XTuJaTXAWlXB9DJ1erhufYmZhgs2q7uYl8PYTpBoSRQGMZ7v7/ywWIgo0hnRk4
 6ML+RRM3HUc/PWSMxtqkqOBbrldk6CCUhcpHKBjfmHgFw/DpQH1YiQ/Iw1wR3dsY/z3j
 962yBz/Lqh5EbiCODzhKTIo6rr+XShyFN6VLRM+wLRN8fEJBsL4cvGDXT/nOqEhY6uce
 dIkzEST094pAN7w++x0xopt6WoJLIZhn3fymy4JacpYGpOwNG8GAT/ug6dDmwVT63RNz
 aORjP+6lFf1W/tXyAJeWMQBCpomwUi2Z/lJRoI5vGoBm3nHWgVxfM6X9qAMNu53HzOok
 cX8g==
X-Gm-Message-State: AJIora+CNtEeLlsYOH+RlIff7bHpVKhpr9kyg3ohPyOJ21qdXRmQzPM3
 JkWcl+7yy+fAvKYHbPjEbGe2Ig==
X-Google-Smtp-Source: AGRyM1sHPD1Gg8UM0KGk0q0Llu95MsGkl/AtOf7TEDrw1Nc7mG/+m2j2yv6OkiARr3/oGJtAnl1m/g==
X-Received: by 2002:a63:795:0:b0:412:b0b2:967e with SMTP id
 143-20020a630795000000b00412b0b2967emr4542600pgh.237.1657184618202; 
 Thu, 07 Jul 2022 02:03:38 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902d2c600b0016bec52760csm6993612plc.271.2022.07.07.02.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 02:03:37 -0700 (PDT)
Message-ID: <e8266519-60d6-efea-ac7f-8ce01054ec38@linaro.org>
Date: Thu, 7 Jul 2022 14:33:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tests/docker/dockerfiles: Add
 debian-loongarch-cross.docker
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220704070824.965429-1-richard.henderson@linaro.org>
 <7eb19536-d58e-1dc6-bcd2-1c91cb451cf7@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7eb19536-d58e-1dc6-bcd2-1c91cb451cf7@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 7/7/22 12:30, gaosong wrote:
> 
> On 2022/7/4 下午3:08, Richard Henderson wrote:
>> +RUN curl 
>> -#SLhttps://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz  
>> \
>> +    | tar -xJC /opt
>> +
> 
> We can use the smaller gcc:
> 
> https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-glibc.tar.xz, 
> 
> 
> Tested-by: Song Gao <gaosong@loongson.cn>

Excellent, thanks.


r~

