Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4A4AE0AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:24:26 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVA9-0004XO-JB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHTiD-0002aL-0L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:51:29 -0500
Received: from [2a00:1450:4864:20::432] (port=38703
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHTiB-0006gh-81
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:51:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id s10so29301337wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yOYPbYyP+N/026/dWzcpTU6YMu8R/yM1Xc85SfBG34g=;
 b=Kg4DpACe23D/N5DGiffyHx8bpPpLs7Q/HNg8+yuK+7baKenMzZ2jCoV+kx6Dk4yZ7S
 szYL/yojNNsY/t08lK6DXiG6qOy0/JlNUMY4IlzGv8kEf8Aj/quXk3Sn2E2wDhARUZlf
 kKgHPxCrT2/w3/z1rZyvndef7VLXAmPdR81houIXejvi9tC7JHze9GyB/JZcHRULiUHn
 j2CBI/FST7YakYztAoBS/UxMaJ/0SevLa2He3KX/71w0Lk0ytF3nmotFGAmspU4LqKpj
 3YUxAkj/smqh28Ykaf7JQvgiz3n9jTHqd9oK3NiExbeGjuQaLut8BTeXT0mIZp2jXf8f
 68wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yOYPbYyP+N/026/dWzcpTU6YMu8R/yM1Xc85SfBG34g=;
 b=aUW2TDnuGkbuqSBtRbyIdKaDHOIIaMCUztsDlt0VyuWyYOMdfhp0a8qWXLMFM/oCcO
 secUVILAKP1pkmpKpQQ8A/XBmE+cE+QnoETPFliCvVXiuVeSssgAOOYHf/JO2J6n1BXa
 APEuECB4liC+DnAtUqTMHCf9IrwQSCpCL5+bYo8C0xooHvnY4Xr2OH0BiYc6AGCMBs5y
 2unMFgKFeAxvVS8yaPrAaZmmNx4oRIQqC39ZAwGaQfC/942hCsZbFtUu5eRs2dJ91R48
 nzgvCzQrgzAU6qMbwZ8cMqVV9+M0fIvKCE+EEnuLm1mlGXTB5k7z59oa/3ufTQYZIdr6
 hegA==
X-Gm-Message-State: AOAM531kh25WnwRo2qRnpIwU4LWHkoJtOFltEXNMZzac4brfOhDGh5Ho
 HyRbDNtaWORXRQjmeuuDZX74MeIO9dFBmrxIsBJBSA==
X-Google-Smtp-Source: ABdhPJyquj8blWQgIoEcCBDvu7N5tzmych3xX6b0R2oglvpD62pOFWLO81f0Csivm7cFIBbLQiSGKyRCW76pMMZibH8=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4447154wrz.2.1644339085022; 
 Tue, 08 Feb 2022 08:51:25 -0800 (PST)
MIME-Version: 1.0
References: <20220201192650.289584-1-git@rpls.de>
 <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
 <87sft2rxf6.fsf@sit.fraunhofer.de>
In-Reply-To: <87sft2rxf6.fsf@sit.fraunhofer.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 16:51:13 +0000
Message-ID: <CAFEAcA9tefH+dFkKu0pki=aRa71aw0a2V0ndusLqTHX1g89dLA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
To: Richard Petri <git@rpls.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 23:15, Richard Petri <git@rpls.de> wrote:
> And if you still want to do a debug session: I think there is another
> related problem. The `systick_reset` function sets the right clock
> source, but I guess at the time of calling reset the `cpuclk` doesn't
> have the right value (probably zero)? I was confused at first, because
> the reset code suggests that everything is OK from the start, but that
> doesn't seem to be the case. I don't have a good enough overview of the
> qemu sources to know what is called when. But even if the reset would be
> right, first setting the clock source and then en/disabling the timer is
> the better order IMO.

Yeah, there is a bug here. On these boards there is no refclk, so
the systick timer is supposed to say "refclk not connected, on
reset we set SYST_CSR.CLOCKSOURCE to 1 (meaning use cpu clock) and
make that bit read-only". But we weren't correctly detecting the
lack of refclk so we were resetting to "use the refclk", which
is bad because it has period 0, not being connected to anything.
(If the guest explicitly programs the CLOCKSOURCE bit then it works
around this bug, but in theory it shouldn't have to.)
I'll send a patch in a moment.

thanks
-- PMM

