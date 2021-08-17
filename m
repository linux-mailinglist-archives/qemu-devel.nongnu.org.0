Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA383EEA2E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:44:43 +0200 (CEST)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFveE-0006mA-AW
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFvcv-0005EZ-Vr
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:43:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFvcu-0003Yv-Cl
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:43:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id dj8so22844559edb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSs06V76c+0ts8h+JZB1VzzY4ifLbeN52pmDAaCxC4Y=;
 b=aISvpLI2RXr+VZLIs6KJE6MBbGNaoGWrYftekDVvg0Fv0YC83jVAvJExy+PEhmI7gv
 WwWDWwYjcZqsw4t+WNcKOtSOVRSMpXSeVcHCyDjXOwqWR7Qksb8uJ+/xKsa/98kVxasv
 CvT5OPGj9OuhyzJdyudTYNzBySPm0sYpBYL4kpZ8uZJg5+gBn+QmR7N4zf6g7Q2g8FSL
 fIPAk5swZJklf8M8QqSaYVRyn8FwXHW1zqdZE/LpOeC7d9RhxamMvHTv8dHLwgZITLNA
 G7M8qzmITLko719q2U7rGXLApzik0dZ0wQXmFCabh8DONHyUz0IsAoJYX2O6J6FvZ8s6
 xRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSs06V76c+0ts8h+JZB1VzzY4ifLbeN52pmDAaCxC4Y=;
 b=l9AKva1KKZemWzCzqMP9vzzyIO4Rm0Ve7sYyESkW4rnvnUu+GG6dI8hXUu3X0swz0l
 UlWOjKZC2WXEUC3fjCkrPeWc2pvlutLctx+ElT1XQjCb1qgbKBtXFaAU19W0XyMSAgwR
 7en9ChuuVVO5i8mXpz8tpg9S2lKp2hheCUO/Gm+eBXgtEcR3Tk4/kxtBl4M2xXKq3/BE
 ouSVaRWx/Qv26cdBu9mpdizcHvZQILHsXarBSa3DbJmSUdq2ynVvqZ2YiKbePyhcglUe
 +SP44C+9xWUdJBlQQbFyNlVVR47B35fZa/aYNe0ci7wABzLPgGZ/2Scv4ox0jbCvi3rg
 R6NQ==
X-Gm-Message-State: AOAM530eGXFv8AE71CyowllNnxcKTwNyIVhDhuC29pn6XbRNIOJ8O3vX
 CaK54GSK1JpmawUppgLaiv31F2zz5HhqpBIawePaBg==
X-Google-Smtp-Source: ABdhPJyN0jYfas2M4CeN0cp9SdP8KNEwhENf7Um9lvtdbPqnF8HJsLNrbphFSvoeoHYJS+yL8Ej84Yx/c14n6KqLkoU=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr3167611edc.204.1629193398425; 
 Tue, 17 Aug 2021 02:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <68327a9-a317-9be8-92a6-ed23a91f4d7e@eik.bme.hu> <YRsnxY+0PplppxeU@yekko>
 <28b9ae3d-80b8-f48b-dfe6-9b895d5c5db3@eik.bme.hu>
In-Reply-To: <28b9ae3d-80b8-f48b-dfe6-9b895d5c5db3@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 10:42:32 +0100
Message-ID: <CAFEAcA8x5Ne2=WF2NXDsO-6GO=Lbw+8qXx3KR7BhebVPkpiHXQ@mail.gmail.com>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Guenter Roeck <linux@roeck-us.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 10:25, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> We could also modify the pc-bios/canyonlands.dts to comment out the
> ethernet ports from it or add the disabled properties there, maybe also
> adding a comment that explains these are not emulated in QEMU but to me
> keeping the dts unmodified, matching real hardware and let the board code
> patch it according to what's emulated looks more obvious to clearly show
> what changes we have from the originial hardware which would be less clear
> if we loaded a modified dtb. Modifying the dtb simplifies the board code
> but hides the differences from real hardware. So since we already have to
> modify the loaded dtb anyway I'm OK with changing it at the same place as
> this patch proposes.

If this was preventing Linux from booting then I'd be a bit more
inclined to it. But it doesn't sound like it's actually doing that?
AIUI you just get a couple of non-functional ethernet interfaces
that can be ignored, and "some devices don't actually work" is
pretty much par-for-the-course for most QEMU models...

-- PMM

