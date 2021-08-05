Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5D3E11D5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:03:08 +0200 (CEST)
Received: from localhost ([::1]:50836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBaDT-0006DS-IL
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBaCR-0005T2-0k
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:02:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBaCO-0008HC-EO
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628157718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UjT8dv+SOGoQXeZN2BFnnCGm5umGbxQbA8XAsKnzHg=;
 b=a/+7PkHGu9h0Q02+SS38NjKglcI5RdMLw9tQu5PCSxnJ8TcFL//ntYZCkNvsR8II+Gb5FF
 buJHag2fIg9dAWNVnK3OCYGP+d3djarCwYA72xw95KwD9wuaxsWSHuqaEzSiV/hjD2dR94
 ynk0c0vfnCDhfiJ4ZY5NT472mfYHRhY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-aJ_QnMV_Ml2AJY9VAuw2jg-1; Thu, 05 Aug 2021 06:01:56 -0400
X-MC-Unique: aJ_QnMV_Ml2AJY9VAuw2jg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f6-20020a05600c1546b029025af999e04dso1076269wmg.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 03:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/UjT8dv+SOGoQXeZN2BFnnCGm5umGbxQbA8XAsKnzHg=;
 b=Q8X2YKiQjeIu8IURkmrdiYqH6EpcIM0xpC7i1uNJFWAnZnoLIK745KZdfKBRFNWyfO
 KTj8XPED2DyGIJ48GwOYSRytBRJlcLv862net+0LJrpbEbAFjkQcgeuNhw6QQ0Ra8feE
 1M6dHDrMJZJmfiDZ6kIJfvBocw169rGfjBqr1L3CTX+9RvoYitQJaaHo6jY3QD0+XjMm
 G8WcZVjYsdlE99f5P6Fe9G2aw80Xq2sJIHO8uPqfXjjNOyrr68zqPPTzSAoQasX2AsIw
 cnxqSumBhZn7x2i/BUH1FPWJi0ySz/QxBK4hUvcQ7vXwzjT+TGr+KrRzU8hKL5Dwnye+
 1jlw==
X-Gm-Message-State: AOAM532zjK+vefNf4sBh6X0CzGbta5rCoXgEVusOcL8BcSNViuhxje87
 fR0Vmgtkyil/RCpDzhWej/e8Wo1EQPlHvISWM212BjI/2fug1A0kACoUl+oDfwyVIxD8wIpLLM9
 zxPihN4ltoszJRAk=
X-Received: by 2002:a5d:4562:: with SMTP id a2mr4142590wrc.347.1628157715799; 
 Thu, 05 Aug 2021 03:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWL1Q8Od10VkG9mDmxtyR0fdint5QHtu1VT6WEou+Oj2iQ+ge1BRvrgzCjV50hLpcRCpKPcw==
X-Received: by 2002:a5d:4562:: with SMTP id a2mr4142543wrc.347.1628157715447; 
 Thu, 05 Aug 2021 03:01:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c630b.dip0.t-ipconnect.de. [91.12.99.11])
 by smtp.gmail.com with ESMTPSA id
 s2sm4943949wmh.46.2021.08.05.03.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 03:01:55 -0700 (PDT)
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
To: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210804225146.154513-1-iii@linux.ibm.com>
 <44c8dc22-c243-6260-c6af-62fd209f21e9@redhat.com>
 <aae5893cb5d8e73c9d981a90609a9bc9bb4c9c25.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <878d3e36-d7fd-7021-db56-06499c17c7cc@redhat.com>
