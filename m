Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342E6EDC5C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:20:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCxv-0007ke-Bc; Tue, 25 Apr 2023 03:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prCxr-0007jj-9r
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prCxp-0002RN-A0
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682407188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5QMF9x5V2TKjdl7+in1WRZXkfF1mRyMHoDeXC1N6i0=;
 b=P7wQncEjtFj34Y/Z+qo7lQAdtwG0+6FZJrO7azbcu+Vy6C0JBkKIQwcaslZTmm9oOct8mX
 g15rnMjg5qKWIZJPrWHkmoTuQMQiwevML0WNTdlUcUyxgfNo4aODgzJA9Llv23oVJjjCnn
 GrFUNpbmQr2ISrnm0cFq/b09M3fCZV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-5jqM0TG6OM2hqB79CgmYQw-1; Tue, 25 Apr 2023 03:19:46 -0400
X-MC-Unique: 5jqM0TG6OM2hqB79CgmYQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so18589215e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407185; x=1684999185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5QMF9x5V2TKjdl7+in1WRZXkfF1mRyMHoDeXC1N6i0=;
 b=I1c+5tGFUn5/0D6aCZqTBMLcwIc88tyxGjLnJ4jD2AqnMPDS34zftf9SdsJ94W38yS
 A0QuBHEbSSY0BhnEKvRm1/c1MmWb/iXWKKNFsgtUgJ5O79DX9Zi3RX7lprA9jpMjqpUT
 lSbCOb24PxzsKxamfnvmP0L2hVRxmKkaN4MFVbRBf/0LigpC28S/tPhLk81Rg4CDa8oW
 uFxKt0fCK+oLd6EMVhgvNjQxAE5TlxnSNJEvar8ZkCc/IDUf7ZvkYByXawlOq6DCKyj4
 FMWFQSDflPIS4XxqR7ZaF6prNSPkRFV5Tp+NCmMtdVbPGRZWQEdn1RqJQ3ITh4msBBOQ
 VMYw==
X-Gm-Message-State: AAQBX9daPrLHMGNjzPxi4y3Gakpe97PjpPkXdsV4zgNnD49zruQIJOW0
 MAljVugnCGusXZyF8JtkgMgLYAs981gv4/GnTFplezgPe348s6UUSIzgZMtEPMDnP1uBTRsQlK3
 N8zS+xb8rER4A6wQ=
X-Received: by 2002:a1c:4b1a:0:b0:3f1:7bb5:9d71 with SMTP id
 y26-20020a1c4b1a000000b003f17bb59d71mr9229276wma.33.1682407185680; 
 Tue, 25 Apr 2023 00:19:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZmaFHJIgE76C9L4FElG5xpD5U5+iocpIUegIV+W35+MeA2wLzlul8EU9TQJHWzti2Luanfg==
X-Received: by 2002:a1c:4b1a:0:b0:3f1:7bb5:9d71 with SMTP id
 y26-20020a1c4b1a000000b003f17bb59d71mr9229254wma.33.1682407185386; 
 Tue, 25 Apr 2023 00:19:45 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f182cc55c4sm14085451wmj.12.2023.04.25.00.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:19:44 -0700 (PDT)
Message-ID: <c11de80d-afa0-695f-fac9-71282b5d40bb@redhat.com>
Date: Tue, 25 Apr 2023 09:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] tests/tcg: Make the QEMU headers available to the
 tests
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230424114533.1937153-1-iii@linux.ibm.com>
 <20230424114533.1937153-2-iii@linux.ibm.com> <87fs8pa0wi.fsf@linaro.org>
 <8ac8caff924ea18b86d6a026296c4250abe1af28.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8ac8caff924ea18b86d6a026296c4250abe1af28.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/04/2023 15.10, Ilya Leoshkevich wrote:
> On Mon, 2023-04-24 at 14:00 +0100, Alex Bennée wrote:
>>
>> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>>
>>> The QEMU headers contain macros and functions that are useful in
>>> the
>>> test context. Add them to tests' include path. Also provide a
>>> header
>>> similar to "qemu/osdep.h" for use in the freestanding environment.
>>>
>>> Tests that include <sys/auxv.h> get QEMU's copy of <elf.h>, which
>>> does
>>> not work without <stdint.h>. Make use of the new header in these
>>> tests
>>> in order to fix this.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> ---
>>>   tests/include/qemu/testdep.h   | 14 ++++++++++++++
>>>   tests/tcg/Makefile.target      |  4 ++--
>>>   tests/tcg/aarch64/sve-ioctls.c |  1 +
>>>   tests/tcg/aarch64/sysregs.c    |  1 +
>>>   4 files changed, 18 insertions(+), 2 deletions(-)
>>>   create mode 100644 tests/include/qemu/testdep.h
>>>
>>> diff --git a/tests/include/qemu/testdep.h
>>> b/tests/include/qemu/testdep.h
>>> new file mode 100644
>>> index 00000000000..ddf7c543bf4
>>> --- /dev/null
>>> +++ b/tests/include/qemu/testdep.h
>>> @@ -0,0 +1,14 @@
>>> +/*
>>> + * Common dependencies for QEMU tests.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +#ifndef QEMU_TESTDEP_H
>>> +#define QEMU_TESTDEP_H
>>> +
>>> +#include <stdint.h>
>>> +#include "qemu/compiler.h"
>>> +
>>> +#define g_assert_not_reached __builtin_trap
>>> +
>>> +#endif
>>> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
>>> index 8318caf9247..5474395e693 100644
>>> --- a/tests/tcg/Makefile.target
>>> +++ b/tests/tcg/Makefile.target
>>> @@ -85,8 +85,8 @@ TESTS=
>>>   # additional tests which may re-use existing binaries
>>>   EXTRA_TESTS=
>>>   
>>> -# Start with a blank slate, the build targets get to add stuff
>>> first
>>> -CFLAGS=
>>> +# Start with the minimal build flags, the build targets will
>>> extend them
>>> +CFLAGS=-I$(SRC_PATH)/include -I$(SRC_PATH)/tests/include
>>>   LDFLAGS=
>>
>> Hmm I'm not so sure about this. The tests are deliberately minimal in
>> terms of their dependencies because its hard enough getting a plain
>> cross-compiler to work. Is there really much benefit to allowing
>> this?
>> What happens when a user includes another header which relies on
>> functionality from one of the many libraries QEMU itself links to?
> 
> I don't think this will work at all, because the idea here is to allow
> using the code in the freestanding tests. However, at least bswap.h
> seems to work just fine. Of course, there is now additional maintenance
> overhead to keep it this way, but I would argue it's better than
> making a copy.

If this is just about one single header, I guess a

#include "../../../include/qemu/bswap.h"

would be acceptable, too, instead?

  Thomas



