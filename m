Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E8C1F320F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 03:41:39 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiTGk-0005ri-Ne
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 21:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTCI-0003gd-BI; Mon, 08 Jun 2020 21:37:02 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTCG-000098-Ka; Mon, 08 Jun 2020 21:37:02 -0400
Received: by mail-ed1-x543.google.com with SMTP id d15so2508718edm.10;
 Mon, 08 Jun 2020 18:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JchWu3Nmpi3YL/W95vchMtR9JFZKQQTDuwnTA2bm/mI=;
 b=nJ/15e2mfWjXcC3thZV28PgfbUsNdP/02imftTMICW8kD52ZzFkI8sPKZkSuhKJEp1
 g8m3YorPUgFEy6Pcvb35JpPl4bwzNbhA6u3oNun1oa8REgaV0jUFysOoo2RAYCppLId4
 3qkZDMdeNQ7TjoyIrmDnB25J2fwlvC7hJe9ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JchWu3Nmpi3YL/W95vchMtR9JFZKQQTDuwnTA2bm/mI=;
 b=sYYc1n/FAun/Vocz8SbO95xuyCcLxqc9LnFbYoTQvcZ+4ZNXd3zgICZgCKFlkp9JiC
 mUzI7lx8xysDXuQcrmlvmaSMlckUdSZkFUqskiSH49ZfRNmIeRHU8fWMbARlPVQjd/j7
 BQEwVE9no8dSBS+H2kRPY6MKLbGUSZ9zK01wAKJDjplkoN04dJU2e5RHmfr5UYPE5kbK
 WPEAY00Zd6oYizyR4x5LHSG2z9bM5jAbIJ57+D9ejdkICi+mP0FgsZfPOzokAPyWMR3Z
 uBA/5BcXVtWwWKR7sOi6ckGdjzSZgayVZWPbpT8AwrivsUbLDJiCYEi6YgGFfsl6m8K6
 9W5A==
X-Gm-Message-State: AOAM533U+eIc0Z7IbJzMj/FWGPICi3gXW97fxG7es84LOKmotHu5MNqP
 pPv+noo4enmAUknB/R/lnE6qxHXKLGTXEw4o4/Q=
X-Google-Smtp-Source: ABdhPJy+e5qfIX84ib9plVC02PzZTkCnjbfDg5bPgHLpH6EcVyDvDNH9/y0jJ4sk6ONbS75s+oK0xTOx6mSDz2EOkQo=
X-Received: by 2002:a05:6402:1750:: with SMTP id
 v16mr25353204edx.137.1591666618876; 
 Mon, 08 Jun 2020 18:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-7-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-7-hskinnemoen@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jun 2020 01:36:47 +0000
Message-ID: <CACPK8XeidP3PzyJcqvP3m8xjiH40r08x9MPsEaEvjLy2CLOzCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/arm: Add two NPCM7xx-based machines
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kfting@nuvoton.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 May 2020 at 20:39, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> This adds two new machines:
>
>   - npcm750-evb: Nuvoton NPCM750 Evaluation Board.
>   - quanta-gsj: A board with a NPCM730 chip.

You could note that these are the two boards supported by OpenBMC.

> They rely on the NPCM7xx SoC device to do the heavy lifting. They are
> almost completely identical at the moment, apart from the SoC type,
> which currently only changes the reset contents of one register
> (GCR.MDLR), but they might grow apart a bit more as more functionality
> is added.
>
> Both machines can boot the Linux kernel into /bin/sh.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

