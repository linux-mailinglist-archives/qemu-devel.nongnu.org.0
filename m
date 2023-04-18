Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357B6E60C9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pokAB-0007O6-Sc; Tue, 18 Apr 2023 08:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pokA9-0007Lf-8J
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:10:21 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pokA5-0007vP-0f
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 08:10:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so23926337a12.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819813; x=1684411813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yDtHyI1vdDXmzca8rziKF/Nl5eBqsY+fp7mj7ylUhP8=;
 b=A4XcKZBEEAsqX2cbgqyv6N2z0sBgSzWYhcI8V+y1YMyUXUv8NV6lqI2R+N/EA4Ka+5
 T7cOcKs9hJVO/FaSznoq7lE7Pp+rIAsyECpabkaNmWhGnQ+tZu2orWl8U4idj7IiT/Kh
 qSf6YP/dvXrpcsB8FLZjdSjSc9ZrZyVVUQEFR5TldIO+KgHtYgDOrEPgtVpT3iekupG2
 ONBqqxxBV5RWh512kEJeYNNFn1ZRZXPtF8gmmt0CuxsOP7tAaz+4Kj3N4Ugcr27KFxtK
 hGOxj1UQVOaSGW06soTSp8sAPe7fP3a3rAhnv0MbYnYBikFdIAHLg0Q3KT/dZ0R6n8CR
 uH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819813; x=1684411813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yDtHyI1vdDXmzca8rziKF/Nl5eBqsY+fp7mj7ylUhP8=;
 b=Uj6os+Gh1qEYZt8/0uNOikgpogaW1DE5h0admtuWFB7D83RATHFNMqIFE7+JTr9V40
 D9ZNrFk0kNfaJb6vcF+hzgnQUdmmQ+LHDHDjIfvsLTonYQizJ+rhACp6wedEX0C/hE3f
 aVi4j2Oue9TdGwTqhZhIMdUjI9zXLSWworjBBTu2APHOpH2AFir7oem6L/HPNLpcMeIk
 3LaoAGSt8+sGFpcVdACmyDvbdOTon6Ii/F4V7XeDpQxVdKcy9G6pIcD/yIxvo4uf53M2
 DjB8v1IF1yxnQBEWs7QxvEAiFaRgXizQ+Cy/2YF9IEOk3uiWItaSkMDgbUULX9A72SCQ
 gA/Q==
X-Gm-Message-State: AAQBX9fKnUhPw9qOTHRptyHeKOCFSaK+NHC8srxN40LYEMG++CNoXBcr
 HweKWAyBzZxq98YYiX54BWpg7wtZjuh4/tAaDp6IkQ==
X-Google-Smtp-Source: AKy350Yr/TNQfRj1mihJ6gVsu/cXnwrnnpZHrGoXffpl0oZHqDNym0yyeuTM6snNKsZqxxgPkDbiskOFYBT2w+F3u2M=
X-Received: by 2002:a05:6402:1e96:b0:506:bdbc:e59f with SMTP id
 f22-20020a0564021e9600b00506bdbce59fmr1075943edf.3.1681819813149; Tue, 18 Apr
 2023 05:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 13:10:02 +0100
Message-ID: <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
> be connected to separate MDIO busses, or both may be connected on the same
> MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
> property to the i.MX FEC emulator") added support for specifying PHY
> addresses, but it did not provide support for linking the second PHY on
> a given MDIO bus to the other Ethernet interface.
>
> To be able to support two PHY instances on a single MDIO bus, two properties
> are needed: First, there needs to be a flag indicating if the MDIO bus on
> a given Ethernet interface is connected. If not, attempts to read from this
> bus must always return 0xffff. Implement this property as phy-connected.
> Second, if the MDIO bus on an interface is active, it needs a link to the
> consumer interface to be able to provide PHY access for it. Implement this
> property as phy-consumer.

So I was having a look at this to see if it was reasonably easy to
split out the PHY into its own device object, and I'm a bit confused.
I know basically 0 about MDIO, but wikipedia says that MDIO buses
have one master (the ethernet MAC) and potentially multiple PHYs.
However it looks like this patchset has configurations where
multiple MACs talk to the same MDIO bus. Am I confused about the
patchset, about the hardware, or about what MDIO supports?

thanks
-- PMM

