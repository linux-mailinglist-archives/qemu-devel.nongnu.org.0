Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8F512EF6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 10:49:15 +0200 (CEST)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njzpq-0000jE-Sv
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 04:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1njzk7-0006ms-UG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:43:19 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1njzk6-0005SK-8O
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:43:19 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7d19cac0bso44693457b3.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhT4gyehSUaS0uvJQJFoIPQABVvtuwUvHG26ElZlo/o=;
 b=bQfJRDymP8yRHTih85B+fPRL/85WgOg+au9/zBdVJ8IkcG6VuKfsYxPPlEgIzuLeNK
 lysj+3zq+g6vTZ6GJq1SHb7AHuqCluY1vGM6QfvogZ08o2zFzPIDBpj4s3O3Il01P1o3
 TkWKAsFEffcBj6WeDIPxIZDZ/v91tw4i80vr9601aoLMAYvBxbsmdRrdPOkm4AK5lTZW
 BQ+QGI9W8wdyaGUBwqoONwwwUNwbKclCynr2mE+90Uik6KQ7BZAda3ngsLFHV4Qfvdnd
 ysuQAFcKt3qSwMFJE09X+vMX0LASuGDbVQb4CEzSSkc2/8UUM1YmJkxM/iPqegJNyEWl
 nkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhT4gyehSUaS0uvJQJFoIPQABVvtuwUvHG26ElZlo/o=;
 b=czsqczGfwTjwpPbCaDjbc+vyi0PiL0dsxZT0kf2vcYULMET2MIixWK+Yux+b7kG6BF
 6q1mYF/UuUujBrHno9Rw3xFBXGy0ds3627dFi5HAY24+1Kzn4Ape1D8biT28yIGCmcl7
 UaBStym44U4P2tLVBvNx06hJlNobVs/C94ZVUhck45DFDHeet7tZTvveBoUWgjsLitto
 KAmXHC22n74zB2K6Lt4oFr/mP6RysOc4QevR9L2FxAdO3LzSF++gzBcGESieVbaPOwfr
 dl6+ITvUlbEdtSrgpkrTi2XSzfIMItFSb9J+GuS/S2OI8KclkQ/qm/BrmdGe4jeRM6OT
 nURA==
X-Gm-Message-State: AOAM532o8Y9hB2iCOZRs/l6LK4QJbiUBWaM3QjXKbWhmg1QPoPkbYz4V
 VQ77VHuFwKKhb3UaM5MD2/n5nsNIHrzw5SESSQ8=
X-Google-Smtp-Source: ABdhPJxukuXDHWbOH46l0xmr6EzFeV2k2PNtsIXL0Wh+U6NQN5IY2zl2dlY+4SlENyce9myUwu6TgOG8qs0VaYjpSc8=
X-Received: by 2002:a81:2443:0:b0:2eb:4ffe:fab2 with SMTP id
 k64-20020a812443000000b002eb4ffefab2mr31271184ywk.330.1651135397080; Thu, 28
 Apr 2022 01:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
In-Reply-To: <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 Apr 2022 16:43:06 +0800
Message-ID: <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> +Richard
>
> On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
> > > >
> > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
> > > >  1 file changed, 142 insertions(+), 71 deletions(-)
> > > >
> > >
> > > Ping?
> >
> > Ping?
>
> Richard, is that you to pick up this series?
>

Ping?

