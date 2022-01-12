Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244048C839
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:25:41 +0100 (CET)
Received: from localhost ([::1]:38756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gRQ-0002mg-Ey
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:25:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g6Z-0001KO-4D
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:04:07 -0500
Received: from [2a00:1450:4864:20::42c] (port=41699
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7g6U-0001Hb-Tw
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:04:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v6so5074507wra.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gvqRhfMTIu3DJZvf9AVR9xuFo98Kmq061hkCn9Eig9A=;
 b=gyixc1V5s5vnmnFXjrNxrr2K2ayOxB/Wqa5B+zGqv5oYdXkLyrlwklfEABCIC7uM2c
 iR+xHYoCcIOsuSzs5qCC4tn6VXVLE4M7bnwY/ysXy0VxYecxoaIFnl+20Ii+xvq2GF0b
 gyBlVn14MOL831UQ2fiwzU5paVKwJiNxRqBXLX3saPU3ds/B45cfOU6nhiTp6QuOuYJp
 VNkaeud8pHdRLgLzr+32x1BHBN8kVtEfpuIKdRlbioreTmVj8UpiBYHX8apNtDmj92+4
 drywdZT3tFdZy4JaS9dp93GGgqL4FmO/VBDku81bkBNBlrKWPGiJkDzbObGO4Cpe2oTN
 TRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvqRhfMTIu3DJZvf9AVR9xuFo98Kmq061hkCn9Eig9A=;
 b=ek6SNOJM4rwuOV6bShKmtXFjYTXEo2qKaZfl/N7aADB475Rli2OzOIGZgxqMe2CgcL
 GAThIyzGWI4py9KFG/yWuVPNjQvy5+TN/Xm7LjTjsLYjggcZ58YSH7zedYUU4NjbmAAn
 cyOCxKUUTytg0oU/zrqUVNk3mMxYAFDt/LeTsHwzh2Qi9110vRG/VbI2uXtQpYyrvT+i
 8Z0s4ZZSUNrfslm8yU1I7II9px8SaJ8FpbRv7pzw3MiZLWnOiozZ4m4yJld41eZukHhv
 ojn3yOoK5lUSDg+ZAoJE15DOFoqoL4IjLkarzIIBwJWwBx94dq8jJah+mecIqHTU2YFL
 IUeA==
X-Gm-Message-State: AOAM533hC31KlpSk1ZDfY5hqOqYoVj4sys1njG376EYu5yG+eykJrryz
 MxylIs+2BRpKANr5CYPs3mC9tpJol5FfSixY/i6Low==
X-Google-Smtp-Source: ABdhPJyC1JBQi22uQDJyc3ByMmAEoo+hyTC1WMqlPNnd4m7T+6KND3+2gICpm91GeQmTKhQFBIJCmEEJ/Ljs5mWTIcQ=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr331664wri.295.1642003441206;
 Wed, 12 Jan 2022 08:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20220111195247.1737641-1-laurent@vivier.eu>
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 16:03:50 +0000
Message-ID: <CAFEAcA-4v_nRcP=ERbgcrmx2J35b_GgUHp7p4S3MszQ_hB9+SQ@mail.gmail.com>
Subject: Re: [PULL 00/30] Linux user for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, 11 Jan 2022 at 19:55, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 64c01c7da449bcafc614b27ecf1325bb08031c84:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20220108' into staging (2022-01-11 11:39:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-request
>
> for you to fetch changes up to 4f4e5567f856d9b841494b3b5216a37d2952ee54:
>
>   linux-user: Implement capability prctls (2022-01-11 18:40:44 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20220111
> siginfo_t cleanup
> more prtctl() update
> target_struct.h cleanup
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

