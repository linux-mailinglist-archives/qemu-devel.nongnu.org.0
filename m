Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7D30F144
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:54:13 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cH6-0005my-GH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cCF-0002wu-1S
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:49:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cCD-0005mX-93
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:49:10 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so2984561wrz.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xyvw4TC7x+PBozW7FIsLgZ5R8r5GHTbnZ0x5becV8j8=;
 b=cISSBvCwhazFibzmmGrWW2FtrINarGaHbuZhTIoidOnVUQf6aDX+mcvMJiIMEF3OUj
 yNDe5PGS3t2zrKqM+qsPyw9P5DRQn+QKFc9Quwr6lFJ/95hpi09YCpGSSXbK6t2olaVp
 rT7DbeT5+DzizVHGx80J8DqRhg1JJK4oEZBWYSnhHkzRO/OYdwyeVNgU+qomRtlVYl+P
 xa4VaROIwRmP6+oayAFqqxBX67g/+7cX1lpmceHBDb1mj0eZLWjperhB5Vyh5xYDzJ0X
 yQHIxR2TizMI4guqe60pFLuIRIq+HwMKQwWrY4dkHT/1eGQ7itbR0Mx2mFXk18rgWLK9
 qCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xyvw4TC7x+PBozW7FIsLgZ5R8r5GHTbnZ0x5becV8j8=;
 b=mfOZY/iCV8eZ4kb+ElolLdjAVI0+1t0qHwGZt0bhKM4uOVyErgsExqNMEqTpZ4EYbU
 z7JZdC4Sex8qZ/n/yyg/2x78RRtgEEk+4Zomb/csx6crhJ0yi18fJHKVDk1GOmUzJlNx
 X1fSDMW7KgJHZF6JNx9yA7JP1WfX8omb9rUw0JlU7tJwnLyCgVjN7E51hp/5X5MnKrEA
 mbO2ekewSIqrT7QmcKygh+SizXxwafXBYdv1/jFHmIra+8X5X1PaxlzsPuu7obyXizM/
 fWAmOXmp0AZ4aw2/6E3l+ruyzlTnDbfKNU7ifOL2oD/FZup2aI+XOYzhrdNcFKrjtoIG
 Jn4Q==
X-Gm-Message-State: AOAM532U2HCqFL4e+CwJ0wRaFMl6OvLrNHvNVpYyZALiQ/vfKL3l4sDs
 Yf5c/sS4Nr7dvrHFF1uhzpoTwQ==
X-Google-Smtp-Source: ABdhPJzjwBJR/vxpcahqSP/ULphIhtvrLOg6HWeRKK/Vu4m8DGDvUlEPmecWlIZ+SC8mWuFjT1WBEw==
X-Received: by 2002:a05:6000:104:: with SMTP id
 o4mr8560821wrx.419.1612435747775; 
 Thu, 04 Feb 2021 02:49:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j15sm7649118wrw.9.2021.02.04.02.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:49:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33B4F1FF7E;
 Thu,  4 Feb 2021 10:49:06 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-5-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 04/22] tests/acceptance/virtiofs_submounts.py: use
 workdir property
Date: Thu, 04 Feb 2021 10:48:58 +0000
In-reply-to: <20210203172357.1422425-5-crosa@redhat.com>
Message-ID: <87eehwqfa5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> For Avocado Instrumented based tests, it's a better idea to just use
> the property.  The environment variable is a fall back for tests not
> written using that Python API.
>
> Reference: https://avocado-framework.readthedocs.io/en/84.0/api/test/avoc=
ado.html#avocado.Test.workdir
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

