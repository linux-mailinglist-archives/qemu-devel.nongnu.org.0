Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C1C3F1BFB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:54:51 +0200 (CEST)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjRS-0007V2-Pn
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjQZ-0006ZK-Nj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:53:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjQY-0001Qg-2v
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:53:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id bq25so13450362ejb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aWC8A5IyKbDkp0J4s47b+BXsC8+tb8vaTDQSnNcprRQ=;
 b=uK8wpYVsEPqq3+7iyi1UAONXGaYr9D9k97fnQNz9ipvzLrRk7KLazmHeadBgJ6OZwd
 k3W7T/jn9TkoGX3Mcad7xFiUD+5V6injVw3qMNNXnkQ4V0f6evGy29EWoLsLaunbUyQH
 0BSAF0JOy6s37c3Htax/dV7/EXcr3UUCV5Cy1buNA2tmC+4AV6vmrh8PWjQHZktPnWFg
 bw4obhHQEGtRl1OkyoC7xJkVtG/UjJo1NqSrQZTij4gR//Wl1iLCkYegg7O67Yk+DdJu
 P7ZRFR5QzK/ylq0hqcHdzWDpt34+EhTBN4WQHXkmHEPs7VPY8vJYoOjH4I2sz8DQlDXx
 evVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aWC8A5IyKbDkp0J4s47b+BXsC8+tb8vaTDQSnNcprRQ=;
 b=mwBrFxlImqHY2YKXhah1KSKmPu3FSE/GYhgQPs/u2LTgV+X632sy0Wt2JQJYvdoTI/
 W6QFPCgVoXrQ8T2NP6N8l2TrX9BG6HmpjkCfg8zr7mclvqY5DRp0/TCTKl60/mYtVXrw
 1S4wAWLl/wibqqtZAfeqMpv3WCE+z7VgmJ2Ni32LBJ/U/TuDvvXU+nZi5nvqn8ehg69J
 lmzqHLuHbE2a6pLFmGbtUBvl7xDvX9+KjqHfABDPg/N9fAmtBNp2TinEFEiN2+d41qIB
 4eQXJcRrm41ma0SU3yABDD9RZ4jW8URP1oyahf/VYwACaa5zblUuy7ilJga5tI5H9cJ8
 EUKw==
X-Gm-Message-State: AOAM5333DNj6gVGVTg9b/PvEGoH8Q5ii0tzrGymzLELxQ/+JlbEVc/5s
 PuvfSucqd1PKSxFAlRTcyspfumkkVSuXyrVzOuaW3A==
X-Google-Smtp-Source: ABdhPJyPXjU1p4kVgrIewrqZZU42j00X1M0Fj3lcHHXAmgKDhzGQ/L/pA9T9OXFfXNtJqSSZX/mwSIo9TYo1twAZRVU=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16421408ejz.250.1629384832255; 
 Thu, 19 Aug 2021 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210819141527.2821842-1-philmd@redhat.com>
 <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
 <055214e9-a809-7ad5-f2b6-7ef1b0ccb229@redhat.com>
In-Reply-To: <055214e9-a809-7ad5-f2b6-7ef1b0ccb229@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:53:05 +0100
Message-ID: <CAFEAcA9WS2z+vDWjfokFnHqZi8cdzNGoCWThmFsCvho_SaV0oQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/19/21 4:21 PM, Peter Maydell wrote:
> > On Thu, 19 Aug 2021 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/dma/xlnx_csu_dma.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> >> index 797b4fed8f5..0c1c19cab5a 100644
> >> --- a/hw/dma/xlnx_csu_dma.c
> >> +++ b/hw/dma/xlnx_csu_dma.c
> >> @@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev=
, Error **errp)
> >>      s->r_size_last_word =3D 0;
> >>  }
> >
> > This is a sysbus device -- when can it ever get unrealized ?
>
> Alright. Then we should add an assertion if a SysBusDevice has a
> non-NULL unrealize() handler.

There are a few corner cases where a sysbus device can be
unrealized (eg if it is used as part of the implementation of
a hotpluggable device like a PCI card).

More generally, what are we trying to achieve here ?
I definitely agree that our current situation wrt freeing of
resources allocated during realize is liable to be a bit of a
mess, but I'm not sure trying to patch individual cases one
device at a time is likely to help.

A comprehensive attack on the problem would probably involve:
 * documentation
   + what should go in instance_init and what in realize?
   + where should deallocation go?
   + if realize fails and it has already allocated something,
     who deallocates that and how?
   + are there cases which don't need to care about ever being
     unrealized, and how should those be written?
   + helpful checklist of common functions that need deinit,
     and ones that don't because they do refcounting
 * figuring out a test setup that would let us test the
   init->realize->unrealize->deinit cycle for all devices,
   not just hotpluggable ones. (We do init->deinit as part
   of the QOM introspection test; I'm not sure how much
   leakage of what kinds we catch that way.)
 * looking at how many of our existing devices fail that,
   and whether we can have an exclusion-list or something so
   at least new code has "get this right" tested, and maybe
   we can whittle down the exclusion-list over time (and we
   can prioritize the devices where this is actually a user
   visible bug or that get maintained)

thanks
-- PMM

