Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45275532A4D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:23:03 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTZ0-0004O9-5V
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntT1J-0005Lw-Vq
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:48:15 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntT1I-0003dm-6l
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:48:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id y199so16205612pfb.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FE0iwfme+sc8UyoN2QM/vJXxcsXcktKneiQYiZkRx1Q=;
 b=usTiZwbTWaD6jJoFsQguQhXBJRitT96xZb+KKsxILzzsqucUCTe8TbfYoKCrmyzVqK
 +G1MP2LbBI5qDSDQYPRWTD7CXSySjlPGH/fV5Akont3E8ORjUZw4/75muL7t+Ex9KQym
 NTpAfDt+3Z/Dy3/XausWjKw3wQO0xMcxkDGx/BUPPFbHOyb6FPLbeIdrYpqBuoWl+oOj
 zbPsa9xCs8Lv2A3qPesAcKGj1SPHTVmbYdhwRGf9YwT4Td+EOjrvuTT1m2TfrbmAMGek
 FazLDtVcH987etQ0Isctrsb2N7iL4KzafKplXoD2FvdUl/YC4VO0Zu+d3qFgp19m6pXq
 pepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FE0iwfme+sc8UyoN2QM/vJXxcsXcktKneiQYiZkRx1Q=;
 b=lok03d3yHllcJDcWmm1ZBwdXPAPVOO5PwhLr3v5QvcPu9T0Ft1SR/svDB1wpSgpNZM
 4UUBNVv947oJahlqbtEkTEZ2rAy98QMeSdZisMAsXwJFpuOCXF4FFieYM8p4J9sM+sJn
 vcnzWQMChDQZZkz/2t8TMWHfWqdUOPg36yFMjeLAXyBYzvtULS6TQbXnVvSgXFnj/lO1
 7VQ1P0IKigJwRVedHYuSx8DoTd8eYvAqYGjuuJGsDx+rlYXopiVBtlj8JzXknQwnkLEi
 2hiCmQzxrkgh59GRuf21cZYcm9/eGVEodSJ/UV7SwiF6K5ySjORvXcDURIEYISXAQhsA
 nvFg==
X-Gm-Message-State: AOAM533jP8MPUNPjvfrzcF+LWFIybkS8HThaNjf3XDEcs6n73hi3Fgau
 UAak3v+nBTtJlAuscHeLXErEoHurmSJS+w==
X-Google-Smtp-Source: ABdhPJxK5OHC4T1sTVUVJlF5R1pjuaoXjGjdrFpCvEFTmx/SE6KOrcNtU+EPeK8I2UwmFRY9Z++hbA==
X-Received: by 2002:aa7:8492:0:b0:518:7e1a:3359 with SMTP id
 u18-20020aa78492000000b005187e1a3359mr17281314pfn.18.1653392890920; 
 Tue, 24 May 2022 04:48:10 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f70600b0015eb200cc00sm7008519plo.138.2022.05.24.04.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:48:10 -0700 (PDT)
Message-ID: <6d4b89e8-452f-521e-3464-7981e89794e0@linaro.org>
Date: Tue, 24 May 2022 04:48:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Emulating CPUs with larger atomic accesses
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>
Cc: qemu-devel@nongnu.org
References: <87k0apeor5.fsf@oldenburg.str.redhat.com>
 <37f4c866-4344-37ba-b64b-fd338dc96887@linaro.org>
 <87sfozuvpf.fsf@oldenburg.str.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87sfozuvpf.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 5/24/22 02:27, Florian Weimer wrote:
> * Richard Henderson:
> 
>> On 5/13/22 03:00, Florian Weimer wrote:
>>> What's QEMU's approach to emulating CPU instructions that atomatically
>>> operate on values larger than what is supported by the host CPU?
>>> I assume that for full system emulation, this is not a problem, but
>>> qemu-user will not achieve atomic behavior on shared memory mappings.
>>> How much of a problem is this in practice?
>>
>> Well, it doesn't work, no.  In practice, x86_64 supports 128-bit
>> atomic operations, and guest requires more than that.  No one really
>> cares anymore about 32-bit hosts with smaller atomic operations.
> 
> Which part doesn't work?  Full-system emulation?

No, user-only.

> Do guests really require wider-than-128 atomics?  That's quite
> surprising?

Typo there -- "and no guest requires...".


r~


