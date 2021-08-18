Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD183F0190
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 12:24:34 +0200 (CEST)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGIkL-0004Ty-E8
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 06:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGIiy-0003ET-Aj
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 06:23:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGIiw-0000Db-GT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 06:23:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x12so2635436wrr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vQ1Ilbz+wPB56hTslPN/pZTyTxV8KPHqP0p1Ek/G5O0=;
 b=lHsA8R6K0ypR58X5Kv5EuXawX1TORa2Kif8zvQz7fKJE6CaJ7dJS2C5wC7MDfhtszZ
 NRJJRj/QwQ/czwNNzX5yy/sBHK5ycgBkVhn1L5bDkMhaaTs0pP1vVziXRQgle717D9Iq
 yupVI8ZWa4WK/rgtzB7bv4s1Lh7F87LybdzGMpGVGXt1/NpDdwGu+WrTO3k3sCfclisI
 kpXJyPylYLv0DhXVS/lJTfdZUVb3JPyNI47z6UYEfcNkjxLA7lm0sWyr95jYhKNEyKGA
 ANaqooWvt7TGgysLiazlEtRz9LlqWVMmUttoFM1n/J6F1nSymr2SDQ0flv5WKyFxNocg
 9oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vQ1Ilbz+wPB56hTslPN/pZTyTxV8KPHqP0p1Ek/G5O0=;
 b=kjUGj/AwmAHMpOpltC9MViHDc8A2HSyjhpROY7kO/SPu152gPo0HesyAt8KonXTPau
 J1nZWZexO96tIHqTndFqCpM7uzSuc1g0cis1pURNsADtMCIs+RnJzt65YtEVMoKfr3iG
 KsOcqyiqlrJvi0tjendvWAvZ+lwZ2RCJyXOtxIDO1rmUA9BmIjLcoFoj8f+WIytwW31f
 FWYm4LrWKApatXUNBGoRCRGzE6oO+ZLis7bk92T1WDeKQadd1Gfl3R0TX2B3RRB1FpQM
 TB4BtC1vOQCVKK1OXiZ2ywDP6DEuJ/YKLl3vbMzYZqesVj2w84kMLUWU+Ge/A/9x2Ts5
 gQsg==
X-Gm-Message-State: AOAM533b1ZoGptcRToIZi7ydhX7TU3553rjdJ51g3/X5/nLG8/m8ui+o
 lnhgFjixNR9q+/i1RLHJV78=
X-Google-Smtp-Source: ABdhPJx9GM+7GjUePX9CVoaaAJdEDEvdxKpNHMS6DhB/6AZp8+V8Gei7ydR8ftplfOoYM24PwhP3Tg==
X-Received: by 2002:a5d:4d03:: with SMTP id z3mr9732567wrt.229.1629282184919; 
 Wed, 18 Aug 2021 03:23:04 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m10sm6719232wro.63.2021.08.18.03.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 03:23:04 -0700 (PDT)
Subject: Re: [PATCH 1/2] gitlab: exclude sparc-softmmu and riscv32-softmmu
 from cross builds
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-2-berrange@redhat.com>
 <11174538-e2fb-cd99-de92-3153fa56d017@ilande.co.uk>
 <YRzS3F766na8QeJm@redhat.com>
 <16bd9721-a296-9cc7-0a94-dd76e2696b81@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b63879b0-8fe8-5ec5-2b90-7e9cac1b3f2b@amsat.org>
