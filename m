Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA37361167
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:49:24 +0200 (CEST)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX67G-0001mi-F0
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lX5Zi-0001qd-Tf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:14:44 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lX5Ze-00068l-OE
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:14:42 -0400
Received: by mail-qk1-x733.google.com with SMTP id x11so25916528qkp.11
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/i7exIOkfzjaGivOrzAfaS8+wOSkmaJkGms6e2vCLj4=;
 b=cUbCFPjQGoHKP8Eq5ZMCVeKk6GZ6EjEz61piJ90R4UKux8MQysMciX9qDJbRfoytce
 ENMkjK/olXuaCzX/G6g9XzQQFy/0S+GteNg7VeTmxDqwnEMGmG4hu3F0eiiEAhhK3PaQ
 i2+EpRQs2ISQHNy4WnVTx3C5H+dx96LPWqYKOZs+nr26Xg/YTdKkkegoAek+QP0SQ03Q
 LG8Kngbf6XmwwgL60rKHlJ+MjcmJPGAytno/qpKPK0+bJuFolIgetNnvHd+KeyaOAF6c
 0nXLIF3SfDoOJDlV2etR4b+jAwB2/TuoqRnbEJ18U5x5LnA+sPVMKy7kN1WctHUj7lt7
 apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/i7exIOkfzjaGivOrzAfaS8+wOSkmaJkGms6e2vCLj4=;
 b=oaUmQK0NQYvm6I7nwJWARwcPnIck2OpV9yYeu70xgHGw6bVs+FsyXl4ZvtsLR9wyWl
 YJ3ecvGR85JH4kiFqO/wF69Gl6uMakYTM4K6XPoo7jzJQAdj5O0Gl4YCiQFXYYdWLRpo
 cpwipjvUVkXuRDCKo40yuZ8x5pfZVj+Tt0v4gZUo5If5X6T3+S2SY+Dgnb69UBRKWsHE
 IH6FlNtJ0yefcOA0lxTmpX7AWg1MtFbKpDcHdPkkShQv3d6ky9kxxT/MWSb6FMSY47lQ
 H1qbv4YZaMcVcEWNXZbE256169pks3DfPVA1vtXAEBRnOC523hdMgWBGXTGDztV8Pkz4
 Vimg==
X-Gm-Message-State: AOAM530FCEiozWUFXfsys2FY7WBPsbIQMxCwCML9woDsTGpO8j0J/9Hg
 PQfUnsbBVgPAOuiAvFmQv3gUsVbquetq9B/h1cG/uA==
X-Google-Smtp-Source: ABdhPJw1HsWteHMsSB5wcgxMU0qV8TzsScna4sL88nd+EcfedtGKo8P2e7k+XMbp+bRHirLh0YJL2L/TRkVI+fYY864=
X-Received: by 2002:a37:64c3:: with SMTP id y186mr4486943qkb.244.1618506875046; 
 Thu, 15 Apr 2021 10:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
 <20210415121257.GD5612@minyard.net>
In-Reply-To: <20210415121257.GD5612@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Thu, 15 Apr 2021 10:14:24 -0700
Message-ID: <CAO=notz+EMXqv+5ndHCGgcwUwGfGMNYt3NCVfx87R9HEutwf2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] hw/i2c: Adds pca954x i2c mux switch device
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=venture@google.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 5:13 AM Corey Minyard <minyard@acm.org> wrote:
>
> On Mon, Apr 12, 2021 at 12:45:18PM -0700, Patrick Venture wrote:
> > The i2c mux device pca954x implements two devices:
> >  - the pca9546 and pca9548.
>
> This looks good, I have pulled it into my queue.  6.0 is about to be
> released, I'll try to remember to request a pull after that.
>
> Thanks,
>
> -corey

Thanks, after I see the pull I'll send out a small stack I have of bmc
boards that can now use this device.

Patrick

>
> >
> > v4:
> >  - Fixed up bug where the i2c_scan_bus wasn't parameterizing the
> >  current_devs list.
> >  - Minor consistency changes in the i2c mux pca954x.
> >
> > v3:
> >  - fixup comment with missing end parenthesis.
> >  - removed superfluous object cast.
> >
> > v2:
> >  - the core i2c bus now calls a match method on each i2c child, which
> >  by default will only check for a match against itself.
> >  - the pca954x device overrides the i2c device match method to search
> >  the children for each of its buses that are active.
> >  - the pca954x device now owns an i2c bus for each channel, allowing
> >  the normal device model to attach devices to the channels.
> >
> > Patrick Venture (4):
> >   hw/i2c: name I2CNode list in I2CBus
> >   hw/i2c: add match method for device search
> >   hw/i2c: move search to i2c_scan_bus method
> >   hw/i2c: add pca954x i2c-mux switch
> >
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/core.c                    |  55 ++++--
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c.h             |  17 +-
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  8 files changed, 383 insertions(+), 14 deletions(-)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
> >

