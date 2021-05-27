Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBC392FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:36:05 +0200 (CEST)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGB9-0004Nf-1R
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmFi4-0008DW-1Q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:06:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmFi0-0004Ts-4h
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:05:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id r10so4647894wrj.11
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jddI1+dmAzr8wcQtm44r/Is9Mz5cxn0ZekTZEhrkl80=;
 b=A/VxuXxN7tsWsUKyJ5VL/jVZaQJWcKraYUuEVoJCIzxky4piikBNlnKVTQnIDb3byL
 S0uKn3mDqr1vPaqiWFTISoUkPZzGV0sYsvTH8HLRbbf/fDbJ9Q5Eq3Q76uhRDNIw+4yb
 BNlvSxjDW9I/UuCVaA+HTqjml5pQHHloVcRrL0v7vdoXPnNS/+kuNs/imedzfS1lkvSP
 tE0KsNMo1Svpx+hyl4bPnqc/pYU7LhjlPy6+WmsUr/5lGNLGfeKicSk4MDWziB2zIWO4
 oCk18DJDZls5B10Nfqm7b+nXZXbPJYJiT8cZHtaGem30JMogkpA51qFv/0I38EmETSbB
 KR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jddI1+dmAzr8wcQtm44r/Is9Mz5cxn0ZekTZEhrkl80=;
 b=iCLeHJfgo4PBLj4qjv0Slu2IXA5Oqu7agorJdI2QVt9Ml0NSPkPKNpwxtvh86r/zCP
 whDm3HW+TlwGkeBBFryezQwecvhRW85cAwFm8AGkyofMkwyTLRVPMSY2NE9gLgRtPwUV
 F01lLjcR8uOCYAOn0ayJ38irVCnCJQo1bmR0n+qJ5HCtEdjkOm/BKa0FVvmSaJWe2mn4
 cBcs0DrMuAJA9U31ZPAvcjUtizg5XnhTF/yeNRMSsPKR31308L2LoU/myBqFjc61mKkw
 roxBaQX7BayxOl44HLjz+7vgEWJnFAg+pZT8Cw9ZY8iNHsM1w9OaS3g0U7FoAVRiife8
 dCHg==
X-Gm-Message-State: AOAM533Ia1A/Ub2EwZdr/VjfFqZCFGxdpsL9qOAToMjD0jxZSTAZN/NM
 ccTC7lV/PZAxiTyaUNI/6wXoFA==
X-Google-Smtp-Source: ABdhPJxCN3zF5tYb+QMhlY9s3cV/KTJVqAJQ4R1IZb/MlpvS0MJYiN+z/d+B5DnxwFFb/uuYQo9QzA==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr3211135wrw.278.1622120749940; 
 Thu, 27 May 2021 06:05:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h8sm3071539wrw.85.2021.05.27.06.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:05:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A5471FF7E;
 Thu, 27 May 2021 14:05:47 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-7-f4bug@amsat.org>
 <8c74e90e-ed4c-9e96-cf87-c0c413e48eaa@amsat.org>
 <177aee51-ac23-5321-021c-a8244ddf254e@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
Date: Thu, 27 May 2021 14:04:49 +0100
In-reply-to: <177aee51-ac23-5321-021c-a8244ddf254e@redhat.com>
Message-ID: <871r9s2uok.fsf@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, "Daniel
 P . Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 25/05/2021 12.21, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 5/25/21 10:25 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> This job is hitting the 70min limit, so split it in 2 tasks.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>   .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>> index f903fdea3f4..894732e203d 100644
>>> --- a/.gitlab-ci.d/buildtest.yml
>>> +++ b/.gitlab-ci.d/buildtest.yml
>>> @@ -564,16 +564,27 @@ check-deprecated:
>>>     allow_failure: true
>>>     # gprof/gcov are GCC features
>>> -gprof-gcov:
>>> +build-gprof-gcov:
>>>     extends: .native_build_job_template
>>>     needs:
>>>       job: amd64-ubuntu2004-container
>>>     variables:
>>>       IMAGE: ubuntu2004
>>>       CONFIGURE_ARGS: --enable-gprof --enable-gcov
>>> -    MAKE_CHECK_ARGS: check
>>>       TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softm=
mu
>>> -  timeout: 70m
>>> +  artifacts:
>>> +    expire_in: 1 days
>>> +    paths:
>>> +      - build
>> FYI this job takes 28min:
>> https://gitlab.com/philmd/qemu/-/jobs/1290778672
>>=20
>>> +
>>> +check-gprof-gcov:
>>> +  extends: .native_test_job_template
>>> +  needs:
>>> +    - job: build-gprof-gcov
>>> +      artifacts: true
>>> +  variables:
>>> +    IMAGE: ubuntu2004
>>> +    MAKE_CHECK_ARGS: check
>>>     after_script:
>>>       - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
>> and this one 23min:
>> https://gitlab.com/philmd/qemu/-/jobs/1290778751
>
> So why are they taking less than 70 minutes when split in two parts,
> but are exceeding  the 70 minutes when done in one job?
> That does not make sense...

The time just seems to be highly variable. Normally I see succeeding
runs take ~40 minutes. I suspect there is some aspect of the profiling
code that interacts poorly under load leading to much longer runtimes.

--=20
Alex Benn=C3=A9e

