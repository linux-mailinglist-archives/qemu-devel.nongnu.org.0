Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BF6DA3F4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:45:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkWTb-0005YM-DB; Thu, 06 Apr 2023 16:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkWTX-0005Y8-2N
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:44:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkWTV-0001IR-Hn
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:44:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id m2so40732692wrh.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 13:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680813892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yDvnOpXF6JPy3fv0d/W8rVXbDmxyR/Q6Q3KQGUfwej8=;
 b=kcmQGEKeYvwyQ+7vqZbiSenCUgsYyb0gr/1kIloY+S32nwpiQa70cNGCmJC1Mwu9Ma
 UTwHk1hNCMLRgDgNgmPeyiJAuoEMJDW/lZhaGfFxW3pRFzXeE6SlvvauTIvXCK5Y6uJJ
 3w/HiyjE0TsBqr/FNHfhhqNCRit0pg9SElH6jC1m1Re1IQ4e+/SmkAhjwEGvSnZFu84J
 aODkkxt774XpiPCxUoODerswysR+SlU2TIbCZaDsMS/Y6ilzYDsTyvCHZOmv8I2W/0j2
 9gksu1XMj5zqANK1fn6zV0sSHHQmsYntiQ9NlGWbziD8GjItbuDswTCbx9j6xvbQ0AI/
 pWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDvnOpXF6JPy3fv0d/W8rVXbDmxyR/Q6Q3KQGUfwej8=;
 b=wybeJq4I7ra6gpWCPKPnVVt9lUI+eZxJCO4tnO3USl9OHLVKbqAPcDykjCaMLUvnh1
 nQUEzBB7njs0IQ3Ix/jCStji+8hpMPPPPqTd30AW9zJY8iLpnCnRtn1N35J3Xb47xCS/
 Ebu8IJJ8nibPCPrlD6tdKhwOgfJSUs2i1aqv74zh6DMj7LlkXQ2x8e/bQKct2knd8H0K
 i1JvNAUdC1eDUOGBAP9lCwqhkNuY/rc4LLhIc+hqv+L7iugURJ9HCeevUljee6CIdYwT
 h1jbPfnnkNq2j0FyJY9s4lKaFzSbOqx7bcoDVjLWnZi5aSPM+MRNOf9R3jAviUspt7KA
 nhWA==
X-Gm-Message-State: AAQBX9c49BHfm1JnodB1vF3o8jYiLOXOpiKk4zJcJHsBpYBJoFZgmV8X
 JHz02rl7E71YRuQSh1gmPvwAlg==
X-Google-Smtp-Source: AKy350bJTtU+p8K+WzI1ZOZSzC2FEMiNTLFAK8mNaGRJ7pT1XVM5aOm7p5VIGa2AAnJZ77yZ5Wtnsg==
X-Received: by 2002:adf:f74d:0:b0:2dd:def:58fb with SMTP id
 z13-20020adff74d000000b002dd0def58fbmr7975900wrp.43.1680813892081; 
 Thu, 06 Apr 2023 13:44:52 -0700 (PDT)
Received: from [192.168.1.101] ([176.176.140.188])
 by smtp.gmail.com with ESMTPSA id
 z14-20020adfd0ce000000b002c55306f6edsm2656740wrh.54.2023.04.06.13.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 13:44:40 -0700 (PDT)
Message-ID: <03374160-af48-c876-c622-587be1281dd7@linaro.org>
Date: Thu, 6 Apr 2023 22:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2] Hexagon (tests/tcg/hexagon) Move HVX test infra to
 header file
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, 
 quic_mathbern@quicinc.com
References: <20230406174241.853296-1-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406174241.853296-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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

On 6/4/23 19:42, Taylor Simpson wrote:
> This will facilitate adding additional tests in separate .c files
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/hvx_misc.h      | 178 ++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/hvx_misc.c      | 160 +--------------------------
>   tests/tcg/hexagon/Makefile.target |   1 +
>   3 files changed, 181 insertions(+), 158 deletions(-)
>   create mode 100644 tests/tcg/hexagon/hvx_misc.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


