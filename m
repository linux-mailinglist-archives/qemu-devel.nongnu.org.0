Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C34DE79C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 12:31:50 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVXJF-0001MS-8E
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 07:31:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVXGc-0000P5-Ai
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 07:29:06 -0400
Received: from [2607:f8b0:4864:20::1132] (port=46011
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVXGS-0008Ly-4t
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 07:28:57 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e5ad7166f1so101354707b3.12
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnZ5MYtwdpYDnsHIJTtKI+IfMhev7Rj/cTI2+g2lhiI=;
 b=faKutP9L4nxik/NLay3DSrqPIMDeR+Aci0c7FdJZ1X2uPjuEzsem0YH5ihAaWUFeMT
 pxRG1XBclCPwRwQK8pVPdMse9XzRIDe+zhUHSsWEULXSl6LDfad7W4hBQk2zfrXsPDOr
 uTPU4UP7ZqdqV5rnmJ109YhWN7fzigiqhc/RkIOB+i3+YyyKZUw8C96//JIyD+I7k+Ot
 rgku/skPP6tYBXO3ByIVn7yNlc97/4QAEBXTyCQJ60AlNbsdJhWRFuNd95L8Ijy17O2j
 P26OoH97y65X+ijKv+Seiet/S2IMmESkhCVeCM+H+ZntGUyiXh+TBQP/JbAyQaDiYDbI
 P5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnZ5MYtwdpYDnsHIJTtKI+IfMhev7Rj/cTI2+g2lhiI=;
 b=OV8IiN5WQACjg3wJgAN/tWDgTmByivg3uewTH3bKu8oaD59rDw4QCp0DF1zcug+tbl
 bO3AWtGoMQKgVdqMc+4De61W1/2K1Hz4hZj3Q2WWdq1caJXq7iNcfQSJP7BQGDMUqlgW
 QfbdbibImhfiGaBFfMnBEq6lz1jK/lv3dSi7x/FEd0QRWje6B6U1alJo2spogK6Ail//
 XjC0KqaVfaNOj6+/sPeCwLObO8mnsY8/Ks9evGlnd2kf+5QxS5zBaDfRIoY2YWXkQ7v4
 pFH8x0xvWiijk+qCHsbwaOG4X4qtHIoYv8OTWu4Gj3kF67cEFEfA8LS8reH/vwbFZxeV
 7LLA==
X-Gm-Message-State: AOAM530PBOetRqJuSnMY82MlNTkHfsmFCPUoMVIW6T+Rig4VOf3mzKX9
 ZTd0NVjC5fcDQexulU9So90QYSoG0UbahEWJYK2/lw==
X-Google-Smtp-Source: ABdhPJzNM2O0jatTwuKDuxSoQWifQRyKTCewmyRJ2Jtw7kLcFiRcFMT9IYPmHWgmSs7JnZ1T5cp1B3iZxzgXFqBhjAc=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr15496519ywf.10.1647689334893; Sat, 19
 Mar 2022 04:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220318134333.2901052-1-laurent@vivier.eu>
In-Reply-To: <20220318134333.2901052-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Mar 2022 11:28:42 +0000
Message-ID: <CAFEAcA9N__jByE16Q9ih5emX-WBtzQKgz5UxR_in8p27qkgM3w@mail.gmail.com>
Subject: Re: [PULL 0/2] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 14:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
>
>   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to a2d860bb546aa766f6c28a47fabedafbfa191cc2:
>
>   virtio/virtio-balloon: Prefer Object* over void* parameter (2022-03-18 13:57:50 +0100)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20220318


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

