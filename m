Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FE6ADBAD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUR0-0005R2-Tg; Tue, 07 Mar 2023 05:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUQz-0005QN-89
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:20:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUQw-000341-LE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:20:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id k37so7441559wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=S353QH+KJ7rJoyMNiMkT3JIQSA2sSPJXFpRZ8B/7xjBAlg8ytrmH56AdLtnlXGOlOK
 Cu7p3DjNzsDHPthTy1mXNa/GJMkt1Zr1Dbb2bwQvKuYfSgivsSe1LpratZBKndaUrFnC
 0KvwNR+sPU6r6Te7yiDy57kJ7nXM04XnxtqjeP2CB9veBXLYWZ/p7ogd1hmNk6A96buc
 yPcE6Am+6UFbDzhiwdgyXiBFNBrvcUFkex2ksXa4uH7PVcbNA68gySyh7Sp1pHLFQFmp
 n+Mk5k+Q/PuhXXGjq9y4Qe2u6rAO7MAwHLgDKqJ+kqhunIGigQB7+0Lw6iRzbnuRP4+p
 faRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=kMdCwdi/247rk/8O6YfOyMZqJ/qMu0ltzZ0lACOEkpwIu36zkGRPm7M19RC4l4qOGP
 ilSzoBnAjcglOyq5Z5NU9QCfGfpnmsyHgohRhEwP7Rzqyd/fvW7U7MHpVGutfWgG2DbT
 r7RRYyUjHpsLEwi7Bz0EqOANr7DdxOIgix5tV9gZymZdOpNb5nVWEFic5tGCZlKgMLFQ
 Dwy92NaW1qsq2Ug0vaTPrJwn0uBf20MLzQfWZ2nvcU65bamkojXCCifOhxcVrgbZEw4w
 TwBsj3lCHmbdYVCyVDfiVwAdtazuBHcpG9tNss+zWwea/qWUkzS0SB7oyHxiCgNi1/3V
 rlYA==
X-Gm-Message-State: AO0yUKXJGYFY6FF4YYvsPy8x33LYUhuXxx0/R1bUyF+8n0GBGUYyxJHa
 4P0z6rYtkllyBz0q4DyXvjfK1A==
X-Google-Smtp-Source: AK7set/WcCwcTZ9Wy6ahyKbPspHwAVbgicrl3oS4Q3WtFSNop/GOQv/fVKbJYU6qUrviR6xfnv6ilQ==
X-Received: by 2002:a05:600c:1c12:b0:3eb:389d:156c with SMTP id
 j18-20020a05600c1c1200b003eb389d156cmr12138843wms.37.1678184437232; 
 Tue, 07 Mar 2023 02:20:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm12199678wru.75.2023.03.07.02.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:20:36 -0800 (PST)
Message-ID: <47807f32-72e5-0b57-ebf5-620149a0895a@linaro.org>
Date: Tue, 7 Mar 2023 11:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
 <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
 <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 03:24, Richard Henderson wrote:
> On 3/6/23 16:19, Philippe Mathieu-Daudé wrote:
>> On 27/2/23 06:42, Richard Henderson wrote:
>>> As required, allocate temp separately.
>>
>> Hmm not quite accurate; this patch contains functions
>> which don't require separate temp and belong to the
>> next "All remaining uses are strictly read-only."
>> patch.
> 
> But they're all renaming, in the similar contexts.
> That's what I meant by "As required...".

Ah, I guess I get it now, it makes more sense when following the
subject with this sentence. Patch content is fine.

