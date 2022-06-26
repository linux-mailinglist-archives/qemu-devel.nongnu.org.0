Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932DA55AE87
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 05:39:36 +0200 (CEST)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5J7X-0002dT-8U
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 23:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5J5q-0001kK-W4
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:37:51 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5J5j-0006Zq-C0
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:37:44 -0400
Received: by mail-pg1-x535.google.com with SMTP id 9so5979509pgd.7
 for <qemu-devel@nongnu.org>; Sat, 25 Jun 2022 20:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fJNzNynPbmLmwXk/EBwjTxTWNWtbFcYQklW5/Hi/ouY=;
 b=LUmBxAHEX/p6K1eNZqkok6oAzSA8z2Uedq/H+th2o481BsLIp0AzwyiJUvH4JQZ1Po
 nlsJ/OZqAytKed+cMHP/YPZOMw+0fymp8vCCU1qQcNjblvZqML0YJcjCGMD1m/Z9npDa
 FFiMEJw4iIUF+0G4OGcDUnpdoHOnY8rSOGsrJ/IXYIQlT3ho2HIefWS4787UiytD1di9
 WEGRyjnZDmA7FrbCM6h5S9WhxzWZxoz5N07bsccwz9sPT+XOsC+yDBf3NTEaGiAmPYyv
 KnXXvs7g76CV9T/FgiL1lZd9RpM0u4h9CXJ22wxYYNhiEPi4FFTbXgzTichG27PK86ps
 b3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fJNzNynPbmLmwXk/EBwjTxTWNWtbFcYQklW5/Hi/ouY=;
 b=7cXTnVxHFF6E6fiK2hB1xB4UtXYrRIxrw8PJkXguKH3UKw8wbfoPaxFQGEA5ez0XXo
 HmgYWEYY7iJEikXYuz/P6YpGAh1AdHJ38R0TyKkLXLCa3RBABjkytDh8atUidbBlQTFU
 RFIq5n5+K+belYsEx+FjJxameU8QsBbtJiD184EANiTV1cim3rRhn6/yThfQNawxXEgm
 7HBcDxN85X9VuBqYrh6kIJelMKM/Bvawm083wHdbHOryIiRlPPLgNrWQJXsLG4J52gYn
 4uyE9NEx7gYhAxHm10L+8vlOyGKvVOWclCCXa5X2pN3iKs7Kbe4tbc13RryMq/r22hwz
 ODPg==
X-Gm-Message-State: AJIora8u/5xbw1OZAMgqyENxBCnWjn1cPc+fKunB7fAdnCso8p8XN/ow
 GIOitqxN9BoZr89Dd4FSqelsWA==
X-Google-Smtp-Source: AGRyM1upnyGHkJdgu6+9BsvXW1Yn5SxwIu5TgeArhxKEIlSU0tH9AHgr4NiwlPQcNI+6qeBX+KL8vQ==
X-Received: by 2002:a05:6a00:a8f:b0:51b:5ca1:47f1 with SMTP id
 b15-20020a056a000a8f00b0051b5ca147f1mr7403847pfl.50.1656214658717; 
 Sat, 25 Jun 2022 20:37:38 -0700 (PDT)
Received: from [10.10.67.53] ([116.12.83.234])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170903124e00b0015ee60ef65bsm4382006plh.260.2022.06.25.20.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 20:37:38 -0700 (PDT)
Message-ID: <3094471f-5b5a-1613-5d48-504a9f997a12@linaro.org>
Date: Sun, 26 Jun 2022 09:07:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
 <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
 <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 6/24/22 14:38, Peter Maydell wrote:
>> Can we use this solution in the short term, and fix up advsimd while coverting it to
>> decodetree?  I'm more and more convinced we'll want this sooner than later.
> 
> Yeah, I guess so. Is it possible to do the SVE stuff the right
> long-term way and have the short-term fix only for the A64 AdvSIMD,
> or do we need to do both the same way ?

I could change sve now, yes.  I'll try and find a reasonable split: more than 1 and less 
than 50 patches.  :-)


r~


