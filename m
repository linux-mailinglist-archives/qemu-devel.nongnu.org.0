Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D294652425A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 04:12:35 +0200 (CEST)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noyJe-0002tR-CU
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 22:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noyId-0002DX-Qr
 for qemu-devel@nongnu.org; Wed, 11 May 2022 22:11:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noyIX-0001fN-OL
 for qemu-devel@nongnu.org; Wed, 11 May 2022 22:11:31 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n18so3564854plg.5
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PBZKo33/Zxa8MABoaYiXvHC05dwfUA0KXD2IvNASjwQ=;
 b=FAeBlrc+5n6k65JJJXdmmKjNqJtka9qqoAEQ9ePiM3gMJ7ThL2xD33XZG27NbryTuT
 1fxEUnoBoSLsvIwYd5OJ8JkGUH/269mFkBX9y9ctItOm2z8o9qvlrPv7XhS9t80LIeKE
 OveLN+ixKVLa72Vg1BJoa6CmBz36qMqqZ6CKfl8mNps7O6WJQ2yrDiqHPiILMROfg0YE
 DvhEpD6wzO9EWzpgjZAP9SCsx7PURXMs+dpjf0Nxs3ganY7QifWS7etfUj48fkh45GrO
 Ue/+Ij2xtmV/5RtVHfrVnw+GqVImjZEkwvDuVgWtc4HpV5PfT8kagXPnNBIlXQgpQu+M
 aDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PBZKo33/Zxa8MABoaYiXvHC05dwfUA0KXD2IvNASjwQ=;
 b=d1dn6rmqbxeZ1QglHXoDBGDguzLYI53hpm+gCOVJsqeWu5+7rrPqJ+ISgTugoo6b3p
 /KTN0QjG9HYKJmrX2a7SHlQunCCiPqXhE7PdBZkNbBVsmPLbP6WWOYHDu4h03c3mHUs2
 fM9reelt7is52FzzFJRmuBXxmZVP5ZGQ3c92hlYJnrDzvPMQOYDt+EzvUkLkuo1rw4f1
 g4STM1EIgb/yKTjAvSNGl9eH/heww3OPf0UIcBVr4nPcR0HiBsq/VT/WN5fAzq5RCpJs
 prxAjvKEGDsU/lNVCNs/CtH8a35GC1M0LP4eBJrzux4Gk1tJSVqcRGp4ALSo1RkBCkP/
 xC5g==
X-Gm-Message-State: AOAM5315VLNU64klFpuz226usw26/4EO65IxqRJ8B/XsAonU6SNEOHnG
 YWDFywndicYva9aPTaogAM1qjA==
X-Google-Smtp-Source: ABdhPJzTKuJL7dG8pLXH94WURmYDza2BDU+wMvd7ffLit6228zlKZ1N2aUHt6JuPL4+xruDdWvjPmw==
X-Received: by 2002:a17:902:8c98:b0:15f:3e78:dc43 with SMTP id
 t24-20020a1709028c9800b0015f3e78dc43mr2634851plo.120.1652321483384; 
 Wed, 11 May 2022 19:11:23 -0700 (PDT)
Received: from [192.168.66.8] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 n17-20020a170903111100b0015e8d4eb2c6sm2653286plh.272.2022.05.11.19.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 19:11:22 -0700 (PDT)
Message-ID: <9eb36cb4-e727-9c10-df6a-2dfe22943244@linaro.org>
Date: Wed, 11 May 2022 19:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early tb
 exit
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20220511120541.2242797-1-shorne@gmail.com>
 <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org> <YnwuFZsNjQLxOfp0@antec>
 <9c8c68d0-cb7c-4ec5-eac4-fd915934db5e@linaro.org> <Ynw6CymBBiqQgElu@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Ynw6CymBBiqQgElu@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 5/11/22 15:34, Stafford Horne wrote:
> In this case I don't see how the tb->flag would be updated, ooh, I guess it
> would have been set earlier when the TB was generated.  Maybe that is what I am
> missing.

Correct, it should be unchanged (and correct) from generation.


r~

