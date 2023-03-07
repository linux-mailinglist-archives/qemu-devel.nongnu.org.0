Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F46AD367
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:38:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZLKW-0001ao-SQ; Mon, 06 Mar 2023 19:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLKS-0001Y7-KM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:37:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLKQ-0000IS-Dk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:37:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so9412250wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ICnPhU6cHn0twhF/CUf4hoGgm/p7umHBuM4TowPzpDA=;
 b=NmvSR9kg1zwpXasWQuA4g9cj+Ngm8LW9Kzeuj16zvxhK19LXslMk23ZJ8vfMFEdSo7
 05d+ERCTImX6PkU0M28BPQnEQdpf4E+8eLTmZ2XDRQllfyUlnXfuQp+uklSK3HU4Sc+X
 vPjRarj4K7sCcj8nGH/DuCR46AUhew1DBVaXK78ugKTqt1P1FGWZw8jX8p3YRMmRBg2R
 V5sO6SplFTdOxn47wsxNf/5L553YLk+CeWiRSPJX5uT5hyLWUtcsRBuLrQuUK1brlx20
 KZtm2vtRF44MHU/kC/bZaVBaHjtDAMTcUqThCaXpCUjGck1gjH4rAnNG2cbyfQCumaG8
 oABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ICnPhU6cHn0twhF/CUf4hoGgm/p7umHBuM4TowPzpDA=;
 b=5w0c+/clzk0XfLapBLkMAwbNSbxBp4jzbpe8tp+qeGTw/t2axx2jXXM/ocfaeZVe5j
 T2vhTh2uWy/dRZZloGL1rKCkd/CFUsCSNWFOqXO+neDO7WDtgSQg9nCjDfNPkQOTkiCV
 /brx/llzo3MOXNXOd6v3oljla9pxMEQEMSCvlMmxvNVXxCNIHKZr2uPApLwk4Cr3EayI
 4NpyFqD3BnGOwyuO/bI7qfAciPWw647eAQue9chw3dSA4jW1KQybBb/YhYoAJU5BK+rx
 xDhVSIaTyepLC9KBG7e7q9+grKaXiv93P+Xf6O5tm7FDkBWjZxM1v35LOHFrzc3SeanW
 g/wQ==
X-Gm-Message-State: AO0yUKX53OlabYeZJJKZTkyfBjFSXPYooe6c7Ndh7gOtW0leY7ERgr+9
 5TUnbZDC3PJ9svin4h4NNR2WsA==
X-Google-Smtp-Source: AK7set/HjGFBbAw3cKfMPPyEuOkqIhgQ399VTchnCbNnzp3TYEVzKgdbSpqwe3mdl9mA/X/UagqZKw==
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr10927932wmq.29.1678149436676; 
 Mon, 06 Mar 2023 16:37:16 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c435600b003eae73ee4a1sm11439258wme.17.2023.03.06.16.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:37:16 -0800 (PST)
Message-ID: <0115ca07-70f3-91c7-8d89-c4b51b833428@linaro.org>
Date: Tue, 7 Mar 2023 01:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 23/70] target/i386: Avoid use of tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 27/2/23 06:41, Richard Henderson wrote:
> All uses are strictly read-only.  Most of the obviously so,
> as direct arguments to gen_helper_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 83 +++++++++++++++++++------------------
>   1 file changed, 42 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


