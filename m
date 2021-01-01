Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEB2E8570
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 20:58:33 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvQZD-00074k-VS
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 14:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvQYH-0006YF-AT
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 14:57:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvQYD-0008IM-6Z
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 14:57:33 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so28804267ejz.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLdT/2RQ29OY0EsVQBKZv9n45rTZTGW2iI2siFUqGws=;
 b=DTR5cRoVF2Xhno1QZ/Q7yFPT/tyLitxYlh+Nh77ZTuq7+kwdHDEFFhaMG5Awx2zf+A
 lqSl5CcnXj7kzFqQiKuYrz/YbmoXXgW/3ieOgo8DMLLK8KCdWIPVjehkR/b0Hz2XbmUi
 9qFqByVmWN9XiBYrjPAwXylMW9UoJd75IR9DiKX96lfpqqPt2LNiDmCIzx34A/abyKPj
 ujZQF1eQ5qP+QzO5BudSwo4MDJPhI8aW3qdBHO/YTFMByrOwmfbOQteNkcV3gbj5LAE5
 J/5uhNb78Tf91BrBwqlQ7Ebo422E68fmoaiTzi5x1zajC/qkG9noBdj0vfm22d/TtFAk
 UTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLdT/2RQ29OY0EsVQBKZv9n45rTZTGW2iI2siFUqGws=;
 b=OvdkwsKt0mmAJYOQ9zuzAK5lbvIb37fy1O46c3/YxFqWrkzS/4wrAG4UkfQXJthXy3
 5cywsmXAQnauuJtLaBT5LaNsWuX0WYYzKkNa8ynIdDG3hD6NtjP1Uve+7eS68NPZXNUf
 tPy4buKogfxVCna3Etq2QpXtZMswpSITND3nTgJ3AtAkc05A7LENTcptIeK342O7/dcf
 5Cn2KHoZrRKRG/5PKEKSqWmE1/oG38JU4FFBKDrWW1mInrf3t8pOBsYWyrgK9L4EFg3C
 AE0ZebIVccCk2pyxHYmQxQ/oDX+lVEAh3BhF2MRcip8Vz41jzkpZ0baXs5wNqjP14WcX
 +B0A==
X-Gm-Message-State: AOAM532SiCSHoinRYXtlHUL5nKRUJkNoDfH7EAj2yd1iaxopjPdWdKEz
 tBdlwRfAaWA+y6bv0P5xxElmQ8omwiOiNrGzOjrm1w==
X-Google-Smtp-Source: ABdhPJx8vVulKFrRLmaz7jswl8Qt30f1e3Xsc8qGq6/nB7iCK9QXPO2bMqYAeMHe0bxzebCfL7zrjBIhSUmTc0Zk8/M=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr56526207ejb.382.1609531046903; 
 Fri, 01 Jan 2021 11:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20201222104503.224510-1-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 19:57:15 +0000
Message-ID: <CAFEAcA8+KAZ+Dzh_7EW1G__G-mfkeAsEbN+F7i6NQ4EwX34i2Q@mail.gmail.com>
Subject: Re: [PULL 00/14] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Dec 2020 at 10:45, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20201222
>
> for you to fetch changes up to 24bfaae13958b823a4f33b70fca52f086851641f:
>
>   tests/acceptance: Add a test with the Fedora 31 kernel and initrd (2020-12-22 09:23:09 +0100)
>
> ----------------------------------------------------------------
> Further s390x updates:
> - enhance the s390 devices acceptance test
> - tcg: improve carry computation
> - qga: send the ccw address with the fsinfo data
> - fixes for protected virtualisation and zpci
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