Date: Thu, 5 Aug 2021 12:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aae5893cb5d8e73c9d981a90609a9bc9bb4c9c25.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.08.21 11:57, Ilya Leoshkevich wrote:
> On Thu, 2021-08-05 at 11:37 +0200, David Hildenbrand wrote:
>> On 05.08.21 00:51, Ilya Leoshkevich wrote:
>>> Verify that s390x-specific uc_mcontext.psw.addr is reported
>>> correctly
>>> and that signal handling interacts properly with debugging.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> ---
>>>
>>> v7:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
>>> v7 -> v8: Another rebase needed due to the conflict with Jonathan's
>>>             50e36dd61652.
>>>
>>>    tests/tcg/s390x/Makefile.target               |  17 +-
>>>    tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>>>    tests/tcg/s390x/signals-s390x.c               | 165
>>> ++++++++++++++++++
>>>    3 files changed, 257 insertions(+), 1 deletion(-)
>>>    create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>>>    create mode 100644 tests/tcg/s390x/signals-s390x.c
>>>
>>> diff --git a/tests/tcg/s390x/Makefile.target
>>> b/tests/tcg/s390x/Makefile.target
>>> index bd084c7840..cc64dd32d2 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -1,4 +1,5 @@
>>> -VPATH+=$(SRC_PATH)/tests/tcg/s390x
>>> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>> +VPATH+=$(S390X_SRC)
>>>    CFLAGS+=-march=zEC12 -m64
>>>    TESTS+=hello-s390x
>>>    TESTS+=csst
>>> @@ -9,3 +10,17 @@ TESTS+=pack
>>>    TESTS+=mvo
>>>    TESTS+=mvc
>>>    TESTS+=trap
>>> +TESTS+=signals-s390x
>>> +
>>> +ifneq ($(HAVE_GDB_BIN),)
>>> +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>>> +
>>> +run-gdbstub-signals-s390x: signals-s390x
>>> +       $(call run-test, $@, $(GDB_SCRIPT) \
>>> +               --gdb $(HAVE_GDB_BIN) \
>>> +               --qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>>> +               --bin $< --test $(S390X_SRC)/gdbstub/test-signals-
>>> s390x.py, \
>>> +       "mixing signals and debugging on s390x")
>>> +
>>> +EXTRA_RUNS += run-gdbstub-signals-s390x
>>> +endif
>>> diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py
>>> b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
>>> new file mode 100644
>>> index 0000000000..80a284b475
>>> --- /dev/null
>>> +++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
>>> @@ -0,0 +1,76 @@
>>> +from __future__ import print_function
>>> +
>>> +#
>>> +# Test that signals and debugging mix well together on s390x.
>>> +#
>>> +# This is launched via tests/guest-debug/run-test.py
>>> +#
>>> +
>>> +import gdb
>>> +import sys
>>> +
>>> +failcount = 0
>>> +
>>> +
>>> +def report(cond, msg):
>>> +    """Report success/fail of test"""
>>> +    if cond:
>>> +        print("PASS: %s" % (msg))
>>> +    else:
>>> +        print("FAIL: %s" % (msg))
>>> +        global failcount
>>> +        failcount += 1
>>> +
>>> +
>>> +def run_test():
>>> +    """Run through the tests one by one"""
>>> +    illegal_op = gdb.Breakpoint("illegal_op")
>>> +    stg = gdb.Breakpoint("stg")
>>> +    mvc_8 = gdb.Breakpoint("mvc_8")
>>> +
>>> +    # Expect the following events:
>>> +    # 1x illegal_op breakpoint
>>> +    # 2x stg breakpoint, segv, breakpoint
>>> +    # 2x mvc_8 breakpoint, segv, breakpoint
>>> +    for _ in range(14):
>>
>> How do we come up with the value 14?
> 
> 1 (initial) + 1 (illegal op) + 2 * 3 (stg) + 2 * 3 (mvc_8).
> 

Oh, that makes sense.

>>
>>> +        gdb.execute("c")
>>> +    report(illegal_op.hit_count == 1, "illegal_op.hit_count == 1")
>>> +    report(stg.hit_count == 4, "stg.hit_count == 4")
>>
>> The doc above says we should see this twice, why do we see it 4
>> times?
> 
> With "2x stg breakpoint, segv, breakpoint" I meant: stg break, stg
> segv, stg break, stg break, stg segv, stg break.

Understand it now, wasn't paying attention to the details :)

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


