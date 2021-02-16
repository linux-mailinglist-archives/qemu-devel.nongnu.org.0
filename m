Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D131C961
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:08:54 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByDt-0002W4-Ms
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lByCp-0001V5-W9
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lByCn-0006lz-Oj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613473664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFRzADEFArC76I7hNgdFHJLJLuduZO+MCP2vMl+7kpU=;
 b=i2hIc+3ffticTQ52noz1LJE+Br8L0kbdU9fvOQR2BYGrMJexB00P7YqYdvGvdFywMjYuJ8
 iAgz90Lkh07GnthODECYNbEEDbDbdTanmQPfwzv+5T6js5Uby4J2ZiAT++Aiq7nojpGj+n
 XX6kpp8QCKf+r6ehN0PdS0PJommk844=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-U5fJOHI8NUeDhxKOZKDOvQ-1; Tue, 16 Feb 2021 06:07:42 -0500
X-MC-Unique: U5fJOHI8NUeDhxKOZKDOvQ-1
Received: by mail-ed1-f69.google.com with SMTP id y6so7106107edc.17
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bFRzADEFArC76I7hNgdFHJLJLuduZO+MCP2vMl+7kpU=;
 b=n52O56MozCpPEmGAUWXCyGrhr7S3ZYjylU1UvbnjuVzkZAHofkZuBQjEDqlphL/AIM
 GfFi5IjA4z5sv84SgnK7SaHxY/u/8xBiOjXxdwbbi0XfcXhgI5fQ8lSdn3bVFQjs2RPT
 8FJgBXQ4Q7p5k5q5ix3mG8R20n8NFqDv9yw+VB7pKvonfazcLrLDg+YPTuFBP5HJkqhY
 X6BPtfmtUurNSLLZUrVqEVZdl4TMVS6FTKgp9xoE8zAsBoA+ODF0fWV13DUmMGqP81oX
 Yjqy8SnoPk1P6NEjfS9B1R6EZ89oYnXQJdMwXVCtvj34dtNN2tqx1A3IgYE3eiR3iNsv
 DYAA==
X-Gm-Message-State: AOAM533D+qPX67iwikwbpQuVZG8VvzfL2sMhE4QXhKDuzfbLcQvQ3MTO
 jUxmZbyK37oSlU020L5h8SHfrQUkFpeEbk+yvhCl4psIHybxABcZAF59QHmlkl4DpKSfPWo8zC6
 Q4S3Q6kuODbWRZkAbVE4mmVSgVg5uApBDb+ZSpZj0kEBPL7cvEfFuimq1RmynKGnapZ8=
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr15636116edx.58.1613473661241; 
 Tue, 16 Feb 2021 03:07:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPGt62FsJSMvUDep+0n5m6C90DTNQ5FtGQ1xV2hEMb89XW1RKp2MrfBIzPYJF9gqXYrH044A==
X-Received: by 2002:a05:6402:13ca:: with SMTP id
 a10mr15636095edx.58.1613473660940; 
 Tue, 16 Feb 2021 03:07:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cy22sm13355712edb.67.2021.02.16.03.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 03:07:40 -0800 (PST)
Subject: Re: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210216102522.6279-1-alex.bennee@linaro.org>
 <a0db0e73-debc-a712-570b-cc38278884f2@redhat.com>
 <CAAdtpL6_ECRTQ7QNxWGJEphDx6uGGpUkXoMwevMeTn0MSPv8vA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a7d87ff5-b604-1a02-6a8b-b1abab178910@redhat.com>
Date: Tue, 16 Feb 2021 12:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL6_ECRTQ7QNxWGJEphDx6uGGpUkXoMwevMeTn0MSPv8vA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 11:57, Philippe Mathieu-Daudé wrote:
> On Tue, Feb 16, 2021 at 11:49 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 16/02/21 11:25, Alex Bennée wrote:
>>> Blink and you miss the cross TCG compiler stuff so lets display it
>>> with the rest of the compiler information.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> ---
>>> v2
>>>     - use target_dirs/fs.exists() instead of find
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Using $(wildcard) could be better than TARGET_DIRS in
>> tests/Makefile.include, too, something like this:
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index d34254fb29..7203243b08 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -41,7 +41,7 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
>>    SPEED = quick
>>
>>    # Build up our target list from the filtered list of ninja targets
>> -TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>> $(ninja-targets)))
>> +TARGETS=$(patsubst tests/tcg/config-%.mak, %, $(wildcard
>> tests/tcg/config-target.mak))
>>
>>    # Per guest TCG tests
>>    BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
>> @@ -49,7 +49,7 @@ CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%,
>> $(TARGETS))
>>    RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
>>
>>    # Probe for the Docker Builds needed for each build
>> -$(foreach PROBE_TARGET,$(TARGET_DIRS),                                 \
>> +$(foreach PROBE_TARGET,$(TARGETS),                             \
>>          $(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
>>
>>    $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if
>> $(CONFIG_PLUGIN),test-plugins)
>>
>>
>> I'll test it and send it out.
> 
> Doesn't work with your diff:
> 
> make: *** No rule to make target 'run-tcg-tests-r5900o32el-linux-user'.  Stop.

Not surprising since I didn't even run "make", it's just an idea that 
can be done independent from Alex's patch (and was just inspired by it).

Paolo


