Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1F307408
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:47:48 +0100 (CET)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54q3-0002yN-5h
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54oq-0002XH-Qt
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:46:33 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54op-0003jk-8N
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:46:32 -0500
Received: by mail-ej1-x629.google.com with SMTP id rv9so6979893ejb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SK+pSlSMuV9WmZMev/30oNDK1ltfozrNGh5+VvlINB4=;
 b=bQvE5LaDOH+PPuVwUzcS4N6J/Vh3NwUZzqEitr5D+5q2ep+Iz42lxLfhFSxOintxLP
 lWXITb2TV/Jgda34PB/C10s8Vn2X+KHn6gDN0BvqIyTHgrawWsrmSlSehSnTRcr+oQc+
 TuvcRDfKdV20Ri0MSdn6ANRL4r5Q1hK7MARFGHiv3o+Tkt/6WRgAXM/ylBIz7RB0IdhY
 4zdSpYhs5cD/TI0Ohy70vP6YoOp2ra6t+hoWfJBikDQTvEwAqADg9vdjvdKSJyOhKlzH
 KS8cjfWS6FwtEP8YDkrE2VsjxigoJinvL9I+gkvNickTOh6h1cM3pOg5W5v2Hf48ve8i
 mUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SK+pSlSMuV9WmZMev/30oNDK1ltfozrNGh5+VvlINB4=;
 b=jO+ukPZF8uxV4Ov2zVcMgHLGZfEfSSuwTRWbgCSVNfSnZwnrnPLdpYrn0T+GAiH/qG
 OHGuuoFAoppXAivOgvN4NT9zP3b7Nsb03oMqFXkbrXtTCNV0s4NQY3EuiKzHt51xka2w
 dvVxOzzvQCv7FaK4wTheLO4LQyvh7ToOtnq0EUDyNCFOnqDJSv2eosZzdNibx+qO+coG
 J4UPw01dmgsoB1JdJAU2vrRFSpfVi5BgmVfMkrPfXlCOVXtwXSxZAf7/ZpjQyLbqL/g5
 UXFXQNO0Hfn+n6XmMHgAV2GzHkHVcBVmdGa8EiGJL6YsaPtXiT1l5B+rSGZjy/8UsvyA
 j3CQ==
X-Gm-Message-State: AOAM531lvNTZu2rijaZV62y52O4zlu48mDOZuKS9DCv71qIXzuBgIzxk
 6+U3uEngimDqzUe9LWvp/cuYe+IBA7ToDmQtVrPBIA==
X-Google-Smtp-Source: ABdhPJzDoUbHxdhDQwei2Mz4oaO+PxDuMb+DZZdcLxtc90sNmziLNbNKzpuPT5zrgfFJfWviCH80PCpCEO+XZ5iDj8A=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr10588373ejc.482.1611830789848; 
 Thu, 28 Jan 2021 02:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20210127095444.114495-1-thuth@redhat.com>
In-Reply-To: <20210127095444.114495-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 10:46:18 +0000
Message-ID: <CAFEAcA-MVVfFbwb4j1-E6YOZEF-qZe3nzqYCb5H0e_qwb+39nQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Gitlab-CI and testing improvements
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 09:54, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-27
>
> for you to fetch changes up to f8a9b4c66569cbc1640722369a91c635102b5264:
>
>   libqtest: Rework qtest_rsp() (2021-01-27 07:18:13 +0100)
>
> ----------------------------------------------------------------
> * Patches to speed up and improve the gitlab-CI
> * Documentation for the decorators in the "acceptance" tests
> * One small rework of a libqtest function
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

