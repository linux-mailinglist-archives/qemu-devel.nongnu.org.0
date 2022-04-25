Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DC50EABF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:41:34 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5WX-0007ZB-H1
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5UW-0006dH-Np
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:39:28 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5UV-0006VR-5k
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:39:28 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i24so15916351pfa.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5pVc/rPStfL6clWTY+B4wZ34m0nd3ikwpPLQDXzBbxs=;
 b=Y2pmzqtxR0Lorz7Adzpo6rE+AebPlWJG9czR7YEqmYofoV2hHFwCat/Grdh/GqAKGO
 QE0hTQuGBBu9wRbFY5mP1nLbJIkjpco5N2Lcvh92dFk7LxzfJMg1DlRvszHkn9KZqROa
 RfS3yIg7egkwr7D80vuvSNvFdt7dGNdOQn7NjrLfnf/BnkbSyIQpOSaglokRI7l575lj
 FcobrfEL+wVoGexlt7SOe1WdODcRhJz1/5a8ceMDYgA4Ytq0wsxkO0rTCwnesyWCZPmg
 Hmpip383iRAQOunMB0pxtkY5r2seJ+b0qfl2TFf8nChiHzYStMnnG8AS42FlEplPaN7M
 H/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5pVc/rPStfL6clWTY+B4wZ34m0nd3ikwpPLQDXzBbxs=;
 b=gb2mHYecILB1iLdRcwM1EJna5X+ri3lhuqS4p8fmssrtVhtJ3t/iRISa+eO32rQqKv
 cNXpXjVDque3Xymb9tyxHE/DipUIp0eUYdTJX3I19ZFe+e/et+6PdZjLGxX68KFXjPPv
 fHKCoahUAWjPesP1RC4pLtlGomS6LblQM3QghyWmyvBPf66fIY/ADs76tanNBikndel+
 mmXW3aGi08om1v3aSEoBrqSyEc3QN9iD0Q5pmD5fsPCxyPBcZVdK0i2ryjYwxUjB56Vp
 fG1YBcG1k0SacWoE0i+13V/GZvb2ZjEm351ZtSWlQO2/8AG72YIUKa62t/lOAgsKpLeZ
 xyKg==
X-Gm-Message-State: AOAM533FN4zF7Ti6TY/80mLN7wonehwmDWsbrHI6l+yz/q0kXqX0VUDf
 PH3AkV/i1xNh/rX4gZHViJNsRg==
X-Google-Smtp-Source: ABdhPJwv978fqKzyzvLxGJwbkLuvr9Aek+2n/lhmJdWyQunOLJFozDSWfey0RH3Ddkxd4jVKkgSmZA==
X-Received: by 2002:a63:8641:0:b0:3ab:4191:b85f with SMTP id
 x62-20020a638641000000b003ab4191b85fmr5836506pgd.380.1650919164977; 
 Mon, 25 Apr 2022 13:39:24 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a62d405000000b0050d1dec25cdsm8964361pfh.115.2022.04.25.13.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:39:24 -0700 (PDT)
Message-ID: <41bf690f-a94c-13e3-b824-903e7784cd14@linaro.org>
Date: Mon, 25 Apr 2022 13:39:22 -0700
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
> Reject invalid VEX encodings on MMX instructions.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> ---
>   target/i386/tcg/translate.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

