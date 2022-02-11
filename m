Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC704B2C52
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:03:21 +0100 (CET)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIaGO-0005BY-C5
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIaCB-0002wh-KJ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:58:59 -0500
Received: from [2a00:1450:4864:20::431] (port=34715
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIaCA-0006hU-1x
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:58:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id s10so3016592wrb.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pKeytq2vOxsKRpPVYQo1iRr7EGbTWvcr+sd78yPHBhs=;
 b=qZ0anfI8qsfkmQPlKvocMwVHUhlHRwx9HODwxIj6yu4S37svyQ0ddMhQuh9v7mPX2m
 5VfOqPOpZ8oKtfJpxHUxB8xPmQy9hKgyhMAFU/c1nO5MTtXGk8nIEjJyrFbHgvqoCl+s
 2eFqaoUkTW5dOLvp1zxUUoqKIY5oRSQZwYBH29ql7edjrF10xECGFYSxsaRv1x0OppNl
 GZt8sPkmG+e7LmBYLcfa7mo+rk1pM4ombecoxS/5DaQigbhNry59tfOFDWwrHhv7PckR
 Gzpy1022RR6BFN67e9DQHxrPQ4G9Rpu8ZLoJDzbYjm/uwQAsqyU3lEGnJ8n1W04H+Ed2
 90kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pKeytq2vOxsKRpPVYQo1iRr7EGbTWvcr+sd78yPHBhs=;
 b=5UBUay5lt+Pu37thpeAYT4GBLwdVPlXR549lxE9j9QzTQvYZcIesoozyD33pJ7FoRU
 fJcOrqyulXvCeMT3vx7kgsJpQAZXY7305OzCC8u5mpS6rCIA9E9ThovrChBi4XQpkLqW
 vPGFarblYIesbnr+g6k1P4tw6/JtrxupEqWTBxpbtQet+hywrBa/jKIdqlUt/vMGB376
 brmMjL911ZSWAqXHYbtzmoAG82nAVopykMuEfxqUJK3yz2+RqHnjEnIXRj/sQ2k25hL7
 wp/MX2w/Zx+AszEUai8j8xOzMTBhBuj1nQv0z09QRooe436ViKlCq9MXWsjXq5mlnw6o
 aVAA==
X-Gm-Message-State: AOAM530eqGdUIbHTyRSAybrX/Cbt5RrfhiaXbTnvyd/t0WUY1lw4OL20
 752LgiMf7X2PZGpsi9keiVMm7w==
X-Google-Smtp-Source: ABdhPJx1Gstq/RKlo21DOJ3s2F9q6FDED7HaHz8NkVpJRI1eznuQWwYe3uCovbbOXJY4QWxojXVwpQ==
X-Received: by 2002:adf:f18f:: with SMTP id h15mr2276425wro.513.1644602336114; 
 Fri, 11 Feb 2022 09:58:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b2sm24425200wri.88.2022.02.11.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 09:58:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 367731FFB7;
 Fri, 11 Feb 2022 17:58:54 +0000 (GMT)
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-3-alex.bennee@linaro.org>
 <YgaNZyojexpreBWj@redhat.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Date: Fri, 11 Feb 2022 17:51:25 +0000
In-reply-to: <YgaNZyojexpreBWj@redhat.com>
Message-ID: <87o83dcmjl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Feb 11, 2022 at 04:03:00PM +0000, Alex Benn=C3=A9e wrote:
>> The alpine image doesn't have a standard useradd binary so disable
>> this convenience feature for it.
>
> Hmm, can you elaborate on the problem here ?
>
> IIUC, the NOUSER env was just about controlling what docker
> flags we added. I didn't know it had a dependancy on stuff
> inside the image ?

The docker.py script expands the dockerfiles with a:

  "RUN id %s 2>/dev/null || useradd -u %d -U %s"

when they are built so when they are invoked for building TCG tests they
won't mess up permissions of the final files. It is a useful convenience
for the other images as well so you can access compilers and tools with
something like:

  docker run --rm -it -u (id -u) -v $HOME:$HOME -w (pwd) qemu/debian-arm64-=
cross /bin/bash

however it's not required for the normal cross-compile tests as they are
all done inside the docker image. The alpine image being slim doesn't
have this nicety although there is an adduser binary. However given we
don't use alpine for TCG tests I demurred from adding more complexity to
docker.py to handle it.

>
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/Makefile.include | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 0ec59b2193..286f0ac5b5 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=3D
>>  docker-image-debian10: NOUSER=3D1
>>  docker-image-debian11: NOUSER=3D1
>>=20=20
>> +# alpine has no adduser
>> +docker-image-alpine: NOUSER=3D1
>> +
>>  #
>>  # The build rule for hexagon-cross is special in so far for most of
>>  # the time we don't want to build it. While dockers caching does avoid
>> --=20
>> 2.30.2
>>=20
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

