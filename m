Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98C51DE5D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:31:50 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1nw-0002Z6-N8
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn1m4-0001bX-MN
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:29:52 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:35783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn1m3-0006r6-3l
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:29:52 -0400
Received: by mail-oi1-x22e.google.com with SMTP id m25so8206616oih.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lxFPg92w/KEQCtE5tCZY09cyrP9lkYU8xtJmxOclx54=;
 b=UVi8ENPrKt+XbohOwvDd6DfhvnRbFdeIAsAjbcxWFAt8sZmI1Kz1UVJnaAZYsrxP3E
 ns/q89W1M8MFnry9J2ktEk4h5ky5vS1ETbqkkNX6npsgsMcEtJ+3/B5VIEs78l+7l68G
 KfCYqHhZz4dhbr5qeDbF1LAp87RTWk4oAPYtgTPCWgBP0dDyDT4Cl3fhhpsUkUsrWivn
 8DjjAgVqHeuaFYo6QbhBXzVDjX2kTPT1AGFiNafxFyjqy6eYDLy3eeuV9dPudhSkh7of
 i1lJnFaaCnSiIsQ7hXAb5z5EmYh2usLfSoxkCGxmD+8HFLRqMmBgDrYuO9TZIJ7seQwV
 HeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lxFPg92w/KEQCtE5tCZY09cyrP9lkYU8xtJmxOclx54=;
 b=LFoXKlDUGph5uu0YnW/6aRMFoeqoBTlH7sdW5LBGwKgz1kdAHJ/nsJu1UHcttRDRRL
 90aZxCnkADWdnC7yw7ZGWopCjVos52+QiJijOCqiy5XDHMVSuI/bb4mXfukAKdPPxaYV
 811ZeeZLKjJZ+xNwBKeIKzIugnsIIU9WifK7Egjp2h7nsHmuE6We2drcPPdJxON1GkW+
 46sDqHRty0sNOEkNz3sQvoP8dGguem61rrQWx0CiQ8pOZg4SZcXAgeOrFOt7i9Wzx501
 4aM5hqXW8P2TSz0nUf5Yd6gm3c4fG7taOZbZdLn6DUChfTNqfEwLxaJFb+Z8Uxsk19eO
 mFKA==
X-Gm-Message-State: AOAM533jPkjKjblDtqGEeT0iF4fiyXLXfamMbmmGG+mtx/f5KFrCo8ge
 FiKkRtTywKt39nQF7Npo+XvDiA==
X-Google-Smtp-Source: ABdhPJyjD4eIkfxAVknHTsVqPRObj7x3U267ZIL2OSrJ4QhVLPVTGG0yBtBn9b9Sud51k7yHl0vS6A==
X-Received: by 2002:a05:6808:1a1e:b0:326:3846:c4a1 with SMTP id
 bk30-20020a0568081a1e00b003263846c4a1mr5662433oib.80.1651858189343; 
 Fri, 06 May 2022 10:29:49 -0700 (PDT)
Received: from [192.168.86.227] ([172.58.102.203])
 by smtp.gmail.com with ESMTPSA id
 42-20020a9d012d000000b006060322124dsm1799836otu.29.2022.05.06.10.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 10:29:48 -0700 (PDT)
Message-ID: <2bbd36ab-5ca4-19bc-7bfe-1c53d01e02e0@linaro.org>
Date: Fri, 6 May 2022 12:28:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/9] Misc patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
 <CAFEAcA8pPZJ-Yn2U+7G=eQOaNu0c4g3LGQvugf5vZ=vnA72Frw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8pPZJ-Yn2U+7G=eQOaNu0c4g3LGQvugf5vZ=vnA72Frw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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

On 5/6/22 09:49, Peter Maydell wrote:
> On Fri, 6 May 2022 at 15:41, Thomas Huth <thuth@redhat.com> wrote:
>> ----------------------------------------------------------------
>> * Remove redundant/obsolete x86 and arm disassemblers (Capstone is better)
>> * Limit some Xen-related code to builds where Xen is really available
>> * Remove hxtool-conv.pl
>> * Update MinGW and OpenBSD to a more recent version in the CI
>> * Warn user if the -vga flag is passed but no vga device is created
>>
> 
> I think Paolo mentioned an issue with the -vga patch here -- might
> want to hold off on that one until he's had a chance to reply.

Ok.  I didn't see this before I pushed to staging, but I won't push to master until I hear 
from Paolo.

r~

