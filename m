Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D2D7E25C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 20:39:40 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htFzH-0006dR-M3
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 14:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htFxS-0005WS-V4
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:37:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htFxR-0007DB-Pj
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:37:46 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htFxR-0007CI-Jb
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 14:37:45 -0400
Received: by mail-pg1-x543.google.com with SMTP id s1so28378157pgr.2
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6uS6z9ltovd2M87dnrmRh+Tl+Py8c4eKqotEugbW7ig=;
 b=SQe76BW32PqffPtMMHxlDPAwVHQcoFXwRX9ym+A2TvPR7IGMQP488Rar3PaQ1eFYA5
 RXTfn/B7Z4m+coVgX42ILeyZDfatW5tVJxkZYVq2nkb5A4d1H5pMBSYxrQ+2H/i6vXg+
 4by6VkOYPeYzr7WFPiB//x/haPBlBNmZm8xMuDqo5JqbJdPa+KasA10t/+p3GStT+rSw
 RbvYmm4j0A9MsjpDFypGfAUBzJeiW1wCqEI0K4Kjdv3pK9+/qUR7auSRgfig7Y4w5MFi
 gZiZL4gxtIcvkZXC398GZGP8NUpw97F/JPSjSTM2EGcrKLqEJCg0pzcE7ggrb8lj9Qb3
 iQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6uS6z9ltovd2M87dnrmRh+Tl+Py8c4eKqotEugbW7ig=;
 b=C3MYQRd6fL+sZw1iT0PirS4eLQlzLdjN1CXycvmzgazBIZV4DGpoZ/+OIxHUQmP+vj
 Gcnya4g+6onztEowLn0jgyhkIFLLuzMUhEmhOq0uZan+QIXDQ76FzR2hyCROwdmeFtLM
 k4TvWMWXKNN3IRH/m4v9Qjg0txOlitswcfNxuvhAperMJlgTfOzZEPA2ZjkudpMG+dqi
 eL7EdLdTLoXYCdmsESaSodGeGmG4QdpuiYWrcHBmMQpoX3gzfdV2ykOPD7W4lnOQX0b9
 ML2LAGxGVhq3aRUKBSDNeJvRlZndVCEIfgHUwKlFVCWu/0G6nSG+EIOhTRGrN2Wo7EAW
 ym1A==
X-Gm-Message-State: APjAAAX20n31c2BMHlWIEbUEpRJVxj3O2fFKM849iQhhrLIFdZYwYnLY
 Y7GgcHqlwXVsrSz+pDSLG7EQSg==
X-Google-Smtp-Source: APXvYqz9gLXr8JOHolfR9+Z+v5+m9fGXuBfRgt2lxBMxnT0zweHxTikFXTvtCbTp1bQ/HJyLMuuFVw==
X-Received: by 2002:a17:90a:bc42:: with SMTP id
 t2mr156235pjv.121.1564684664244; 
 Thu, 01 Aug 2019 11:37:44 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x26sm92220455pfq.69.2019.08.01.11.37.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 11:37:43 -0700 (PDT)
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
 <20190731160719.11396-25-alex.bennee@linaro.org>
 <20190801141431.GK5034@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7d4d47c9-c1ac-5778-35a6-8aa3174a302a@linaro.org>
Date: Thu, 1 Aug 2019 11:37:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801141431.GK5034@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v4 24/54] plugins: implement helpers for
 resolving hwaddr
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "bobby.prani@gmail.com" <bobby.prani@gmail.com>,
 "cota@braap.org" <cota@braap.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/19 7:14 AM, Aaron Lindsay OS via Qemu-devel wrote:
> On Jul 31 17:06, Alex Bennée wrote:
>> We need to keep a local per-cpu copy of the data as other threads may
>> be running. We use a automatically growing array and re-use the space
>> for subsequent queries.
> 
> [...]
> 
>> +bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
>> +                       bool is_store, struct qemu_plugin_hwaddr *data)
>> +{
>> +    CPUArchState *env = cpu->env_ptr;
>> +    CPUTLBEntry *tlbe = tlb_entry(env, mmu_idx, addr);
>> +    target_ulong tlb_addr = is_store ? tlb_addr_write(tlbe) : tlbe->addr_read;
>> +
>> +    if (tlb_hit(tlb_addr, addr)) {
>> +        if (tlb_addr & TLB_MMIO) {
>> +            data->hostaddr = 0;
>> +            data->is_io = true;
>> +            /* XXX: lookup device */
>> +        } else {
>> +            data->hostaddr = addr + tlbe->addend;
>> +            data->is_io = false;
>> +        }
>> +        return true;
>> +    }
>> +    return false;
>> +}
> 
> In what cases do you expect tlb_hit() should not evaluate to true here?
> Will returns of false only be in error cases, or do you expect it can
> occur during normal operation? In particular, I'm interested in ensuring
> this is as reliable as possible, since some plugins may require physical
> addresses.

I have the same question.  Given the access has just succeeded, it would seem
to be that the tlb entry *must* hit.  No victim tlb check or anything.


r~

