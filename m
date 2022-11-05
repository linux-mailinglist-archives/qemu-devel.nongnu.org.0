Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D061A662
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6w2-0002op-Cx; Fri, 04 Nov 2022 20:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6w0-0002oP-6H
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:21:16 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6vy-00073k-5H
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:21:15 -0400
Received: by mail-oi1-x22b.google.com with SMTP id t62so6767194oib.12
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UDT2kgPJr1NVMKNmOW1pfjGuDsgVBUXcmx24MG8pW68=;
 b=OBNUfPxAHiqYuGNoRK2yGP4b5PvOzCx+rATrV4JSiTlps1KnK8uUWIVnwEEJkViazQ
 kbKGWJfFX04obCCsVNQFiOHMqMLhYa34s5jmo+e/w3ycEZ1Tdmlr8OHMn5hELVw0GSYp
 6CuPRHmGIuGwzh+9J1orzCHIj9/u4VYkfIALvVzD1jgsHyoFtWgJ3H3zt1o8G1eFhENU
 pr0KtKdd6/Wdwg8feLLotIQB7C6j4HVcN6XkfSkbyw3j0ump5QEp9yvomngRy8Bmw0Uy
 qKZWZpOR94Rx2j3Z7AP0uxUR2fDbHO31qcMRq2Yjeqvf/jCPcpz1Tv0Jgi/oSyf5SZ+b
 KgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UDT2kgPJr1NVMKNmOW1pfjGuDsgVBUXcmx24MG8pW68=;
 b=1ekGNap81cy+SZ0KR5W7BSR96CSZ5OkN69eEI2j4be2fmACgRjpqK9ZjS7X10Axqxh
 T28WuEhI2SdgQb8w2/qNmJSZBmVVvJI5WfP7KRdNFBd7biS6D0Z9J9BSpx1A636GaVTK
 njiEmZCabeYi7XSuvu+3LSb4fID3CVrAjCl6GCZ83dpdeQKMzFKL5VNHGJsydnlNwweT
 eGdhS6U9beONLnq9oU3Z8XVOLD0ipLrVpiT7hcR6O2SPXstjx9Db79dptvjMl3v6M7VW
 AOCOolFQXo4W3EtOCm6jroCynJBfRB8pfQEg0DYqTmEpvJwa9lwpc7w88+ZQ9x3uL286
 VPtA==
X-Gm-Message-State: ACrzQf10iqaNfuoPt4QmXpKcORR8qieARSvC6vFbqaQBiStyqWx1Ywu1
 y1+w4iVhLBhvbUyzpuMiPB095g==
X-Google-Smtp-Source: AMsMyM524tVV3tL6u38LdXUju37qxbMECUXtlfPk8+wW7x2IxbA3MORkwXTtccjJUg/Op4CB4XBBNg==
X-Received: by 2002:a05:6808:1207:b0:353:e6cf:6d46 with SMTP id
 a7-20020a056808120700b00353e6cf6d46mr20928990oil.207.1667607672920; 
 Fri, 04 Nov 2022 17:21:12 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 ba12-20020a056870c58c00b0013b911d5960sm209745oab.49.2022.11.04.17.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:21:12 -0700 (PDT)
Message-ID: <e05fc3e1-f0d3-aa1c-fe5b-d65e452f4ef1@linaro.org>
Date: Sat, 5 Nov 2022 11:21:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 07/11] Hexagon (target/hexagon) Add overrides for
 direct call instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-8-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

On 11/5/22 06:26, Taylor Simpson wrote:
> +static void gen_write_new_pc_addr(DisasContext *ctx, TCGv addr, TCGv pred)
> +{
> +    TCGLabel *pred_false = NULL;
> +    if (pred != NULL) {
> +        pred_false = gen_new_label();
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> +    }

It would be nice to pass down the entire branch condition.  Trivial for usage within this 
patch, but more complex for others.

r~

