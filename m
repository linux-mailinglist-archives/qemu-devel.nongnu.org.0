Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5134AE344
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:21:48 +0100 (CET)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYrq-0007Dc-Ra
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:21:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYnR-0004xD-KJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:17:13 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42708
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYnP-0001iD-Lo
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:17:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z17so534687plb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bLjbOhCXpgmdqhkTZhvRiyq9P4PelbwvNE9mxOEMvV8=;
 b=SHA529i85NmUGl5meY4DCy+4663HRVUg7SwGM1IsZ+NAs8E5s83UvfvYjG5nLud6Vh
 n2tqeWNbK/K1tpgmVrHmzIwdJ+Fx7uj4Qx+16RcU9YC2MbwHA8PIrfVyy0EunSX7GF0Q
 1cfhIZBA/D2d6t+wWHIPPTxvE7tdWNh8qlnGH4XQylmFEbdRYycngRCTONTV7UrAmh2l
 Y3KhyMMixSpsc9uxJpZtKBMzn3dvGaMUbjzOlBSeyPzZVQF2Osbv0zpQ1fDqRq2Yr3tj
 gEyzkA0fYuFKtFFLWRtK1AcoYrMV+yOZ+0c6Wvqiz/ilbFiPmJ77J+mPSPwL5Lr7V3Lb
 ozSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bLjbOhCXpgmdqhkTZhvRiyq9P4PelbwvNE9mxOEMvV8=;
 b=zIzig13HIg96at6MtYuvCBsDs3kEtIU/R/idIwkn1qtWYyRnvGgTqJJ+XSvhk9VDrZ
 ev5fNTIpPCRbvkfVoPiX20FRi2tsOp8FaKYC05uEmWuBtz/k+9UkPOft4ksk/rwxtDrP
 gdHhKLLG4A0DStnrIuLHQZs053fxV2iMiUVVfrp6xBrKl4gcvk2Qb3+CsB2C3gMOqsYw
 vDVDAFnJfPCPUIeh6n1MehhD9JlWzRUp5f0NMfhgBwPyxy2UU9aw6dwk9CfB7Eq0CVm8
 asYlMvfchnvQSfx/vSehHfAjov/Ixv/P+oa4WNgJBUwhHLMobOwQBGKlrOr9mbDJgK75
 1ofA==
X-Gm-Message-State: AOAM531NdnSDNnzEEUIKwWng8Ph9Tgfm6E0ggnKxlDDDtAxwOHl8e46V
 gkjheeI4WcSuOMRP3s1zyXilIQ==
X-Google-Smtp-Source: ABdhPJxDPaMou6wvEL0eDeiBhO2IlAtrhV6FHQ4mUkQYEJHO7gtRbmI/hSxcH0AReZq6WZFUN4t/DQ==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id
 oa6mr80274pjb.127.1644358628063; 
 Tue, 08 Feb 2022 14:17:08 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id q2sm12219366pgt.47.2022.02.08.14.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:17:07 -0800 (PST)
Message-ID: <1fff41af-eb60-3351-aae5-0701c3f94605@linaro.org>
Date: Wed, 9 Feb 2022 09:17:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/13] target/i386/tcg/sysemu: Include missing
 'exec/exec-all.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> excp_helper.c requires "exec/exec-all.h" for tlb_set_page_with_attrs()
> and misc_helper.c for tlb_flush().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 1 +
>   target/i386/tcg/sysemu/misc_helper.c | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

