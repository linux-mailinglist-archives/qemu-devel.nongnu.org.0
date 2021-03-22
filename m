Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34016344844
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:55:20 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLxa-0000YX-5a
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLEv-00043m-HM
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:09:05 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLEs-0000No-22
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:09:05 -0400
Received: by mail-ej1-x630.google.com with SMTP id a7so21498849ejs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0/ySNQIj995FV4Ig5xfjmxhkIwm690huMKV7xqtpA7k=;
 b=Sce7/SWWy59o3LyFVDphawAy+FMVJH1u1BhDfnfLGFmwPxI9mQX8roKXi/DMj3jhFf
 mFPiF7UfFQuGJwmp0uIcKxQDx1O+/HJVqSy/+YXvAEuDveHyINf4KjimlWzuIGSqYTMT
 xTnAAt0pvYFdRx9kRFIQW3JqPnkFfjnwULvdW0WWw3yex/NlmIdoHy6nXZynGWkoQROm
 T4lW1q5jnSmJbWOAmOwBovEczDmKUA2fiGqi+E0v/QG8wO2hNxLcuyYsz+c/pMaV/q5T
 wcg6rCCU39hd186U5Ws6f++B+BR45hLw4RYIsuVnQiKJuFHX/HyqGpupqWCWVSXqTMkr
 d8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0/ySNQIj995FV4Ig5xfjmxhkIwm690huMKV7xqtpA7k=;
 b=s5NzroRmxkJgpW4ITxa/6bVTayBeVJTbw40ca4tkNNbMivobO5gRcof8c6dAsE3/CG
 cFaeBq//WtnTQqYT/XIeMfOERNwwssdE0bIW/uQySrj47gUrB/fKhvQRtDDs2EsoWeUg
 DjUaq5SWzbLTluoSOxmuuH6KG/m7oK5w6xMjgYPh5t+4oHMo5DOyT4svuyXY8cy4I8r8
 DLxViztETO2XlYvIYhWkBtknTk2Dru7mTJhhoa8ARElQkxfqsDU+TOTF4YnLAVaYjMMb
 7ceNkIab9/RCyaEa4ynZImn9hZNtRRa89K11dpxvubCFqxtbaBXB+WLB+yvjsfieO+CT
 /y8g==
X-Gm-Message-State: AOAM5333s9KCPcJ3ynLOPmN2QpZdrKR30GEh/h1YMoBtZVRmwCLgTyZg
 ZiBbvZVFKYCacl1hRJIlLpidIA==
X-Google-Smtp-Source: ABdhPJwGi1QCSi7ZrFXa/YQGnoQD+6PyKOgq+MeAnL8vTKfh1eXj6ysUdots+a4tf4jCc9r+bnjNWA==
X-Received: by 2002:a17:906:4a19:: with SMTP id
 w25mr19282036eju.180.1616422139991; 
 Mon, 22 Mar 2021 07:08:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lu5sm9862613ejb.97.2021.03.22.07.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:08:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 261981FF7E;
 Mon, 22 Mar 2021 14:08:58 +0000 (GMT)
References: <20210310160002.11659-1-alex.bennee@linaro.org>
 <20210310160002.11659-5-alex.bennee@linaro.org>
 <a374fee5-7771-c9c2-489f-d496d3042196@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL v2 04/15] gitlab-ci.yml: Add jobs to test CFI flags
Date: Mon, 22 Mar 2021 14:06:38 +0000
In-reply-to: <a374fee5-7771-c9c2-489f-d496d3042196@amsat.org>
Message-ID: <87zgyvjn5x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 3/10/21 4:59 PM, Alex Benn=C3=A9e wrote:
>> From: Daniele Buono <dbuono@linux.vnet.ibm.com>
>>=20
>> QEMU has had options to enable control-flow integrity features
>> for a few months now. Add two sets of build/check/acceptance
>> jobs to ensure the binary produced is working fine.
>>=20
>> The three sets allow testing of x86_64 binaries for x86_64, s390x,
>> ppc64 and aarch64 targets
>>=20
>> [AJB: tweak job names to avoid brands]
>>=20
>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Message-Id: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
>> Message-Id: <20210305092328.31792-9-alex.bennee@linaro.org>
>
>> +build-cfi-x86_64:
>> +  <<: *native_build_job_definition
>> +  needs:
>> +  - job: amd64-fedora-container
>> +  variables:
>> +    LD_JOBS: 1
>> +    AR: llvm-ar
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --cc=3Dclang --cxx=3Dclang++ --enable-cfi --enable-=
cfi-debug
>> +      --enable-safe-stack --enable-slirp=3Dgit
>> +    TARGETS: x86_64-softmmu
>> +    MAKE_CHECK_ARGS: check-build
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
>
> FYI this job is timeouting:
>
> ERROR: Job failed: execution took longer than 1h0m0s seconds
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1112829128
>

I didn't see it fail in my tests (although visibility is somewhat masked
by the current failing iotest). However I notice the builds are fairly
close to the limit (56-58 mins). As they are already pared down maybe
just increasing "timeout" is enough?

>> +
>> +check-cfi-x86_64:
>> +  <<: *native_test_job_definition
>> +  needs:
>> +    - job: build-cfi-x86_64
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: fedora
>> +    MAKE_CHECK_ARGS: check
>> +
>> +acceptance-cfi-x86_64:
>> +  <<: *native_test_job_definition
>> +  needs:
>> +    - job: build-cfi-x86_64
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: fedora
>> +    MAKE_CHECK_ARGS: check-acceptance
>> +  <<: *acceptance_definition
>> +
>>  tsan-build:
>>    <<: *native_build_job_definition
>>    variables:
>>=20


--=20
Alex Benn=C3=A9e

