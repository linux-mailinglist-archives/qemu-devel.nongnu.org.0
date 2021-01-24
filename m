Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0A301DC4
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 18:03:15 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3inC-00020K-7r
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 12:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3ikP-0007nE-42
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 12:00:22 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3ikN-0002m6-BL
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 12:00:20 -0500
Received: by mail-ej1-x634.google.com with SMTP id ke15so14578585ejc.12
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 09:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WVy420wCTLPtxKlainlh4vkkjeABe2fc5Ro8rxtxDqM=;
 b=NmyvaVkgNj9kSfM9BcAVPhCSlyABGXs8Z2FFa/5aKzxI0+sxCSCfgy2qhhRCYyx7Kk
 mT6QQrfi9CYc1cGDvVS204O8r7B7SnIyKn6LEavduckWB6U7Pk7WfFyQw3Ui4SLd3wtX
 4JBPQPhuzcO6VbNg/LmPTVYidMUe8TxvZPUlBmEU06I+9geVHt+ajS7e/7VDISV95Tgh
 jbHabsU28DKVcRwc5iZ1+I11eciJ4elECrLARumJvX9XwNffO7w7QqR5vjJ2KfQ9abSb
 nqqKpAKYwZ7xYWZuKBmXvc+oF30WOvpQBrHtCrIkDQzTGMh2L4hV9Ym585SD2v4FO68j
 +SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WVy420wCTLPtxKlainlh4vkkjeABe2fc5Ro8rxtxDqM=;
 b=pgVenr0N6pJzan27/rzWsNbpn9vp66JYXFeDzTrgywU/+1c42ak2xlXeteD3/LDlTH
 i9S80ZSi9jIv6Bx3LUWLvZwEnmvZOrwvoJIThCbRSwvsGzkvVk/hot8Is9bds0F3cZRa
 grCYQ3o9aWonkhhv1wRjjZhVQ+L6PVz8YIZ+NLO7JPs85VXmDRSmQQVSEdwXLFpT5pU8
 OniBt1T5jmzvB+Qoyc4giw+S6IJOFqTNGJ7mIyLesG8OZujWIjfTiSbPjm1xdlxHC4uW
 GzoBVwCqnMVBRYMoyMP6oMbLPGxtahnWjvnqOPihH2SVDIs5bp1MrIu4YVpaeyGcJPUd
 OmMQ==
X-Gm-Message-State: AOAM533r8YRmRFamhJvg2GOkiVi/Omacl1uevyJi61w/e8Yyk8m/8qQz
 GupXK7Fpg2uYjX5CfxuXi/gnu+U2JJZPpuIYOXc0HEBAS30=
X-Google-Smtp-Source: ABdhPJyesW2tlqDgIgTomjGhgZ78Tegn6saVdF4ne64sehFBAy8CSA+lqvLVppabjoivUjnhA0xVNiI92+BY0zu2lSo=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr67020ejz.407.1611507617836; 
 Sun, 24 Jan 2021 09:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20210123205747.1175854-1-pbonzini@redhat.com>
In-Reply-To: <20210123205747.1175854-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 24 Jan 2021 17:00:06 +0000
Message-ID: <CAFEAcA-1-qQBMsnLWyPktASWZBZshT-19R1NApUMyNYhfv-t-w@mail.gmail.com>
Subject: Re: [PULL v2 00/30] Misc patches for 2021-01-21
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Sat, 23 Jan 2021 at 21:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit fef80ea073c4862bc9eaddb6ddb0ed970b8ad7=
c4:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' i=
nto staging (2021-01-21 10:44:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to ccd3b3b8112b670fdccf8a392b8419b173ffccb4:
>
>   qemu-option: warn for short-form boolean options (2021-01-23 15:55:08 -=
0500)
>
> ----------------------------------------------------------------
> * Make MinGW respect --bindir (Joshua)
> * Switch MinGW to a "deep" installation (Joshua + NSIS fixes by myself)
> * Fix compilation errors/warnings (Qixin, Philippe)
> * QemuOpts cleanups (myself)
> * Consistency improvements for -action (myself)
> * remove deprecated "change vnc TARGET" functionality (myself)
> * meson cleanups (Marc-Andr=C3=A9, Philippe, myself)
> * IDE out-of-bounds access (Prasad)
> * LA57 fix for -cpu max (Weijiang)




Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

