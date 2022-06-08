Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD65420B7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 04:05:47 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyl4s-0000Ge-0L
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 22:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyl28-0007GC-SO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:02:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyl26-000659-4G
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:02:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id e24so17324609pjt.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 19:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1HuDf3y0v+3DM2rtRx9pu9Ne23sLwmAnnVqikeoy1Lk=;
 b=oY3DTAv/pWm4/9vEdXlIzTdsxNsLToGMx8bm6/gosIiTf7uQARM1dD3eFtV0kp4xWS
 CS5aRvaJt9Oi8PajYRtV1IMiuTQScQZqt5hSjmx7gSeyDn/3BA7W5G0iYn09iIk3TwwF
 IRMDaIpjsn9X7MBMsv7murFDwF19KrR3hSg65YcRsykGNUDl6MlvghxQbXXK47lXcNsL
 k2Ub5HvnBRCy1AOW3E5WAJK1ioPyz4gDDDiO6XlEmxIWVXyXv+n10u/wzZLM5vhmkqAY
 qEkZAuHrCErgz6gASmcdhDOWXWLGPa3BbfFzYaDog7PGwJNRDwa1Kkgx+tIWW280iZJy
 Ranw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1HuDf3y0v+3DM2rtRx9pu9Ne23sLwmAnnVqikeoy1Lk=;
 b=p9oMA/W0aSiIlu6NdXu7NPCoafR7EVZi9aOmUssfoCeZigZc4HddNX7P6JbhKfo6Zj
 T2MTpCITCCV2NwpwjUCSUiJkkKqDntJj9kCanlrflgTnT9BlbTXcA8ZjAFiIwDqZffIw
 vr4Q7HZBkU9uDsKe6FYmrz8vcrlI6PUomAudQyGNK+JGknwOTH3jXZSaGGm1RvrsULIs
 8e+D1VDF5hhBr3Z0uDbUIMmM+KirVrEfHfvAvVl6Z44zpe3sdAEnAa3gsDkienG/+lFe
 I73Pe5Wng8cBwHwK08hrJAAVrCPygEB3dVYptvbRPNLPOM29V3O9J9K53gDh//lG8ILn
 KCQA==
X-Gm-Message-State: AOAM532kPRokZzH3wo8OrHBjC1IIXrKOzr1ABSrcUS/a38dAo5sWu3ei
 PJ0UwDsxkmZbv77mRfX/iJNgSA==
X-Google-Smtp-Source: ABdhPJxAIcn4WOHYUirwYSoL0SZnTHq1Ngsoxu1Loy21T9pmtwBk/94xptKib2c2EZU0DUd7Wjx/jw==
X-Received: by 2002:a17:90b:368b:b0:1e6:67a0:1c17 with SMTP id
 mj11-20020a17090b368b00b001e667a01c17mr37208812pjb.203.1654653772384; 
 Tue, 07 Jun 2022 19:02:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:c626:2f70:ac99:7c97?
 ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090abf8200b001e305f5cd22sm12586257pjs.47.2022.06.07.19.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 19:02:51 -0700 (PDT)
Message-ID: <3bfb791b-f6fa-ebad-8195-43ce653a73be@linaro.org>
Date: Tue, 7 Jun 2022 19:02:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Content-Language: en-US
To: Warner Losh <wlosh@bsdimp.com>
Cc: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gleb Popov <arrowd@freebsd.org>, Konrad Witaszczyk <def@freebsd.org>,
 Jessica Clarke <jrtc27@freebsd.org>, Kyle Evans <kevans@freebsd.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
 <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
 <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
 <35407e39-ac93-b5c0-c634-975ab8609a92@linaro.org>
 <7CD189F5-3536-4B7D-B7C1-AE5E74B90D03@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7CD189F5-3536-4B7D-B7C1-AE5E74B90D03@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 6/7/22 16:35, Warner Losh wrote:
> 
> 
>> On Jun 7, 2022, at 3:23 PM, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 6/7/22 14:51, Warner Losh wrote:
>>>     void unlock_iovec(IOVecMap *map, bool copy_out)
>>>     {
>>>           for (int i = 0, count = map->count; i < count; ++i) {
>>>               if (map->host[i].iov_base) {
>>>                   abi_ulong target_base = tswapal(map->target[i].iov_base);
>>>                   unlock_user(map->host[i].iov_base, target_base,
>>>                               copy_out ? map->host[i].iov_len : 0);
>>>               }
>>> And wouldn't we want to filter out the iov_base that == 0 since
>>> we may terminate the loop before we get to the count. When the
>>> I/O is done, we'll call it not with the number we mapped, but with
>>> the original number...  Or am I not understanding something here...
>>
>> I'm not following -- when and why are you adjusting count?
> 
> When we hit a memory range we can’t map after the first one,
> we effectively stop mapping in (in the current linux code we
> do map after, but then destroy the length). So that means
> we’ll have entries in the iovec that are zero, and this code
> doesn’t account for that. We’re not changing the count, per
> se, but have a scenario where they might wind up NULL.

... and so skip them with the if.

I mean, I suppose you could set map->count on error, as you say, so that we don't iterate 
so far, but... duh, error case.  So long as you don't actively fail, there's no point in 
optimizing for it.


r~

