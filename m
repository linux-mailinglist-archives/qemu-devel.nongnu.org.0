Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEAC3155B6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:18:01 +0100 (CET)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XaK-0001gS-If
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9XWy-00005y-Jh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:14:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9XWt-0003g3-2c
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:14:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id f16so4110350wmq.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OqHRYOU/pAYo4Hq1UhAFwBeBxI3srspUOreZsPV1U/Y=;
 b=uySgjH/xw1cO7XIMnc6jBEEabFm5b6oBx1D1XRA7yer7Ji/uJwprhmPh92lt0IK7Ct
 llf8Af42HYgBArNicOwbVATj2hcAQSEEC2Ddlygoe3sIecGEJ+vhwA7jk9bbcOHhsBFi
 uyreWDp33WNgLvV8QUSSLS74FY9M3ltdrEV9mQ+1zFi1otJ/jLlNkoZlIJbQgnpDau0o
 rKd75oeB97ZVd37+czl5U/QTjieqO8SEdhKNwo+hMF4dpJI7JM0jwYoHF2eB3DKcxlUk
 Az5oJyK5/5HSZVv5feseUtqCw4ahOXmkD6Lil3Pkm6EtYMQrugt+EUlNc20uJakgqiTN
 HpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OqHRYOU/pAYo4Hq1UhAFwBeBxI3srspUOreZsPV1U/Y=;
 b=dfaHnNXFDkzhIG1GvZG+HCRVfjk4TFaTVWcCNGsp6gBnapTTFWWUkqDp9YZwY6tQM4
 AV993b/F6jpTKb7gYngKLei15nLCpDHW6opEKJofSEiEfcCpGjb0gGodV4UsBOz1dzCc
 Am9zevk9cylmW26+zHRY67WxyMr1jPlxcaltXurUVt0sYlJFEn4L5pEWlOzV5SkGNjZx
 VLnkZsyfsWKBXMC9K+WjxfNbc6L+zucmexv+bd4nB+F642mHywUPLKKio2FBlqL7NJ3R
 ehYRsKaJhSUGN06/v+auMLx10DDIG60SAEiZTTHl76SEdZQlxlweOzNDU5nIV22ovVHg
 KdYg==
X-Gm-Message-State: AOAM531/sD6rneKL3sa1Ee1M26ecQOti746VG4AnHBS+pIE7WN7Mw9Fk
 2uryLXZAphob3FN0zzcjJOL7Jg==
X-Google-Smtp-Source: ABdhPJw75s7FNupLlhOghOaK+BaoZGE7idJsSY12LwqgieSmerghvs1xxl/kegq1yf3Oi19MUPUThA==
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr4221460wmc.24.1612894465323; 
 Tue, 09 Feb 2021 10:14:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm23345876wrm.92.2021.02.09.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:14:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18BD41FF7E;
 Tue,  9 Feb 2021 18:14:23 +0000 (GMT)
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
 <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
 <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
 <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
Date: Tue, 09 Feb 2021 18:09:38 +0000
In-reply-to: <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
Message-ID: <878s7x9khs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 2/9/21 2:41 PM, Peter Maydell wrote:
>> On Tue, 9 Feb 2021 at 13:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>> Migration of this job is pending of Cleber's possibility to add an AArc=
h64
>>> runner to Gitlab-CI, right? Then we need someone to support and maintain
>>> the hardware... I don't think anybody volunteered.
>>=20
>> We have the hardware already. Effectively Alex is maintaining it...
>
> I missed to read if Alex volunteered for this task but am certainly
> happy if he is :) Although this should be documented somewhere (who
> to contact if the AArch64 runner starts to fail?).

I'm listed on:

  https://wiki.qemu.org/AdminContacts

and have the root keys. I had given Cleber access to get the runners up
and running which I thought they were:

  3291365 ?        Ssl    8:41 /usr/bin/gitlab-runner run --working-directo=
ry /home/gitlab-runner --config /etc/gitlab-runner/config.toml --service gi=
tlab-runner --user gitlab-runner

I'm not sure what else is needed on the HW side, it's just waiting for
the gitlab bits to be plumbed in.

I should mention the HW is due to be upgraded in the next few weeks but
I don't expect the upgrade to affect the way we plan to use the machine.

> Assuming Cleber's runner script is merged and working on the AArch64
> runner, then we need to figure how contributors can use it.
> Assuming this runner will be registered under the QEMU organization
> namespace in Gitlab, then contributors would have to open a Merge
> Request to trigger the CI jobs (similarly to when you push to the
> /staging branch). Then we would cancel the MR. We can ask contributors
> to cancel their MR once testing done.
>
> Midway could be having maintainers opening such MR?
>
> I have no idea, just asking questions to see if other have ideas or
> see the big picture here.
>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

