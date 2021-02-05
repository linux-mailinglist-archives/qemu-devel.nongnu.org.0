Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0567311145
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:36:25 +0100 (CET)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86u1-0008GC-2C
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86se-0007hr-N6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:35:01 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86sb-0002t5-8U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:35:00 -0500
Received: by mail-ed1-x530.google.com with SMTP id t5so10132282eds.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 11:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dCxr8zy1x0m9bDA9JbC6bPiaGbp4UMX+EfGqQQhAQJo=;
 b=I+Ewhcy3lybe1ahdXG/gXKB1+E0Jv8JTP7Adp7yUKERlw2r/P0zNwOa61W5hrSxvkL
 0NbP5PzCYQSDW/0Z4b77p589H8c6g1Mw8f8sxh2FAPeo6lEAX/LPuR1qPKmCClApdu6g
 CbBCoDxVq9t7JJ7PCKOWzopTog6xC7EAbu91Tfe6Jaff7iZO7WLPsukDDgu7fFGHq1B6
 ovOZQsYxxJIZBaphqygdwMNPGDy4C1RFN/YGn2G6O3co038XCQm1KJol560qsZwl1Ida
 4u0Q8StH4M0zHjK5Nr38M19lwIV1kH6Piu/iBrFos6r/7t3ZolT6FaH/oUZl2t/RfqC9
 8tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dCxr8zy1x0m9bDA9JbC6bPiaGbp4UMX+EfGqQQhAQJo=;
 b=CUbe72nIMk4WRQQpxQrtTfGTLq/APxSUwQCKLQSmG2nyfWn3RAbcHl3o4PTsmbjmRZ
 h7VC2g2jmK/zEBM+G0R1lSzX5dQMf9B6CO0ZctW0sG2bS/EZPztVnvEmiWrFgS6pC/YM
 vZ+4sQgim5BIws7neGk+OwQ0AkLJJigAkk10Wa+movOej3exPwqQStBVdjAos4j9lHPk
 LqErjrmbZN/5Y5L8hea7r8GvqtKvuebfFC4rnkLH5WWKI5BsfGZHUuAevixB4NLlpBa4
 XlLlSATGWK24wYDJFiZ/851Hgh6mHdJ/kBtf028/imi9wdRLq6CZLKsH7ZPHTfFbC9ka
 TzdA==
X-Gm-Message-State: AOAM532Zkm58JmkDg5vHTNEA/ojYtpE46YCHQEBVKZjoB1zZOc5TIffD
 vgq2ZEDluKRphROtQl6UgAVt5G1f2h8U5ScQIz0zZA==
X-Google-Smtp-Source: ABdhPJw7jIES3smr2MdokpF4AnJ2wHzhNHTJeYXfUgJSdlMfcr/nH+4fI5ryc4b1Txao1AbjWE+UM40+UYg+zahU+Zw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr5109713edd.52.1612553695346; 
 Fri, 05 Feb 2021 11:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
 <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
 <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
In-Reply-To: <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:34:44 +0000
Message-ID: <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 19:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > > On 2/5/21 5:59 PM, Peter Maydell wrote:
> > > > (The selftest is part of the AN524
> > > > download so it's behind a EULA click-through and we can't put it
> > > > into an acceptance test. We might be able to get something
> > > > based on Zephyr or Arm TFM.)
> > >
> > > Wondering about that... If anyone can go/click/accepts the EULA and
> > > download artifacts, then I'd like these tests to be committed to the
> > > repository, with a comment containing the download link, and the test
> > > can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
> > > binary I downloaded is the same you used for your test.
> >
> > I would rather not get into that. The selftest doesn't actually
> > exercise as much of the emulation as you might think anyway.
>
> This was clear from the previous paragraph, I was asking about the possib=
ility
> to have developers/maintainers individually accept EULA to download artif=
acts
> for integration testing.

Yes, and that is the thing I would rather we didn't get into.
We should just have suitably redistributable acceptance tests
where we can.

-- PMM

