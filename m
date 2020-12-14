Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29632D9C75
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:23:14 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqcz-00047X-R2
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqal-0002gu-J7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:20:55 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koqaP-0005Vn-US
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:20:52 -0500
Received: by mail-ej1-x641.google.com with SMTP id n26so23273010eju.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyIU165AX2GxY4aGtpCSEudJnMqksPyH9EfdrIdS0wo=;
 b=jYVwRQl2q8Wb1gtdfcH/iyy8zJWjBNP3UU9BX3nb88euvplUNtTWGAh3/yfWX/2izV
 3GiDlrJ7tepboVzVzzxRMGkKIAHobXKKKAk7zS8t7tMx5mtdgoMXgi+1FeIjYuhIMXNU
 THF3DiFR6uuVnHju1MiRxsl7UJ0Sr/xYKZyPuEXTkSeVImEg09Iq9NWbY2YZuacLYFh8
 OM9WFx6RTGExMxL7YZKr9CQL6Z2aM4GDwkYj7axac/nLgq3tlaxxjzfZkf0EmbwkEPhp
 JUrhYTvIFppkGOjvJsT/sCCoE2/gYx1UDZHfT7vWdNR4gxwhdO6TFaWFjJuq1ua+8Gsl
 DEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyIU165AX2GxY4aGtpCSEudJnMqksPyH9EfdrIdS0wo=;
 b=NDx0Dsh/vcJ0tHS6BXyjQ3PwtRbFQRlGEWZfpL93pxkKHDGlwrDoi2SrJiiNdlwx2V
 tzoW17roCnlH0VvmgDU2Ph/QsfSHLoNDrNqpIUyI8nifqqUtfc4lqbAHn7APYAyU8dcJ
 XCn0wsYjNUrrwv8gSpAXlweQMQQ/D7W7a5IJEkvlKpJ/DBykaJsSiKsTPE2gFYIJXSlr
 5aiu694zl5h+tEQE/846PcjHBqnskUN8H7EFBQeYyXQNDQdxBsR49Yj6z1/mjMCtS7e1
 YBZPyYV+BT3sGLgPLjZNqVclsuSxkU3kApZZVD3t2+IDjSr3p5XANJUnpN5Htk+wBEHR
 zh9A==
X-Gm-Message-State: AOAM532GtlCq8hZBdomsfvVwFum6ial0qIBSaKgLQwtUGZmtddXfSngE
 qlPQLPXIaelvdGgr4x6tqvwcX3T7HvzAB0DUWEGNpw==
X-Google-Smtp-Source: ABdhPJzOTzyZ88qIAl/iYVvTqO1SHo4+b1aTC1bbAXErManqAp0FRx3DulBzmQRspyl3dEpL5oDm8M1Mu1jwHhfpfNY=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr23015276ejf.407.1607962829786; 
 Mon, 14 Dec 2020 08:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20201127071803.2479462-1-ganqixin@huawei.com>
 <20201127071803.2479462-2-ganqixin@huawei.com>
 <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
In-Reply-To: <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 16:20:18 +0000
Message-ID: <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
Subject: Re: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 16:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 27 Nov 2020 at 07:19, Gan Qixin <ganqixin@huawei.com> wrote:
> >
> > When running device-introspect-test, a memory leak occurred in the a10_pit_init
> > function, so use ptimer_free() in the finalize function to avoid it.
> >
> > ASAN shows memory leak stack:
> >
> > Indirect leak of 288 byte(s) in 6 object(s) allocated from:
> >     #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
> >     #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
> >     #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
> >     #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
> >     #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
> >     #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
> >     #6 0xaaabf57415e8 in a10_pit_init /qemu/hw/timer/allwinner-a10-pit.c:278
> >     #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
> >     #8 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
> >     #9 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
> >     #10 0xaaabf5b94680 in aw_a10_init /qemu/hw/arm/allwinner-a10.c:49
> >     #11 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
> >     #12 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > ---
> > Cc: Beniamino Galvani <b.galvani@gmail.com>
> > ---
> >  hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
> > index f84fc0ea25..be211983b0 100644
> > --- a/hw/timer/allwinner-a10-pit.c
> > +++ b/hw/timer/allwinner-a10-pit.c
> > @@ -279,6 +279,16 @@ static void a10_pit_init(Object *obj)
> >      }
> >  }
> >
> > +static void a10_pit_finalize(Object *obj)
> > +{
> > +    AwA10PITState *s = AW_A10_PIT(obj);
> > +    int i;
> > +
> > +    for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
> > +        ptimer_free(s->timer[i]);
> > +    }
> > +}
> > +
> >  static void a10_pit_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > @@ -290,11 +300,12 @@ static void a10_pit_class_init(ObjectClass *klass, void *data)
> >  }
> >
> >  static const TypeInfo a10_pit_info = {
> > -    .name = TYPE_AW_A10_PIT,
> > -    .parent = TYPE_SYS_BUS_DEVICE,
> > -    .instance_size = sizeof(AwA10PITState),
> > -    .instance_init = a10_pit_init,
> > -    .class_init = a10_pit_class_init,
> > +    .name              = TYPE_AW_A10_PIT,
> > +    .parent            = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size     = sizeof(AwA10PITState),
> > +    .instance_init     = a10_pit_init,
> > +    .instance_finalize = a10_pit_finalize,
> > +    .class_init        = a10_pit_class_init,
> >  };
>
> Please don't make unrelated whitespace changes like this in a patch.
> We don't line up the assignments in this sort of struct -- this is
> deliberate, so that if a new line is added whose field name happens
> to be longer than those used already, the patch does not have to
> touch all the lines in the struct to maintain the formatting.
> Instead you get a readable diff where only the new line changes,
> not all the others.

Hmm. Having said that I see that the other 6 devices touched
by this series did use the line-up-the-assignments style.
Anyway, the style this device was using is the right one.

thanks
-- PMM

