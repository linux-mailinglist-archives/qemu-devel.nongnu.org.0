Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EF3F0325
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:02:42 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKHG-0008Tt-IP
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGKF6-0007LY-Sn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:00:24 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGKF5-0005vu-Ae
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:00:24 -0400
Received: by mail-yb1-xb30.google.com with SMTP id a93so4810079ybi.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKMoy/KYqdLBgRRtPYF+51xv6vSlbD1dp+0MXK3cF8I=;
 b=K3su5PJPffVcdcahQ556VKeM0MI1qs5+/pBXpeAsoNwT/hBisQiLxLRQwV3zhLzKuN
 3lGdzCRgEAey4FPMUWGinQJQGyPsVDZcrjmiCChmXhafeOnyN9RSQIuKYzdr45npEQpn
 RevN/YpHH7Ja4+ePyZdTwSd6+HhKV0wHacQ1/+zPu5OdSxJqt2+g80QqlteD+xasFUdF
 /g7Q/x2P2jl1R/ZZWSiDNyB5BeGybs65TiysUjlrG7m4NqnYpaK4D3oGWvY3w/fY7z+T
 418u4MFJ2G7g2JoNpNBNMFJbUyk5pYsoH/uVSJHwj7qW6qVwuAzMLurLxuJWQKijNtFX
 hUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKMoy/KYqdLBgRRtPYF+51xv6vSlbD1dp+0MXK3cF8I=;
 b=if87JJBYkL2O+kOtRSLw+UQYcVa10d0odM1lZp5T8msoP8p8yaXUJz8KweacTkkjH9
 7YVOhng3eFRup2dijZmn4Op3Z2weONMbQYRyIqlF2s299fMSvRDrSJrraagJBqrVO2o1
 /Dj6knqLAa3DD5g9z9J+qxAeKBiPEz/TqpOrO4dehL/TiD0JALiBWuU1Wham2vt1CUS9
 6lMf2u/x+eUKuwu2gwFEWi/m5s9erMws8B/kyjmJ2tIkLY2KnZHy29Xct3sK2Rrt/oLV
 tpVnorDbGV0WtzdJWcWR0R8eiDJhBYt837ngetL8xoQE1XwmwCTQ5T+7nAK4omGSJREl
 XBQA==
X-Gm-Message-State: AOAM531bovtxoDkdGBycwQV9Vieg/VThyFIYxtlIaJ6xDg9QoYfjiqgI
 wHBwE0jtmDNhiV9GzZRpYxdf+LUv+S3Cbwl26vM=
X-Google-Smtp-Source: ABdhPJyLiPRlbhcdTk2PHu38IR6krrxLPVyrSxV2DbxyQOqZBfdKULnkXAgmhB1FgoECWqfMJfqsQj3MT9W9LtDw+8E=
X-Received: by 2002:a25:cf8a:: with SMTP id
 f132mr11387601ybg.387.1629288022077; 
 Wed, 18 Aug 2021 05:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
 <162928727089.357603.8471789223247950118.stgit@pc-System-Product-Name>
In-Reply-To: <162928727089.357603.8471789223247950118.stgit@pc-System-Product-Name>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 20:00:10 +0800
Message-ID: <CAEUhbmXwr0wvabJ8e2=VBbf6OgFehuOGH78XZGBaukDgOfPiQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm/monitor: Add support for 'info tlb' command
To: NDNF <arkaisp2021@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 pavel.dovgaluk@ispras.ru, Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 7:48 PM NDNF <arkaisp2021@gmail.com> wrote:
>
> This adds hmp 'info tlb' command support for the arm platform.
> The limitation is that this only implements a page walker for
> ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> not supported yet.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
> ---
>  hmp-commands-info.hx |    3 +
>  target/arm/monitor.c |  170 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 172 insertions(+), 1 deletion(-)
>

I believe this is not TLB on ARM, but PTE?

RISC-V implemented a "info mem" for page table walk.

Regards,
Bin

