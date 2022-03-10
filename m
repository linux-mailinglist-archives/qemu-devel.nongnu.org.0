Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DA4D4747
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:51:19 +0100 (CET)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIGE-0002kJ-LC
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHs5-0000mf-OA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:26:21 -0500
Received: from [2607:f8b0:4864:20::1135] (port=45564
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHs4-0001JX-2Q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:26:21 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2db569555d6so55381877b3.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=os/FWLS7vNBrOpcQdwWCYJ8VWPSxixoPyI+WElCTSgs=;
 b=VSfFTIzW6biGaz+sagsPctNFjDwXHAzHqw/t2KcMHqvIskoE3wanCpoabx9ylj8TLT
 /jDZtXe9q8sQnA5p2smWy2JD4IHWZ5L2dW0hvNJ+zD1FvL+uh/Jlpw/d6kn9lbCrRH8O
 7Ef3RrtaNECiiM+lc4xPVhSxJisO7Fm2Megksu/J85vqitawwKiwxUVCFDsK9pYcCYm7
 +QaLLghIQvkmJiZIhSaohr8d09NQ2s/+vbFV7JCJdGTpdG3R82ol1ZmD8W3NLZUBFvgi
 XiD2gh16BFPK/35sxS3Hy943C3suxZ1yRQQAoxWM1EoVvQZUI7IwcEwsDJ4PDeNaI6U5
 JVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=os/FWLS7vNBrOpcQdwWCYJ8VWPSxixoPyI+WElCTSgs=;
 b=wIJLqHQ5T38uIgl/08qvWOp/Wbv/1okWJPj1gICqm5yb6lsccqmMUW1QyxCBZf1VSa
 ZW7Y1Nlo1+WkW545nvx4B1hu2XThIiE/EqcrzVQMRTId9BkKh9x47JNTnTTHl27Iqvip
 SGwiJKw+iQHyFFJcXag3pYQaL5BvDQLwbmmNGBbt93P7W7tIfjPPS+piNsCE10EC+i/W
 8yIpspUrWXmQ2Qy3/Yip8hucxDVcWyF+Mps2E8z59lDYaa1fIs3rsHtfj72G4GKZ0laO
 kSS5N2jowsx7CGIX6+8Ha1J2bR56YiB4+rmRqqoX6fJuUp19ztPI9yk+wbg0Xs4D6+jW
 prjw==
X-Gm-Message-State: AOAM533o8WVusZQXIPnMD3aK/EihwXJPnB1LA5j/ya90I0gjm531ucs8
 bUWdcPotNsW3LTj/t1ZDgu9T8XZz55gI5SvIg7+XXw==
X-Google-Smtp-Source: ABdhPJxL1OhECXR/lCtm8D4WvdGMrvSAYFkuxPTIlXsJSw1Vq/Zs4ddm/+IkFjd/sTZolbpGDqx5tvebyIb5X9IOKss=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr3600855yww.64.1646915179156; Thu, 10 Mar
 2022 04:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-15-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:26:08 +0000
Message-ID: <CAFEAcA9ruD4OFW+S0_4kjXFQ8zgenui5=uOpygnjsH=dm=eCPA@mail.gmail.com>
Subject: Re: [PATCH v5 14/48] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 11:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use FIELD_DP32 instead of manual shifting and masking.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h    |  4 ++++
>  target/nios2/helper.c | 37 ++++++++++++++++++++++---------------
>  2 files changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index ecf8cc929f..963cdec161 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -105,6 +105,10 @@ FIELD(CR_STATUS, RSIE, 23, 1)
>  #define CR_CPUID         5
>  #define CR_CTL6          6
>  #define CR_EXCEPTION     7
> +
> +FIELD(CR_EXCEPTION, CAUSE, 2, 5)
> +FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
> +

Is this definitely the right bit for ECCFTL? The copy of
the manual I have has "ECCFTL" as an extra bit to the left of
bit 31 (!). I'm guessing that's a docs formatting error, though...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

