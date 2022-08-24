Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39F5A0214
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:27:47 +0200 (CEST)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQw2T-0001K0-F6
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw0n-0007mg-B0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:26:01 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw0l-0004tg-KX
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:26:00 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3378303138bso446483897b3.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3zoDEn0rEuZP370CHtW1Vj8FKyKC4YBMxZofTvpvUpU=;
 b=fGTevsAtGHsbNARHVPSmesnAywkiESTOC1/a5ngBhxqMAysTqrrVO6GVeMoVWnZUgl
 5cw3RQHdUk04NDMbpcMdZV29lA4Nc9QTSDeZ9CUjow9kqIwGJw1NRzjHLIArB4THbRhj
 pAz/7m/byHoHcs8Tj74/1ng56szyecfaAlQtY+xwbsg8DT18r7k4CGxg9UslEhgi/teA
 OhQSQyv1th4eZP8YwDoqp9NnwLA8g7pK3KnxZV1WA/ns4xYXTZNMJBm7OAM846sFsU+m
 G3qHfHUYh5A4qTuMVD0XRZKl2FmC0v6moYza0bk7v4eB/d6nzs07feToAAgtI/di4/62
 v9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3zoDEn0rEuZP370CHtW1Vj8FKyKC4YBMxZofTvpvUpU=;
 b=zdmtbS3HxMQF6quyuzgA+gOH3SuUFNjKlSth8/gX1fP/MZu8laVAo5XVAV7xVSF3zy
 S/+kcFZE5bOEQ+J7XQ+5p1lt1LEq76eCUUIFh11GjRqsG1iun4hHTy28ClIzW4H0DwsS
 9YHKAawDDJsS4pf+54pu32x5y1LvQhHTEduP0InUEfW4SeEYjTV86hsmmpNnk8U+Rsyg
 AsZ+hPlvoUsBY0MTzsYF3RsdQ1yBg55Jm9MLA/a/xInU0yI2a7qO9YxtvJC92J85/Q8L
 X8iMeEZM8Kqbcy53bDs+PpQCMhl16UmhdQU38ianAt6/R4GRGXDAu4VyJoscSJE2wJ1R
 oHXg==
X-Gm-Message-State: ACgBeo0uLdfT1ZEP1coH601sFSmt/gcWPH9n7l+BR6XgE/cyMZ9mohLt
 HaEvkUF7pd2zsR+B1qWjkLe2xqsgUEZph9CQF9CcEg==
X-Google-Smtp-Source: AA6agR6GmiRL5Ov01ngYJgZ9p65pJW+KPV+SHyf5evD3PYoazZds2hpWWLCuojmSfZuIrpjhjU4InkttXsnV1yMeOj4=
X-Received: by 2002:a25:4e85:0:b0:695:8a88:903f with SMTP id
 c127-20020a254e85000000b006958a88903fmr629130ybb.85.1661369157094; Wed, 24
 Aug 2022 12:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220817141754.2105981-1-anton.kochkov@proton.me>
 <CAFEAcA-ii9vOLvtO_Yb4c90KaH8dENbgUEquiuqJPkQKd03D-g@mail.gmail.com>
In-Reply-To: <CAFEAcA-ii9vOLvtO_Yb4c90KaH8dENbgUEquiuqJPkQKd03D-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:25:14 +0100
Message-ID: <CAFEAcA_cnmzCJXUXbkLA02XrH5psRq-WxEO9sCjtkuS+VxV8nA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Aug 2022 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 17 Aug 2022 at 15:24, Anton Kochkov <anton.kochkov@proton.me> wrote:
> >
> > For consistency, function "update_rx_fifo()" should use
> > the RX FIFO register names, not the TX FIFO ones even if
>
> "register field names"
>
> > they refer to the same memory region.
>
> "same bit positions in the register".
>
> (No need to spin a v3 just for that; if there's no other
> issues with the patch I'll fix it up when I take it into
> target-arm.next.)

Richard, since you're accumulating target-arm patches currently,
could you pick this one up (with the commit message fixups), please?

thanks
-- PMM

