Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F44FAA04
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 19:57:28 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFKw-0006Uu-K9
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 13:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFJG-0004jD-Cf
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 13:55:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFJE-0005hH-O1
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 13:55:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b2-20020a17090a010200b001cb0c78db57so9443905pjb.2
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yasihu4LUgcHFYu4THfnpF1kCHG8V7rylOaLGAh+MAc=;
 b=YMYsYW+i3GiyihshqYcALzLE7KLYK4wVM3tY/7FGgTjB/732l6jY3SrDhi5CK/UEC7
 Y3BEDWE0Ly5M1u2mg1KAcisKDhEnLvyHwSXw+f5Pnkfn74S1iGWWX+G+gcoS7fZKr/NT
 uu35A3SJ3HrEXMoxYBXrpvuwbYChuqaOTxU8Gxwuo8Zzvfh3h9ljnoial7Y22hGeqzJv
 UOIlG3yFBZLktIUCKyaQQcvWLpRvM3Qhsytkk7Z1suuX2iTBYUqIh9YdeI0qPLdafumC
 OCbVyeSC69CWEMuFplT8ircULEew9bibFonUWKCkQksYipRzML2JrevOGg0Ds+xwiyQf
 9eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yasihu4LUgcHFYu4THfnpF1kCHG8V7rylOaLGAh+MAc=;
 b=0RnfGFcEcID3nqm4KhKkt4n2GuJSIIomrgPWXjusqaf444rbBa2SYanIoxbJ78svqt
 FRbekemEIn5D/9ud+GfdLHRF+3sdPbL9oOFK16ixRQNEt4JboN/N+VKnWdn28Ih2KP8H
 BS6KF/p8cc1At/DACiASK5gsTF2l5TQdkI+vUVOWj5q2IdrdNdTePLAYpQnQ6CbRjBaQ
 +/mgmLmbn1K5f4YeCC7kGknB5u8hrs0HoNQxKtoCUN2a2bQXnE3LHKCQaWOtSku+LecV
 dNl1s6ZMe/ElEEDO6MXGjgcE/mVtkSf0/pAFmgBG6XEEStKFbMeflue7CoPyGaI2CL0f
 6WqA==
X-Gm-Message-State: AOAM5331wLzjiNLrOQ/gqwNnPJJKhJGw1LU93Sj520ZxiAjGgUr83gVJ
 XAo5zPrpw+KsoQ7A2JCHZsTumw==
X-Google-Smtp-Source: ABdhPJyf0MtAGQQ6WHWn2fSffzcsWGeOJ+DrfIolrNEeoBo5uVMJRQmZrvF5ZCFYh0pLcWMlRvqFBw==
X-Received: by 2002:a17:90a:930b:b0:1bf:ac1f:6585 with SMTP id
 p11-20020a17090a930b00b001bfac1f6585mr27665736pjo.88.1649526938904; 
 Sat, 09 Apr 2022 10:55:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b0050591e66508sm4802402pfj.220.2022.04.09.10.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 10:55:38 -0700 (PDT)
Message-ID: <89c9a4dd-01af-54e7-80fd-7eb800aa6da6@linaro.org>
Date: Sat, 9 Apr 2022 10:55:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/41] hw/intc/arm_gicv3_its: Split out process_its_cmd()
 physical interrupt code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Split the part of process_its_cmd() which is specific to physical
> interrupts into its own function.  This is the part which starts by
> taking the ICID and looking it up in the collection table.  The
> handling of virtual interrupts is significantly different (involving
> a lookup in the vPE table) so structuring the code with one
> sub-function for the physical interrupt case and one for the virtual
> interrupt case will be clearer than putting both cases in one large
> function.
> 
> The code for handling the "remove mapping from ITE" for the DISCARD
> command remains in process_its_cmd() because it is common to both
> virtual and physical interrupts.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 51 ++++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

