Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B904E6AD35B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZLBF-0004Mz-PW; Mon, 06 Mar 2023 19:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLBB-0004Lx-MO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:27:46 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLB8-000737-8D
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:27:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id p26so6782861wmc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148860;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ROY1jIYMDYHKmZcBkGLXR5XghLZpSypAMhegAgulbU=;
 b=N+4M+mkMAUHv9Cz9is0hXbT/EKGA+Em3yW2BnuLvxUa8+JZMiMF4W58FNTQbTg1MJB
 7uMFYZ47JxFD4p6GjUtjBMJOLlti59kTnLl8QPlPD+nhSr79JyrA4X+QpC6gp0mydebr
 Pd+qsJuqWDcqXdupjYr128D3FM/ntb+9Hx1tA2mVzro8PrSBaKbYw2IQVSd2wh0B0qe9
 qZvyAV2CvU5Lf5qASmrj3O2+GZWKiXjrME4VxQa5txKEKt7uy/bnSTi8CxQxdkM36KEN
 EED/PlLd6HHW6g+vnbG0UCBwDAHhbEaAjCb5BIBOkKRgK6oST+/yriYUttCwJWI6S8pH
 tfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148860;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ROY1jIYMDYHKmZcBkGLXR5XghLZpSypAMhegAgulbU=;
 b=i+enoJLkV5YZ2teEsa2cn56BqjIgg0fR/nC+msP8Nhf30OfLen07Wsq/wkXx2Cc835
 XjzW5jnQFqKpSZCJJDngu2bTXVDpVw2XWn5QUVgzWOc0g6qp/Ci0LnjXY4ojex8c0SL7
 AKVpFhmOS1Zqxg4/NUapYJF94Vl2geRU/PYK+U6hzkhkl+StxkTi6q9yzcHM5E5bvNq8
 IsymFYr/QWwgaDZEmheisOScVfKry5YwYTcsz1eCgmWCbDmNJtsrv6GH3GHfBOfWSYNb
 D816ndEtM2Mz+Zjq8A9TxopF+eKcZtOS+/OZH0Ptl+tElagnnfBQCIXlYykS7Jq+H+IL
 QCBQ==
X-Gm-Message-State: AO0yUKW6uxtXIHY0xWw0UMRbQFKFnJX1/Z+6HzPSnvFYS6co9w0gBvxl
 NbJYycphLhq080dc+k3Qr7PLjw==
X-Google-Smtp-Source: AK7set9/ujnUmNkjiCPLpyPXG763+u2a86W5ccLWzyEhd62fHq32FuJ1mhHgJQb5al6S2FbnceOsVg==
X-Received: by 2002:a05:600c:1550:b0:3e9:c2f4:8ad4 with SMTP id
 f16-20020a05600c155000b003e9c2f48ad4mr10805188wmg.8.1678148860310; 
 Mon, 06 Mar 2023 16:27:40 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c170a00b003db0bb81b6asm11235452wmn.1.2023.03.06.16.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:27:39 -0800 (PST)
Message-ID: <9c2de89b-3ead-0fff-72ba-7f2d9210d743@linaro.org>
Date: Tue, 7 Mar 2023 01:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 49/70] target/rx: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-50-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-50-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


