Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF1CC113
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 18:51:37 +0200 (CEST)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGQno-0004Tp-Gr
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 12:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iGQlB-0003X7-QG
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iGQl9-0006a2-Nq
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:48:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iGQl9-0006Zu-Fy
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 12:48:51 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47C25883D7
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 16:48:50 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id j125so2888736wmj.6
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 09:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XKJYFzBodqF1HRGpAhodY7Xy8ElHyqDyXGWQqyZ52C4=;
 b=kH5xVgOMJhUKN2/mcTz0wy4EQ2dgXeYEL6ZQVhAnSYXR9wTwQ8yYG70x7sPTZawD+b
 HcjYprshM2KZWe8HjvPSYge/HDN5nDqeB1R78hGWrnhh90K2xU8P/TD8k5XYntT0FZQJ
 q2fW55R38f6hucl8TknimqgCfi8HcMMNW2zw+o42Oq/fC47A9EVdy4qE2lpT3GuW/+ci
 mp4/QiR7irSrbX6mWaic8SHvQufOchbPUrFt0KePARw4oDgrynlM3M3V0ka3T69UjCaI
 7ChO7EBhK46tP0xK8ifv41mC1WEqWDMZWO7bLSrfvGVM5DN4AEFk6jz9PgYvo/vgqbYM
 C7/g==
X-Gm-Message-State: APjAAAWoAz76PIWERCiB+UnEJWJ1Ft2OSE5o+Xx/bVE8nN76z90ACMbU
 jXS1RHQv21a4nQ2ExYXXXonfBqTrHsq8qiWfQw5RzVksNO05GQ/yZtwZqulpLu3Et2OQ58A0XvQ
 FcHx53puKtmebTcU=
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr11146378wrr.135.1570207728890; 
 Fri, 04 Oct 2019 09:48:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMmdsYa8x9yQIxNCM1llUEAHxLXvLSkt3ftppY3OV3qeqWJfTf8bwC9fpuIsLk2j5AGKbRzA==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr11146364wrr.135.1570207728583; 
 Fri, 04 Oct 2019 09:48:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9dd9:ce92:89b5:d1f2?
 ([2001:b07:6468:f312:9dd9:ce92:89b5:d1f2])
 by smtp.gmail.com with ESMTPSA id t123sm10919993wma.40.2019.10.04.09.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 09:48:47 -0700 (PDT)
Subject: Re: [PULL 12/30] Makefile: Remove generated files when doing
 'distclean'
To: Peter Maydell <peter.maydell@linaro.org>
References: <1570035113-56848-1-git-send-email-pbonzini@redhat.com>
 <1570035113-56848-13-git-send-email-pbonzini@redhat.com>
 <CAFEAcA--sjm+ejLLdaQtsVC4u4adA9p+QDSJ2QKQ2hSBLt=oDw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <88f324b0-65a1-1a7b-b663-27415ae11cb2@redhat.com>
Date: Fri, 4 Oct 2019 18:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--sjm+ejLLdaQtsVC4u4adA9p+QDSJ2QKQ2hSBLt=oDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/10/19 14:20, Peter Maydell wrote:
> On Wed, 2 Oct 2019 at 18:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> When running "make distclean" we currently leave a lot of generated
>> files in the build directory. Fix that.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
> 
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 3543451..48b52da 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -1176,11 +1176,21 @@ check: check-block check-qapi-schema check-unit check-softfloat check-qtest chec
>>  check-clean:
>>         rm -rf $(check-unit-y) tests/*.o $(QEMU_IOTESTS_HELPERS-y)
>>         rm -rf $(sort $(foreach target,$(SYSEMU_TARGET_LIST), $(check-qtest-$(target)-y)) $(check-qtest-generic-y))
>> -       rm -f tests/test-qapi-gen-timestamp
>>         rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
>> +       rm -f tests/qemu-iotests/common.env tests/qemu-iotests/check.*
>> +       rm -f tests/test-qapi-gen-timestamp tests/qht-bench$(EXESUF) \
>> +               tests/fp/fp-test tests/fp/*.out tests/qapi-schema/*.test.*
>>
>>  clean: check-clean
> 
> Hi; this change breaks the sequence
>  'make clean; make; make check'
> 
> because now 'make clean' removes tests/qemu-iotests/common.env.
> But this file is created by 'configure', not by 'make', so if there's
> no other reason why 'make' needs to re-run configure then we get
> to the 'make check' stage with the file not existing, and then
> when we try to run the iotests they fail with:
> 
> ./check: line 60:
> /home/petmay01/linaro/qemu-for-merges/build/alldbg/tests/qemu-iotests/common.env:
> No such file or directory
> check: failed to source common.env (make sure the qemu-iotests are run
> from tests/qemu-iotests in the build tree)
> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:1102:
> recipe for target 'check-tests/check-block.sh' failed
> 
> thanks
> -- PMM
> 

I've dropped this patch and will send v3 that adds back the VMX patches.

Paolo

