Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4852569F2
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 22:04:25 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC75M-00078q-VM
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 16:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC74f-0006h3-Kx
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:03:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC74d-0005tf-9s
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:03:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id k13so1191278plk.13
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 13:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lqqr+eKAvs9WjqwAK7w5a9jXZYgXBL85g0djvopoSUk=;
 b=Gqlogtra9EvERkjBurbyh47VrkMaNcznkZB1KSe45rtoaEFyrfIAlHrDmdVsmPsV/r
 9k8ArTVLOzpH337J+1VKyTFX/suKSBY9GXLXxqDDwFHK81h5b9+P7thQ6J/cF0np6xHS
 ZI4zJ1eFkEaya41HXpuohLAcg6ctMYOtzDINjvNqqjyhtbXq1Uv1BB+oBo4BDxqgy2CU
 g5PZT3BIhWznDvGsqofTeRHGU8Nn9eDnde5wFVg5ldS0cUVYWMDYBQQk06y8LEgLU0HJ
 4GWmL2cCzxjhfm+nrkXYgxOSV4/uX/m7ljPqGBanQIpsxeiy/D0qctX53YO6pj9EmPGD
 P0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lqqr+eKAvs9WjqwAK7w5a9jXZYgXBL85g0djvopoSUk=;
 b=DoMjpZdMZbRyTH/gMxZL6U7JbUlX3k/jR31Uwsf45HQhw5r4qOUsjovAvozLDfvpup
 EuTLZGM/8TOnqnZh5nCRgny85mRTZu9GX101ERODof3wiHYkhKuiwEZF1Q6gwBkyNYuF
 vpH20cOUsLi58vv6rw3UJxb9+UAZ2qYgFwQzMBpgfQexjIc8pm87yup+25Z9FnawMywq
 3rwU/AqIP5LHbMu8e9QmJ8naOpRatJu2v2QynZT3ZaLMiqmSNDUHHXvaWKM5M+aSmujH
 PjbablpeJIzmR/AIdldC+OjLVkTFYp+MZqoB2vkHQPStUTdjqT0/6eUZrbzqMfEwcX0H
 L2oA==
X-Gm-Message-State: AOAM530wIIRw9x7+XmjqqgLiFzdwuMwr/+81W52C3S4xA9ld/0N3o5mM
 yjWLNtmK2MbYxdAUQIOLZeDQBA==
X-Google-Smtp-Source: ABdhPJySEQnJF7X4WcehnOAntMgQlzX2RfBazBKtF3wzOWE4F2IRv1axtysWLfr/XWIlMVAGliRg7A==
X-Received: by 2002:a17:90a:9c3:: with SMTP id
 61mr4299246pjo.191.1598731417781; 
 Sat, 29 Aug 2020 13:03:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 65sm3429855pfx.104.2020.08.29.13.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:03:37 -0700 (PDT)
Subject: Re: [RFC v4 36/70] target/riscv: rvv-1.0: floating-point move
 instruction
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-37-frank.chang@sifive.com>
 <e8976125-e692-cf9e-5d23-e1e48f6ea72d@linaro.org>
Message-ID: <f7e5eece-0db5-cc2b-4cfa-d2b6ace1fcc8@linaro.org>
Date: Sat, 29 Aug 2020 13:03:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8976125-e692-cf9e-5d23-e1e48f6ea72d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/20 1:00 PM, Richard Henderson wrote:
> static bool require_rvf(Disascontext *s)
> {
>     switch (s->sew) {
>     case MO_16:
>     case MO_32:
>         return has_ext(s, RVF);
>     case MO_64:
>         return has_ext(s, RVD);
>     default:
>         return false;
>     }
> }

Oh, and check mstatus_fs here too.  Which is missing in trans_vfmv_v_f, btw.


r~

