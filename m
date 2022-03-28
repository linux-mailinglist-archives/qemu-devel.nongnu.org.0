Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EF4EA1A2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:38:15 +0200 (CEST)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw7y-0001mY-AJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:38:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYw5E-0007gf-Pw
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:35:24 -0400
Received: from [2001:4860:4864:20::2a] (port=40197
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYw5D-0006EQ-6f
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:35:24 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so16546495fac.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pC3KAYqx4/pWTZmEZVXwW0JJjmhTPjb0N9WuTowOZIU=;
 b=EX50myn3PUMQg/7sGYcqRdtE4rg0gez0D2JHE6IyLXHNLaKtEKagWNWDY/IwJRfjzd
 uM3eYB7kxCC7eYBvvDkPJBBstULhVRcHkq+t3a+N7mLOZODB/JDxuJAsKGkQgaasSoIS
 fDzOBJYHevE4PoAZHrPjaKD5zASk/oDvjm0iIF4qnlX6UvDYJjphRgRP7ne0oxw04vyx
 0bIthHdw3k1rCP1hgafdF5gSnKAnc5rwng9JSs3LNxNEIPFzU5ysiQx76dideLR/t9Gu
 NIBJhSRVlLDoCk2OvorSGeus7Ht6WJlXOfaQbU14KCHMaYRacZzP40oRofIcy2EYs1WD
 SyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pC3KAYqx4/pWTZmEZVXwW0JJjmhTPjb0N9WuTowOZIU=;
 b=kVcpzcPPozNCzLQAGZGW2RhhkyYlHjDSAF2n9ybrza9CzixuSPEENyMJt9449RYni1
 /zHGNHhTujavkURpIPhbNoZQMzP4q+pxfs49BLikzcJ3VS3sMpL4qufw7M0K+cboFZud
 g2w/c0c0rUUhPpeFoYWmemIRhTXvRqOCAa1Z0b9YBw+ka/DNGCpDe4i6yBpSBJ4zBlUB
 zWGQ1s9EWS+HSIf28jwlC4WJmTGOLic3xGD0/GH3u1Nz2UpVcNkGKBKr6E6Bdo3/W4eL
 bHt2zorJ9SUJRbFgjZyRNEp7SvIUKLDCWnoOEEM5yARa57WdOtNkWS6EupM1jAwqpzSO
 51kA==
X-Gm-Message-State: AOAM5319fTISUeWpesfPuZmKDJFKSvd1lVK0D8OYXquTMqPfyFC0w2gN
 ncZk9QKASYUPtnOCMKZr3KZyuw==
X-Google-Smtp-Source: ABdhPJxOkbXYCH4LWYqVvPNoVWMsgj8q6psV1eYABK8WfDIngouvDGkpeaaZ4czu8XGof5tDyLhI5Q==
X-Received: by 2002:a05:6870:418a:b0:de:ecf4:e35d with SMTP id
 y10-20020a056870418a00b000deecf4e35dmr491588oac.101.1648499721987; 
 Mon, 28 Mar 2022 13:35:21 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056870028600b000d9be0ee766sm7005443oaf.57.2022.03.28.13.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:35:21 -0700 (PDT)
Message-ID: <da0c9544-3ffd-27ab-de80-4cdcda91596f@linaro.org>
Date: Mon, 28 Mar 2022 14:35:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 13/29] target/loongarch: Add gdb support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-14-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-14-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    target_ulong tmp = ldtul_p(mem_buf);
> +
> +    if (0 <= n && n < 32) {
> +        return env->gpr[n] = tmp, sizeof(target_ulong);

Ew.  Do not use the comma operator with return.
Split these into two statements, all through this file.


r~

