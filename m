Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C359C81C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 21:09:45 +0200 (CEST)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCnv-0007WR-2W
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 15:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQA5H-0002p1-MA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:15:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQA5F-0000ff-UD
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:15:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id m15so3416496pjj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3IxCEfargs4UuVJ8ZBLtCoSTozP/f6R+u6A09b76vzU=;
 b=vHF3C9axLJzd9XeANTowulJNLfhduB8OR+lV9/c2JnFsCaqJdEwBZ3rh+MjV5KwvqA
 SX4yKbyK6LYW/jtOg41jVjstYjH2a+mEJB2qYOI9Deu+D/UGDzt9y3bLWcdtm0fVXxs5
 sLdhJESZoGWtnaF8e+3MW2JqL9vE215fz6B980cuqk8Hxlx+yvYgYNsUOyQu/qnVoB3a
 vdAvcAR+kdO61CsMJ9rkLt2Qwa26eiryoSOMuF6V/27crN8WJW28oZhl5CA1EY5COw+x
 PekaLe31KCemLFap54J9QhaiAtAygKdJZty6jzqiMPaIGPiHrZtdBq+Ss9ZlColwyyl8
 qeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3IxCEfargs4UuVJ8ZBLtCoSTozP/f6R+u6A09b76vzU=;
 b=mqiENDRlQs1WPHtAPuF94yDlwS1sICTcen12WZ9/+vAFDAv5hUKTRKOuTyuptIPvvE
 CNY7rzsDbcLx0+D6hJxiTN5OU1CEmrNlUxMj2wuDbNh1Ew6WnbQ72UawHOOFeACskdYk
 oqnyHBXufNJAb9opZLu7ptRSGLv1AUXmk1kHEz+peTVzZ2pInzmt64eJG4coqff9nFEN
 WRR4y98GR7aDyv7G3tXqKcgcA3G1H4xvE27K1B0CWiFC+dA1Gcgmm7Xb/QI51zGspFz6
 yHCmwt5xzq6ZNa057YVdMe0xydbpUqnKxORTLxoMROAGFnkPLPqGO5rzJsQ0ZOjz6Yaq
 ZfPQ==
X-Gm-Message-State: ACgBeo18tmn4/VAI4UzMhEqO6qrj1jWMNLyQRkFdK7z9EFYNgT4Hzcy1
 obIBozOPUIKoL4LK2/U2F4cH2A==
X-Google-Smtp-Source: AA6agR4Ji1URWWh+zzJG54KHeBA623AhGNHW3XyZa4B8v2nmnJp0slF90wexlH6XLIBXP/uHA4LPdg==
X-Received: by 2002:a17:90b:4a88:b0:1fb:36b7:7f8e with SMTP id
 lp8-20020a17090b4a8800b001fb36b77f8emr4990004pjb.22.1661184923531; 
 Mon, 22 Aug 2022 09:15:23 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001fb398e5e6esm1727418pjb.55.2022.08.22.09.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 09:15:23 -0700 (PDT)
Message-ID: <07068213-5ffb-1926-d4d0-496b95885710@linaro.org>
Date: Mon, 22 Aug 2022 09:15:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
 <20220822132358.3524971-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220822132358.3524971-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/22 06:23, Peter Maydell wrote:
> FEAT_PMUv3p5 introduces new bits which disable the cycle
> counter from counting:
>   * MDCR_EL2.HCCD disables the counter when in EL2
>   * MDCR_EL3.SCCD disables the counter when Secure
> 
> Add the code to support these bits.
> 
> (Note that there is a third documented counter-disable
> bit, MDCR_EL3.MCCD, which disables the counter when in
> EL3. This is not present until FEAT_PMUv3p7, so is
> out of scope for now.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: Get the MDCR_EL3 bit right; v1 implemented something
> more like MDCR_EL3.MCCD.
> ---
>   target/arm/cpu.h    | 20 ++++++++++++++++++++
>   target/arm/helper.c | 21 +++++++++++++++++----
>   2 files changed, 37 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

