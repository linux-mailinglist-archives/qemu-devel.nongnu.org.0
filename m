Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD17357365
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:44:25 +0200 (CEST)
Received: from localhost ([::1]:36266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCE4-00046p-Ky
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUBwk-0003Hh-R6
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:26:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUBwi-0001tJ-0B
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:26:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id x15so9610708wrq.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2Ri9xTccFeXNJNjsjY0ieVgvCUPT23izMv2IoxOMIgU=;
 b=eUmh7eTcEB+iwOjOu8sCV8VjGEPTM2kdPqkGSWuV3M9wVci4JOuJAohwfi/9S+4UmA
 biw9j62qldQbmmi1U9x7gfrU+PPruRu85OkUJw//UNKtORIvIcAUV4ZTLOikAC0EeYpI
 tbL5SO06F8FkjDqaq5eD80FCMUJj/YbBXsh8hhUx/KKIEvxZ1HX/2crTBUb38ZBqMmZN
 fGr3nBfX4vFPH0+q4eeutc2gGeZrKN/3EEw5JdsTKDp9iUk57lMP7Hr9aPdKF8Kewg2v
 iZnMfuP1sK2iK7O67tLrM6GHMSxrFM2PHe+OZcb8EWqMpD2FOpUdsZHe8GpLMrF1yVnm
 tG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2Ri9xTccFeXNJNjsjY0ieVgvCUPT23izMv2IoxOMIgU=;
 b=rdJmliLHI683pMuYfXFygSDHX4KqNKgpQdqpcAnomC7q9V3q1fik6eX9FNLjb1Vghh
 ACr0jy46KaYSK8RNx57w7avemIMu4mhXJdyGHiQ1ph+jHfUCi0p8Cbx7OYRFBo75Dlo9
 WmwXr8XKBvymXDhOKCLk67/NXHBq4oPEPnjHYsdhrMvotfXIipdyGjhOcxOxr5SLQPxX
 9PqXZsFAxLBb1zkUpyEmpuhuUeOU8GE2Aj4HNTjf5oy732322GlT9peMXrBCdkqVXMiD
 NH6YayuBYaUNHq7uhaz5AQU0eJTyuNLGcfOqhQeNH8N+04X5lnkjfKJs+M4KInZj/7D/
 WVvQ==
X-Gm-Message-State: AOAM531X7Q+pTlxZOqDKmITxAH6c0+r/sqkyaY7h4mD/wM5JW/hSfMoE
 P5k3x/vDWuImCcRdVue13hSKCg==
X-Google-Smtp-Source: ABdhPJz0QtQGoPFZdL1D8KaDfjhuIxQgyrthv3D1gRipd466VcrTJohGx2igKEqbBds6xjpBGFsxpw==
X-Received: by 2002:adf:ce83:: with SMTP id r3mr5649861wrn.144.1617816385949; 
 Wed, 07 Apr 2021 10:26:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm9842689wme.47.2021.04.07.10.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:26:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49BBF1FF7E;
 Wed,  7 Apr 2021 18:26:24 +0100 (BST)
References: <20210406150041.28753-1-alex.bennee@linaro.org>
 <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
Date: Wed, 07 Apr 2021 18:25:04 +0100
In-reply-to: <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
Message-ID: <87czv6uhtr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 6 Apr 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be443c=
138:
>>
>>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pul=
l-request' into staging (2021-04-05 22:15:38 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-060421-1
>>
>> for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b4cd9:
>>
>>   gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-04-06 =
15:04:50 +0100)
>>
>> ----------------------------------------------------------------
>> Testing updates:
>>
>>   - fix x86_64 cross compilers
>>   - don't use registry for non-x86 containers
>>   - add valid host types for given cross compile containers
>>   - clean up i386 code16 test with explicit -no-pie
>>   - relax sha1.py gdbstub test
>>   - add more gdbstub documentation
>>   - remove annoying warning on gitlab
>>   - test dtrace backend in gitlab
>>
>> ----------------------------------------------------------------
>
> The merge for this failed in gitlab CI with a weird state:
>
> https://gitlab.com/qemu-project/qemu/-/pipelines/282228325
>
>  * marked "failed"
>  * but has a "cancel" button
>  * has no "retry" button
>  * has an "error" tag whose hover-over text reads "Pipeline job activity
>    limit exceeded!"
>
> Not being sure whether this is gitlab CI being flaky again or a problem
> with something in the pullreq, I've not applied it for rc2; we can
> figure out what happened and maybe try again for rc3.

I think it's GitLab going nuts because:

  https://gitlab.com/stsquad/qemu/-/pipelines/282304522 is all green
  https://gitlab.com/stsquad/qemu/-/pipelines/282619235 is a dumpster fire
=20=20
And they are both the same commit (pull-6.0-rc2-fixes-070421-2)

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