Date: Wed, 18 Aug 2021 12:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16bd9721-a296-9cc7-0a94-dd76e2696b81@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:45 AM, Mark Cave-Ayland wrote:
> On 18/08/2021 10:29, Daniel P. Berrangé wrote:
>> On Wed, Aug 18, 2021 at 10:15:47AM +0100, Mark Cave-Ayland wrote:
>>> On 10/08/2021 15:06, Daniel P. Berrangé wrote:
>>>
>>>> We need to cut down compile time by excluding more targets. Both these
>>>> targets still have their 64-bit variant enabled, so the loss of
>>>> coverage
>>>> is mitigated to some degree.
>>>>
>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> ---
>>>>    .gitlab-ci.d/crossbuild-template.yml | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/.gitlab-ci.d/crossbuild-template.yml
>>>> b/.gitlab-ci.d/crossbuild-template.yml
>>>> index 7d3ad00a1e..cfb576b54c 100644
>>>> --- a/.gitlab-ci.d/crossbuild-template.yml
>>>> +++ b/.gitlab-ci.d/crossbuild-template.yml
>>>> @@ -9,7 +9,8 @@
>>>>          ../configure --enable-werror --disable-docs
>>>> $QEMU_CONFIGURE_OPTS
>>>>            --disable-user --target-list-exclude="arm-softmmu
>>>> cris-softmmu
>>>>              i386-softmmu microblaze-softmmu mips-softmmu
>>>> mipsel-softmmu
>>>> -          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
>>>> +          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
>>>> +          sparc-softmmu xtensa-softmmu"
>>>>        - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>>>>        - if grep -q "EXESUF=.exe" config-host.mak;
>>>>          then make installer;
>>>
>>> I'd prefer to keep sparc-softmmu if possible, simply because my everyday
>>> platform is Linux and so having a cross-build for Windows will catch
>>> things
>>> that I may miss on a day-to-day basis. Is sparc-softmmu currently
>>> enabled as
>>> part of the native MINGW64 build?
>>
>> Note the builds still include  'sparc64-softmmu', so we're only loosing
>> cover in places where it diverges fromthe 64-bit build, but this will
>> sstil get coverage in native builds.
> 
> Okay I see. From my perspective sparc-softmmu covers more corner cases
> simply because everything is wired up as cMMIO peripherals on a custum
> bus compared with sparc64-softmmu which is a PCI machine and so there is
> already a lot of overlap there. However...
> 
>>> If I go to my Gitlab QEMU fork Settings -> CI/CD -> Variables there
>>> is an
>>> option to set variables that can be used in job scripts. Perhaps this
>>> could
>>> be used so that I can configure my personal QEMU fork to always run
>>> sparc-softmmu builds when preparing PRs even if they aren't enabled for
>>> everyone by default? At least this would then allow me to spot any
>>> breakage
>>> before sending a final PR to Peter.
>>
>> Separately from this I'm doing some work to make things more configurable
>>
>>    https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02102.html
>>
>> but not on this level of granularity.
>>
>> Rather than globally excluding from all cross builds, I think we ought to
>> split it up more equitably acrss the different builds in some way.
> 
> From my perspective as long as I have something in Gitlab that I can
> push and then get a green CI build that covers both sparc platforms on
> Linux/Windows then I'm not too concerned about the implementation
> details. As long as the combination is covered in a job somewhere in
> your latest set of build changes then that's okay with me.

Your use case seems similar to mine: I overload the current mainstream
pipeline with extra jobs. See:
https://docs.gitlab.com/ee/ci/pipelines/settings.html#specify-a-custom-cicd-configuration-file

My namespace CI points at a custom config in some branch:
https://gitlab.com/philmd/qemu/raw/my_gci_config/.gitlab-ci.d/philmd.yml

This files simply contains:

include:
  # Keep mainstream config ...
  - local: '/.gitlab-ci.d/qemu-project.yml'
  # ... but include my extra jobs.
  -
'https://gitlab.com/philmd/qemu/raw/my_gci_config/.gitlab-ci.d/nvme_wip.yml'
  -
'https://gitlab.com/philmd/qemu/raw/my_gci_config/.gitlab-ci.d/mips_slow.yml'
  -
'https://gitlab.com/philmd/qemu/raw/my_gci_config/.gitlab-ci.d/philmd_runners.yml'

