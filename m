Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D548C667
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:47:31 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7euQ-000623-JJ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:47:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>) id 1n7e1F-0005RV-GN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:50:34 -0500
Received: from [2607:f8b0:4864:20::229] (port=36660
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>) id 1n7e14-0001GM-64
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:50:20 -0500
Received: by mail-oi1-x229.google.com with SMTP id r138so3418268oie.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v7nQ/MZcVdG+hUoUTS7jHgUVp9FnVWDV0MFgJtRnVOE=;
 b=B7Pr1ZBrpomlgX1gs356IhMjj8nPi/0FdihMDNxFlJRAsjXUW+QK2I8/KG6TMq0QqI
 S+EbQhmBV/3MUhM4BzJE63eAbqyV0q/pSWx98uFYT6QtBCRZAWJrmLNyHU5E8iVNUPtd
 P7JIGSIIhwdO2STifVWHdbbtc3SsGwX/FGF+t4ZwBjrkLRHZ2EBzhdAVAfSszBtwCSmK
 hneePx8lBd21lwAxRj1f2P7dhxc3Y+nxdZczzyQvwSnixStXlfXPQVBKDg0UErzy6DHZ
 Z/HDC30DD9ff8knIMD4ljWPtCGWmn5Z3BTywZLLUNpTUb9GROh1RMpgIiBZbKRZ6L7wy
 7a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v7nQ/MZcVdG+hUoUTS7jHgUVp9FnVWDV0MFgJtRnVOE=;
 b=jLHl8cvfG9b8NQP7itLAH3pPehtTTCbLst7Z8vwoPMByOuTRrRH78DgwLiQ40+g6bu
 E4acyZofIzqJJnZsXnl3sw0eQ+iX5JLlN3ICLxLoYbuvcwZYW09bcm/lPRpDs1wjJJyy
 Apd+1+lCMZtRqf2EdInHXxrGqCYtTRrfxFbpG3/UzsGejkzExfl2ASkzGSWZJNxAoC5q
 NPwRkQ8G6jaKrRzehTdu2d3wLILBXBrcq2QsZBQtyyf2NiJ/BNXgoWHX4ZtvojVeJbP1
 9xEL25Z6qvknHk5l495g3nt5tzFZh+zM5zOSHMAop5WbTrqgSbz286pjYVnQ7rnBKOwi
 Qt9w==
X-Gm-Message-State: AOAM530Zq0gZTg8XZy6MkAJsUMloQcOZduZwXoQyvbf3iJ4fzm9zmzDT
 7FL9P1xl+L9BpA3vq7xGi9gHEkRhV1FuiylO5os=
X-Google-Smtp-Source: ABdhPJxazij8YpWP87rmG4tRMPRQcGXj98G4yx00tiHqJ1Kh9iLQBshOpmCAQ7x59LBbzEm5NTKfrg/yHACHbUo552c=
X-Received: by 2002:a54:4f81:: with SMTP id g1mr4859437oiy.172.1641995417089; 
 Wed, 12 Jan 2022 05:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
 <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
In-Reply-To: <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 12 Jan 2022 21:50:06 +0800
Message-ID: <CAN9Jwz2cZ9W2rNLDa7xfHGqXon-3T7OW3M7wLqMwbEwkKm+Pdg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
To: Graeme Gregory <quic_ggregory@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 6:57 PM Graeme Gregory
<quic_ggregory@quicinc.com> wrote:
>
> On Tue, Jan 11, 2022 at 04:45:44PM +0800, Troy Lee wrote:
> > This series of patch introduce a dummy implemenation of aspeed i3c
> > model, and it provide just enough information for guest machine.
> > However, the driver probing is still failed, but it will not cause
> > kernel panic.
> >
>
> These patches arrived just in time for our i3c testing. This stops
> our CI halting due to kernel panic on i3c probing.
>
> Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>
>

I'm glad it was able to help.

Thanks,
Troy Lee

> > v3:
> > - Remove unused AspeedI3CClass
> > - Refine memory region
> > - Refine register reset
> > - Remove unrelated changes to SPI2 address
> > - Remove i3c controller irq line
> >
> > v2:
> > - Split i3c model into i3c and i3c_device
> > - Create 6x i3c devices
> > - Using register fields macro
> > - Rebase to mainline QEMU
> >
> > Troy Lee (2):
> >   Introduce a dummy AST2600 I3C model.
> >   This patch includes i3c instance in ast2600 soc.
> >
> >  hw/arm/aspeed_ast2600.c      |  16 ++
> >  hw/misc/aspeed_i3c.c         | 381 +++++++++++++++++++++++++++++++++++
> >  hw/misc/meson.build          |   1 +
> >  hw/misc/trace-events         |   6 +
> >  include/hw/arm/aspeed_soc.h  |   3 +
> >  include/hw/misc/aspeed_i3c.h |  48 +++++
> >  6 files changed, 455 insertions(+)
> >  create mode 100644 hw/misc/aspeed_i3c.c
> >  create mode 100644 include/hw/misc/aspeed_i3c.h
> >
> > --
> > 2.25.1
> >
> >

