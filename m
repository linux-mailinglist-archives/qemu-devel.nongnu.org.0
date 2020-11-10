Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BC2AD41A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:50:19 +0100 (CET)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcREA-0003bi-2V
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRCj-0002QK-2y
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:48:49 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:43354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRCh-0004cm-6L
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:48:48 -0500
Received: by mail-ed1-x544.google.com with SMTP id b9so12180705edu.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eVD5y4g2Rfc2yx6nNOaT3CPybZQkXS892G2CTFVz298=;
 b=bVW6tYvSaLHDyGWgFY2XN0jvAQuXg8HO8vwem7A0JIrslp7m0xBzRy+q/hFL+zkmjm
 RtwFSAudSvlhd2jkQ7cM71OpClPC7xwCT3BOBV2PwjuY7rFhSPVpnGI3d7OjQI4IiGyu
 PVusUFkdEshwmF3weoGX2ax/2CXThQ35u2XBQtDSq8oqSjxf2/xIR1ESWf6E0K6NyE0K
 QuWBPjKDyG4pOLK7HtGByPWHBXex0U8eUaGloGPg9bSFGJmJgT+ofP0Imos2d0IgOQvJ
 q8qXqCmWzxoCjkOkLuq4dtHOl0FhZhBGquOJ2lcIAhLLgg/CxlymjJtYr0UVXKxdpPK7
 XNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVD5y4g2Rfc2yx6nNOaT3CPybZQkXS892G2CTFVz298=;
 b=EDVrJ+mjtVJCprGBwoJEUPLgvTkwKOOvnWUyuvyO0SfBcGHCuhrNxz4ByYUwMGSQc0
 648CFoePmhY91EgFNeObQPKOXZR70VZTNJgGc5xEnpHFoHa1SSl9HW9epVyRmwcRi7MN
 15axvz9LcL3PeSMUiRVdHhVVSpqbNf9zxeqBeXoKsgEjIMF+mcNQJE3PONA3TSyll1dh
 7W96y9JfGpHzQpd5GtPUEKPKEpOSnMHzMQEo9uuI1XCld29YdlSj39Qg9XhnZYxdsCFA
 ATVMK2El3LrdwOlW3VSbQKOB49s+ez2qoB4w+9yE8TL7rUteMXTl/G/7mQHpy3IRgsO6
 6WNQ==
X-Gm-Message-State: AOAM532TADJOXnQguNtsWvXAAVAapE0SsHxb9Mngl3+W03xbBYCB6Ngz
 OP7BR9ETxYzrjf+4Rn4lPKwEuwFLEUN6YeZqJiyL+Q==
X-Google-Smtp-Source: ABdhPJzL2hPD3BYwnLwG4gU1pm4CJyBhq0CKnXI8mHeRFQTa4sdgvJx5GDqgRhBfVK6e6T6n8MjPh9FCWjltkD4He4I=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr20917837edb.52.1605005324597; 
 Tue, 10 Nov 2020 02:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
 <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
In-Reply-To: <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 10:48:33 +0000
Message-ID: <CAFEAcA-2Qf2=Qsgqw+s+E42vd-K0GJ0aNyCVnsZ-cF925GUK7A@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/qtest: npcm7xx test fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Daniel P . Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 at 01:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Cc'ing Daniel (patches 1-3) & Marc-Andr=C3=A9 (2).
>
> On 11/3/20 2:14 AM, Havard Skinnemoen via wrote:
> > This series contains a fix for the randomness calculation in npcm7xx_rn=
g-test.
> > It also makes test failures fatal. The last patch would have dumped the=
 random
> > data to stderr if the randomness test fails, except now that failures a=
re
> > fatal, it never actually gets a chance to do that.
> >
> > It may not make sense to apply all three, but I'd definitely take (1), =
and I'll
> > leave it up to you whether to apply (2), (3) or both.
> >
> > Havard Skinnemoen (3):
> >   tests/qtest/npcm7xx_rng-test: count runs properly
> >   tests/qtest/npcm7xx: Don't call g_test_set_nonfatal_assertions
> >   tests/qtest/npcm7xx_rng-test: dump random data on failure

I've applied patch 1 to target-arm.next but will wait to see
if anybody has an opinion about patches 2 and 3.

thanks
-- PMM

