Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82572686B64
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:19:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFoW-0006D0-Nw; Wed, 01 Feb 2023 11:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNFoU-0006Cb-PO
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:18:22 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNFoT-00018Q-9U
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:18:22 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a184so12961010pfa.9
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nk3dO3pBA+S0xxhZSBnwh/Qb1HBX8KbzYWOtII1jtxQ=;
 b=OckReSyXYimfyzktcpWGfcOwziIelXWum+GRFigvDOCUqZyEYlZiZCb5tHvZA5MkfM
 tOOgnMJUxuJPtTUH4mslFvDBuopcXnHVc23JBbhoyos5Eyy4TOZn/DghO1zUa5sjqnfQ
 uqgOGPY48Ad1lDbskR+qm1R5OgzRQOQ/5G9UKOhIEyyyCgrO6w6Pg+x+EFDrXN4KXqa/
 Av8AecTxBcqHhCAPLwA4EZG+T6mjD25BX+bcq80SemCIqVQaKRgZDRIGVy/FLpb/HapZ
 8hn1XjNNBaaRjzlx4JFJC2tA005BBIJ6Kdf7TraCWt8T6l6jltXTg81wytIVEwy2pBaM
 g2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nk3dO3pBA+S0xxhZSBnwh/Qb1HBX8KbzYWOtII1jtxQ=;
 b=ODPMngqRD4wr5f5OFxmXPHNlek5YVfnmUxW1ZPbBigUb6GzH8BZLgx+fhoQ5+jawst
 VpG4jO6BcnDe4Nl8XM5Ur4esjxjpqL89ff5QNWtuABU7vvO2JJDryiuojWtC+Dn+ZOA2
 k98oN3zbyPIAaZ4h+gXfFP7Mx1EeQsVhNwKcr3fqWDo7kcML5N0VlY2jJr+ZGpa6o4D0
 Li9AnaU0V4p9L+hDpzD8bjHaRCuFo2lXPGpilWaEH6I1iN3raNdhPgTZm5N8JUZLTSju
 +2vskKsXm+EjYQReo7KPNCTKdwko+kTlVK1LCvSq1Fzwd6EyGLPE4AqH/dR31DwFTLg6
 G2Pw==
X-Gm-Message-State: AO0yUKX1NCi4j3f33zmXSjWVmodSYDIcDd2dfPzqn5PJ6Ss7PYzJAHgu
 IUUkpgJQvcLm65SH9oiW9ffR+BRTfj/Jc9WWbBDbmQ==
X-Google-Smtp-Source: AK7set/B2tPYOnP4cpMf6XbUmIMLXuyOBtuTGYgHQkptf6MbQjdOA8jU+yX51W7aNzIqIG4DwuHMaM2g0WpgNX9uawM=
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr476495pgm.37.1675268299735; Wed, 01 Feb
 2023 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
 <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
 <Y9PF7C29TNSuvz9o@redhat.com>
In-Reply-To: <Y9PF7C29TNSuvz9o@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Feb 2023 16:18:07 +0000
Message-ID: <CAFEAcA_21n3Yuiy2-ArDB2qnXyKQfsoM6iiQNEE0mN29_SsxKw@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 27 Jan 2023 at 12:39, Kevin Wolf <kwolf@redhat.com> wrote:
> If it worked well enough for Stefan, I think it would be worth trying to
> batch some pull requests going forward. What is the downside of it? If
> CI fails and flaky tests seem to be at fault, I assume you just re-run
> the job, no matter whether it tests a single pull request or two or
> three of them?

In defence of "don't roll up multiple pullreqs", both the
pullreqs I have tried to merge so far today have had different
kinds of CI failure, so doing them in combination either
with each other or with other pullreqs would have been
counter-productive...

thanks
-- PMM

