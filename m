Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FDB4FE3E2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 16:32:46 +0200 (CEST)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neHZU-0000OK-SI
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 10:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHXx-00071p-7Z
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:31:09 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHXt-0003eT-La
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 10:31:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so3103400pjb.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jRlO+zP0kVj3Wo0YI3Dve+Qh0WCm2PUnYex+fnuEUiM=;
 b=Ex/Euq1TRS3pBLT+kHDohou2RQNwF2KGPRYKsowEMBhkTlOLUuOsqmr6qhkzrY1cvG
 hRo2w/HZuWPS+eyjW8qMTeYGiwa4ujBK5Edc4Iky69Pjq5pfYUqD3sNH/1oXRkGMewFR
 EoPH2C7DYe1ch3BY/a7d7BFee8hZhLbqWeOguhgzoh+KGuXaM+vRcF0l8mdCKxxDp0SN
 vZfj2rbuX9G2Z9qj6p7x1teSzyfDJGrTYH2LrU4h32V6ucVqTgkE3/FqhO2E9wiyluya
 qpjHkkT+Tp8qIc5YhGlwjnlRHQ+FZB7Ri9k97QTf/r4Ljo8grbE3RQAlIIydiB61HOC6
 QgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jRlO+zP0kVj3Wo0YI3Dve+Qh0WCm2PUnYex+fnuEUiM=;
 b=niYd8D7EIUj/z+xOArfopGDzNTjaKeJjj3UjkurpDGgP4JWpqpHnpj+i6uQFjq7r5O
 59jm2mp8YPL3zzHT1IvltQjuoms+yt/DIXGrtj+7aLqfTCXDAsxRLaVX5hbMgPvExIji
 /9tXX3iV1M5Gd6c12oDQFOliiqEJ2NORb+9NAscrLpl08fMVt1kCQi5koJh4VFVBWTEj
 78bMIRrlLzZG9szncsvpwlhjxvMLK4cdEIf1XlAKMHpTjXLJbbiQSalootHs3XUi8eDX
 GGXD9v53ulTMZG3gD64ZMd7+TJBGUYYQT8mfPrU34iLMdRXWM6Chib2Wk8NFtCYGNgbl
 qxBQ==
X-Gm-Message-State: AOAM533eQy5zzSQeu00+H0Q4scHreIJwz5AVrQ2epl6zbYRSuRHkHYG/
 /D+2zuOHpo/N00UtpUsvkC5JiA==
X-Google-Smtp-Source: ABdhPJyT9nS0Mjwm5kcwwv6QQqyCWMIBvuH+akkbDlB0Pj84nSogs1bUg3bwO7bdaq8rP7/MEnfvgg==
X-Received: by 2002:a17:902:7088:b0:156:1aa9:79eb with SMTP id
 z8-20020a170902708800b001561aa979ebmr37525303plk.71.1649773863990; 
 Tue, 12 Apr 2022 07:31:03 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a63be4f000000b0039934531e95sm3082383pgo.18.2022.04.12.07.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 07:31:03 -0700 (PDT)
Message-ID: <232fa6ab-2e1e-4b50-bb45-762242f8a0e7@linaro.org>
Date: Tue, 12 Apr 2022 07:31:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
 <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
 <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9VHK_YLnZ2FAgdg87uF5Bk4op7kvL9e8DAZp27jvfjiw@mail.gmail.com>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 02:56, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 23:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/11/22 09:18, Peter Maydell wrote:
>>>> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
>>>> +    ]
>>>
>>> Why don't we decode bits [11:8] here? I see it's the same
>>> as YIELD/WFE/WFI, but I'm not sure why we're not decoding
>>> those bits in those insns either...
>>
>> See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.
> 
> Hmm. That just means "decodes to the NOP/WFI/ESB/whatever
> instruction-description whatever the value of those bits",
> but when the specific instruction-description then marks
> those bits as "(0)" or "(1)", that has the usual CONSTRAINED
> UNPREDICTABLE meaning described in section F1.7.2, where
> we get a free choice of UNDEF, NOP, ignore the bit, or
> any-dest-regs-are-UNKNOWN. So we're within the spec to
> not decode [11:8] but I think it would be more consistent
> with how we try to handle those (0) and (1) bits generally
> if we insist that [11:8] is all zeroes here.
> 
> For this series, I guess go along with the current way we
> handle hint instructions, and maybe fix this as a separate
> cleanup later.

Ok.

r~

