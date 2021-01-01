Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55D2E83FD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 15:35:00 +0100 (CET)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvLW6-0007zX-RS
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvLUE-0007Qd-Gd
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 09:33:02 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvLUC-0002tF-Na
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 09:33:02 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u19so20354618edx.2
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DjnVoZyR9j6UCFJ4teI/geAT1R7PF32LCPfyVPyqvVw=;
 b=jhEe++uM/Ph+dGg/QoU7YJucAW/JYDwi7avUuCw0IoZR4PL2+69LAloul8cjSOwlMM
 xF0GaJ5xqmGYBfY6UTSdNy6rKSgYEN6kHoSgy2ByTBqXOKrBCI+abyAV0rQyS73V+Vzx
 CkgN6zuaIlXm/rVC2OnSWKK0UTd7RWDnOlvc7bzBMS29d4JM1mvLoIJg7F02EYYI3Fjk
 CHAmZjAV+AycdfFjtHDLt0RYUI7ZaE0oeE46iRldBHchiV3raGpdhQ0Rzy9Toi4mKq2J
 1tCYe6jDcElri9aN5Bz6Gx13VZFpYRmG6inYFokZS4C8Ag7X2SLhFawPGiDHaRoLx3E8
 7ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjnVoZyR9j6UCFJ4teI/geAT1R7PF32LCPfyVPyqvVw=;
 b=tLtARt5oNNhUZ2xg1Z0+4JLrGhO2FTBc/41Y4SNCTrTg2YDFuzkhcHTl8pt27xzzTx
 4uNWDSZX14AMvYeHPd0CAN11YeViUrT8RI2B/aIDsCp/62esJc9K8LXHeUD4HkjimzV6
 ZCerjVCtOMrM40waxzuQyy48C/NZ7s3zYRpfUyz8geaIfL5lViMDqihDyLI5FMbD06SI
 +6uNs8l8M3hoJpo87AUM/KphiVpnhuoS6LWm7F236Az9onOyfbjRbHhjcNTkMcP9P6Nb
 PZW7hY1OsrQsOMzC56vD9Zhu/lqfQEqDwbS8qfnqU/1XbnRr4939I9Sb59CcRL082fkO
 DH0w==
X-Gm-Message-State: AOAM5308q8V/i3Vb50Im1K+4WjFHbU8KJCq5df7U8cN5XTb9xY2IKvnv
 ChsoV0LgTVc1JUTeAeipc0D1Z0z0+ZbLOv+A2xfP5w==
X-Google-Smtp-Source: ABdhPJwiyjl2TWzPkH5zG3QshwF/LV5xH6GNdovFv6RZHylIfFck13bVvOMdhQS0uGYK1xdREmODgTEnJbIc1qK4RKk=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr59690027edr.204.1609511579144; 
 Fri, 01 Jan 2021 06:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20201218190022.31214-1-marcel.apfelbaum@gmail.com>
In-Reply-To: <20201218190022.31214-1-marcel.apfelbaum@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 14:32:48 +0000
Message-ID: <CAFEAcA_4VnP8KSy-Z_OsVsue=81+SFNf6N_2cRHXe3LaY-+tiQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 0/1] RDMA queue
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: AlexChen <alex.chen@huawei.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 19:00, Marcel Apfelbaum
<marcel.apfelbaum@gmail.com> wrote:
>
> The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/marcel-apf/qemu tags/rdma-pull-request
>
> for you to fetch changes up to eed31bc5e2e9cc68626d51e7a10914dc52c370f8:
>
>   contrib/rdmacm-mux: Fix error condition in hash_tbl_search_fd_by_ifid() (2020-12-18 20:15:42 +0200)
>
> ----------------------------------------------------------------
> RDMA queue
>
> *  bug fix in contrib/rdmacm-mux
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

