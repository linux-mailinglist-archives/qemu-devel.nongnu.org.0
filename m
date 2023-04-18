Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363856E6856
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:34:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponJy-0004pq-Nw; Tue, 18 Apr 2023 11:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ponJx-0004pZ-J8
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:32:41 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ponJv-0008Fp-Qq
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:32:41 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94f6c285d22so154021966b.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681831958; x=1684423958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=49TO8ItszAtZ89NZrK9wB8OA85khJVMD+b8dlN5lUak=;
 b=RV8gbOsFNPawulyJMToS9FTgnwtlaTzo3RHREEPdN7ICh2pJxZafE4lDqIJah/zQwi
 2d3K+jG1KCmuDv3zRjkQ10UMsmXUmZNB9Tj8hOAJxxJuM5rduhTOG/COSAUhx6hmYQQL
 19QmKt/3xdj64Du8IDYUO5YWVwmr7ohXNqB3we5J6v59ojAi3ShHghvxWXIC++9TYhvF
 qSUnxiV99Xm6qRckzMKD3b51c1k+XMIxXXWNNqWZEaxqka9ZYpeJsMT72dD7SOdoYiEV
 swc3Sc7g8vjJ8oyRmlV+O+lUmcrOT6yxj/xz8ZMlCZ+xvZzaEfJvO8IS4omSq7ifChRc
 bScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681831958; x=1684423958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49TO8ItszAtZ89NZrK9wB8OA85khJVMD+b8dlN5lUak=;
 b=N5+Dt/BY+aenKXNm7H4f6Wcvy/+GbsPo21mO9j7034tmgf9l1SSso/KIwJM4BjlHTv
 g6zNyPrfvnAu4ubRbuf5Ek6MCufZ32/JO00OWLBde67glXvs6IS0Nfb+kS4CxmoMyjMA
 5jeg9mncEJpetbK0hBKy6j7233wx6CDN2ejuED8htqO57kqOhPE81JlbWDF/+ywc72Wx
 Aq63Eukxsib1hPSofOw3NjQQnYNgCcKKYcbSx4cL2iu5aUtFWcu0CaTB7U6of8VPZSyq
 hKQ558EdhCUn/Mo5ko/C9udpuEeHCaFbOSHc/QhVjJYtoVxPMHoUjTuUNv1NXN60Fbzi
 99xA==
X-Gm-Message-State: AAQBX9f5OQZf1zahl6VV1z50gvZzmfCZBdvEFH5hI3glAaE1uHxw4aav
 RgIyK7LyrbWxubkiFywxuC5z+ae+e7uPZavDSrAIpA==
X-Google-Smtp-Source: AKy350ZMrnEhxaFfuord6fZdqpUIgFnEx4t0YxFmqVsFmnnBrFg1OQLIeyiKQHSz12a14fs61it7iUqf+iy8BNazzZU=
X-Received: by 2002:a50:d0c9:0:b0:4fc:fc86:5f76 with SMTP id
 g9-20020a50d0c9000000b004fcfc865f76mr1395747edf.6.1681831958026; Tue, 18 Apr
 2023 08:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
 <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
 <79e67479-6785-c064-6aae-edd1ba2327cd@roeck-us.net>
In-Reply-To: <79e67479-6785-c064-6aae-edd1ba2327cd@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 16:32:27 +0100
Message-ID: <CAFEAcA-tOt520nfNdHyGV+0PUvGdw2o+yfpv95cQDHPDJnq0aA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 18 Apr 2023 at 16:18, Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/18/23 07:46, Peter Maydell wrote:
> > I guess I don't understand what the topology is for these specific
> > SoCs, then. If there's only one master that might be connected
> > to multiple PHYs, why does one ethernet device in QEMU need to
> > know about the other one? Are the PHYs connected to just that
> > first ethernet device, or to both? This bit in your cover letter
> > makes it sound like "both ethernet interfaces connect to the same
> > MDIO bus which has both PHYs on it":
> >
>
> Yes, that is exactly how it is, similar to the configuration in the picture
> at prodigytechno.com. I don't recall what I wrote in the cover letter, but
> "Both Ethernet PHYs connect to the same MDIO bus which is connected to one
> of the Ethernet MACs" would be the most accurate description I can think of.

> Each MAC (Ethernet interface, instance of TYPE_IMX_FEC in qemu) has its own
> MDIO bus. Currently QEMU assumes that each PHY is connected to the MDIO bus
> on its associated MAC interface. That is not the case on the emulated boards,
> where all PHYs are connected to a single MDIO bus.

So looking again at that diagram on that website, I think I understand
now: for data transfer to/from the outside world, MAC1 talks only through
PHY1 and MAC2 only through PHY2 (over the links marked "MII/GMII/XGMII"),
but the "control" connection is via MDIO, and on these boards you have to
configure PHY2 by doing the MDIO reads and writes via MAC1, even though
MAC1 has nothing otherwise to do with PHY2 ? (And MAC2 has no devices on
its MDIO bus at all.)

> Userspace, when talking to the Ethernet controllers, knows that the PHY
> of the second Ethernet controller is connected to the MDIO bus on the first
> Ethernet controller. QEMU has to be told about that and otherwise misses that
> MDIO commands sent to the second PHY (on the first Ethernet controller)
> influence the second MAC interface.
>
>  From this exchange I can only assume that my implementation is unacceptable.

Not at all -- I'm just trying to understand what the hardware we're
modelling is doing, so I can figure out what we "ought" in theory
to be doing and whether that's too much pain to do right now...

thanks
-- PMM

