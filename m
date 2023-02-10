Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F616918F0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQNST-0001Ez-Gs; Fri, 10 Feb 2023 02:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQNSJ-0001Eh-LZ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:04:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQNSH-0005Dv-El
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:04:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5595548wma.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 23:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tKbcTBVAfC36O927Gkyr8J/NNkF7fppuQBxlm74fJmE=;
 b=A24DWJ7558LFQjER/PM/hdzTvLqFp6eJMrNB1GhiUD5hSAueL+6FHRNMm588pTrP1x
 pwyoVveVvlEuGBnpksqNZZk+/rOfroYOQieWBAjdaqUR7x+0wmcoYr+vNyn74Yzi4s/z
 hX6DVPXNCm2uH5z/mShY1htDq7L00NtQz9LjJ9ngOzwpkMddPx25Bx7jjAOA+ejGkqEW
 3d7aEvbcPrsB0reDizE/IN7GFJbmpSIGAButBOXNovjXNfn5Cd531wipInW6aJgv2mkF
 FT559h+eThzyWfSUVO82VPSALZW3Xplo5iypLQYbpBNRwwLMwbBTkKFAJepYO842Bm+D
 XL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKbcTBVAfC36O927Gkyr8J/NNkF7fppuQBxlm74fJmE=;
 b=wW4LnsztQ4UzIICWD0RCEBvIPYgzL0M+BW2T3xtvRQdsuhXkVhe9QqJT4lDMR/XCRd
 oq4ZOwCwX71QHaQSFLNUg5R4H53D+toEfgQ9IvHdqSKixqS69KWZr0jHFE+dLyCZZIxA
 /4WIUwgV3moMK5JS760/iwlStZuxUENDpOC+bfIbFjxV0i9yMh8hiLSTzAk8z83k9OIu
 TIkR6M4KSPhNuho4AVQ+jBtXjtrnu4cM+DAv41Tr6iC2WGrQ3j5keK8qErInAFiBWwu0
 HrPtjJGW66YW+vt8mlI24m/Zl0BulU/grpMJ2E2HHL4Js9aFSJskpwyfpIB+M1F/qL9u
 SdDQ==
X-Gm-Message-State: AO0yUKWDfDm89+G2Ii6UD5W/4+dXgINZs3C9MN6LCygHs5x3tzKXBmWb
 Bsmwzz4MSiaifPKHh8x6go0oDA==
X-Google-Smtp-Source: AK7set/Ta1Gb7ZiR+LoLPwYrICsfes/F+wLe88BQqPNw4iSfHsT3peqJ/iwEgjxFnWVneUPM98hxHA==
X-Received: by 2002:a05:600c:43d3:b0:3da:1357:4ca2 with SMTP id
 f19-20020a05600c43d300b003da13574ca2mr13343001wmn.11.1676012658177; 
 Thu, 09 Feb 2023 23:04:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003dc1d668866sm6919353wmc.10.2023.02.09.23.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 23:04:17 -0800 (PST)
Message-ID: <aeec5f96-b035-37a2-31d1-d9374d9018d9@linaro.org>
Date: Fri, 10 Feb 2023 08:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v7 2/2] Update bench-code for addressing CI problem
Content-Language: en-US
To: quintela@redhat.com
Cc: ling xu <ling1.xu@intel.com>, qemu-devel@nongnu.org, dgilbert@redhat.com, 
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20221116152923.1087185-1-ling1.xu@intel.com>
 <20221116152923.1087185-3-ling1.xu@intel.com>
 <9a51b2a6-2e56-d090-5083-b710048fdbbc@linaro.org>
 <87sffez9dd.fsf@secure.mitica>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87sffez9dd.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/2/23 00:50, Juan Quintela wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> On 16/11/22 16:29, ling xu wrote:
