Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01B1853D3
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 02:27:17 +0100 (CET)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCva8-0003x9-80
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 21:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvZO-0003VI-Aq
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 21:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvZN-0002GB-5q
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 21:26:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41923)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvZM-0002Dc-V0
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 21:26:29 -0400
Received: by mail-pl1-x644.google.com with SMTP id t14so5134222plr.8
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 18:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j3M4CdeK1AwG3wYfx15EhDeO/eLOhzMp4aiaEQ5mNbE=;
 b=q4NQ6wA+laRAt0j9GcFCJ3ZxAr7cmHxnop1IVenbLvCQww9dW4ZtB/skh9BWhQI4Vy
 OGuAPs27et7N2l8J5gNOzlvI4bS23xuCISmwtIx1bMRKvzyVBMk9afMs4MDIbUkfb6uE
 wrxGxxbrPu0TtRPBrTsvXhpyWF6qSWfLNXueMCzAC+CVYlzjHU1qTUaldfhdEWzlHXck
 ahofCaISA+D5IBz1BUTYD7MMpPjHPR+1ni+STwXNYZa2zVuuWrDmlZ8RYWTsIjm2XPab
 2ZyU8SF9Yrz6bJq8FL6Q5MYLc7fsSrv230VBsQAJ6VwNNJqURs4AiKyn66tqgNkWvjlb
 mGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3M4CdeK1AwG3wYfx15EhDeO/eLOhzMp4aiaEQ5mNbE=;
 b=eZolsYkKUCJekDOEes6cI/EE4Wi3MZ6vttJsbGRkTCv/8o99CrM1P6w4sgg+B3fb10
 QWqrriqyIbzGHH/eIRHBjrnGBRSuYLQ7uSglkdkywhlH6chnqdOTXjqgick5X36viDSV
 KEfzYcOHpMSAYRbZXAnpPXEYtPZwrzZ9gP2P+ALkkXyaCUReXD/dS7QvEaghbvMdtlme
 Rs2TsSE21CkWuV51Btj1WAQnHzMv8KwH/cwajLREDOvzLvxwC9B8S+bphs8MLEo1TCHt
 LLl4QTimA01cPq1zEvBylxP1lRdMfwuBk+nVKp33R6gU3uGUUEgTOX6yNAFAnvfMF6Sj
 QLew==
X-Gm-Message-State: ANhLgQ2J5Lvg6vkpRxbLqbsc2CGp4oOW2uKY6oMZm/tw60ueAkihqu2B
 z16ZkLlf1+dY9TdbVpsq2FudqA==
X-Google-Smtp-Source: ADFU+vtI3t/zOtO/YkAVluVT2EcabrtxXWemUkuiaD8A+vwuzV0op51XNazy2LvjhQnq0zIPaI4G8A==
X-Received: by 2002:a17:902:d915:: with SMTP id
 c21mr16080497plz.239.1584149187509; 
 Fri, 13 Mar 2020 18:26:27 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm59083883pfi.78.2020.03.13.18.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:26:26 -0700 (PDT)
Subject: Re: [PATCH v5 05/60] target/riscv: add vector stride load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair Francis <alistair23@gmail.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-6-zhiwei_liu@c-sky.com>
 <CAKmqyKOiKUqzGSDd1+TvqhCT6pjeEXEX-QVzYhcaiRa-y4D98w@mail.gmail.com>
 <445d93e8-1d2c-9877-84a3-ed62a5920d89@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <392b9e62-0ff7-de49-f5dc-793bc38ba484@linaro.org>
Date: Fri, 13 Mar 2020 18:26:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <445d93e8-1d2c-9877-84a3-ed62a5920d89@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: guoren@linux.alibaba.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 wenmeng_zhang@c-sky.com, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 2:32 PM, LIU Zhiwei wrote:
>>> +/* check functions */
>>> +static bool vext_check_isa_ill(DisasContext *s, target_ulong isa)
>>> +{
>>> +    return !s->vill && ((s->misa & isa) == isa);
>>> +}
>> I don't think we need a new function to check ISA.
> I don't think so.
> 
> Although there is a riscv_has_ext(env, isa) in cpu.h, it is not proper in this
> file,
> as it is in translation time and  usually DisasContext   is used here instead
> of CPURISCVState.

In translate.c we have has_ext() for this purpose.

I think you don't need to test has_ext(s, RVV) at all,
because in cpu_get_tb_cpu_state(), you already tested
RVV, and set VILL if RVV was not present.

Thus testing vill here is sufficient.  A comment here
to remind us of that fact would be appropriate.

For those few cases where you have an extension beyond
RVV, e.g. amo_check() I think you should simply use
has_ext() like so:

static bool amo_check(DisasContext *s, arg_rwdvm *a)
{
    return (!s->vill &&
            has_ext(s, RVA) &&
            ...);
}


r~

