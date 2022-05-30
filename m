Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB514538811
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:13:08 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvllA-0007ou-5h
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlPw-00080m-F7
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:51:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlPu-0001sO-O4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 15:51:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h1so1862773plf.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hTPnGpAfJ8zMvfkD/hTU8PhEyKnLyhjxnq3sSlG9sGc=;
 b=CBEjfnyAS5GVcn6b6QKtAh7YsdYyaOnXVSxdSu2aY8Kzrw4MfoP3af2llGig09y1Il
 lhzO5Lih3nFdS5l8Rflg/6+hNwvo24Lb0NG4n0CMd4O3dqdmEb+Ah0jLUqhLPrXKFKy8
 RQcXJpDcbwkreVcgIHxg+49pq02JFLM/9GjjPwVMCyn5yD67tKxSCVRUKOLTugv0i0nD
 dPX9Gw/pQIyIWd4USILv8+j/x2aGUUnszvy4MNlVicAkymLgQU8BPkyLnmlnfRmRBgU+
 HJo6yfERIBLBwqS/NKHmRa+COsUGh078RbdlFKA2Oi9tak1d8zVDlo8VW/AxoxVHlrjc
 R4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hTPnGpAfJ8zMvfkD/hTU8PhEyKnLyhjxnq3sSlG9sGc=;
 b=YbN4D97BB/rgHXRvXK2bNY9X328JJAMklnN4hxwpIrIVGwU9wM5ud1/uMQQYQs2YN+
 6VEKmwFYM78uUW4CgbOR40KXAb4xgqCJhWYj7W9GcQIYYktMbOh4HpUWDv6W/jLsBUGh
 msUSNPtf59DwYt4Nn2UqhDH2a3FW353xyaSsAHZENSBWBTb6r0tERgUELVvYmutWE9tw
 3Mt3Hhr0pmFx/Q5xqCryi4aTgnxIPBIxxf/K6a9LYfcgDc0LXGakXID6z4Na+IcwKQIf
 JgJ6T+ccGenI5YKDITAmvKWHVF97HxD2dh4suCNmr47gKE8evn49br9SeFJZk+0Ph4hN
 8BGA==
X-Gm-Message-State: AOAM532AOEDvRc0hEyn2bt7HAwD7yVi3wK9RR5HyyIAXpPVaOR9jnDpP
 fdR5OpiAyo0No8EFw9p3lOgulg==
X-Google-Smtp-Source: ABdhPJzD6d/cTyv4RLQhez7VpK/fbP4c3XrBY0Cku1OV2DsHiG8IwHU9cWqALwF+TYb5HesN7x7c6w==
X-Received: by 2002:a17:903:1108:b0:156:73a7:7c1 with SMTP id
 n8-20020a170903110800b0015673a707c1mr56869763plh.101.1653940265233; 
 Mon, 30 May 2022 12:51:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:feab:28bd:b064:f797?
 ([2602:ae:1547:e101:feab:28bd:b064:f797])
 by smtp.gmail.com with ESMTPSA id
 be1-20020a170902aa0100b0015ec71f72d6sm9453909plb.253.2022.05.30.12.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 12:51:04 -0700 (PDT)
Message-ID: <62f36b58-604a-80e7-1e94-0d6d3611ec84@linaro.org>
Date: Mon, 30 May 2022 12:51:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
 <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
 <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
 <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 5/30/22 12:01, Peter Maydell wrote:
>> I'll have another go at this reorg this week.  If it still doesn't feel cleaner, we can
>> drop it, and I'll make some changes to the SME patch set building on this.
> 
> I was wondering if it would work better the other way around, so that
> raise_exception() doesn't mess with the target_el at all, and all the
> "work out which EL to take the exception to" is done in
> target_exception_el() and similar ?

We need some place to put the EC_ADVSIMDFPACCESSTRAP special case, and it has to be done 
at the same time we're handling HCR_EL2.TGE.  Perhaps that can be separated out to its own 
helper.


r~

