Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D486A3DE4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZVj-0004A4-7E; Mon, 27 Feb 2023 04:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZVU-00040u-Ir
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:09:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZVR-0002ap-FA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:09:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so6550108wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gGThxHJEEJL4cAFrfXjf9MNVVgDOoFDI7d8nDusJTJo=;
 b=Tyfpcvs2lEIGrhm6/hImEbtPqlWd0KqRxBpNLzg3lUb4EZDDjm8n4qpOZXhKGpO5Dq
 G2OR+G6jiK3x9QaOPsE85RuorSWRrHA6urV0XUjTUaEFTfRAlzGTTsGHpLd2hsbTwWWa
 XnnkAwPeIlqu/qHW6Z7YIUcDyoT7+i7agfIC1WbOL4wQRPVXNJSB56SPPIM9uuG+BZvM
 LLKOle7tkORvM5p8uxZUiYpJl0M+BJW7f1OYrbxDdYOSp2ujECyMRriKNvCUVBG5sMSs
 4DLKE05TpoGSBOmpab1EMAQOSfOXhIiHaAbAfXpUCSvTqzOsIu4x2BxKAfs/+olRjfdS
 QY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gGThxHJEEJL4cAFrfXjf9MNVVgDOoFDI7d8nDusJTJo=;
 b=wxzAZe2/Yypt4Z7SHv5IwH/WWQ6mBKQHwhYQuWgTvf0HvSp2wJa2RhBWORrbtF4s+k
 1QzOhmH7czMyWpZrIdc1oI54P+EVT9vEGVh8H74o9NeznxgdIITt9sH3EXF0+6xydKHL
 nuqEwLzbBLb3bwr1m0HjgTOwMGDTP1VLvK5JgK7SOl7Uxv4nvKNUanZfQxWZU3Qxlyrs
 wUd1TCyLWZoyxxRdzceJNjFPnPwBGrFrKU8k0XlaIMUY3FcDIxscrIW4Njv4GdFuy6fe
 ju7yS5J4Ye4zx6r7pjnL35MraAWrKGvHcbRujE4UCDnqoX08jMSO09Aws1Eye45c1XRe
 OtRQ==
X-Gm-Message-State: AO0yUKVvJC6n4V69h7sp0w1MP7qHco+2EiCQhVLguLDoiL+6qOMBYNra
 OjAnSuurJ2lr0h2tiJPmBCZmwQ==
X-Google-Smtp-Source: AK7set8rnfem+O42kwLkEiJMoVhtb16Tyh618+L4d1nCrRYjk9zjysK4PulfRUZcjDgwa+gzjwgdgQ==
X-Received: by 2002:a05:600c:32a7:b0:3db:15b1:fb28 with SMTP id
 t39-20020a05600c32a700b003db15b1fb28mr19294636wmp.19.1677488952104; 
 Mon, 27 Feb 2023 01:09:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm6494761wrp.48.2023.02.27.01.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:09:11 -0800 (PST)
Message-ID: <9a21a6eb-6b52-c735-12e7-2b02b5d53f9a@linaro.org>
Date: Mon, 27 Feb 2023 10:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 50/70] target/s390x: Split out gen_ri2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 27/2/23 06:42, Richard Henderson wrote:
> Use tcg_constant_i64.  Adjust in2_mri2_* to allocate a new
> temporary for the output, using gen_ri2 for the address.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


