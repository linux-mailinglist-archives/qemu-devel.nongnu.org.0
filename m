Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C126AC49D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCZA-0000Fv-Ty; Mon, 06 Mar 2023 10:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCZ8-0000Bu-RB
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:15:54 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCZ6-0006Y3-4H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:15:54 -0500
Received: by mail-wr1-x436.google.com with SMTP id bw19so9157376wrb.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yRQl9IavSP2ECC7Npy1kkvDd7fq8yF3XjhXOCTQ7O94=;
 b=YquRDKbKEtYWh2bDDkqMNyQreLSxV4TO/zSf+aL6uxzZPmB/VPMKvw23JlSZ7TKT2t
 Xfv/wAgD3jbXBNqUpiVkNHoccaGMi7v7QFK8m/jR9yySZG7Y3kCZopRJdrvQtfjr3K/Q
 Y9pvgboZPkj44EY6xbwzsSIft1ThrNplVhqg/El6vN0yY0GmKB3Xaneb6s2b7LiBDedM
 u3XRqtbjMNbYdmMt5V0+pzAisjju9HKET16dnBWmUIL7ZE+VxuRZfRYodQ9EPvlROzFX
 9ytFi2q0/AxIJwOAT5ljYLwvDFtm21FYSJfwD9KyCI3gpuwnnxEWnRi0fA1NyGChwUDB
 dsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRQl9IavSP2ECC7Npy1kkvDd7fq8yF3XjhXOCTQ7O94=;
 b=mAi26NNrv+nuEXkRfBlRdqk0czcrYKA2PT8Hx0fu913GXSosEudGJikHFosBINH08V
 pBo91MXUcTsSqaNykoR/kN+6MzowgPBD0g5svBV34m3BwK7qRv5w3PnLg+d8/fzaJJJI
 pznXqusZUtVuD+vFufbyMm7j2IkYgWyOdj/VPJtPO33yXPgzdYxVTrQGRQWCJk0BJViJ
 clNvZTnMm7iQboe81KyudhrtPCWramY8YFQZxPDG9Es3fDgBNjB9+o4HF7ieFgsG+qEm
 qz+yNc/j0MnNHtXljo8CekzqfjpMWlH9bLI7zx39ce4ml+5fqIa6LAhbasvvtVlQgx6I
 QsdQ==
X-Gm-Message-State: AO0yUKUEB2JydQXRLLb2QalVtDkSjuR9Xr8DuWClsCaTiuFAlVz2xUJP
 SvMwTdcnLsApNt9sx31K/fyxdQ==
X-Google-Smtp-Source: AK7set+37np1BJ1mhdQXd/QD/bscRr/zPqmnUVof8TjkCv+PNp1z7+lduk7lnkA9tutnLDPccK/Osg==
X-Received: by 2002:adf:f20d:0:b0:2c7:e60:a41d with SMTP id
 p13-20020adff20d000000b002c70e60a41dmr7235515wro.61.1678115750559; 
 Mon, 06 Mar 2023 07:15:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm10349148wrr.58.2023.03.06.07.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:15:50 -0800 (PST)
Message-ID: <c5541883-df72-90ac-88d3-ecc01c78058d@linaro.org>
Date: Mon, 6 Mar 2023 16:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/70] target/arm: Avoid tcg_const_ptr in
 handle_vec_simd_sqshrn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:41, Richard Henderson wrote:
> It is easy enough to use mov instead of or-with-zero
> and relying on the optimizer to fold away the or.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



