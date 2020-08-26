Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E925337B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 17:21:32 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAxEx-0007hN-RG
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 11:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAxB3-0004U4-De
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:17:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAxB1-0004b1-JU
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:17:29 -0400
Received: by mail-pf1-x444.google.com with SMTP id k1so1154055pfu.2
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KhxCPcFjyEBQpjfyeIcNjqcX9Xj3CtjhkjDuLlufOxo=;
 b=VQGDOkhIUTols85bqOeJMeUuecBmgucp1YFZIvZWRF3mR2+PNIe6rfRp22XCq2gk8T
 qMQR3izYwQuh/4F9ndRpzrnC9p1LCHG1CzgMqPJkXqtzIi/0BTgv4Viqgsuft4D8Rhha
 YQr354tKmLSSvDal0+IITFI0UMEzDjCfEZ49Rc2Cenv2tv3BemKpyaZlBmbz0Il8rpxT
 Lrw6OxIzcds+UXuAQjIvtygHtWNuNvjOr5pNtkh7PnDV/DQQO1XPlkbzcU7XE9NVB4sh
 jc8NHD5j7S6Tu4xV3ojCa0TdaviVLI96B3+ahARjYlt9cA6uV03X3qjcLkqgxGAaJzsO
 BkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KhxCPcFjyEBQpjfyeIcNjqcX9Xj3CtjhkjDuLlufOxo=;
 b=dYzzwuVM+iVcQzxyyU3ztnsiA79fF0P+U1drI7P7PNq74f3hMyf4JIsyBnmpnjKWLu
 xQYOkSqboxvhlBVDukUkjNruFS2nLLdw/rWmluCwB1QIAfFPfLcUHkMyP4FYJxdk//kl
 0Q2t3dg0n8/g5KnAgcxbvnQlW855uWOdnTAwgw7fOJS8RMpHFcdhTnWywchlg+9miq7j
 y3jWBX9EIi70lqtgacpRxVSe6mRdcFUO7Mero//lvV3tjjJeS0KkdLi/VKyAdqlHJJvx
 9yQ9Emb/eN8v29DBhiyNV6Klr6KGUyuFTx1avYcWbqzhswCQTV6mw6aOY13G2UizdCbm
 RFYQ==
X-Gm-Message-State: AOAM531PlfEiFQrGFU9lyPdQyq9Do9CS5RXnCdspo4xX/Sf6gN5QSDn+
 cJoLbdJOcKtmKOnQXH0tEXaqFA==
X-Google-Smtp-Source: ABdhPJxiyE33GKFrNngrOTPcp3NVOJvPM1nNa07Fq9QxBx/XCsb+Z5g1cZs9g6maX8WowViTAWYdxA==
X-Received: by 2002:a63:d504:: with SMTP id c4mr9771168pgg.138.1598455046107; 
 Wed, 26 Aug 2020 08:17:26 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g5sm2479060pjx.53.2020.08.26.08.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 08:17:25 -0700 (PDT)
Subject: Re: [RFC PATCH v3 17/34] Hexagon (target/hexagon/imported) arch
 import - macro definitions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-18-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <283ca509-1ab9-71db-2aa9-6ed19f22c18b@linaro.org>
Date: Wed, 26 Aug 2020 08:17:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-18-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.239,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, riku.voipio@iki.fi, philmd@redhat.com, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:50 AM, Taylor Simpson wrote:
> The macro definitions specify instruction attributes that are applied
> to each instruction that references the macro. The generator will
> recursively apply attributes to each instruction that used the macro.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/imported/macros.def | 1529 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 1529 insertions(+)
>  create mode 100755 target/hexagon/imported/macros.def


You might as well squash all of the patches dealing with imported files,
because they're beyond review.  They are what they are: another project's files.

Give that squashed patch my

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


PS: I notice that the README mentions archlib, but does not give a pointer to it.


