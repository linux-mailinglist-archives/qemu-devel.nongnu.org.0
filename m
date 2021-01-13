Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C72F500C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:33:50 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzj5h-000375-GJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzj1g-0002Rw-4Y
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:29:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzj1c-0001Zq-4I
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:29:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id h17so1948954wmq.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FLa8wCJzSi5//c/8sgq4/gzLprO3Z4xY/rwT4bI+pvE=;
 b=JDcTxPtyMpczxfr04N2boOhvpF8ub8Mfy51HXnheBnXQ6rAgWAjFbFNJ6JB6ool0l4
 vCJGGBD4RwNijRYF7pSfkQcg6cl0lZxSSRwrSBtfDCnAGHuMKaVB8LicHZnkTmyOQjLD
 F1ljGzPkIkmAWQRvYoI0PCjllPmth8chGFkVPy0UpEPuVQKGNI3ucr4Rqn3LtTqybhFy
 CDchYEzUhT6d+UwhuV0PvQuGpM2zvTzDvBJjFd7wqr6PgjSb8Mes28qLMHZTBU+0XNMN
 0b2Ezk9zBA0jdZjR2A3/WPliun9FoTTjtMSoyJX9ElTFyhuEvNi+0gB207EzzUBWRL0F
 LXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FLa8wCJzSi5//c/8sgq4/gzLprO3Z4xY/rwT4bI+pvE=;
 b=ZUOic5KMujn54iIU73oZ+QFIGZAEbATimsYPw1OSD51QZg8vNYyReSfq8jEtScr+as
 u3rws0S34F2ZG/EVnpDfRMOo4R4oI1lhnPtlarXCpW3ecSha8vFCeaDyR2hfwFEzDXep
 oF1AOT9f7nvcQgQJqBGgbkJ97xbhT84ppZ4x2JmKALOgKayZD3rMhShuj+ZmIP8MBZFW
 22cft6zDFaERKt8AGKsX2yF68eq1iq2DkAD/fLQ+CSc4UdGw/r+8awdnsxCgtpNOfmt9
 xJ/+/3S1hk8ojhpnaH4B7c9J3rapyOSgJvdYXWHv5MFbCkYed1NngZ5KT0c4c6YVVjXb
 GmoQ==
X-Gm-Message-State: AOAM530Jp24DAeliI8wkrM+E5QA3h1NxJT71tGkf1+KGjsZhO3TFJtw1
 70gfExitLmjEAOxNgOJIYNRaog==
X-Google-Smtp-Source: ABdhPJxA2Riq6bk8JbD4N2ehu3fFD7eBIsrbS4uEOsMdDJ5wuxu0p9IqKkyyLazbb02CqaOpz8LFTQ==
X-Received: by 2002:a1c:8f:: with SMTP id 137mr110524wma.4.1610555374485;
 Wed, 13 Jan 2021 08:29:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm4269830wru.4.2021.01.13.08.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 08:29:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A54EB1FF7E;
 Wed, 13 Jan 2021 16:29:32 +0000 (GMT)
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
 <20210113153728.GF1568240@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH  v1 9/9] gitlab: move docs and tools build across from
 Travis
Date: Wed, 13 Jan 2021 16:27:54 +0000
In-reply-to: <20210113153728.GF1568240@redhat.com>
Message-ID: <8735z4n6kz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jan 13, 2021 at 03:14:08PM +0000, Alex Benn=C3=A9e wrote:
>> While we are at it we might as well check the tag generation. For
>> bonus points we run GNU globals htags into the public pages directory
>> for publishing with the auto generated pages.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.yml | 22 ++++++++++++++++------
>>  .travis.yml    | 16 ----------------
>>  2 files changed, 16 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 4532f1718a..c07064a4f7 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -79,7 +79,6 @@ build-system-ubuntu:
>>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>>        moxie-softmmu microblazeel-softmmu mips64el-softmmu
>>      MAKE_CHECK_ARGS: check-build
>> -    CONFIGURE_ARGS: --enable-docs
>>    artifacts:
>>      expire_in: 2 days
>>      paths:
>> @@ -111,7 +110,6 @@ build-system-debian:
>>      TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
>>        riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
>>      MAKE_CHECK_ARGS: check-build
>> -    CONFIGURE_ARGS: --enable-docs
>>    artifacts:
>>      expire_in: 2 days
>>      paths:
>> @@ -126,6 +124,17 @@ check-system-debian:
>>      IMAGE: debian-amd64
>>      MAKE_CHECK_ARGS: check
>>=20=20
>> +build-tools-and-docs-debian:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: debian-amd64
>> +    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
>> +    CONFIGURE_ARGS: --enable-docs --enable-tools
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
>
> Do we actually need this job at all ?
>
> Assuming the depenedancies are in the dockerfile, then all the
> build jobs will be testing docs and tools already, as meson will
> auto enable it.

I pondered making an explicit --disable-docs to save some run time but
really this is providing a golden build of the docs which can tehn be
deployed by pages.

It also ensure the tag generation works for the various tag outputs -
the GNU global output being used to also publish a HTML navigable
version of the source tree.

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

