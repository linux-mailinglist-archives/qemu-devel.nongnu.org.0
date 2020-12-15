Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F22DAC9C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:05:27 +0100 (CET)
Received: from localhost ([::1]:39482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp954-0007DX-Ef
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp93f-0006aN-4u
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:03:59 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp93d-00068U-5i
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:03:58 -0500
Received: by mail-ej1-x62d.google.com with SMTP id 6so12683915ejz.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 04:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01cXpZdWDwdTL+YKu3xh8zJlKwB9s64ctlCEMuj2Yqg=;
 b=hmambKAZVwxJ122hfqjuMadKI/odgK03SBV6pJIuf4KRl6Bx7WFPDWCQ8wvh7hywiH
 wp4i1mUh40/S9LYupYuzRBGjBQCiarqNn9pmXDGeYiT1gp0BZ/XjDgX1Lhf7Q+VXadww
 ZTIZ/TlryFQ8MAogNoUsxr8QuFt9afW/yrrLe08QcXDFOA19wlJwYqoJz0OD6xrGHMZ1
 /jhACKuk13igFMjkaqBDxuoO2h9cRqCuqRwVhwxyTiB9SRmA+bIuQK7DpB09J1GVhFRI
 qiEBbT7NDFclJZ+nBOrZIatIeE1k+2mXp2kUf9Kgg+GxJwMrLXdJEjCtLoxvHiBPRDvE
 OgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01cXpZdWDwdTL+YKu3xh8zJlKwB9s64ctlCEMuj2Yqg=;
 b=o0zlaJyIEnNaatmZbd4E1v1lFDAp+426JJa/Oi5jgwR6eQ0xvtU2k+ezbRwcHrTWf+
 YPkjV9enBStSfOvNBWToDJO4Q3NdbUru1X7P9SWqks5Wg89c3H4+ZxzxdkErMeciPDPK
 r1ahtL6nioLMCy8j9TA7X9p10mPBTJB7cXYsqoDfH38v17loKSj5x8ADaDvpxRR/mRFK
 ZnpiTHhoUYsqWDlmuErkGCPT1byXnauqjdptlyb4jyYfVajcsPJXiWiWlH+CIqd32X/V
 whpMHElZnmBD5NpKtPAJPGs9bAaLvjKXBgcjT7iOHMw5Lanbn5rs/zWquk2k7ILMzgSX
 etIQ==
X-Gm-Message-State: AOAM530ilxh/rDzqH6j3RCW36N6FthA+qNFKlI1x38lp0QE5PM7ceeCp
 aUhIE0S1QUE9BbFlD9A48HT4OsqhBRxQehGXH4DiYQ==
X-Google-Smtp-Source: ABdhPJyt7v4lS7g3av+2ZZORZmUmepAvJbYia+ylQmxhTejzRkdBLUMsCD9nyu37G0vzrmtAPHUBk/3qILm+PxF1p28=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr26592761ejc.85.1608033835424; 
 Tue, 15 Dec 2020 04:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20201214155733.207430-1-laurent@vivier.eu>
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 12:03:44 +0000
Message-ID: <CAFEAcA9ji4Hn1nOOAOgomRK6YvJd3G87bbWsgkaV4ihBxy0PAA@mail.gmail.com>
Subject: Re: [PULL 00/19] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 16:06, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 17584289af1aaa72c932e7e47c25d583b329dc45:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request=
> ' into staging (2020-12-12 18:33:46 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 48f670ecfcbe92f63475c516aefb6e217f469bbf:
>
>   configure / meson: Move check for linux/btrfs.h to meson.build (2020-12-13 =
> 23:56:16 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial-patches 20201214
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

