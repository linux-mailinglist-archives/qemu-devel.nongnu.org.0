Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF82621994
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:38:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRXI-0000z1-Nx; Tue, 08 Nov 2022 11:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osRXE-0000vv-Qy
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:33:13 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osRXB-0007u2-O7
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:33:12 -0500
Received: by mail-yb1-xb34.google.com with SMTP id 7so13441364ybp.13
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iqpLtPHBCJa4cXy8Ww7aJQ5YuWoWdijI/un8ZjuU9E0=;
 b=E1+Ihef8HM2Q2vWkqPnDAwBYJy2TYsR3yvNkctz1IyubuAZ5ON7z+eyH/nf9fKJK4E
 QSTkamSj/v2P8BrYyHuloWj/Rkm/7J5sVKV3YZ8aijz5mx/YKr+XQOvw8cL/aGX6EI6G
 DrH5xyVWAAsPZJIUIHPUAmK1Tcv87del3L5CFfEYkB/RX6IMrXemL+hJXDIWtkfAEulG
 TXX2s4OP+1sDYvdi2MYcvW48dRIIlkhzT0QggvFBCQvJVLRdGzBDUQJgQZcNNXm97oKi
 29ZSqafOSBSXbuSoHX/yGt0kmeV/BSl0SsTS+u02slSlxIJJSXoLy8nJDGuQY7h2gr/I
 0gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iqpLtPHBCJa4cXy8Ww7aJQ5YuWoWdijI/un8ZjuU9E0=;
 b=VbGV6slgCXfJQL4j8EYGoomDjjjbZ8/vqfe6q6cifJM6Cxy+6lAN+LI1FQ+6+QhVHo
 psqnowOOKhZ3OlZ/JdG+EjmOpxpn3TAlNtvgnLfyW+PjBcnPvL3PNTvobrDkaPEdqwrn
 WHw7crS/a/AhlZvws28xZ8fu0lQmB5dTrE7ee9uh+bVuBKqTzbVkt7KZxHYattJrRoQl
 VQRsT7c+L9Oi7pl4BBwnaKtUkDHiNV6gaQ6GY6D1teZW/IumLuGhEB4woYXq+RHyofw0
 mJk44B3JpEotP2T2oFB9mhYF6O+4XVu2/bwaLO6H3QFaA6pAieEbC654eywQMZx5KeCs
 1TsA==
X-Gm-Message-State: ACrzQf27HsakpiygJY0qyjCClkTIa8+nvoVmAzxmWeq0TDlQ2pTTPl/0
 7OaswkPyD1UKawjWTxCjMdg4WSoOoALqFaX2RkmtGa4HN1dz9g==
X-Google-Smtp-Source: AMsMyM5xNnYPGiSFnPb+iuMcx0RRdiD//ey0bXE2QrpID4wB5W/87zZE2L6VcTWxRvgMgjxuhqVRd93RdEudE2paNN0=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr56095419ybe.642.1667925186190; Tue, 08
 Nov 2022 08:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20221108041929.18417-1-jasowang@redhat.com>
In-Reply-To: <20221108041929.18417-1-jasowang@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 11:32:54 -0500
Message-ID: <CAJSP0QVNFCCni5iXz5Dvu0C2oKipNuKk7pKX4t=Gh9zVpzPVZA@mail.gmail.com>
Subject: Re: [PULL 0/2] Net patches
To: Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 7 Nov 2022 at 23:20, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 524fc737431d240f9d9f10aaf381003092868bac:
>
>   util/log: Ignore per-thread flag if global file already there (2022-11-07 16:00:02 -0500)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to fd2c87c7b0c97be2ac8d334885419f51f5963b51:
>
>   tests/qtest: netdev: test stream and dgram backends (2022-11-08 12:10:26 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Laurent Vivier (1):
>       tests/qtest: netdev: test stream and dgram backends

This test does not pass in CI:
https://gitlab.com/qemu-project/qemu/-/jobs/3290964536
https://gitlab.com/qemu-project/qemu/-/jobs/3290964524
https://gitlab.com/qemu-project/qemu/-/jobs/3290964471
https://gitlab.com/qemu-project/qemu/-/jobs/3290964475
https://gitlab.com/qemu-project/qemu/-/jobs/3290964569

We're in soft freeze now. Please hold off on new tests unless they
verify regressions/blockers.

Thanks,
Stefan

