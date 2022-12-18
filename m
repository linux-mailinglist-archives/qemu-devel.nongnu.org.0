Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6864FF0A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:53:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6u5r-0001Kh-Ke; Sun, 18 Dec 2022 08:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6u5m-0001KQ-O0
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:52:38 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6u5k-0000Zi-R8
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:52:38 -0500
Received: by mail-pl1-x631.google.com with SMTP id t2so6687369ply.2
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4MsHmndbxJWiAykDDII/4KXe8xjIqSsp8oAJXZv4WYk=;
 b=FeF3ASyzQD24thJ5nLmHh2HAxMXVQbkXMB7qllP4sCNNt6YKUMoGDotsdY+LBny5rD
 dqveWELLoHCWnFdQzAEKWqld1pDjv52pgq2TPjQ7H4SMMRQXnGaki0Gn8ZszykTI6FND
 U9ppuyZhO7qnnSW6dB/X4n9HxbtXIpn2mSMSEukuN33pLqGtqf3E6RgdZihHvza8/QA4
 np+ZNXEEtNJ6RT30dVmsfXJ7mp0AwSA580fXtdS+kkrMwf4zSF9e+HZWbdbc24Ww9S02
 623h5KBT9dglkcgj+hWF0cCnVNFKgGyLXsO8w6yN/57GdIIROdArtmV79XAxuQevTvCg
 VxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MsHmndbxJWiAykDDII/4KXe8xjIqSsp8oAJXZv4WYk=;
 b=wDXcCCLaLn6CTQ4b6u02DCw5N/F6eKZCJC/RrLsOofV/RttOhhT1xmpLh1eKFuC4jG
 JEVkOIRDblvYYnchZxQiaJTQJyAR7to2Bg/In266zEBj2A2NSZvq3JFg8QVK09Wpf/2q
 C+NQQQmOM3Kf1rHZzBlcbEuGQJY1D4DJrIbRycC6Pul4oeyrjSNHmPETPMg8NMPsIg4Q
 BJAdWMgVv55iwEvQRbGwegdMJWqbVmLAvRt2NThimrLkEOt+bm589eZatY6wDGiUgqdQ
 neAHAQHSsfznnk5LgdEff8qfpOd7xM5Ti3K0kY77wPSDDm+6denEFQfYnqD9vbjY7vZC
 zy9Q==
X-Gm-Message-State: AFqh2kq6Bch3PKknNaMFdco3xQA2mpHdu/VvNjIksMf4GafIcsisCYOh
 c0tB3hOouJHCTy46HNZbWEmefRYmZiHLNzPfo1MUfw==
X-Google-Smtp-Source: AMrXdXvB+BJJ0VMTmsK/ssLgvLDbe0oj1fEWArM/VqhHfPk1gFS1XJumiuFwu+oUKjKmK6BBUiclF4tXySCCADKb8Hs=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr1210709pjb.221.1671371554913; Sun, 18
 Dec 2022 05:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20221216204845.19290-1-tsimpson@quicinc.com>
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Dec 2022 13:52:23 +0000
Message-ID: <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>
>   Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20221216-1
>
> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
>
>   target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)


Failed to build, s390x:

https://gitlab.com/qemu-project/qemu/-/jobs/3492490152

Program scripts/decodetree.py found: YES (/usr/bin/python3
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/scripts/decodetree.py)
Program flex found: NO
../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found
or not executable

Can you get the CI requirements sorted out first, and then
let me know when I can try re-merging this, please?

thanks
-- PMM

