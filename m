Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D39321237
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:47:35 +0100 (CET)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6sQ-0003fI-HR
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE6qk-0002hj-MV
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:45:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE6qi-0006mR-Hr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:45:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v14so18126940wro.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GdyHROkyM1jZ32HivO0DbkwWJ7ZZScbSko9y1R0wAuk=;
 b=L+jS0QY6jAAjC4SOAivhlJmugDAdzqTZaHq6En88hog8JUXFgd08KY/Ef5lCCtPGBQ
 id/IT/z8qQRWsge/V/0aSYWET4PhlfD7XXB2PD5XUvtDGFWAezjQKLMhDlNvYYUE4tXG
 HWh/9RRhuHf78J2vTLRwiLI1yEjUTGkxAMqWNLuXtUlQ/Q/1JdNII3+Y0TZxUtOI1ycj
 5a2jOiXYz5/DnOA/MbnfrK/e8Ue1ZQ7gC6JhNnMt8Ujwu8PafTdKjLkTAe1YPvRjyXaP
 ix1KOVfVH3aSOgl+wlTiMFMEa6r+SqmLi6+zXjFAu8aRSXF308CJfNW7oAPptDxd13/t
 8NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GdyHROkyM1jZ32HivO0DbkwWJ7ZZScbSko9y1R0wAuk=;
 b=suHlkGKGsY1nvaLPcDx7yTjGgOfu14BXE2Hv3cI5WP2SzLJs5BEaFMNS6ea1UBkfIW
 buaEsLTxU/1GHIrpYkYKPNPoCUwQTqNwpulr1VT1QokycQeg5rmed0U3nqjSXJsMusge
 CW35CnZwkYAnls5A/d8U4qzm5Y660+rHOdLlYNtJQb8OAIbWFtJFvylYpAuDX/bFEQaQ
 AjRSytANqck3ZfG1IwQj2nhmoiSJq2hiol330yZz+NQaUlQk3Qy7mjnuIlGMQaK5SKIT
 b+nIxgZ3cLZlUOWCaYNGzeQLB9vh9pZhSOReRqBGRpSifWPvn69ie+msnrq6FlRavFa2
 RA9A==
X-Gm-Message-State: AOAM531oemzAGYbvXGdiXB2whbegXOZPpLVlujdDf44wURIwpqTMRoKb
 LwJYMbxwuGOWIgw9edK3wPeaEa8KniC9sQ==
X-Google-Smtp-Source: ABdhPJwn4VZlOiNhb7RTNPlhaB0JqUUHiCrZlUtOX6xpY8v11tP5EIA6Qac5DpOPFAzgURpxF5I8lQ==
X-Received: by 2002:adf:9565:: with SMTP id 92mr20353353wrs.201.1613983543486; 
 Mon, 22 Feb 2021 00:45:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm29541748wmg.41.2021.02.22.00.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 00:45:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7FD71FF7E;
 Mon, 22 Feb 2021 08:45:41 +0000 (GMT)
References: <20210219110950.2308025-1-thuth@redhat.com>
 <87wnv2jvg3.fsf@linaro.org>
 <6d677b16-8e46-3b5e-385e-c482dd182a2a@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
Date: Mon, 22 Feb 2021 08:44:47 +0000
In-reply-to: <6d677b16-8e46-3b5e-385e-c482dd182a2a@redhat.com>
Message-ID: <877dn07aoa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 20/02/2021 22.10, Alex Benn=C3=A9e wrote:
>>=20
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> We're building a lot of containers in the gitlab-CI that we never use.
>>> This takes away network bandwidth and CPU time from other jobs for no
>>> use, so let's remove them for now. The individual containers could be
>>> re-added later when we really need them.
>>=20
>> They are used - when people run check-tcg their builds are cached via
>> gitlab.
>
> Oh, I didn't know that. But where's the magic that tells the tcg tests to=
=20
> use the registry from gitlab?
> "grep -ri gitlab tests/tcg" does not show any results?

It's in the docker makefiles:

  DOCKER_REGISTRY :=3D $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/qem=
u-project/qemu)

which are dependencies for the appropriate tests.=20=20

> Also some documentation would be helpful, docs/devel/testing.rst does not=
=20
> talk about gitlab at all...?

I'll see if I can improve that.

>
>   Thomas


--=20
Alex Benn=C3=A9e

