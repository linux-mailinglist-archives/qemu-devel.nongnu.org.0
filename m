Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D750EAC0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:42:48 +0200 (CEST)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5Xj-0000yb-Vz
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5WN-0007yT-EM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:41:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5WL-00073V-QH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:41:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a15so15922788pfv.11
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CZgo5cQGEcB3cJ25hk/sFbDN+qld8u0x84XYGi/wnyA=;
 b=RvtGerlUoYBUsd7287Ql3jnuvpR9V8C7tnOmIE3YQ4jo7+VtlS0eGey4nbs5A5hhnb
 MAQGACCc4eXd2Jm3B6lg2qylFmGlEbcVX8lBX8sUL1/D3mCvb/CKNpDVvaFNXu68FUK8
 f9A9q6v5SdAnEn5kfuDhXfLI8SlisSQu/qZAt2UrfoUAFuus0sVZedCTx6o2DgyDDwJW
 u8ZSzChpxxTcdlZcXsT4eHPJtdOOps9ZXuR3fHFbeyJ1JkSkR7PDxLqgubdULmtxYuwS
 bmiw+NIazIUexCm+VyOAnfDpw+Qey5rxb0K8/5nosKwZxWl52Jmm8/fi/exVFQTtW3RE
 TaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CZgo5cQGEcB3cJ25hk/sFbDN+qld8u0x84XYGi/wnyA=;
 b=mRbay9vrd9W0flTHO9qTJESAOa2Sj14AOzR5ZSRV5n9XO+NV7069jgH3bUXRYfbUFJ
 ZxUCFf6eI8WJxUUz4gtT1vhT6tgMaRQ9ms5zQ06gYrx6LHbE3uo5GtwJe+QvM16f0Ee2
 tp4UdLM8uJrF3x43k5FJcX7xX+DpMnWrVkJGJUJ8WF5z61z/FMXS3qtD8JCHBxb3b9l+
 6Z+HUGTMNKBO1Kv9J20F/sJid/lICENcYUU+mSptmJK0dohQu4B14r7n1B8E+CKsqxnr
 rKE2Nn2ktTz01/wCU2ZzXqBbTQRUD3K6DLMsOB9rs7l1nLE7NZW3/Q6gcnCvNhsJNWLC
 cmpQ==
X-Gm-Message-State: AOAM531TU9txiP9U+0VYTXmmLO9kfzrf4HcTba5oAP6tlKEfoKmCeMYk
 N8OyC5rRIa+1GAMeaoaLail6zw==
X-Google-Smtp-Source: ABdhPJwXHPLICRsJDZIDPZUo+UEwkQozxRm3afZiWErD3myfNhtbBa9qHBBidPPhTVKTkC1uyjMfmw==
X-Received: by 2002:a05:6a00:e8e:b0:4fa:a52f:59cf with SMTP id
 bo14-20020a056a000e8e00b004faa52f59cfmr20777666pfb.84.1650919280243; 
 Mon, 25 Apr 2022 13:41:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm10545247pgl.45.2022.04.25.13.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:41:19 -0700 (PDT)
Message-ID: <659b9522-5089-7295-33cd-018fb38a3af1@linaro.org>
Date: Mon, 25 Apr 2022 13:41:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/42] i386: Add CHECK_NO_VEX
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-7-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-7-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> +/* VEX prefix not allowed */
> +#define CHECK_NO_VEX(s) do { \
> +    if (s->prefix & PREFIX_VEX) \
> +        goto illegal_op; \
> +    } while (0)

Make the do/while align, and add the required braces for the if, per coding style.


r~

