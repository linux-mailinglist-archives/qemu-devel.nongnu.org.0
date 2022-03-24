Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FA4E671A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 17:35:29 +0100 (CET)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXQQp-0005SL-Hm
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 12:35:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXQNs-0004LR-TL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:32:24 -0400
Received: from [2607:f8b0:4864:20::b29] (port=45004
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXQNr-0006tb-6P
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 12:32:24 -0400
Received: by mail-yb1-xb29.google.com with SMTP id y142so9363895ybe.11
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=evTEJu+LmVaXp2k6SBkBBLze7MCQsoSQNgUe/zp10nk=;
 b=TcpOIjuvMtZsRIWOuhDMuXbx70LCx6vpw1fpCFWZXWDTEDUw3/FbAcD6cBh7tU4IDx
 qcqiEZNR3RjVF8+PlL3X6k4Ez5kxojmL42r5HvAx9RYY21Y7Zs2P4UA2ngApB6AutntZ
 oEC1AVUp4F2x2MN7ukcf/7gZD8Vhqqt4jjQXJNDGZLHGSor36Xuk/14DVWhg6fjQ+Frd
 OUYzfSTIVW/XkBCkQrEU9MXMJYqyonZk2dXhZnCsnUZFXQP8nZJLxlG6Cgc9gHwUflCO
 6vpvwtzEj925Tq2YKbpUUn6kPrxX9H2W/KGL+DnHNXiQteoWQrwlJSo1Wn9h2/c/dTaq
 IylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evTEJu+LmVaXp2k6SBkBBLze7MCQsoSQNgUe/zp10nk=;
 b=ytv6kd7KbV+/2g77+g6GPhRdVepfv8r1m7QVkATs3TiyfEWQ8anQGteo2+wZp5oTuY
 Ld/bs6nU2HiS1lA+lltS1B664NwaROPSLfXvBFoX0Y4zDia7XPkXXvNvP2gWXRGeZdGN
 AG+4ou5qv9//3OHKwEY80KP+JmZXrjLNrdYW0ieKZmsYvB9/e7rGU0njav/ME+w6JZJ6
 mKEAYphGzaC5pfP1enaYPxHg31PNRFmyqzKKJQ8i0todXdXauchiBX325tRMtPm2N2uw
 FY04mN/OhPw9QtsLtkeA2nIWcwbSuwcq9g4tBdvOG1j15ZcKvv09ydTrW4sxUVXnqGVd
 z7jQ==
X-Gm-Message-State: AOAM533TSk9tLF+1HNnyGRz7rH2sTCXkXZ6WZ/kgh10jcCRsXHuCJZ1D
 8dP8Cs4Jy1JO9uxqAkEKsSZ99TCUmp42vmtyJ0Bt4t4FzFp7Ug==
X-Google-Smtp-Source: ABdhPJwiOXV7aFrI9ahqm7kH6lL7Y76wbaV2i07DF4uhMMmd8qtr4snRsWCG5HjSWEN4X8OpLiFf/7THE/jGaFKs5hw=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr4630744ybc.39.1648139541890; Thu, 24
 Mar 2022 09:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220323112711.440376-1-alex.bennee@linaro.org>
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 16:32:08 +0000
Message-ID: <CAFEAcA9FTU7cPDoZctk4USLsS_aF8jJmxcbAz-iFzJ5Qdh_6jQ@mail.gmail.com>
Subject: Re: [PULL for 7.0 0/8] i386, docs, gitlab fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb3=
0b:
>
>   Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.0-230322-1
>
> for you to fetch changes up to 0f37cf2f71f764c5649e149c774172df7ab187c7:
>
>   docs/tcg-plugins: document QEMU_PLUGIN behaviour (2022-03-23 10:38:09 +=
0000)
>
> ----------------------------------------------------------------
> Various fixes for 7.0
>
>   - make clean also cleans tcg tests
>   - fix rounding error in i386 fildl[l]
>   - more clean-ups to gitdm/mailmap metadata
>   - apply some organisation to docs/devel
>   - clean-up semihosting argv handling
>   - add custom runner for aarch32
>   - remove old qemu_logo.pdf
>   - document QEMU_PLUGIN env var
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

