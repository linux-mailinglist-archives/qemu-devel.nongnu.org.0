Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197612AC5D3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 21:17:45 +0100 (CET)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcDbj-0005St-Lh
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 15:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcDZR-0004ge-2b
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 15:15:21 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcDZN-0005Mm-4N
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 15:15:20 -0500
Received: by mail-ed1-x531.google.com with SMTP id k9so10159046edo.5
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZrZchvQHWsy3zCGue/JfH0otVhxgj+rnFH1q0xvcQY=;
 b=Icfdz5e1YUOfktb0t/U+HBbmCO2mVS9qIOb2scbQI4PBX67fBs8930ZAk9bbMyAyo8
 LT5JvSaoIJC3P3/S1ywr68Ct7GemQ/EJCcwIXHb7QJO13iqjRuOdRpcaU63RN/ffA6Th
 LBRFpLLYP3nlQY1BMs0pJM87rkBPVmcuEFfHcq4/HbZzTLKCbjWT1ORb5NMXMJHuAOSh
 k18s+D2zsDjguH/lXthjCiLkGz+zk/xUOdSrGJ0VlpW2AXhdIYFN4hYQRW5LYG747L/8
 tR0KKcviuwvAE5iShaVcCnSLycos2OTP3FUecGbZf0DMz2Iepir1OPEGbBdWkqeXtil/
 KC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZrZchvQHWsy3zCGue/JfH0otVhxgj+rnFH1q0xvcQY=;
 b=E/9T4lvKb6P+b5RMSBmiNphnGPQKUHrsnNVszHm0hwKYYBx5juy3xcwWDiFI/phq3j
 yAyRbNhEbE8r4iSTjHVXBYpHnknRhfzu6QIS5fuX6wGoMVh+VguQoo/QeD6vGzuJMTh/
 WafrO4p+ZwxD2ViiwFZ0hLpZIejkudR89DpIenpDxtqJGPye4Sujh5cezw9BRSO1JqBt
 XIVsWjaahbgKJBplxxuWt1Vq84pcbeRqFhcLQScV3wd6obHiHiwhpc+xNP0oX2d4jp4m
 nduh+PInsoqxing8VXsxOsH+ft5XSCUnDUpRR9BzZtEl9x3Qg06A1bCQCqKv2dLCtci9
 zAOg==
X-Gm-Message-State: AOAM533jeWq7oT5M1QrM1S8hQbaiPnS1jCtKO1FcPP1oTuhEuHkSHxHa
 k1+5uHksl5O3oLb1hnoM2spNXImYEIbluSedHnV4Og==
X-Google-Smtp-Source: ABdhPJzaiduUByQDmE+QvLIzrndtUaerjfj9+2pHWeF1eC3/AS6Z1acwQOy09G4tM2I5FcnynRIoNW3eGMCmQ5CBoMo=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr16724160edr.44.1604952915213; 
 Mon, 09 Nov 2020 12:15:15 -0800 (PST)
MIME-Version: 1.0
References: <20201109175049.2182359-1-mreitz@redhat.com>
In-Reply-To: <20201109175049.2182359-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 20:15:03 +0000
Message-ID: <CAFEAcA-x8Ms6JmpSqztjY0ixYeaP-BBYmMr87dE6XdceXt=gHA@mail.gmail.com>
Subject: Re: [PULL v2 00/15] Block patches for 5.2.0-rc1
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Nov 2020 at 17:50, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 2a190a7256a3e0563b29ffd67e0164097b4a6dac:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-fixes-20201109' into staging (2020-11-09 11:20:25 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2020-11-09-v2
>
> for you to fetch changes up to d669ed6ab028497d634e1f236c74a98725f9e45f:
>
>   block: make bdrv_drop_intermediate() less wrong (2020-11-09 18:43:31 +0100)
>
> ----------------------------------------------------------------
> Block patches for 5.2.0-rc1:
> - Some nvme fixes (addressing problems spotted by Coverity)
> - Fix nfs compiling on mingw (and enable it in Cirrus)
> - Fix an error path in bdrv_co_invalidate_cache() (permission update
>   was initiated, but not aborted)
> - Fix (on-error) roll back in bdrv_drop_intermediate(): Instead of
>   inlining bdrv_replace_node() (wrongly), call that function
> - Fix for iotest 240
> - Fix error handling in bdrv_getlength()
> - Be more explicit about how QCowL2Meta objects are handled
> - Cleanups
>
> ----------------------------------------------------------------
> v2:
> - Added missing Message-Id and Signed-off-by to patch 12


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

