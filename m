Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128358AB7D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:21:00 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxG7-0003wB-13
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJxC1-0001kK-Mx
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:16:45 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJxC0-0000DV-2z
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:16:45 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31f443e276fso24220567b3.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uiSeEckWkl11KCMR9KCT4UTY+DqLtii1NR/9u0MUByg=;
 b=ihEKeGhh2TNkoIWVOJG/HM+Yxm6ybvNkHGkZHSvmP8MZyYRcQFcLgyKvMOrTxeLktq
 kbM4M6R+z3tfZ3XcklEFdL9K87Afo+bN7A5+/Uv83YQ0ktwyX+Sc1YbP1Nu/9IbaS5R3
 6DpuQPl0TrAri96BYk2CPlw4S0RfyLB+mI0KajPGzSj/1vFI4aycCjV6zKZSmshEBCI9
 O8Rkt00sHf0CDG7BKnzAFj8MgvLdYugo4FShK4KL8DoNtt0G2yFqjGBkfWuTafK0WEIN
 jcvbQDEEu9LPVdNSVhg3Gg/pfBxbNu4+Cu5tobaGBuUWhczqZ4aj+aGnVQUnUvEEnA/1
 Nsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uiSeEckWkl11KCMR9KCT4UTY+DqLtii1NR/9u0MUByg=;
 b=H8l+ruMTLeUV7LvsGIlVf2SWZbrcuPPU3PNjp52L1moQXDxriJvl9JGBDIwvmUsktS
 fKIr6mxIX3KS+9a0B4uhwx9C2twEwLPZceY5yg+OoBxozNWmGYaFoC7EuZ9Rqwl+Ajo2
 r29JETfAk2PlwsUbJYOPyXLxIv7fMOpmxYSJBb82e8KENjIOXeUk6Cy27vkdT+wuY6mU
 /tLnl7jsl6VEJOqyuCqif44gfEJcTLJKkKrVAat18Oklb7vrxZmMrYGsVRMG3C3qniYc
 d6IXqkPmbdCcOCH+sHLd4wx754MZQ6CCzPWw8HT5JZlljTXFxp6qxld7y/2jyH439E+Y
 bp0A==
X-Gm-Message-State: ACgBeo0fqpcvsnTlowrWLnZwlLd3zCOZ3+pV72FVzDZE25pvf1b+k8F9
 Gz+Pw5ZcKb56q0/RWi57pEiEnotqZdyTiEo1OmuG0w==
X-Google-Smtp-Source: AA6agR5+hkGBcsolZKJ7iJRMkvPFU5mmliCU456jwCmHFjn5rGMg72l2U2tYcYGJXevXbUCHsDamdZtFd65eKL2IL68=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr5750929ywd.347.1659705402833; Fri, 05
 Aug 2022 06:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
 <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
In-Reply-To: <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 14:16:31 +0100
Message-ID: <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
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

On Fri, 5 Aug 2022 at 13:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I know this is a mess curently but QOM is full of boilerplate code which
> is confusing for new people and makes it hard to undestand the code. So
> cutting down the boilerplate and making things simpler would help people
> who want to get started with QEMU development. If adding a property was
> 3-4 additional lines I wouldn't care but if it makes the code
> significantly more complex and thus harder to understand at a glance then
> I'd rather avoid it if possible and stick to simple terms.

I agree that QOM's boilerplate is not nice at all, but if
you do something other than the "standard QOM boilerplate"
solution to a problem then you make it harder for people who
at least know what the standard QOM approach is to figure out
why the code is doing what it does.

-- PMM

