Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060632167E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:25:27 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAHG-0000y5-DX
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEA76-0006x4-3V
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:14:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEA73-0007kk-VJ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:14:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r3so7193360wro.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S2Okou0fEKiAvEfRBtvsEu3EAQM96mVR7qvqfBXtQag=;
 b=bWmZMJ/RT0ckDrLlWzEk3S4xbe/SnOnEAarcJbtTE2xeXQV7A4YEI8jALrNCoAP0bo
 Ot+m523eTFTBFJ79XAVkz3xM9w/W67jQ7DeK9LGT+QWRqY/1z0oppZz8H0fyromVfDIc
 HkOVj2IZdLEtDw3nVfoz0Ec78YOeTMZQpwDd5gZFXJnYwtODRDaa9QLwNQ48tH95ca6T
 wfUvxfBetEFakNgRNKpFLiL2cSodBIwNgPCcc4ERmKELnL+5rnGRh3YFMBn7bHaZZQkY
 rrVU0GARV+xQxn1Ke/KG7W+vk3Xucx7KqZ5qXc1KXquQQepybYStB0anvEZDKW3HYz6G
 tR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S2Okou0fEKiAvEfRBtvsEu3EAQM96mVR7qvqfBXtQag=;
 b=VfObkBMzQWLEjrTF0pRdyK/YvLd3VgLBWg/vQYBoD5YhP/mPzxHkKBDXn3fpuGxhLo
 B3cVZ7Sx5aQMbPhnBj0JmWzxV1VKJ4+IRHv4oOtGaFQ2/zeHi+y1VeL/rqVd4FAztJNT
 BgBqcnRF2ZiPqNiXUNd6F60EhJQjZpd24pGgOaEJDgn0hwMxCNoHlI3TqExqTBNRbJtu
 Zp4asiRipyd930MJqVpBkHpZCdsZNeJ2ugPRkkUiKknLCGh0g/4LpDUu5CHj0ldCMeXV
 kfVxryqt1UQ+7CXQ0Ls0CFlxPaTFUa0WyFSFnlTtZkNPcxUcbl/EEuJyOggL/2+N8CxP
 wk7w==
X-Gm-Message-State: AOAM531GNgLAH4AjS9gfDrS+Ztp5YL0q3ctYwIeKcUYPOQ6HKf0OM1qA
 omxYRnqvYZZAxGp+ZdjKoQzOfw==
X-Google-Smtp-Source: ABdhPJwf5vRFnoEb5OtNi0iU3PSk9cC4+jyNUYHBXOmCaLIjHIQjnCmU/4JNbz0B6hay8FMCE5vFZA==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr21619346wrd.118.1613996092008; 
 Mon, 22 Feb 2021 04:14:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y12sm16758175wrm.33.2021.02.22.04.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:14:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 24EBE1FF7E;
 Mon, 22 Feb 2021 12:14:50 +0000 (GMT)
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-6-alex.bennee@linaro.org>
 <a28b2c23-418b-83f7-c045-e82a11b95ae3@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 5/6] docs/devel: update the container based tests
Date: Mon, 22 Feb 2021 12:14:33 +0000
In-reply-to: <a28b2c23-418b-83f7-c045-e82a11b95ae3@redhat.com>
Message-ID: <874ki470zp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 22/02/2021 11.14, Alex Benn=C3=A9e wrote:
>> This section has grown a little stale so clean-up the language and
>> examples for current usage:
>>=20
>>    - refer to containers at the top
>>    - mention podman can also be used
>>    - add podman prerequisites section
>>    - move to using "docker-help" for online help
>>    - mention the registry and it's purpose
>>    - don't refer to out-of-date min-glib image
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/devel/testing.rst | 61 +++++++++++++++++++++++++++++++-----------
>>   1 file changed, 46 insertions(+), 15 deletions(-)
> [...]
>>   .. code::
>>=20=20=20
>> -  make docker-test-build@min-glib
>> +  make docker-test-build@centos7
>>=20=20=20
>> -This will create a container instance using the ``min-glib`` image (the=
 image
>> +This will create a container instance using the ``centos7`` image (the =
image
>>   is downloaded and initialized automatically), in which the ``test-buil=
d`` job
>>   is executed.
>
> We're going to drop support for CentOS 7 in three months (May) ... so may=
be=20
> it makes more sense to directly use centos8 or another long-term distro h=
ere?
>
>> +Registry
>> +--------
>> +
>> +The QEMU project has a container registry hosted by GitLab at
>> +``registry.gitlab.com/qemu-project/qemu`` which will automatically be
>> +used to pull in pre-built layers. This avoids unnecessary strain on
>> +the distro archives created by multiple developers running the same
>> +container build steps over and over again. This can be overridden
>> +locally by using the ``NOCACHE`` build option:
>
> Thanks a lot for adding the information!
>
>   Thomas

Is that a r-b if I change to centos8?

--=20
Alex Benn=C3=A9e

