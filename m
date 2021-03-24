Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6A347AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:24:52 +0100 (CET)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4RH-0000Hh-4s
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4QF-0008I0-Mv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:23:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4QC-0003Hn-Q9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:23:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id 14so1420360wrz.12
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=giFI8/egT47Bm9rcBpOsa2gLncqqH5rfSdtb0fcIwVw=;
 b=H2+JpCFT1qw5lQlNGaZwdpmdtYFDeIeQQc6dieAevpWbssE00BcJ2BVGsYd9cXmbAQ
 2IkBbKyt5Zh69ehD4N3ri8i+0a3ND6JXJl3FgGsXQ6wXqEZoUQ3iYwprzjUlkEcWDVOZ
 YDIWPJ7w1iEQt9oKsS6NO5MkDHVMeCEr0DiKZOtLwMB4Z/hGS1eKkGnqv4VyTwURUA4v
 iARjUZ7b9UyzCLoLH663oat4C2Em9IENzOuJpisDBl5OxhwfYSrX+TKjhiflkpHU8O3c
 MYrXyVZ+Q5JeU3P/XfiKZdXYeeLMnGWKP2syTWETNy8tP+cJWsTu2+hdYpuDgbRYEu8y
 0n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=giFI8/egT47Bm9rcBpOsa2gLncqqH5rfSdtb0fcIwVw=;
 b=Ctqynyb/UROnyBlkyLC5DaqeDAEkKfELJWe5aY5uxBuH+zR2O+ExuxKVugHamTQf9f
 303Nh8ki8PlbIPPKQDQxjRPXRNVbgKLycFa/vLUrkRdfkpCcb+C7b11luAd2pxopT2xi
 /+4z2QBG7+0tWmt02+auYX/34LryirCS6tsnftPUfHZkGYNDh7U+FyOXizCkXVXAu1or
 MVTu8Rdbbu02eGlNqlicyLEz6oZoKabQsDMOnajzXFSktQSOjsP3PQNaiUN0AIQJZstQ
 Bbhlbz6pFiU34jvYG3gf49U0CoR+xwMZ92E/jWXpwHNkiOk3mZD/A1yliFxHjGFIVTwW
 FLdQ==
X-Gm-Message-State: AOAM5313qbiW4h2d9hMgugRhSSDWjXMq4MMQGM0iSLjoZgEf3q91IBo8
 Oi6wEgRLLs0IkKKGLvBPhaylcw==
X-Google-Smtp-Source: ABdhPJwiZdM9oVnDa6QZAgT5zkJdAdmpnkEf3BcGmf7OqXZ4C/zlAn6kqeFaUOFxErGROwQoyGTCQg==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr3789485wrq.193.1616595821111; 
 Wed, 24 Mar 2021 07:23:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n23sm3625874wra.71.2021.03.24.07.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:23:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6715A1FF7E;
 Wed, 24 Mar 2021 14:23:39 +0000 (GMT)
References: <20210323165308.15244-1-alex.bennee@linaro.org>
 <CAFEAcA_c0xYHhwyJtgcwhzVfv9EaRTYdjRCWJsk-ZOuE5okTbg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for 6.0 v2 00/22] fixes for rc1 pre-PR (kernel-doc,
 semihosting, testing)
Date: Wed, 24 Mar 2021 14:22:22 +0000
In-reply-to: <CAFEAcA_c0xYHhwyJtgcwhzVfv9EaRTYdjRCWJsk-ZOuE5okTbg@mail.gmail.com>
Message-ID: <875z1giqac.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Mar 2021 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> I've added a testing patch to extend the CFI times, Laurent's series
>> to fix the iotest regressions currently keeping the CI from going
>> green and an optimisation to the --enable-docs build to try and start
>> bringing the total CI time down a bit. rc0 is being tagged today so
>> I'll probably roll a PR from this later in the week in time for rc1.
>
> That's tricky given you sent this patchseries at 6pm on the day
> when rc1 was nominally going to be tagged :-)

The wiki says:

  2021-03-30 	Tag rc1=20

so I thought I had a few days. I wasn't aiming for rc0 just to give time
for final review comments to come in.

>
> I was kinda hoping to get the iotest regression fixed in rc1,
> but I want to tag it today. Oh well, it's only the CI, not an
> actual bug, so no big deal I guess.
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

