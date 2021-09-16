Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE440EB6F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 22:11:08 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQxis-0002xA-MF
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 16:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQxhA-00025B-Bb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 16:09:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQxh8-0002yY-3I
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 16:09:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so4391660wri.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ppSC+/+Jpx8UR/QL3oTEu0FnuI55Fdz4BkNPfXRhnjk=;
 b=wZ8lh2gQ+b5shgJAyzS4/dzCFt0fcD6J60kh8qafm9neLry7rW/UzfqM1GROhE53G9
 uVgYTSfPjr1TfOvil4RB6z477BkOdtwngzWL8opR60ckESzo09Apc6UlyMFtmt3WRuNL
 LkVz3NuEMm4FEjYfmfAn6dMwOX+e7dJSYwbhi6jxfNcGB2OJPVWx1DTj3UBcBzPRtx8N
 YCOa7XHiXa5TtTP8HW67DoD6Le9NXLa6bb1KOIKVGqRJRkTSs+CKyX0Lfl5U65CMIpDg
 HZ91zBaqi+52roJuUYcfWXD6BIzv2avDjfYMX9jJxmULv5XfV14U5f+HjP8J03cL6z5o
 3GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ppSC+/+Jpx8UR/QL3oTEu0FnuI55Fdz4BkNPfXRhnjk=;
 b=iWQvz+xgIWtJB927j4AFvdIxbeT3H0GmiCtmzzPdLPCKZOJVbuEyEQFyG0exrklqgR
 mjTVe1+ua4PUVh1SuI33QN5LPv7cazAVQKCBFbCcHGHKoQIa38q9u0xMWngxYthTBs8M
 +MiaQ61j91z1WF3xc2eg1EaGclwZMx+HNZ9zZhfNJM3Xk5hAT9D8GWWMEYMazZw/gt6v
 kpvKtmyH56kwaursCMmXuAjRlFI++2oUA7EklEMznDxJTFKhBcGx9qR6qFN8VFhpJVDi
 Vd/9gAjwacKoEUQQtkp5IvFfQ/1BgcBmeVEHMEc+9dhUT8UEFyQDMCm0gyI2kaim+vhv
 dHqw==
X-Gm-Message-State: AOAM531SgJkiTiylk3MvVairhkMfvGl5bBg+dRy9mcKN9W3CBeYNhCsN
 pzZBDzl1uIre3CHkNasy9DgYUGmz6IgA1IdnwmiTEw==
X-Google-Smtp-Source: ABdhPJxgr/xpIjeD5ZZrGULm3j8i3pgHyQZmod3emZRE//ZQvHJOahNby2XKP6EqPBVYRwQojZs5HevnXUmFEeXUd4I=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr7923921wrr.376.1631822956195; 
 Thu, 16 Sep 2021 13:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210916141026.1174822-1-laurent@vivier.eu>
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 21:08:25 +0100
Message-ID: <CAFEAcA9Q-_T+wMyi+EmfjdnFMhdN70vcCy4_tG0s4h1eDZb=QA@mail.gmail.com>
Subject: Re: [PULL 00/10] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

On Thu, 16 Sept 2021 at 15:19, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
>
> for you to fetch changes up to 9ac200acce8c27ef44da31246f337a2454e54e0d:
>
>   target/sparc: Make sparc_cpu_dump_state() static (2021-09-16 14:52:46 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210916
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

