Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EE4114FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:53:25 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSInT-0002qV-Tp
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSIm2-0001n5-Vz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:51:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSIm1-0005Le-8V
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:51:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so22360491wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8gFEuB61gP14rHN79pW0cpdAdUD1Jd//qodzwrGT65A=;
 b=BK31x9npTJc5uug49/haqjQ8B65x5pahOSUo8I89XAJuvzsG9UPzyf7k6O1HutLVnk
 Qq4PyDH0q/7v7vJWMBaTP+Nqu146KrjbnEIgPpvuLqHrr3L5tbBFs7GepKlMjg2rmb/I
 RDYVQ2itaXqSyzcgwa5ENHHe6cLp0b9xxJkB8TQx+Jkm/TH29Jt8rnkbkTv3nlKG2Pks
 gBG2eNtj5njRveEVkSykinKofoJ4V9eHF6CEKqffGAq2U0/Gi56isUgR7gWnXSU7Ne8M
 Acu3uxb+OuE62cof9haql/MPies7sMAMBNtJhjGCOam3jy8wzxUX4hAnpkHf7s54Bllz
 2yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8gFEuB61gP14rHN79pW0cpdAdUD1Jd//qodzwrGT65A=;
 b=Fmrgp1pSdAlF41U6Jjc45ZCtYt7TbBStrg6EA/SIJaVwO32V4YkfKsXzDlHZlanXX0
 D4J/f78vXg5oiS4XvPQ5nzF7i/Gi7uADH1ZxAhtpByqNvaAG01zIoQ0271QsWAww4Gsm
 j5689XmSIRxbhrSLlcaw62tBg524X6YaaaJuaLjMMhknEIXCyNUr2axPnr7ERn86ulbJ
 konqTgIE/XKIKvwlG7jhW+6ml5BHrkJKx3r/gYhtdoBiTKnA0Sqy0sKq43/pYGo/fwun
 4E7nxqQ/ox15LFhqkEmKBzZgt30+Odsw16rbh4i77mM5vuuO9lsZTewAAN2huK1eABd+
 MXYA==
X-Gm-Message-State: AOAM533mLgmDRc4l6OR2jCb/oiVD9OByuay8518FYhem3Dr0GRdyBEpb
 SKiJ0w/Io0IDAK3XZ7p7ffM=
X-Google-Smtp-Source: ABdhPJz43/me3guLDOQpnKkmlDIG0vxoOXw3B3KcoB61wWxy49NNpEpTbmhvEG26EVbPjp7APhgz5w==
X-Received: by 2002:adf:f486:: with SMTP id l6mr27704386wro.375.1632142311106; 
 Mon, 20 Sep 2021 05:51:51 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id x13sm15923884wrg.62.2021.09.20.05.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:51:49 -0700 (PDT)
Message-ID: <034fccde-7b4b-4877-edad-be06e524ea48@amsat.org>
Date: Mon, 20 Sep 2021 14:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/35] tcg patch queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 12:07, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>>
>>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916
>>
>> for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:
>>
>>   tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)
>>
>> ----------------------------------------------------------------
>> Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
>> Move cpu_signal_handler declaration out of target/.
>> Misc tcg/mips/ cleanups.
>>
> 
> This seems to result in a failure on the s390x all-linux-static
> CI job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1604251543
> due to a core dump running the 'trap' test.

I don't have access to that runner, nor to an Ubuntu based one.

I can't reproduce on a RHEL8.5 host.

I ran git-bisect,
- from 57b6f58c1d0 ("Merge remote-tracking branch
'remotes/hreitz/tags/pull-block-2021-09-15' into staging")
- to 62e76dc7dab ("Merge remote-tracking branch
'remotes/rth-gitlab/tags/pull-tcg-20210916' into staging")
using:

$ time make -j 2 -C build qemu-s390x run-tcg-tests-s390x-linux-user

All steps consistently report:

  RUN     TCG tests for s390x-linux-user
  BUILD   s390x-linux-user guest-tests with cc
  RUN     tests for s390x
  TEST    float_convs on s390x
  TEST    threadcount on s390x
  SKIPPED float_convs check on s390x because no reference
  TEST    sha1 on s390x
  TEST    linux-test on s390x
  TEST    testthread on s390x
  SKIPPED signals on s390x because BROKEN awaiting sigframe clean-ups
and vdso support
  TEST    test-mmap (default) on s390x
  TEST    float_madds on s390x
  SKIPPED float_madds check on s390x because no reference
  TEST    hello-s390x on s390x
  TEST    csst on s390x
  TEST    ipm on s390x
  TEST    exrl-trt on s390x
  TEST    exrl-trtr on s390x
  TEST    pack on s390x
  TEST    mvo on s390x
  TEST    mvc on s390x
  TEST    trap on s390x
  TEST    signals-s390x on s390x
[ RUN      ] Operation exception
[       OK ]
[ RUN      ] Translation exception from stg
[       OK ]
[ RUN      ] Translation exception from mvc
[       OK ]
[ RUN      ] Protection exception from stg
[       OK ]
[ RUN      ] Protection exception from mvc
[       OK ]
[  PASSED  ]
  SKIPPED gdbstub test sha1 on s390x because need working gdb
  SKIPPED gdbstub test qxfer-auxv-read on s390x because need working gdb

However I note another job timeouted on the same runner:
https://gitlab.com/qemu-project/qemu/-/jobs/1603171791

Are we running multiple jobs in parallel in the same runner?

> The 'check-acceptance' job also hits a timeout on the emcraft_sf2
> test:
> https://gitlab.com/qemu-project/qemu/-/jobs/1604251596

Not looked at this one yet.


