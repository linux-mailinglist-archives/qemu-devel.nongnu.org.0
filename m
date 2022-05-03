Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD82518A5E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:47:44 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvgd-0007tR-A1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlve8-00063m-Nn
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:45:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlve6-0004Dn-56
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:45:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id q76so11401814pgq.10
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RLF5/W3IuH9Yj8t7hqDK7PyODo2uegZZGGlMK7Nstbs=;
 b=x07od6kXQobaypaC7asRdxwZe7JV+GiGqZMKrFSpMHp/4j6uVh6yNMJqxgiScC9VBn
 o6u4ZSjwB72cfcuS43/DFjjx0twExbwdZki7BalpdpVj2O1qXHUpywNufqux2PusWHwm
 vjt6QXZaOB5Vp4o1UacgSb3bAWimuKxszFBD4BYy44UbimVss16EPCXpZoJ7lajjL71w
 s9KVZZslQjFgdWWG44s0czfnCJwLhPdTC5x5YP1hvYcN5x51C61/8Mzq5JLNq39MrfBF
 S2yulainJXHgUwRfKBi6Aq6japVvslEPssQYN8RHeLyg5KTPJmVS+RFvWDNl1VdloURq
 dcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RLF5/W3IuH9Yj8t7hqDK7PyODo2uegZZGGlMK7Nstbs=;
 b=Jw467+x6kuQf/caN+/TI1Ndi/BJmDsFoJUrtenpLi11kCkCkwumi6rmnCP51s8KEuU
 2oI6VoMcBUKzp0geu8otMvwArWCh2Lka+ilQFUY+gSZlv+S9OzdmC5MtYobBoyctFEkZ
 oi84XVJ30HOf6GjhbIpyFCV9xE3hee0ghUDPwjpe5xSMxvDypxf27YEe92IOEuwiEdZg
 jlyNBV1gF8svBXVvWYCdTaPNTmqC11yPhZ8GLafqUpkxq5rJTaZVEReR8rPHTK9Hi/k7
 KzjXuXLuSmlbRbiFaU/qrv5JW6pOPv1XaW9owO/H+S4kia5ePqED2cNmYzD3ctEmXaeY
 UhEw==
X-Gm-Message-State: AOAM532Q88EzW9oykqc+LbBF05MEh7fuPL+eBHdPUiyBqu9i0lQh7zy3
 /3iT0/lMxk5ZumIybq9nc5hH/Q==
X-Google-Smtp-Source: ABdhPJwPnBo2z1yYoVOVcnGpDorCk/yG5/bejQ4Cj57rtSU59tKBx4JXNi6TvD8iHavsnS9DylKGzw==
X-Received: by 2002:a63:81c8:0:b0:3ab:6025:f43c with SMTP id
 t191-20020a6381c8000000b003ab6025f43cmr14387693pgd.189.1651596304353; 
 Tue, 03 May 2022 09:45:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm6525669pfk.78.2022.05.03.09.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:45:03 -0700 (PDT)
Message-ID: <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
Date: Tue, 3 May 2022 09:45:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 20/45] target/arm: Handle cpreg registration for
 missing EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-21-richard.henderson@linaro.org>
 <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/3/22 09:34, Peter Maydell wrote:
> "set CONST on the cpreg" is what the code does, but it's not
> what the architecture wants. In particular, if the EL2 cpreg defines
> a non-zero resetvalue then the EL3-no-EL2 CPU will get a
> "reads as constant that value" rather than "reads as zero".
> CNTHCTL_EL2 and MDCR_EL2 are examples of this.

Ah, I'd missed those.  I guess I need a third bit to indicate keeping the resetvalue, for 
e.g. VPIDR_EL2, which is why the code is written the way it is.


r~

