Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB45AF32E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 19:55:43 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVcnW-0004x1-U7
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 13:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVclz-0003Hl-ML; Tue, 06 Sep 2022 13:54:07 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVclx-0007Ea-4H; Tue, 06 Sep 2022 13:54:07 -0400
Received: by mail-vs1-f44.google.com with SMTP id c3so12467184vsc.6;
 Tue, 06 Sep 2022 10:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u55wOhmagVzyMeGKyU5rGsL8UbtxXQtu4xUjFY0YLtU=;
 b=pElFSl+D0AoeUgn8r6BeySNcOS+lJ0SEIas0p52BrT7qXCfmN2tBZ+PFHzreloxzZs
 NrbRpNM4V9RnR9VGa4+GSQiXhwCPBd7DdP7nXIt8nYz8U9rC4dVo7cJGpZbvTS5B+I/v
 NFA1aMJjnBu8/llHYUn1BSUutaOG20BXKH5lHNYFYpq3ThFSrcHRe+m6weiSZA1I7MQf
 WoCndr/AE1BpCP7IbDgpXnUKazPLMpnciZi4oUu1ry/96WFIduMIq2bOX7GJ+0wHv3Lx
 cqACPVJXkNBja1EY4P4+5hGBiNVq6mZ2+TiRA5V88JZFrJPUQWFq2vD4ZTATV/M5loRW
 dCBQ==
X-Gm-Message-State: ACgBeo3nzuxDGP7ouhufngb1uqDT7eQ8GYg3ASYkHA6ECLq4qDSyduDS
 XnE3lIWpRU++8BLbsm5BC+5ri/DuKoeM6gGd0G8=
X-Google-Smtp-Source: AA6agR4rq3aiLa1GpvJpD4K/pOLyrdhlA1pZhHmGqZDem7UdVCdXUZvlq4CNOTUlwjkkAIGkoo+0IUek7lrGi+vE95o=
X-Received: by 2002:a67:e083:0:b0:391:df54:ed3c with SMTP id
 f3-20020a67e083000000b00391df54ed3cmr12523360vsl.45.1662486843833; Tue, 06
 Sep 2022 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
Date: Tue, 6 Sep 2022 19:53:52 +0200
Message-ID: <CAAdtpL5Agv1N4rvOBuibaLrBUcM_m6DbC8nVhy=bx9Yy=McbDQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.44;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Sep 6, 2022 at 7:23 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0) as well
> as setting the IMPDEF revidr bit to indicate these flushes are not
> needed. This cuts about 5s from my Debian kernel boot with the latest
> 6.0rc1 kernel (29s->24s).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Arnd Bergmann <arnd@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

