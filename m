Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B22C85A1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:38:49 +0100 (CET)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjOB-0004gh-8T
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjMm-0004BJ-4V
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:37:20 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:34876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjjMk-0007nH-BV
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:37:19 -0500
Received: by mail-ed1-x544.google.com with SMTP id u19so14807209edx.2
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 05:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5eimlhABFpXHhXcYpNOJ0M7q5cBlxjtZapM+TQ0b8xE=;
 b=Q54Mv8Zfd4NZtRH5VznVcF3vqqakqgSfhAN0Yuc50HAt/kpLVHExq7hgNKBEA09A9m
 /1VJVuptYGyFFKL+9spEc7z9MoI8nd/w9ar7rBAn9OiGXWoXzd+YfdTsm0R9G3LR4tcL
 BKXYuZdTsNHhNYviTm9wq5i8bhilHvJW4ZR9AZMGMu/roK2mTECj+I2g4AaAo7as8/1h
 gDF125krlbiBNaTa2wNwXSW3B+O4vLV52fftjP4wcrBmbbG/LrelyO7VIcZTB/FFIjcq
 9Us12NoOs2vcT4CzopkQwnpev1Qp3Lhe4mTo01vkIFSC61aY7YSvAyB6SySMTo66+2uX
 sARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5eimlhABFpXHhXcYpNOJ0M7q5cBlxjtZapM+TQ0b8xE=;
 b=hUcG4y7q5kj8OOF1YtIIt/DdoqFRnYoEtwAiAmbCCT3HKOE2K5qh+aw+g/ZUDmEdHA
 MJWrqYQNM5UIQmpAfLj9nn1u5XdrABItm7AxLHCUmJFVYVfGRhBB0ku6wxe/9PXRWFTY
 0O/wdK2qIxkdtbLCEBeaN/iMiLlAYs7WWp0N6TNmPswHd0MDw6lLtnyYk6FQGTyGk4uv
 /goN+/O2+Tq9rg1NccJpHcQ34Ls9+8s5XaXyCVVVgpL/GuVQVG8UtpoemaGZmLYalq+p
 +w1UTVmCAdcLbrcRDDk97B+YGs+Ge0wUsjyIPEYFlvS4gftDtiaXVTn4l99GsimpFBFH
 igsA==
X-Gm-Message-State: AOAM53347uizuxjRLv4eF2vZxpR+5K7LRcTHMfRSADU2Q747hV8zmiU5
 0JmMKGx/C0QtkiivcbsblsTCZ5lPrTmLHcJweC20TQ==
X-Google-Smtp-Source: ABdhPJx3wdeF/rxdqwfW9oNJIbghj1Y1gmjv4IVUcsoWGBZbj7ilQOVC+YfuCwPw2rgtlW+996FWWPxxVScfxN7YJz4=
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr8629423eds.146.1606743436795; 
 Mon, 30 Nov 2020 05:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
 <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
 <CAFEAcA-2Qf2=Qsgqw+s+E42vd-K0GJ0aNyCVnsZ-cF925GUK7A@mail.gmail.com>
In-Reply-To: <CAFEAcA-2Qf2=Qsgqw+s+E42vd-K0GJ0aNyCVnsZ-cF925GUK7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:37:05 +0000
Message-ID: <CAFEAcA-vvCW9G0DE3cpR1wbWp4xyaaKs84-tBkX0o6hRrPJV0Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/qtest: npcm7xx test fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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

On Tue, 10 Nov 2020 at 10:48, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 3 Nov 2020 at 01:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
> >
> > Cc'ing Daniel (patches 1-3) & Marc-Andr=C3=A9 (2).
> >
> > On 11/3/20 2:14 AM, Havard Skinnemoen via wrote:
> > > This series contains a fix for the randomness calculation in npcm7xx_=
rng-test.
> > > It also makes test failures fatal. The last patch would have dumped t=
he random
> > > data to stderr if the randomness test fails, except now that failures=
 are
> > > fatal, it never actually gets a chance to do that.
> > >
> > > It may not make sense to apply all three, but I'd definitely take (1)=
, and I'll
> > > leave it up to you whether to apply (2), (3) or both.
> > >
> > > Havard Skinnemoen (3):
> > >   tests/qtest/npcm7xx_rng-test: count runs properly
> > >   tests/qtest/npcm7xx: Don't call g_test_set_nonfatal_assertions
> > >   tests/qtest/npcm7xx_rng-test: dump random data on failure
>
> I've applied patch 1 to target-arm.next but will wait to see
> if anybody has an opinion about patches 2 and 3.

Had a brief conversation on IRC with Dan about this. The nicest
thing to do seems to be to call g_test_set_nonfatal_assertions()
somewhere more generic, but just at the moment there isn't a
place for that. So for the moment I'm going to take patch 3,
and we'll leave the g_test_set_nonfatal_assertions in the npcm7xx
tests; as and when we make that setting more generally we can
remove these specific calls.

thanks
-- PMM

