Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12283B8F81
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:09:05 +0200 (CEST)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysgy-0002Eq-5r
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lysfy-0001Mc-2p
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:08:02 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lysfv-0000Cf-LB
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:08:01 -0400
Received: by mail-ej1-x629.google.com with SMTP id bg14so9204172ejb.9
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66kTnvI5ZxR8Z5UXfSlV6nc9sCLgSv+37LChHQZxbuw=;
 b=vxKn7/ZVK9EOv3Fji/f15MZqpcnsC8NwTGjaZeLHpp9ubmlssYQeiDC+pID9QO70yt
 FXdRk9grk6S+W9pV0L4Aezn9fVQ56EhM6j8XpB/m6G4WG8QqNDcVsnDfuFvVbK9Bd84u
 MUco5ArWkna5U3MWBtGWLIW/J5/oJHH/z6N5d268cKbxyAXpyzLEXxSeAsvnCej0+y0S
 jPAtTR2/LpkAM37qqZhk2tDM7oJO+Yac3Ubb+kseksb56dBA/wQMDC7pClsWeBKhmW0v
 VUlOM9UDZvu+PvA0OlecZmaWUvnQ0s2J2rwWKr5JFQYfKviCH/0xufOVfcdHBBK67mH4
 RjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66kTnvI5ZxR8Z5UXfSlV6nc9sCLgSv+37LChHQZxbuw=;
 b=gnThZFO3EO+tPMPAXiKlMBvjJ7dS0WeFwDgEumZM66pe18y8tkmeQVk6Z2VNVTTEhe
 ODeUu2ieRoDBklD+42hCMwNbekrzttAa2ffit/wnziaOFFXgwcsCCx3BqOOHQF2ugUxn
 8wUTLtNi6zGHS+CI/AY/EOxact2Gfjiuw8dcOiDIPmTYIednzIC/ySDqOG0EoqOuBDAR
 NEMLaCYmdCDcQpX6hqd7SSFZHOS3crYU3ynjz1GNGaey++fXuuicssGdIQpUj8vTDtNo
 O/mMkcFx6VdeuFgdxC3ETzZ3uLZUXD2MotHBgnIx3P9LW0S+0zGjOBhAihAnjTlasLFp
 FK6Q==
X-Gm-Message-State: AOAM530ULguLQQt0C6cQh4hADFiCITlyfCEb+7/T+5H5zU9tcvSnfCmN
 /RxCPLq6wB8koopggUU8jstVnBxeZSmJy/iPEUBbZA==
X-Google-Smtp-Source: ABdhPJzuKoDONOkQrPmyYyzIEucm+7ef9HIK4M/rh6wiwpVrPYTU4cgtZk12nAgl55D/L+ZhknLTw/wTVVOeVrXZKtI=
X-Received: by 2002:a17:907:7b93:: with SMTP id
 ne19mr1409621ejc.56.1625130477866; 
 Thu, 01 Jul 2021 02:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210629184743.230173-1-its@irrelevant.dk>
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jul 2021 10:07:20 +0100
Message-ID: <CAFEAcA_HCyJYb2OVY7qpGgcDSWb-gp7R9zUOYCh1J9P4HOTaXg@mail.gmail.com>
Subject: Re: [PULL 00/23] hw/nvme patches
To: Klaus Jensen <its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 19:47, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 9e654e10197f5a014eccd71de5ea633c1b0f4303:
>
>   Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-06-25' into staging (2021-06-28 18:58:19 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to 176c0a4973d3ca5d46b05d0edb439b154363d29f:
>
>   hw/nvme: add 'zoned.zasl' to documentation (2021-06-29 20:31:27 +0200)
>
> ----------------------------------------------------------------
> hw/nvme patches
>
> * namespace eui64 support (Heinrich)
> * aiocb refactoring (Klaus)
> * controller parameter for auto zone transitioning (Niklas)
> * misc fixes and additions (Gollu, Klaus, Keith)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

