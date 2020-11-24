Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980AA2C2EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:41:30 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcJl-00081p-OL
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcIJ-0007Qo-5y
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:39:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcIH-0005TW-Is
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:39:58 -0500
Received: by mail-ej1-x630.google.com with SMTP id o9so29738869ejg.1
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZq2NDetzwf/kL1gL5nZ86Fr7wqJpRQG8SuK1yEyGXE=;
 b=xOa8Z7rZNc/PuG9NfKhsBa4NBBJJoI8ItmReP0JF/GNcWAU6SMRgYWe7gZOW7nT6vt
 6p0iKNYny9wr88+pHZ0mkaUEz4SX6/lY0CLlYka/PVYiud3L7eX+JOuznSU5dPtk4fxr
 o+fcgNiyBY69/QoSCS0IcCQBv6dXO88r8uSdSmwk2x6PIEfWgpnTFwD03yxU8txC66HY
 X0OqDX80ewwvpYJ5dZ39ILFU28hGITeBs8LIP5l0LusUURKKMILH6K/F+SpVigXxY5Ni
 eHzePOIi2TF+A6c9qp23OoaT4T3yYZy6GtoQPIalpfVK+QEtcSuSQ+ukXLNP1+o3VJXG
 6I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZq2NDetzwf/kL1gL5nZ86Fr7wqJpRQG8SuK1yEyGXE=;
 b=JDPzQYREF3+tCUaplgB7/X2ocGHqQWYtq1um545iMGbceMf3cV0+I7R8z+8DJIuw2e
 DLLK9GHw63kGr3ijxM7Gz+GamL5cZA305k4P+Ar3h22nldKYnw9aLA5l7LE97HLXtmUi
 dH7lvzQOpwWsiaYJUNJsbQNwSEvEUEfKVd61JSlKcS8A63RuCI55afgragEkrWKtDJ3z
 AssGBnODyZzT61P1EkV2WfrBxm5Jk6+ys6GKwzSBaJYAt6rXq2M0M8vugTzFiO/VoJEk
 h4Mdy3fFzZJ9h5LHkjnA5unznR2mIm55RRpHHzM/jr7saledK3WRLQKfzO/TLbY9M12a
 AAVA==
X-Gm-Message-State: AOAM532UNEVVM4lZyzX41FQwawQ5nQJOVkhgTQ+kO58DF3Lwye1EvAJR
 g2UFlnenz6zqnupaPUcnVzrZPvlAXW6tzdYTJPo5jA1cCLs=
X-Google-Smtp-Source: ABdhPJzAWftCGQdggoco0VVmP6t2tfmzcvTHZTjoWN8dl/4iZ/TSthq5byJp6NP0ECOyCvvMeADwVHe/Vcf1mkTjuFU=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr5429943ejr.56.1606239596098; 
 Tue, 24 Nov 2020 09:39:56 -0800 (PST)
MIME-Version: 1.0
References: <20201124120728.1482792-1-groug@kaod.org>
In-Reply-To: <20201124120728.1482792-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 17:39:44 +0000
Message-ID: <CAFEAcA9Cqp0DwCWauMs-81RpSO0Q_Gtf1doBGz6QYLdY5L9poQ@mail.gmail.com>
Subject: Re: [PULL 0/1] 9p fixes for 5.2 2020-11-24
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 12:08, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit 683685e72dccaf8cb9fe8ffa20f5c5aacea72118:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2020-11-23 13:03:13 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gkurz/qemu.git tags/9p-fix-2020-11-24
>
> for you to fetch changes up to 558f5c42efded3e0d0b20a90bce2a9a14580d824:
>
>   tests/9pfs: Mark "local" tests as "slow" (2020-11-24 12:44:25 +0100)
>
> ----------------------------------------------------------------
> Mark "local" qtests as slow to avoid unwanted breakage of "make check"
> with some configurations (eg. Fedora's Copr automatic build system).
>
> ----------------------------------------------------------------
> Greg Kurz (1):
>       tests/9pfs: Mark "local" tests as "slow"
>
>  tests/qtest/virtio-9p-test.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> --

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

