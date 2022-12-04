Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32830641DC7
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 17:08:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1rVg-0006kN-L8; Sun, 04 Dec 2022 11:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p1rVd-0006jy-Nr; Sun, 04 Dec 2022 11:06:29 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p1rVb-0006nh-Tw; Sun, 04 Dec 2022 11:06:29 -0500
Received: by mail-yb1-xb31.google.com with SMTP id d131so8327800ybh.4;
 Sun, 04 Dec 2022 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e1m5dBcF2ZxqAED8tocJKmjyKzou36nu8LGa8y56nPQ=;
 b=G/98IFRxgLpzoZv/jqQ9WfbmVJlOxhSgjnp5Oy5UiJ0/gP0UjsOCiyKzGx2J3LcVAi
 tJk3uS4pkyRpP6DzQW4ZkxdSVThnjFdCWKinF4hRybuZqYECts+PJ7zS10WNb0LRSvKQ
 AAPfXXPEht0YamCUXibFH4qHJ3i3TCYZOutzLdpYNDlzoxuEp6b6OKn33V1nCPKhNAyw
 nMaxLLgW7BayWtRJkxu+51Lpq+yIvEP8ZvAxJhqGmGz9Y3zLRcHHzPj0NQ5M9p/IITqv
 iF5mUkMAawm0gk47i/UxBuS0yb3pekUsUY1EP0aTl8vK1zxMkPijeHB/ncXla/RrhIpU
 lf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1m5dBcF2ZxqAED8tocJKmjyKzou36nu8LGa8y56nPQ=;
 b=F8YIM8lsXX8bT2O7oStrkSbiLyBpw6MSwwf2EBjhXe4kRk2vIgFybP3DAJjw75wE+W
 MqVR5aexI1OJrkr41m8l1aWSTXpiOcnXC8GpirBRRp+m/WA2k++rP8FCG+UeNbOujB3B
 pRdzZ8hJDOk2uXw+6PIBIho8zLEp6IYpeIqXlGvppkRWxoRcvT21Q36n5m0bLpxDlqUf
 5uoJxX45DsrwQ3tmxS4dDHEN0bjxMq5/yUbLJLF7upOhta1yyHeX6sbVWQrm8ZG+nRy1
 HhSnAdusuvkUvXtpubueU8mGNoCozTJoJO3PxqL3qUFYpHKWfPwUY/NsIVC+vp3uw+Rt
 RdQw==
X-Gm-Message-State: ANoB5pmrEALrnO4owM4Uf/npZ+uPA/vZVXvkDi4e1YaLnhu7P5bpCOAn
 buVNAh8QMXYrJl/lf6ClIRdzgMOBUDyFBFwhOxc=
X-Google-Smtp-Source: AA0mqf4zHpPO2SiUsBkyi8cphCkiH+u7/FYfVSA7wNnLJY9ROD5uQiCdFXwLD6mQyy+DHh1A2+a5O5cze2foVYGg+1k=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr60752654ybj.58.1670169985683; Sun, 04
 Dec 2022 08:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20221201165024.51018-1-its@irrelevant.dk>
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 4 Dec 2022 11:06:13 -0500
Message-ID: <CAJSP0QUev9iCGpqiN35d87RBGiQxK4weXGR5hGJT7W00E31=oA@mail.gmail.com>
Subject: Re: [PULL for-7.2 0/5] hw/nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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

On Thu, 1 Dec 2022 at 11:50, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi,
>
> The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
>
>   Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request

Hi Klaus,
Please send pull requests with an https:// URI in the future.

Stefan

>
> for you to fetch changes up to 83f56ac321ca2301f00e63b6acbde5c692916a1d:
>
>   hw/nvme: remove copy bh scheduling (2022-12-01 08:45:03 +0100)
>
> ----------------------------------------------------------------
> hw/nvme fixes
>
>   * fixes for aio cancellation in commands that may issue several
>     aios
>
> ----------------------------------------------------------------
>
> Klaus Jensen (5):
>   hw/nvme: fix aio cancel in format
>   hw/nvme: fix aio cancel in flush
>   hw/nvme: fix aio cancel in zone reset
>   hw/nvme: fix aio cancel in dsm
>   hw/nvme: remove copy bh scheduling
>
>  hw/nvme/ctrl.c | 182 ++++++++++++++-----------------------------------
>  1 file changed, 51 insertions(+), 131 deletions(-)
>
> --
> 2.38.1
>
>

