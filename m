Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B64118B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:59:17 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLhM-00073Q-PX
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLg9-0005rT-2C
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:58:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLg7-0008RM-By
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:58:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k23so12335450pji.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hqdGh89IM3bcdtsDcp3bfE1UIYgGWqjLoQICykFpzro=;
 b=FR43xwlPgBtVfRwBXxUZPf3bu48UiwFZOS0La6wR/G+s9ZP3XCmjk6/ms+UA0AXK3y
 4A6ZXkstoY+/TS1XthBnqcZNI9KMccnglQu1WMe7lv84EvenkgtkFT2u8U63bFxQ8gbB
 n6mTwf7OY4heigkag5YWZKyUU5EO08CknBSCJczcsTit69IgbsJD90YCh8stAJ7vuhu0
 NTYemVIKKGrija6fQ2tsqHENPDk3VseR4xjuCtWge+Dcgez3/zRE1hy1cwiy6e/vVqAF
 WcZi1J1DsEsWe15T9lNUCXg97UCJsI+1Ual+gytn3mKlDNiHEFmyYn3jAfgsqqmlaHDJ
 2ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hqdGh89IM3bcdtsDcp3bfE1UIYgGWqjLoQICykFpzro=;
 b=LsUkxYAW760YvGsp+aT4T+Gh0vqoEDk693sTpFDYAFWdMju9CzjHViDNmDiH6qYHBs
 if6EPRuS7r/1lF7pxe6pJZwa7/PJZtfQ8Hjcss2ugXh0DZ2qwKTcrbcIDMuzXIa/ff50
 nE24ZlKb6kvb9hTP5+eZAv0MKj9+zmCdftVCEWKoN+xqPU9woaYatQnY4Cx4XOts0QoG
 rCwBEQNDZ5pYZ1yLlQ6aDAQlMD1f+nObYONCVTjho1fMohq5ugUw6gAGwgSlQ+Nuue4g
 6g/QA6G7eXEUc4i1TBEzyiMPZdRLFMv1IWiFSY/57l2To74kVlJWwLOt4NMJcx9TkHK/
 ZKxg==
X-Gm-Message-State: AOAM530wxnoO/FK79W1Kecnc13yx5jCVqB4FC8YnmBIA1y0xX6vylSBF
 WNO4gi7udQ/1kWBjiSOWwgOYmrW1CsEa4Q==
X-Google-Smtp-Source: ABdhPJy1XxgV0BJQ3/GA0246UenzToLj2gf6GC7syfihXdC59mB0KfAanOy9KRgplNGnYQ0UreRzcQ==
X-Received: by 2002:a17:90a:1a19:: with SMTP id
 25mr21733742pjk.34.1632153477871; 
 Mon, 20 Sep 2021 08:57:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s89sm7509767pjj.43.2021.09.20.08.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 08:57:57 -0700 (PDT)
Subject: Re: [PATCH 05/30] tcg/loongarch: Add register names, allocation order
 and input/output sets
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-6-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f34ba038-83ad-d6de-24b4-2e366f9a5782@linaro.org>
Date: Mon, 20 Sep 2021 08:57:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-6-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +    /* Argument registers */
> +    TCG_REG_A0,
> +    TCG_REG_A1,
> +    TCG_REG_A2,
> +    TCG_REG_A3,
> +    TCG_REG_A4,
> +    TCG_REG_A5,
> +    TCG_REG_A6,
> +    TCG_REG_A7,
> +};

Generally I'd place the argument registers in reverse usage order.  It means that we'll 
try to use A7 before A0, which may work to our favor if the called function has less than 
8 arguments.

But otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

