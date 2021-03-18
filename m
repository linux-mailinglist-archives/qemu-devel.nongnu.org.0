Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690C340495
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:29:09 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqpw-0008NM-58
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqnm-0007d0-P1
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:26:54 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqnl-00009Y-5q
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:26:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id va9so3337040ejb.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xr52rFM9SXw1Mb5CRFGczBBvP1Gt4M858QJVYbT6Pxk=;
 b=Tt3DjGU1ptm02Lm5FMtuNvuSL4oVCmFn/tDGmkdhikn1921i6vdDUiLa5FsPVQ2Pw4
 u3ZFT5t/PD5pLXrToVnpY1SzRx2rqqiUW3uOz+hpBI0j0nvKrfdcXUcuDg+h3mlKt7wF
 pq7NFh2NhyflHBatNaAWnea2szttVLH0xpue3jRmL2r3MotqV6iz67TlSirZGeOECJtl
 VjM7kXFgHgnlmKIKkMxVznTO0usEOyLkuj/R5SFzntC5QZJDPO8JpshpvyJ36PBF3yu7
 Nk2HVIWm4VMIeClaldX7Y9jyDwjpLklEFeg+itXdxqf09tr+LWG2I73pXasmuUMseduI
 ahgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xr52rFM9SXw1Mb5CRFGczBBvP1Gt4M858QJVYbT6Pxk=;
 b=MggtZ8as3JLCrwecp/XpFig23KVmYyH59XZdrtp4Loes83uMIQPvkxVosnpArvSCEW
 EOntP4gISRidn/DU6y2wRECR+djT0GPE1Z81n5PrJQ0G6TzB55qf6BYdcfKWQMB/exPo
 L5z+O6rjqETqrIILysBqins6z3k0SkBNzfKzwNvX/FWpHWyuq/rKbEGUz6Jn1ohKPlez
 CQdFBc8bENs4biKBIbMX1EYAt2qjSO5supPVSAWwz0rU/se7FHAwxAyGyYb4QykP1h7J
 1fiMrjXyopJXCjwawd/8HXjSD5xSOwe+x3mK0gOSCGyYM15VwPFGCJJ12KAGev6guI4o
 DxsA==
X-Gm-Message-State: AOAM532+tUtT0eU8rzDaLh7H9+QOBj6Z2JXGXvGn5OteCGZv2lC1wUUw
 onLrShcIBxH1u7aGivfBfENXb180UzVMAAe2UuwJIw==
X-Google-Smtp-Source: ABdhPJzLPy1JXs2R+6gDosSATnuMHdCsWnVcyvJphn4QVGdyLlOGn5UWepD2gYB1KWhErpY9oQjCsVqXu+8ryMFk6SE=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr41109609ejb.56.1616066811566; 
 Thu, 18 Mar 2021 04:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210316214753.399389-1-its@irrelevant.dk>
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:26:27 +0000
Message-ID: <CAFEAcA8_rcfiYz4NSqY1QKA-FMPK7Hk3xcVvFbXGZnXw_HKuYA@mail.gmail.com>
Subject: Re: [PULL 00/11] emulated nvme updates and fixes
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 21:47, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
>
> for you to fetch changes up to e2c8dd15807886ca234ffffcdd06eba47fa65162:
>
>   hw/block/nvme: add support for the format nvm command (2021-03-16 22:30:47 +0100)
>
> ----------------------------------------------------------------
> emulated nvme updates and fixes
>
> * fixes for Coverity CID 1450756, 1450757 and 1450758 (me)
> * fix for a bug in zone management receive (me)
> * metadata and end-to-end data protection support (me & Gollu Appalanaidu)
> * verify support (Gollu Appalanaidu)
> * multiple lba formats and format nvm support (Minwoo Im)
>
> and a couple of misc refactorings from me.

>  hw/block/nvme-dif.h    |   53 ++
>  hw/block/nvme-ns.h     |   50 +-
>  hw/block/nvme-subsys.h |    2 +
>  hw/block/nvme.h        |   44 +-
>  include/block/nvme.h   |   29 +-
>  hw/block/nvme-dif.c    |  508 ++++++++++++++++
>  hw/block/nvme-ns.c     |  124 +++-
>  hw/block/nvme-subsys.c |    7 +-
>  hw/block/nvme.c        | 1257 ++++++++++++++++++++++++++++++++++++----
>  hw/block/meson.build   |    2 +-
>  hw/block/trace-events  |   22 +-
>  11 files changed, 1939 insertions(+), 159 deletions(-)
>  create mode 100644 hw/block/nvme-dif.h
>  create mode 100644 hw/block/nvme-dif.c

Hi. This tag includes a submodule update which is not mentioned
in the cover letter or listed in the cover letter diffstat:

 roms/opensbi           |    2 +-

so I suspect it was inadvertent. Please fix up and resend.

thanks
-- PMM

