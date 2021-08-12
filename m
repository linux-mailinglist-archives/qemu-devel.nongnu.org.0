Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB43EA4B0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:28:59 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9pT-0004i3-17
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9of-0003XK-RF
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:28:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9od-0008MU-Ha
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:28:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id d11so11202404eja.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/kJrcZs7jmV6yVYAo+PNIHT3K8AcywMMaiAHPAqpC8=;
 b=Qdny8TmWTa5orkrXSgN90LbpC9POzMSDkYtAE2zSFX3u4KF/d68WwexEvUx0bB9LHD
 PMndETQKoSa724j8Zckv5rrXVPpPoIpSFSdpSsU0AQCvnVF8+4mrLDgiAvKQ55M0bzWl
 za+3O0osv7595763G8wWeDZXUOfYLgQH7wZ8qoGizr8PIhggAb09N3NVzJMzWF1Im1Ka
 /DxkoaLF7NA+oyxLJKHbcI0hRO1PsNCObSraXJMIfM/6dNfs+eB7v5nbh5LAJ1Xcz2t3
 +9i/dofd0aHy0IFxRcCwJ+v2u9jbTN4XmBIABFkyBWz/++Iywr1TFSMc2lQtc4lmxaJC
 Fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/kJrcZs7jmV6yVYAo+PNIHT3K8AcywMMaiAHPAqpC8=;
 b=YVvUar483MSluDBnowtJ4GdXX+iim0PkYh11nAHFyxCbCPMVc+0k9wtqLTlU63D7nF
 Ix52krKXrBeOJjOfrfOpNXpctChTE56SKmvEeDK4bMXsG898A+xPATAYuvlNOHfKITGD
 61IGqyFfzUfER9wmCSqN8pIU3wUR9mfC2rucqXU6ybZ6aXbkNS1b8HraN+V+FfAybm9z
 mDdV5Lb38rtwdB23lzT3cn7y8oa+HyXBFap12V5JozG7yzNjO6T+TH+3leX4fuvDBTJZ
 rX5PUCz/cN3v6eIlAmxRPzJnNaHmlRC8R8fNYL/PnpRu2P+WhCVkFaYxcLEYjF6CA2Py
 TuIQ==
X-Gm-Message-State: AOAM5309PUqcXpyIrS5Rfi8y+lXijQGtF/5+JmW5oKn5KwL5nxDuEgUD
 2MyJ3lPrOepdp9K3HB9t/euW4IRdUn8/qx5PjQujQA==
X-Google-Smtp-Source: ABdhPJwh6FzLU8SMOLlO6G9OWsm65vY/a/RyIwB7lwy09LVQBgVZvHo7TcVKuLv9R1uVsaWQWS/hWISZzUlZS2LgIwM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3357736ejy.407.1628771285564; 
 Thu, 12 Aug 2021 05:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
 <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
In-Reply-To: <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 13:27:20 +0100
Message-ID: <CAFEAcA9PWpMpPxsETpSM75ZjDrDsUaNFUgQC6cPJC10JM9aq6g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 13:13, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > In the realize methods of the stm32f100 and stm32f205 SoC objects, we
> > call g_new() to create new MemoryRegion objjects for the sram, flash,
> > and flash_alias.  This is unnecessary (and leaves open the
> > possibility of leaking the allocations if we exit from realize with
> > an error).  Make these MemoryRegions member fields of the device
> > state struct instead, as stm32f405 already does.
>
> There is a typo in "objjects".
>
> This is something I had issue understanding as I was seeing both
> patterns in the codebase, thank you for making this clear.

Basically if there's a struct that the MemoryRegion can live
in  then that's the best place for it. For some board-level code
where we haven't needed to subclass MachineState there is no
convenient struct, so we just g_new(). In a few places like this
one the board-code pattern has been copied into an SoC object.

-- PMM

