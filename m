Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4D20CDCE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 12:13:06 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpqme-0003gp-Nt
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 06:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpqlR-0002rM-9m
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:11:49 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpqlP-00068t-HT
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:11:48 -0400
Received: by mail-wm1-x343.google.com with SMTP id a6so13397212wmm.0
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=4zVBYujwFD6aOdyf3bwHPIorbf15ZPM0zA9tqwRXCBQ=;
 b=y7dALvykl5B96wQncVTWtY2mtDR1HgZ6d1XD/YXqyA0o1uS4e1+KhYh9IA6ZN8uSk2
 +djel7m7I/HPO52TLJ/Kq+w4MCv1Z7vjLf/4ZMsqLYB/ha6SoId9r+dTjzrIFno5Odte
 s47V71oJYxSn6D+iZ+m0PRGHzpOQ4V5ebGNZBn4D3hCACLA4n7vV3xYPNOLW5YoL/mro
 WUHvZCt4h5iPrXLenGIncanCzCd5wOLnv+n+OLx1ktEonZ96TdQQCvZZLlXHNt4UlInQ
 aEUUYtYf7xVWE2Szg/QMrdNybTpQvZ5+lUBDEBJ7O5va7R7FnEcj/Pm0jPNn0Iu/vPNm
 92Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=4zVBYujwFD6aOdyf3bwHPIorbf15ZPM0zA9tqwRXCBQ=;
 b=JTrd8Tb0sn+Tu4Ty5rcYR089fiBgE72B282yLzKeKhfEINfnNA/kZP0nYAa1Cf5XzL
 jFieyfx1aAclvovUhJIQN916YYALm2THb7lFB5DYyxIEcLdQtq31JFUooS0fwpVKnA0E
 r5w4NQnztm2Rv45z1rLEshIHZR3D+oBNumlAAOafOvDctfkMxGgE0C1j4p79PGNeTABt
 S27LpjrbnJH0pkxfDn4mEUluub79W+F+sNjv5JEJHNwIO4XOmCHbWLiKpTRz2wp1YuRV
 tZJxFsdBIJRt1QAlpm67OrZ1x8LcKGpbdkBaPUjOBYR17ljwHPdN3htzK+YnUKKBiNhg
 ntVA==
X-Gm-Message-State: AOAM5326+OfBNlZSQThtSJVJREcZ2OlSFoMSHr9ut5xMDg6P+dvmvRdx
 sgYqnaIAcT4STziamn95eBfCMA==
X-Google-Smtp-Source: ABdhPJwEN/KXeCjEYcXh7w6EzG7KnYbv7sPrMVcVNiG5RNRzkRNoRjebr9wj2ra/u2kbWceqMG+LHw==
X-Received: by 2002:a1c:bcd4:: with SMTP id
 m203mr15817362wmf.124.1593425505949; 
 Mon, 29 Jun 2020 03:11:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d63sm29672079wmc.22.2020.06.29.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 03:11:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55DD61FF7E;
 Mon, 29 Jun 2020 11:11:44 +0100 (BST)
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-30-alex.bennee@linaro.org>
 <20200629100350.GF1298906@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH  v3 29/30] gitlab: limit re-builds of the containers
In-reply-to: <20200629100350.GF1298906@redhat.com>
Date: Mon, 29 Jun 2020 11:11:44 +0100
Message-ID: <87pn9irxjz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Jun 26, 2020 at 07:13:56PM +0100, Alex Benn=C3=A9e wrote:
>> Most of the time we are just rebuilding the same things. We can skip
>> this although currently there is no mechanism for picking up new
>> distro releases.
>>=20
>> Rather than try to be too fine grained allow any change to trigger all
>> the images being rebuilt.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.d/containers.yml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>> index 20b2fb1de5d..f56aa44f711 100644
>> --- a/.gitlab-ci.d/containers.yml
>> +++ b/.gitlab-ci.d/containers.yml
>> @@ -19,6 +19,10 @@
>>      - docker push "$TAG"
>>    after_script:
>>      - docker logout
>> +  only:
>> +    changes:
>> +      - .gitlab-ci.d/containers.yml
>> +      - tests/docker/*
>
> How does this work for a person who forks the QEMU git repo and pushes
> a change which doesn't touch the containers.yml file ?  AFAICT, all
> their jobs will fail due to not having previously built any container
> images in their brand new fork.

Hmm what we really need is a condition check to see if there is a local
registry with images in it.

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

