Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D155338B78
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:29:38 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfz7-00063j-7d
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKfxK-0004mf-2y
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:27:46 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKfxH-0006SG-D7
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:27:45 -0500
Received: by mail-ed1-x532.google.com with SMTP id o19so7459692edc.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
 b=ao4CmjR4yN4zkSdHs6Aoe9x5LE4uGnfRpvkjmWgeA9S0yplhIWfeGavx4WlHlbKEpH
 lst5QE1kYtmjJpjQ95aRUusLGgclreQdGoLhERp4IPPTeYjPFRcuaJS+H6UYRRrtamnV
 JCEZgN55/BFDlKhgykEUnLjyuqkOvMQdKuSFK0g6V4V1ViV9OZ6aNSLa16yUvaBzmfXW
 7rvSXcYfJzXMSicnoMSlN7EFcIWEmFt0zpjKZmKEgkOwtrCkaD4EJZZIXbNh5RNwJ2K8
 5NrwYGM5Ol0aEvpUusWD+rX9AAqcj/T3dOnMVzWHstbcVwmJJK3quM6cSNtr9ub+5Tlo
 yO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b889pTV0jwB3xmSqwSho9uUp1GcV/P1V0b24gNrbczA=;
 b=W+pr+H+7YMkjUaiEQnCavef4V80tVWoghqSHM9pU+0kQTh+m41VBQ08pUA3jipkpSa
 8uqjEYsjHXQAD26tU68HUTvKAlEA/0N01igdm2kTktnANVciH6ZWSR5gAWafSBKlaXD7
 QFpsaoQvGpmrWnRpaRva6CQU5Pw1JenQvtI62VcDSArBQvuaLAH3qIIWKdMKMlVmpYpm
 dDCCS8tzhACJkW6Y6CRt57jhXTxyCVIPSNbeDyH1QW/ynlad8bA5JhX+T/DLcXWXdRtA
 xjbiCN4uGil1bIUsa8+6fxvjL6DXJ0c+OMyujJQromA0z6DsaaAC/n081tJLvpDU4ACD
 qX8Q==
X-Gm-Message-State: AOAM530LxTVkoQ4NvvoJjyAoJP9GzCmXhGFuMlqHpVAC2/5elHyWeIiN
 152YEMqFo4P8cdpgQuDKI8b4+E2P4mfAejOytYxGXA==
X-Google-Smtp-Source: ABdhPJzA8LLc96WBjtzYeaBVDWI+AIBFv1JxEmIdYQ+EVRGciJYS+W02eA3AzQ8fbZmyEroL9eLQwOrJF7gDHUP/F/Y=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr13333147edt.251.1615548462041; 
 Fri, 12 Mar 2021 03:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
 <87a6r8ehsi.fsf@linaro.org>
In-Reply-To: <87a6r8ehsi.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 11:27:23 +0000
Message-ID: <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 11:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 12 Mar 2021 at 10:31, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.=
org> wro=3D
> > te:
> >>
> >> Query the SYS_HEAPINFO semicall and do some basic verification of the
> >> information via libc calls.
> >
> > Are we both testing system emulation and linux-user, or just one of the=
 two=3D
> > ?
>
> Currently just linux-user. There is no inherent reason we couldn't add a
> system emulation test but I felt that was already reasonably exercised
> by your semihosting tests.

Do we run those automatically anywhere ? I agree that probably the
best thing is to get those into the CI loop somehow (and then put
a SYS_HEAPINFO test there.)

-- PMM

