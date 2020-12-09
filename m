Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D432D4AB0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:43:34 +0100 (CET)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5N7-0001cH-QM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn4IL-0000tK-AM
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:34:33 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn4IH-0007yG-VO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:34:32 -0500
Received: by mail-wr1-x441.google.com with SMTP id 91so2839236wrj.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aqMZV1melTRW+dD9HVS7RhIoOojRAokaAgOOsHPSxWA=;
 b=LEzXyMWhWf5iKkyqRxpSwjY0VMK3A0sN/crqz01KJfPxw8d3w+y97ncZDK6o/mXeDS
 iEdJt18o0uwSRoAbHqTSU0vqx3W6uSwUkZIV1CNRmVCG1q9O4k1Gr1sLOfquGW0fW5m0
 TaOXnUvmshRff7A1nyNKPZX7iuPuZFUDGjzTe2eMU29Ytag9kXqoXw+gJHOfmxfzrWgf
 EFmnRyYjp3AipDVkaGL8bmrx67lNv/4+mbiihuF3dgmIu5BLWB1scHRg4GpcJJ/UR4tN
 hPSuxgUazeUO2hva8i2RMbpmj1QZzKwLc2LUVUGwcUx2VcC6nxj605yVz+ednSoaucjt
 UEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aqMZV1melTRW+dD9HVS7RhIoOojRAokaAgOOsHPSxWA=;
 b=iXCDvE6jmwjzIz4sNVmRUrHY4iLps7/cgG4wrJgTvLYi5DKvsQPQ/klcSiSzn3iYIb
 J/f5hYDzEr6a1FOb4ZwO4P1vF1BUv8Fm15b20LjaUCouRloLOtOdNjt5Ld6OxVepW932
 D/b1AvFruazRJ7Oc5zUCqzhNqtv/preoazo2neG1HWqRgK+tbY947r0lcqbg1M21IUYG
 CKzmqSXikGCyDyxpfqPnYHuLJlBJnuuJ6g+I4e23jnel7D3wZF/TicK2zY+xmoIcqa0S
 bWeLD3D1UXjYqQx0WcckJMEINEIWf2R9glbXJZFuOFVwCQhxo5bS1SstTk8AkuUIjY98
 g3aw==
X-Gm-Message-State: AOAM533YI38k/v2SneCpzTZGj6dV6eyOJJS2/iZ5/pxrLE97EDUM+7Zj
 uz6DiPMaBrvw3iVZ0arTf6vOSw==
X-Google-Smtp-Source: ABdhPJz4r1MJgXPwF0fB8E0ExJPVja9Wpfhics5AkxTjYdI7WdoHkw1UiPxrMJ2fgIue1uOzj/uQpQ==
X-Received: by 2002:adf:f98b:: with SMTP id f11mr4258776wrr.235.1607538867820; 
 Wed, 09 Dec 2020 10:34:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm4805572wrq.64.2020.12.09.10.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:34:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2522D1FF7E;
 Wed,  9 Dec 2020 18:34:26 +0000 (GMT)
References: <20201209170059.20742-1-alex.bennee@linaro.org>
 <20201209170059.20742-7-alex.bennee@linaro.org>
 <0d1a0b59-ecbc-208f-8eb7-0aa323930cd9@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 6/6] gitlab: add --without-default-features build
Date: Wed, 09 Dec 2020 18:32:19 +0000
In-reply-to: <0d1a0b59-ecbc-208f-8eb7-0aa323930cd9@redhat.com>
Message-ID: <878sa6de19.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 09/12/2020 18.00, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.yml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 878d114d40..f87584ca8f 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -441,6 +441,13 @@ build-without-default-devices:
>>      IMAGE: debian-amd64
>>      CONFIGURE_ARGS: --without-default-devices --disable-user
>>=20=20
>> +build-without-default-features:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: centos8
>> +    CONFIGURE_ARGS: --without-default-devices --without-default-feature=
s --disable-user
>> +    MAKE_CHECK_ARGS: check-unit
>
> I wonder whether we'd rather want to check without
> "--without-default-devices" here to see whether all code compiles fine wi=
th
> "--without-default-features" ... ?

Yeah at the moment the full-fat without everything doesn't achieve much.
So how about I swap the IMAGE around with the previous build and drop
the --without-default-devices?

>
>  Thomas


--=20
Alex Benn=C3=A9e

