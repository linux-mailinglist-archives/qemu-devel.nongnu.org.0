Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7031DE5D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:36:41 +0100 (CET)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQki-00080K-Cn
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQi7-0006Nv-Vh
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:34:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQi6-0000NM-8O
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:33:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so18225016wrs.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X7Q2iyrGS6rJZKBKgylzu0YFXHPiTqV0v0vOiOr6SaM=;
 b=IOBZNrKOJTF6rMEIJUYI2eQjyXTtbF4DuvSRUzbuIoMCTEkOds0oCZic6uR0n4aQ3T
 rXvvZZTNUvWO8tPUip32tvh0R1Yo15ZZmAUEp7Town/x9ZkZrz3hLmd/aArAg5gWQd2r
 DfSw/pf0KaXqhmBZimitwOwEh9zbgWnhKIS/AfwwjQwvjDheScUBJCRDEzAgJzTMmRkM
 KSyYm06k2QffYthegjQbY9OUlzheExh01LQ0AtbsTsXJ++P4TlZhT/BuZHjhr1RCVyr1
 2KVBa6aC0ntnm67mEU6NgHR4W4vgJrptSlwQN4syUK48M3tkOHjq+VHSaI+FeIw4bMuh
 jq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X7Q2iyrGS6rJZKBKgylzu0YFXHPiTqV0v0vOiOr6SaM=;
 b=OIyrYzSkgMIFz7DlLEu2wiN48qCxYq3r3HSrVgZbNz2vxh/HD8hJWdPLDvw5mx+agE
 vLyRU+dFY/XrRog79XChyak6hUGf0guJYd+R5OX47X3jum8T0aDLOHnNY4t/scPdk+zG
 os8R1RJHxMIc4xu+dY9BtMq+SAS78q17St56e0xxxzE3QyGfUQuCEAGAFLibU+5HkC8t
 ZTXh5bg6WDZgXGkZ6ky6MCOCiSuviW+fmeOMvgIpjo+sLUG0jkQSWUcp478wfa0AjUR5
 Gw42es2OQMTh6iJaNh/iFx9izOpR+VgA6G6thTHnM511sKbL73Mh37/qhunkJLa3qzvW
 BPDA==
X-Gm-Message-State: AOAM533rsx9FvXNTekxQftw/I52qH5Olnj6NsequyMFRx0ZjAr97cRpA
 Fk0grKkGpTTgVltWkDjwQOU=
X-Google-Smtp-Source: ABdhPJwXdoFLF5NXF0RCDmmqFTv4onoSIxTjAmG2gN3pm5uQgCYeipzIiwlaDUHnoo6u8R8ZtAlmIg==
X-Received: by 2002:a05:6000:1816:: with SMTP id
 m22mr267373wrh.91.1613583236175; 
 Wed, 17 Feb 2021 09:33:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm3701321wmc.27.2021.02.17.09.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 09:33:55 -0800 (PST)
Subject: Re: [PATCH v8 35/35] Add Dockerfile for hexagon
To: Alessandro Di Federico <ale.qemu@rev.ng>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
 <6a5411a3-3d48-d30e-df70-4c73328c5fed@amsat.org>
 <20210217182334.0fb3b75e@orange>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ebc9316-2e55-e370-4efa-e58586790474@amsat.org>
Date: Wed, 17 Feb 2021 18:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217182334.0fb3b75e@orange>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 6:23 PM, Alessandro Di Federico via wrote:
> On Sun, 14 Feb 2021 19:50:41 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> Hi Alessandro!
> 
> Hi Philippe!
> 
>> I had to add this to build your image with QEMU build system:
>>
>> -- >8 --  
>>
>> diff --git a/tests/docker/Makefile.include
>> b/tests/docker/Makefile.include index 93b29ad823e..ba73fb4b1f0 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -146,6 +146,8 @@ docker-image-debian-riscv64-cross:
>> docker-image-debian10 docker-image-debian-s390x-cross:
>> docker-image-debian10 docker-image-debian-sh4-cross:
>> docker-image-debian10 docker-image-debian-sparc64-cross:
>> docker-image-debian10
>> +docker-image-debian-hexagon-cross-build-local:
>> \
>> +
>> EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-hexagon-cross.build-toolchain.sh
>>
>>  docker-image-travis: NOUSER=1
>>
>> ---
> 
> OK, I'll drop `-local` (see below).
> 
>>> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
>>> @@ -0,0 +1 @@
>>> +FROM revng/qemu:debian-hexagon-cross  
>>
>> Once this patch gets merged, the image will be available on
>> qemu/qemu:debian-hexagon-cross.
>>
>> I suppose for the final merge patch we want:
>> - rm debian-hexagon-cross.docker
>> - mv debian-hexagon-cross-build-local.docker
>> debian-hexagon-cross.docker
>>
>> Is that correct?
> 
> The `revng/qemu:debian-hexagon-cross` image was there only to let
> people quickly try out a toolchain without building it from source.

OK, not obvious from the commit description ;)

> If building from source is OK with you, that works for us.
> In any case, people will be able to use
> `qemu/qemu:debian-hexagon-cross`, right?

If you add a job to build it (see .gitlab-ci.d/containers.yml)
it will then be pushed to the Gitlab QEMU namespace. So Yes.

When we need a Docker image to build things, we first try to pull
from QEMU namespace, then build locally if not available
(see tests/docker/Makefile.include).

>> If so, can you amend that detail after the '---'
>> separator of the commit description so we don't merge this patch
>> as it?
> 
> I'm a bit confused, do you want me to send a patch corrected by hand
> here?
> I'll send a new patch tomorrow.

I basically meant, "If this is the case and you want to keep it as it,
please describe this better, so this patch doesn't get merged".

>> Also, can you add a job to build your image in
>> .gitlab-ci.d/containers.yml?
> 
> OK, is there a quick way for me to test changes I make to that file?

Open a Gitlab account, clone QEMU, push your change :)

https://wiki.qemu.org/Testing/CI/GitLabCI

Regards,

Phil.

