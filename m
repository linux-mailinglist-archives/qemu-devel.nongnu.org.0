Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAF31C2B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:59:16 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBk1b-0006FX-BP
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBk0G-0005L3-EL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:57:53 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBk0E-0002ol-CB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:57:51 -0500
Received: by mail-ej1-x62a.google.com with SMTP id n13so6580237ejx.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M/uPZvtbeZmEFhZjMouvEXxHFrMltEhursBsWihn+9o=;
 b=Y/AhaawwkW5HNA7wlQ7heNB9oMC5cOyfNKR+wnjtmg0jBkn1/VSPZVCmE7URnzG/gk
 m9/SyFyW20SwnqfaXder0Na8yNiLFu6g8GWdpKgHj3CIL0B2gzq5uom3dg1QHez0a5kR
 N5bvYbqk3VQC7kvi35OO17Wl/6J5qAVlR7wt+jjnNeHFxqu8HD3MJcUAsB5SREder9Ox
 Add+p+TW0aTfJFVR97HxjxVCiPHJbjpc3aL0YYl6FCf1Rm+prreMV+cYw8vTGgjWpGor
 ZHpSdjyEy9wTMmIZntiFltrYHnOkxAKgNEAA7EY+DEt+f7mU6tQqWDv16/ynzUVs5wDY
 uf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/uPZvtbeZmEFhZjMouvEXxHFrMltEhursBsWihn+9o=;
 b=K6Nsy0uXewPttYhIL8amUQnR8qFI/GkAiZbTgt7GWfRvHyLgkpDdnZmeXnDJ4hi+VY
 uej+mSZrw8kboVR0TMJbz9VpARDuUJH/OiJKXuXpr9376fsa88gyjzQf5qlpz366irjE
 eMBNgZTYuAU4gZLMqmEtNfTPQjlbQxiDdDE+/O8TiNrXP1j1L7Hb2yXE3XvcnRuuhJU/
 0eNLGNEP5GuS04zPpPjOOAhSriTvBwGuPbOt3RgKhracMITXjLIsEOgH5ISvxNcYMpz0
 swYliNdSWrDa3VF0ppKMgc/OIFjQYIr3N9vqSOK9wpTZnsguTy8hAM39h12YBw+dpRIK
 WGCA==
X-Gm-Message-State: AOAM531xjm9o6h9nz6loNDOCvhsXAFLJmr67Mez9XbL/WLxYhhlBDp1d
 N7/iYCIcPssWGbPxBn+jgRXBc4a5mi8FIrpewqSy4Q==
X-Google-Smtp-Source: ABdhPJwNbI7Crz2aaLanXTivZYSn1Ll8j93i7OizqN1pZAYvEiyN8YqoEyeJDJPkbo7CR28RYrMwHxaqE/UObpC9hPY=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr16824093ejg.382.1613419067903; 
 Mon, 15 Feb 2021 11:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20210215150100.436555-1-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 19:57:36 +0000
Message-ID: <CAFEAcA9H=ecpgHNZW3n_wAH07jh-Ns9HUu34__Mvb+n3cSvSmg@mail.gmail.com>
Subject: Re: [PULL 00/11] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 at 15:01, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 0280396a33c7210c4df5306afeab63411a41535a:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-gdbstub-150221-1' into staging (2021-02-15 10:13:13 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to b248e61652e20c3353af4b0ccb90f17d76f4db21:
>
>   monitor/qmp: Stop processing requests when shutdown is requested (2021-02-15 15:10:14 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - qemu-storage-daemon: Enable object-add
> - blockjob: Fix crash with IOthread when block commit after snapshot
> - monitor: Shutdown fixes
> - xen-block: fix reporting of discard feature
> - qcow2: Remove half-initialised image file after failed image creation
> - ahci: Fix DMA direction
> - iotests fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

