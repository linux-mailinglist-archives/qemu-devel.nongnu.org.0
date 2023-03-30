Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF936D0B54
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:32:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvBS-0001EV-Vz; Thu, 30 Mar 2023 12:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phvBP-0001Dh-UM
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:31:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phvBO-00040h-72
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 12:31:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id h8so78784445ede.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680193884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8PNdonIV4iHbxLXT7tt0I71+I9CCRTsiaRCVsBkuP70=;
 b=pSn73KTmGvkY6SCuQt/pKKxqb05gX8e4/U0uc3TEHST1n3xWHWtde+6IAvXJHVyDHf
 tkp9N6qPoHdLBG28yICxbXsBOLivf6X3al5ZqkgcoVd0T4LGO90kNJskb5JRNgNykMcb
 mC7jlOV6eD6geDJtQMzE9nMubbmz5nK3e+CvzHp0IToBmrTxDw6bwOBRHq6ptNDr64Mr
 rORbe1Y+cD52snZBFgxhEXELZ7nnvE2TxMbILQZ2QGZC+698s1pZH6lr3TiJpkvQiYYl
 RWj9ZodvbpNs53sfy6a47NziHHwOyj8pkNBOV090jWwgIY6q1w4TMy0l063Z6Mzv2nuT
 4XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PNdonIV4iHbxLXT7tt0I71+I9CCRTsiaRCVsBkuP70=;
 b=TRV8ohgEfAbjzVJqA8F+djyh4gMwxIjrjx55I5yCRHwWg5KZhR2P86OU3OMq3cS5ka
 MBpAf1/lPLIOC6pXgcBd0CfD8+jvvFXo45EB+3+bIrv2MxjiTgLBJk4SqOlXVdLRiyUI
 EDCFw6Gevyh2TR+dT6ZQK8pK3m2rf/f2f2Bjjzkdzz45LjJmk6UUWQrdDV0WqTMCcvU8
 ddvCriBlOgJAhEkr378XI7pERLeeXUcunWuANxJzpwqVODkofvNN0LGHzgqCGFdQH7+p
 MkKMEkz/F0gFl7XjGDChuiNLHmWFy2UxOq3JutKN8S3LaTVrWkU+neSujQVeZSzhx1xO
 yRAg==
X-Gm-Message-State: AAQBX9e8tsKEJ/s3AIBe/RqzFkOMU0nEhIAvqxY68R3XSXxECwruJ1rn
 +Lrnxpg1J7qnHIRdbBbMpBk5gGEn45yWMf15wp2kCrxTRbL0b1iJ
X-Google-Smtp-Source: AKy350ZftjCm9QzbdSE9r5nLD9HacKbbyBZ8FfEnfpnMdb4e12N6C4Gf20wRgbEm0POJG8pOXvK6uL1GIVx8XzfwpCs=
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr12145665ejc.6.1680193884087; Thu, 30
 Mar 2023 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <20230315145248.1639364-2-linux@roeck-us.net>
In-Reply-To: <20230315145248.1639364-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 17:31:13 +0100
Message-ID: <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/net/imx_fec: Support two Ethernet interfaces
 connected to single MDIO bus
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

> @@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>      uint32_t val;
>      uint32_t phy = reg / 32;
>
> -    if (phy != s->phy_num) {
> -        trace_imx_phy_read_num(phy, s->phy_num);
> +    if (!s->phy_connected) {
>          return 0xffff;
>      }
>
> +    if (phy != s->phy_num) {
> +        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
> +            s = s->phy_consumer;

This does work, but it leaves me wondering if we should really
be modelling the phy as a separate device object, so that we
can use link properties to connect the right phy to the right
IMXFECState rather than having this odd "actually use the pointer
to this other instance of the device"... A quick glance through
the code suggests that the phy and the ethernet controller
proper don't really care about each others' internals.
(imx_phy_update_irq() does call imx_eth_update() but AFAICT
that is unnecessary because imx_eth_update() doesn't care about
any of the phy state...)

thanks
-- PMM

