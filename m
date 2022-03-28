Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1B4EA18C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:33:43 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw3a-00049q-9t
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:33:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvnT-0005LI-Q0
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:17:03 -0400
Received: from [2001:4860:4864:20::2b] (port=34885
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvnS-0003Zk-70
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:17:03 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-de48295467so16498919fac.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1cwItfnSyUsGIh7YZWTkLSAmGgp+1d/ElsMGQM5mmlU=;
 b=YZIxrWahZ1b9kL3XPRY10IcIsy1WtmRFbpRZD9nYjr2v5KmDP4/9Ek8hmf+Nsd0Xuc
 GG7tp5vKkZqOLGtkX9o0Z2D5cKUagC10JiB6FjetehhZ3QzfaQN5EX+r3TikZHpR+JpO
 hQPpLZSjXeaTBA8xp90N3hrxv/3JBo/0/JnAPOG/U79Rw6FR/Q64m9CL9N4+7uvd/Ucd
 jx0XNEdipirXyA7WQX20AdnKPjXJKcRAW73lKnNyPseadE3QcshPfAJgnYLwqs/KbP8I
 qcgdWoaLy+q1FeBdJmLfiBqwLtkGOYmNkzAzWNaLQHEamyS+wIA2599cWU5RhA39OMe8
 Y7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1cwItfnSyUsGIh7YZWTkLSAmGgp+1d/ElsMGQM5mmlU=;
 b=1xhI/EGE9vVOF5HP2A1p5jtw17orbMxROq8rZmKOcQt+xbkGO3qaAUQh62diy7BdGF
 13/Ezyy+bBJCp+ApBdl7XHd7vSs6aOkU1X9iRoVIWYXnsTSdmUp/v/SNNJliTEvVDjRi
 Zdzz9s7d/1r3hg1HwdZK1kIZWnEs5bTY6iMm3TJvQiU8l5kAfBGyrOtcw9ySz0HChfAO
 tnmiRwaid6ofbKA+5o8uVrgVmq4oompr4lKfMMoBXihlC6+Da3zS9pI6VyGTvvmMXqK8
 KSnIWaDjZzZADP8iM6oU6YizM1SYfHKEhKSgpPNbeB+gThdtxsfSCGWBO63TGXVbnuwJ
 wSOQ==
X-Gm-Message-State: AOAM532Q1ofJNRCAOXxH0aTfqT2iF7iuVrlgn8q8KNwGVDCLMw6OriQx
 a6iufYnlmWk02746zp1ZjjmtwA==
X-Google-Smtp-Source: ABdhPJxTIZIbHrN8A5w6Wn/D9HGN4HkTO+0Y34SgjER2kqh2OWUxqe2jz1BDiamPUg+Zm2FW4xPQ2Q==
X-Received: by 2002:a05:6870:392b:b0:dd:9951:c90c with SMTP id
 b43-20020a056870392b00b000dd9951c90cmr433410oap.33.1648498620619; 
 Mon, 28 Mar 2022 13:17:00 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r35-20020a056870582300b000df0dc42ff5sm1061697oap.0.2022.03.28.13.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:16:59 -0700 (PDT)
Message-ID: <a68c521c-75d2-cdbd-745c-d7c6b820bbdd@linaro.org>
Date: Mon, 28 Mar 2022 14:16:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 10/29] target/loongarch: Add other core
 instructions support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-11-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-11-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
> +void helper_idle(CPULoongArchState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +
> +    cs->halted = 1;
> +    cpu_reset_interrupt(cs, CPU_INTERRUPT_WAKE);
> +    do_raise_exception(env, EXCP_HLT, 0);
> +}

Why are you messing with CPU_INTERRUPT_WAKE?
You only ever reset it, and never set it.


r~

