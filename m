Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ADA6E6767
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 16:47:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pombe-0006Re-A1; Tue, 18 Apr 2023 10:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pombc-0006RN-RH
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 10:46:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pombZ-0007Xi-SH
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 10:46:52 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94f109b1808so239550166b.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681829208; x=1684421208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xGSnephk7yGNx+eOoVYchkNcgUbIw9bj/YqG7sC0utE=;
 b=L7WIg9ElBozqmcZB8JVTzq5cKfIgqQ1MgaxS9Um+nbqyKHSnG6WG64epjxvxbybXvB
 Pb9eaCnAp0w8lCvFJdxC7Gv/4cdzYAACR2D1e/Y+XTEy3SCt947A7N+UN/OqHkm0EdOh
 dd0xeEyrfBOgXjrWjxe7JgJdSdUKHgVe+ziyRg4CIfAYioydKBEBmX9jqMgGvWIr/L/3
 Td7fZK6uU2Gaj/ZHzM3IaitXa+4fOG/OUGbjXxQyqvI2VUphUq3ppieasBZ7kIhTOnn0
 hgWuDINiPlCUOBco9rqEIdw7jt4I6RVxVisDtIqZKd8301ZNwo0fqvztFGFyp4QkpC5L
 JoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681829208; x=1684421208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGSnephk7yGNx+eOoVYchkNcgUbIw9bj/YqG7sC0utE=;
 b=OcXAHwqz3/Oar/LJ3uqWAWZJmS+289n1DfJP1+exfmwjLnTUeZZ6Ev3SAcdGrMuhJK
 nbuprla+BlAOCkrG2iOdBBDP9aLhEfq3dk3AwraLw3QaWr5uthMjgSAXnfom7H2ukQjA
 z1+ithIMFj9cLs77PsFD84bbQD0Bl5dJqqqxsjOeR5HqnTT8OWwLmg5UFoN83/y45uPt
 ja2SeTCpLkDXKmI3C7kTZsyIIShYHnuqiQ1Ui0w728yxQGpyTnhLWaFbdNPX98CEwlQw
 mrZ6G0qTfRknnvkR25uqoUVKlvcllHBVa6H+z5OM0cZDrTHH4csKBIXWAQs/1e9GDjKO
 MdJA==
X-Gm-Message-State: AAQBX9etcNX0WzCDiMVlBfKrGsv2AhW2QS79tCbUKcjZ71LCHNb6tCO6
 X7kKb1vVy+JrtMPWB7SqS67mODUcDrhqyYjZDyaZug==
X-Google-Smtp-Source: AKy350ZPu/Ef9Q/cJdYcgeQXTBO9w563a/RoZ5BbEHrmEzzyGJa+bDe2+YK2jAgCQd9r1CocRYoLtCP53BmhUBGOyVg=
X-Received: by 2002:a50:9fc7:0:b0:506:8d91:89c4 with SMTP id
 c65-20020a509fc7000000b005068d9189c4mr1277922edf.6.1681829208192; Tue, 18 Apr
 2023 07:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
In-Reply-To: <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 15:46:37 +0100
Message-ID: <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 18 Apr 2023 at 15:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/18/23 05:10, Peter Maydell wrote:
> > On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
> > So I was having a look at this to see if it was reasonably easy to
> > split out the PHY into its own device object, and I'm a bit confused.
> > I know basically 0 about MDIO, but wikipedia says that MDIO buses
> > have one master (the ethernet MAC) and potentially multiple PHYs.
> > However it looks like this patchset has configurations where
> > multiple MACs talk to the same MDIO bus. Am I confused about the
> > patchset, about the hardware, or about what MDIO supports?
> >
>
> It is quite similar to I2C, a serial interface with one master/controller
> and a number of devices (PHYs) connected to it. There is a nice graphic
> example at https://prodigytechno.com/mdio-management-data-input-output/.
> Not sure I understand what is confusing about it. Can you explain ?

I guess I don't understand what the topology is for these specific
SoCs, then. If there's only one master that might be connected
to multiple PHYs, why does one ethernet device in QEMU need to
know about the other one? Are the PHYs connected to just that
first ethernet device, or to both? This bit in your cover letter
makes it sound like "both ethernet interfaces connect to the same
MDIO bus which has both PHYs on it":

>> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
>> be connected to separate MDIO busses, or both may be connected on the same
>> MDIO bus using different PHY addresses.

but maybe I'm misreading it.

thanks
-- PMM

