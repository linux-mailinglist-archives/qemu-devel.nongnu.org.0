Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290436486F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:42:04 +0200 (CEST)
Received: from localhost ([::1]:41826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWyJ-0007eh-42
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYWvY-0006Ea-Pc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:39:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYWvW-00013Y-Ty
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:39:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e7so25761917wrs.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IfDEphQMDHL2uuTr76KbxcwAUUPOL/TByCj8a2WbFd8=;
 b=GUSlrVX4CODU8sWpLHcy90d/2cgq0qsvwa5P4Px0DLc0Rj7L9mYwZEC8cGk83eIEnz
 +MCGBuJ96X7h3X8YIBQmIMzcpn5Phqv4VpeTTNBBR9OVP+4zsItDdST9si5skOw53Ig9
 JH6vNkazRzbEmCDt3GV4CYA610DZHf4QKbz8dvq/RoT4du4CcD1xlXT/M5O7S6EqmouT
 RLxw++72PnxPZ9XOp/JcwJxPwkXS332qya5K/ObQ573L7yao0J4ibC1NlbAiBSv4N5lp
 NVRnUBQ4/8t32nQ4q7n/gfZfvS9a+PltT98+SL1gaeXbPC8YQq63IyIL1VJM3+8B/aV8
 2pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IfDEphQMDHL2uuTr76KbxcwAUUPOL/TByCj8a2WbFd8=;
 b=YU/Uwda8AeR/3QDtgftMJ+uNu9DBBWrkJWD+RtCFv5gGb0zSf6qnQAfepiXB0Tsir2
 6krYoxPpo9h/fpLyJUMEjhdZHd01jKrz1X8OR7n7mZlTtox3npiYi9ke4zEy9ZmxFlRV
 0mWwnC+HKv0oTixlcj1BGwl4o4ZLYBjf79Ae4O6/SJ7Pmqmgb2TRepGClX3EL/kbah74
 CWcfAZ0BK5FevyPBG27TjA6Ioh8R1FZcy5vveI1+QBSBXTIWaGWjBnKpQGQO6f9Ysu33
 w7EysxjH+Qy9b3sVyQv6Ids7L8Lm/UsVWb72U+xwqox5MNoKaHJTFJpa3kwJjXtqV/oy
 YGXg==
X-Gm-Message-State: AOAM532mTGHMqQ7BkxcraQg24D2IrFPh4TXHQNLjJ5lqewB21KqN/PcN
 Qireb0X860HyLC5bLeBCNpc=
X-Google-Smtp-Source: ABdhPJxNorrVpdlmpjAegKNoPC16jxosHo2spU1VCRkhb2Y4C5EQiwMGJy6zcxSde19BKCUztecXvg==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr15406745wrm.32.1618850349475; 
 Mon, 19 Apr 2021 09:39:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s14sm23855605wrm.51.2021.04.19.09.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 09:39:08 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <877dky9rqt.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1db4a7f8-4017-a3c3-b490-304e0d0b4a48@amsat.org>
Date: Mon, 19 Apr 2021 18:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877dky9rqt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 5:57 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Forks run the same jobs than mainstream, which might be overkill.
>> Allow them to easily rebase their custom set, while keeping using
>> the mainstream templates, and ability to pick specific jobs from
>> the mainstream set.
>>
>> To switch to your set, simply add your .gitlab-ci.yml as
>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
>> is your gitlab 'namespace', usually username). This file will be
>> used instead of the default mainstream set.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  .gitlab-ci.yml | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 718c8e004be..35fd35075db 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -9,7 +9,12 @@ generate-config:
>>      paths:
>>        - generated-config.yml
>>    script:
>> -    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
>> +    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
>> +      then
>> +        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml ;
>> +      else
>> +        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
>> +      fi
> 
> This is going to be a little clunky. I can see a use for the static
> forks that Danial proposes but I guess what is needed is a little
> expressiveness. So how to express things like:
> 
>  - I've only touched stuff in linux-user, so run only linux-user tests
> 
>  - I'm working on KVM, run all KVM enabled builds and tests
> 
>  - I've changed the core TCG code, run everything that exercises that
> 
>  - I'm working on ARM, only build and run jobs that have ARM targets
> 
> This sounds like tags I guess but the documentation indicates they are
> used for runner selection. Could we come up with a subset that could be
> used to select from all our build fragments when constructing the
> generated-config? I could even imagine a script analysing a diffstat and
> guessing the tags based on that.

Ahah this is just what we were discussing with Willian 2h ago after
looking again at stefanha analysis
(https://www.mail-archive.com/qemu-devel@nongnu.org/msg795905.html).

. diff-stat -> files modified
. files modified | get_maintainers -> subsystem maintained sections

I suggested Willian to add support for 'tags' entries to MAINTAINERS,
so we could have:

./get_maintainer --tags file1 file2 ...
-> virtio, migration, kvm

Then we could run all the tests tagged 'virtio, migration, kvm'
(unit tests, iotests, qtests, integration tests).


The transposed use is when a test fails, we can list its tags and
from here get the subsystem maintained sections tracking these tags
and notify them a test using their subsystem failed.

> I think we should define a minimum set of lightweight smoke tests that
> get the most bang for buck for catching sillies. I think checkpatch and
> dco checking should probably be in there - and maybe one of the bog
> standard build everything builds (maybe a random ../configure; make;
> make check on one of the supported LTS targets).
> 
> Then there is the question of defaults. Should we default to a minimised
> set unless asked or should the default be the full fat run everything?
> We could I guess only switch to running everything for the staging
> branch and anything that is associated with a tag or a branch that has
> pull in the name?

Yes, this is a community problem that need to be discussed. Not all the
community members have the same requirements and expectations.

What I'm trying to do here is ease random contributor fork workflow,
not uptimizing mainstream /master gating CI, which is suppose to have
way more resources than a random contributor.

Also I don't believe 1 set of CI jobs will ever make all users happy
together. We have all different needs. I'm looking for a solution
which include every contributors from the community.

I'm brainstorming about a setup where a maintainer might have extra
resources provided by the project (such access to dedicated hardware).
Let's use 'virtio' for example. The maintainer might want to use 2
different pipelines:
- one to run all its 'virtio' tagged tests each time patches are queued
  from the subsystem the contributors (this is the subsystem "gating"
  side).
- one to run extra set more complex, run only before sending a pull
  request.

Regards,

Phil.

