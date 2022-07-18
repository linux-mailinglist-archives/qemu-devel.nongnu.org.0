Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEAD57800D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:46:59 +0200 (CEST)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOHC-0006Ue-Gm
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDO92-0007nx-3Q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:38:32 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDO90-0002SB-FY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:38:31 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id i206so20028251ybc.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rL4zHHaVlPgCZ4/qggrkbdJg65XrBOsNmaed0DC8l5E=;
 b=SoyURsevO6Mah/hjFYBFhpX5yzTNRv+tynSgQclFldJm5heYoL76IeGHmJqQZkQD/N
 POZbd1QXpxcnujzwYMrUmCxzdrEVf6YduwMqjKEY2JuxKFVarFetD3Lkj9RmxpzHqWJl
 UAiHAJFq7QQojyBN26ZBHpC7wUf2j7NZVR4vAzXadRdiaHZpnNAKQnxC4ctWCwYJLxer
 3Cah4W7Iocem+BXZ4QUABqs/Dhg+KzayLNTK0jzVbQWlCho/qtCPUXPxWDX8gZg7V+TO
 jkY074H9OOYcNueENSWQ5MUUU5577wTnrfm0hmDGoW6InHGvCkvcWQfngwLBQknV81xl
 BgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rL4zHHaVlPgCZ4/qggrkbdJg65XrBOsNmaed0DC8l5E=;
 b=bumq4YDHwWM9kfeH2w16RpCrvCYkwWVQQlQewE0NedoQiVT627+bnaOBgTZWAMPch2
 TsdCDOZ8vRgCd51JyICiBjkAjqDa6SyJgl8sXtyoL4rixfcC73GBlT7V+bY92BQFh3tB
 oWx3BeYeGFtijuC51cLJbk5OI7RYmYtmkPviJm+hhw0Ojcpz0rkTGKoD8jfpF5XmqQci
 hclVTu4u1PHebRLPalaUsnXp9ZpSSTi5aj+DqOlAUEJ1bMus9qhBCVPobVdcPX/GWaYN
 cX4i2sLp9xFZn/3bTJr0fhNi8PKhPD5UFiO2wGsuFlw3xotAXYqr8C1PEgq5+V3H1ABq
 oFtg==
X-Gm-Message-State: AJIora8I7AAVMvdXllphXOQbQyp+DDVGoBtJ5p9k0FhMhyPR4wt0+z/t
 yM1D8UW+gRll+zylnJQkPVkEXCl43rHLF2/45pL0kw==
X-Google-Smtp-Source: AGRyM1u3apg6NT7oul2SJRWrHjkJ/R4Tx5dE71ufIRF+lJJaNZVB1TvqVNe/1hvX0yLMU3ixhN852uBkvNKhvzIhF1c=
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr26931443ybg.85.1658140709424; Mon, 18
 Jul 2022 03:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
 <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
 <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
In-Reply-To: <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:38:18 +0100
Message-ID: <CAFEAcA-2B7F7zzvSVnfvCzR__vUOV--DPJS-42=fmkLpdzy_NQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: designware gpio driver
To: Ben Dooks <ben.dooks@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Mon, 18 Jul 2022 at 11:25, Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 18/07/2022 11:15, Peter Maydell wrote:
> > On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
> >>
> >> On 13/07/2022 18:20, Ben Dooks wrote:
> >>> A model for the DesignWare GPIO (v1) block.
> >>
> >> Is there anyone else who should be reviewing these that
> >> was missed off the original list? I'd like to get an idea
> >> if there is any work to do. I've got a couple more drivers
> >> to submit and was waiting on feedback from this before
> >> getting these submitted.
> >
> >
> > My overall feedback is: this isn't a pluggable device (PCI, etc),
> > so what's it intended to be used by? Generally we don't take
> > device models except when there's a board model that's using them.
>
> I have a board file, but that's currently under NDA, so we're not
> allowed to release it at the moment. However we've done a few drivers
> which we'd like to get out of our development tree which other people
> might find useful (GPIO, SPI, I2C).

As I say, we don't really accept those, because we have no way
of testing them upstream unless they're used in a board file:
they're dead code from our point of view. When you have a board
model you're ready to submit you can send them in the same
patchseries as the board model.

thanks
-- PMM

