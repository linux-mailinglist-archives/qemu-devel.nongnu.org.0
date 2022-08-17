Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A613597011
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:44:45 +0200 (CEST)
Received: from localhost ([::1]:44546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJLf-0001rZ-Om
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJJI-0005eh-7H
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:42:16 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJJG-0005wd-HT
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:42:15 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w197so15415930oie.5
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=th162/+QCyE+q3ybh9FlJczEQVylnZ5oCzlCpOcKIdM=;
 b=Ucx/VZ4bK4t0JucQXm7aj72dngi0TYiWL4sfXzC3HlppsTD9HhHmzYKQy+kuqdUvoY
 t3DnjOApXKHq2zdbGB5HD3r1gvypdQNt4uUK6or9ddaNCd4KoZnOZD/Q4tsJlZ9+RkfF
 3P3aSNOSvvybNBAFp5lZ8aeErN1cJeci3y/5rAx/SdNt7WmsH7vvIYuxHqrOH6rigGUi
 TiQziaqIgZoRdRHvY0JkuuVqWmhhsu/zrBJC+Q98AYYi7+64O0a3XjzltZ113N1KtPxK
 V8+lsRUSX0OURzjW6g4Y2ehbobSSE6gfJAXk3EF6dbdGXjGyD3AXNQ+ij/w0Cq4hp+8A
 pxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=th162/+QCyE+q3ybh9FlJczEQVylnZ5oCzlCpOcKIdM=;
 b=dUKBr5PXtW2TswCWknD3B9UAkOJuerm4BN5puYtIiUiquvO0I/jytLFjlT8NkJvogD
 J+6e4JfrJOJUGwgF/6QPcPf3Q7Vot5JBMjRLU2NJZSI66mpK5fA7w049zCai77gsXvCG
 y/K+Rikt2hY8O0syd8iTWgzNCG6qFbLUwr5XGdzLgoyiBm4MLqHN+xvPdR4x7ygYLVCn
 McYGXEclUcmeK7jORzcNnHVvdtpJaAn4fqknyB15fvcCDbZhQR+XnAnFlABMXx3AiFWG
 CbKzloBGwyKNTZ0TkvlFMPISlPgPOW6hJnrnd5n74X99Gb9aLDqqNoS6K50hE1JSys7i
 mumA==
X-Gm-Message-State: ACgBeo0QRcgTwfs33VD6Il8ksQbiE7OWEm0eQ7N1dYJDc//E/cx66cn/
 sQkm+RvLdhuXA3uF6+9g0WOTbw==
X-Google-Smtp-Source: AA6agR6v53qowifUKdJ00v6T21JdrczfSYxWzefwcG3fOkPGDjMqayBxgfdTHuWX4LIxHXnlFZ8/RQ==
X-Received: by 2002:a05:6808:15a2:b0:344:9c1a:1a2c with SMTP id
 t34-20020a05680815a200b003449c1a1a2cmr1540999oiw.84.1660743733200; 
 Wed, 17 Aug 2022 06:42:13 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f2:9412:75e8:df77:dd33:d368?
 ([2605:ef80:80f2:9412:75e8:df77:dd33:d368])
 by smtp.gmail.com with ESMTPSA id
 cz19-20020a056870649300b00118927e0dacsm2783366oab.4.2022.08.17.06.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:42:12 -0700 (PDT)
Message-ID: <2ff3270c-c78d-3ba5-58d4-1a2cd0a22f04@linaro.org>
Date: Wed, 17 Aug 2022 08:42:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
 <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

On 8/17/22 06:08, Ilya Leoshkevich wrote:
> +static void cpu_tb_jmp_cache_remove(TranslationBlock *tb)
> +{
> +    CPUState *cpu;
> +    uint32_t h;
> +
> +    /* remove the TB from the hash list */
> +    if (TARGET_TB_PCREL) {
> +        /* Any TB may be at any virtual address */
> +        CPU_FOREACH(cpu) {
> +            cpu_tb_jmp_cache_clear(cpu);
> +        }

This comment is not currently true for user-only.  Although there's an outstanding bug 
report about our failure to manage virtual aliasing in user-only...

> +            PAGE_FOR_EACH_TB(p, tb, n) {
> +                cpu_tb_jmp_cache_remove(tb);
> +            }

You wouldn't want to call cpu_tb_jmp_cache_clear() 99 times for the 99 tb's on the page.

For user-only, I think mprotect is rare enough that just clearing the whole cache once is 
sufficient.


r~

