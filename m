Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F098933317B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:27:30 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkp7-0007gV-HN
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkoI-0007EH-P9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:26:38 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkoF-0004Jy-Px
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:26:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id mm21so32338171ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tclFdy5liTKxd+HYQn0rcjOXUW+zOcvQ9qtXx+xFZu4=;
 b=CBNyi0sFZPzPEMdTDFP7oxmV8ZLjHL1hIiPyx03/0ImwOwkvhuUHphWcBwoxURIFPq
 AuaelJ3Jp5xZ14L9ahYZodztbe5ncFLhwAJZbN8rTGjEvdIwo0L7rQzNSHnUWAaRsrW9
 ES4JpbQR/1sy7JJmjIR2LX2aOgndQMTJoo3Un7MxAoydCcPTBjzFM+8Yurk86Ev9cg7y
 atOjk3F8v9qbT+07J6yfYlJCv4c9EL+q+ckZyfgjbAhdMZu14xSQUU+GYGuKQzz/VGTI
 FmnvpECDHVrm47wkIn4C1BG6FNXq/XBsHqwNwDhddkNSFqmR73kHgQU70zh7Xe3gMWN/
 6caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tclFdy5liTKxd+HYQn0rcjOXUW+zOcvQ9qtXx+xFZu4=;
 b=EpsZ7K54ypSIX84JZvWFwUmit+/uczSxUOtqmJYJFBBh/LS8rqtALc8bjEth1JKAz4
 9yTjLtH2WVC+JlNTXE2Bo30SA9Xk7KF9qn3egW2uOSQ4iJgvJ/mMGgLfZE0nL+AUk2wa
 4V15m5WdrcDlmF6qAu9tKQM0YXJKc+XapgBjiP/nnx6dCYQQ3zoeTjNuhDs1iL4CgYMs
 4jTr1mABnOwTvds/SKOiIctk/8gLdmRQi/0R96SzSdDMiCanvqwJHUl0PWTnO5IC2DR6
 L9BIG85lbr13cC7d0Oh6IKiP2Thd/eXVkyjl2WG+GlTQ5pl+vaumFYUzb/GE2fkPzsCT
 hwPA==
X-Gm-Message-State: AOAM531XKz4wMeweJVJl/Ipvh9PGcI1wD6pcJqBTEQIkzQ8U0uBF80kp
 rFPgJqtNEv9fhOEJbC8sPvtMhEGdZxk=
X-Google-Smtp-Source: ABdhPJyNBgdiFmG8qam26WGwZT7EegOGFcc+fN65g7EP49XnXEzXNjwQ/h5NWJeyBJAkuBkIK34ZaA==
X-Received: by 2002:a17:906:8593:: with SMTP id
 v19mr318217ejx.32.1615328793552; 
 Tue, 09 Mar 2021 14:26:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id dg26sm9726771edb.88.2021.03.09.14.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:26:32 -0800 (PST)
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87ft148964.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94023068-afd8-834d-c3a8-4ee15f4e44d5@amsat.org>
Date: Tue, 9 Mar 2021 23:26:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87ft148964.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 7:37 PM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Mon, 8 Mar 2021 at 13:51, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:
>>>
>>>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates-080321-1
>>>
>>> for you to fetch changes up to 8109b8cadf5979a29b4b6e1ca7288bc0ee676426:
>>>
>>>   semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-08 12:15:05 +0000)
>>>
>>> ----------------------------------------------------------------
>>> Testing, guest-loader and other misc tweaks
>>>
>>>   - add warning text to quickstart example
>>>   - add support for hexagon check-tcg tests
>>>   - add CFI tests to CI
>>>   - use --arch-only for docker pre-requisites
>>>   - fix .editorconfig for emacs
>>>   - add guest-loader for Xen-like hypervisor testing
>>>   - move generic-loader docs into manual proper
>>>   - move semihosting out of hw/
>>
>> Fails on x86-64 trying to do something with docker:
>>
>> make: Entering directory
>> '/home/petmay01/linaro/qemu-for-merges/build/all-linux-static'
>> /home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
>> auto build -t qemu/debian-hexagon-cross -f
>> /home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfiles/debian-hexagon-cross.docker
>>   --registry registry.gitlab.com/qemu-project/qemu --add-current-user
>> --extra-files /home/petmay01/linaro/qemu-for-merges/tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
>> Using default tag: latest
>> latest: Pulling from qemu-project/qemu/qemu/debian10
>> Digest: sha256:4f96b88d2c3cf59d46d6173d86f240ef7b4f2b68509e6e5eec7b179aa1bfbf74
>> Status: Image is up to date for
>> registry.gitlab.com/qemu-project/qemu/qemu/debian10:latest
>> Using default tag: latest
>> latest: Pulling from qemu-project/qemu/qemu/debian-hexagon-cross
>> 45b42c59be33: Already exists
>> 7a55fd5ded7c: Already exists
>> [...]
>>
>> 40ae5f465547: Pull complete
>> Digest: sha256:c5f3e6f6a761c17570945059e60297352380379f9222fe444f998c6ea7e9d4ce
>> Status: Downloaded newer image for
>> registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross:latest

^ until here, all good.

>>
>> #1 [internal] load build definition from tmplp8d2u1p.docker
>> #1       digest:
>> sha256:639f37ba0ced2cf59254e62ec107d1d7ccd627d6876fb2b465f50c88c4baa44d
>> #1         name: "[internal] load build definition from tmplp8d2u1p.docker"
>> #1      started: 2021-03-09 16:53:55.092177401 +0000 UTC
>> #1    completed: 2021-03-09 16:53:55.092271396 +0000 UTC
>> #1     duration: 93.995µs
>> #1      started: 2021-03-09 16:53:55.092598107 +0000 UTC
>> #1    completed: 2021-03-09 16:53:55.188002068 +0000 UTC
>> #1     duration: 95.403961ms
>> #1 transferring dockerfile: 1.26kB done
>>
>> [...]
>> #9 [internal] load build context
>> #9      started: 2021-03-09 16:53:56.338003711 +0000 UTC
>> #9    completed: 2021-03-09 16:53:56.42858509 +0000 UTC
>> #9     duration: 90.581379ms
>> #9 transferring context: 4.19kB done
>>
>>
>> #7 [2/6] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata    ...
>> #7       digest:
>> sha256:d73bbaa9b5d86f286257ada3d545250e61e000c22c1f971f003578dc00661346
>> #7         name: "[2/6] RUN apt update &&
>> DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu"

^ why is that run?...

>> #7      started: 2021-03-09 16:53:56.338854291 +0000 UTC
>> #7 0.553
>> #7 0.553 WARNING: apt does not have a stable CLI interface. Use with
>> caution in scripts.
>> #7 0.553
>> #7    completed: 2021-03-09 16:54:00.554068941 +0000 UTC
>> #7     duration: 4.21521465s
>> #7        error: "executor failed running [/bin/sh -c apt update &&
>>  DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu]:
>> exit code: 137: context canceled: context canceled"

:/