>>> Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-bench.c
>>> for performance benchmarking. we have modified xbzrle-bench.c to address
>>> CI problem.
>>> Signed-off-by: ling xu <ling1.xu@intel.com>
>>> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
>>> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
>>> ---
>>>    tests/bench/meson.build    |   4 +
>>>    tests/bench/xbzrle-bench.c | 469 +++++++++++++++++++++++++++++++++++++
>>>    tests/unit/test-xbzrle.c   |  39 ++-
>>>    3 files changed, 507 insertions(+), 5 deletions(-)
>>>    create mode 100644 tests/bench/xbzrle-bench.c
>>
>>
>>> diff --git a/tests/bench/xbzrle-bench.c b/tests/bench/xbzrle-bench.c
>>> new file mode 100644
>>> index 0000000000..8848a3a32d
>>> --- /dev/null
>>> +++ b/tests/bench/xbzrle-bench.c
>>> @@ -0,0 +1,469 @@
>>> +/*
>>> + * Xor Based Zero Run Length Encoding unit tests.
>>> + *
>>> + * Copyright 2013 Red Hat, Inc. and/or its affiliates
>>> + *
>>> + * Authors:
>>> + *  Orit Wasserman  <owasserm@redhat.com>
>>
>> Is Orit the real author? Or is it based on migration/xbzrle.c?
> 
> Based on as far as I can se.
> 
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> + * See the COPYING file in the top-level directory.
>>> + *
>>> + */
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/cutils.h"
>>> +#include "../migration/xbzrle.h"
>>
>> Interesting migration include path. Similarly:
> 
> xbzrle.h is only exported for migration.  Nothing else can use them.
> So we can't put that on include/migration/*
> 
>> $ git grep -F '#include "../' tests | egrep -v
>> '(../libqtest.h|tests/tcg/mips|../multiarch)'
>> tests/qtest/netdev-socket.c:12:#include "../unit/socket-helpers.h"
>> tests/unit/test-qgraph.c:20:#include "../qtest/libqos/qgraph.h"
>> tests/unit/test-qgraph.c:21:#include "../qtest/libqos/qgraph_internal.h"
>>
>> tests/migration/aarch64/a-b-kernel.S:14:#include "../migration-test.h"
>> tests/unit/test-vmstate.c:27:#include "../migration/migration.h"
>> tests/unit/test-vmstate.c:30:#include "../migration/qemu-file.h"
>> tests/unit/test-vmstate.c:31:#include "../migration/savevm.h"
>> tests/unit/test-xbzrle.c:15:#include "../migration/xbzrle.h"
>>
>> $ ls -1 migration/*.h
>> migration/block.h
>> migration/channel-block.h
>> migration/channel.h
>> migration/dirtyrate.h
>> migration/exec.h
>> migration/fd.h
>> migration/migration.h      [*]
>> migration/multifd.h
>> migration/page_cache.h
>> migration/postcopy-ram.h
>> migration/qemu-file.h      [*]
>> migration/ram.h
>> migration/rdma.h
>> migration/savevm.h         [*]
>> migration/socket.h
>> migration/threadinfo.h
>> migration/tls.h
>> migration/trace.h
>> migration/xbzrle.h         [*]
>> migration/yank_functions.h
>>
>> $ ls -1 include/migration/*.h
>> include/migration/blocker.h
>> include/migration/colo.h
>> include/migration/cpu.h
>> include/migration/failover.h
>> include/migration/global_state.h
>> include/migration/misc.h
>> include/migration/qemu-file-types.h
>> include/migration/register.h
>> include/migration/snapshot.h
>> include/migration/vmstate.h
>>
>> Do the 4 files marked [*] belong to include/migration/?
> 
> The split is:
> include/migration/* <- exported for everybody to use
> migration/*.h       <- Only for migration
> 
> Now, doing tests for migration makes this difference complicated,
> because some tests really need things that are not exported.
> 
> This is the way that it is normally used in the tree, no?

Yes you are correct. Thanks for clarifying!

Phil.


