Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB138AB4D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:22:28 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgl1-00028L-2q
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljgZJ-0000oF-Hy
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:22 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljgZE-0004pf-Oa
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gb17so6584797ejc.8
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6rOUncbNjNjsMzZOciY3gU7BKnM3beVVtn+zrynWX2k=;
 b=pvWR2sNnnu4E9PbBQKFzmQhabBDjRdt73NXqpEiomlV4p1mQc4X+qROKZ7lHSUk6GP
 DLSvgkxbLorDjMOTqUNWFw/R7M9G6GaAQXS2hLzD1mHsX1CSifpU7frqVPQy2VQJW1XK
 DElPn15fc+1Cg7kYVS2EvIcJKKepwLsR+KnGe7HRlS3Zgm7ohkYJcKYQ/1uhbLZYJ38e
 no3gGdKdwzpOwm+tak0uU4ycHy5KBpUP7ABS6+qwbpbyMY4ZY/9HXpGCs2rKJpIJT8SY
 kvaImz1Qa8cPhrx7Fv0R0c1X7OSEVMJ7VNTBhyKr/GK4lrIO49Y+UCIRCScVb6sberUJ
 ZfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6rOUncbNjNjsMzZOciY3gU7BKnM3beVVtn+zrynWX2k=;
 b=AGw7qWDRsAzP1N0WWu2JIl2c5cWmHTzMkN5VNmNhv0IT4oSW84xkX3Ffn3ll6t/I9t
 ewvf6u3IUjv4A9z0MTGI3SSvXF6sblmkQFh3ChmB+l0XiyYMcMSdxL35ZGIrJIF/EOHI
 JaOjXzr4xtLaGXWpeNifnp3ESRe5pJbuWbVRTNLwV1+PwOVqovkDw41b+aGJzD9Qs5QA
 xZbsP3N7Ts9bhOLH8t0E6B2DQg6Lte8n4SijTm0w2ZnAU3AuBMouoTd2Dfms+yqNRXBa
 GyHrYO18Y16tNtgQ+h1MfvS8uhtsf0fv+LHW6J7Q3LVARyGUV5sL2rtCaPFvkiRUakIT
 KdwA==
X-Gm-Message-State: AOAM530dR3Q2Ck2XKM54MY4zTxLzYhxXSfO2tjxrbHPbQRfEhi+bE6hX
 MO0gKptQ1V1KpBDLUpnrYxmUZ+Xb6tkIiTKBp9NhWa0ZTi0=
X-Google-Smtp-Source: ABdhPJycw+o3uU9KpnoTeVPRoaPFScFapkDA2OF6LZ0czKoFp9LTyx+cUrmNV6RF81m98+tuJW/mzjp60JaS6IdKxmk=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr4084984ejc.382.1621509015255; 
 Thu, 20 May 2021 04:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210518090720.21915-1-alex.bennee@linaro.org>
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 12:09:56 +0100
Message-ID: <CAFEAcA9eM_joGz1ybAwSSQmXrvMKRfWPUq6hqHy940sXvRdT1A@mail.gmail.com>
Subject: Re: [PULL v2 00/29] testing and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 18 May 2021 at 10:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 367196caa07ac31443bc360145cc10fbef4fdf=
92:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.1-pull-request' into staging (2021-05-17 16:44:47 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-update=
s-180521-2
>
> for you to fetch changes up to b1aa4de12e846e0ad18969ee823c19b66d8d4d8f:
>
>   configure: use cc, not host_cc to set cross_cc for build arch (2021-05-=
18 09:36:21 +0100)
>
> ----------------------------------------------------------------
> testing and plugin updates:
>
>   - various fixes for binfmt_misc docker images
>   - add hexagon check-tcg support docker image
>   - add tricore check-tcg support
>   - refactor ppc docker images
>   - add missing ppc64le tests
>   - don't use host_cc for test fallback
>   - check-tcg configure.sh tweaks for cross compile/clang
>   - fix some memory leaks in plugins
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

