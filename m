Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A5F3C5DF6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:07:44 +0200 (CEST)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2waw-0005z8-3r
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2wWU-0003Ge-1R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:03:02 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2wWR-0006J8-Nu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:03:01 -0400
Received: by mail-ej1-x632.google.com with SMTP id i20so34808569ejw.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hD8eEEhl0gf0c8FTo/j4mZpa3IL0vB//sj7qPPdpJlM=;
 b=WwRdNsYNUKMp0NgAZ2e2uOpnxGrCshpK9AE+9j2vr5Jzqhw2JQra6uwuWSXZWsKCBE
 BkuAZqmO37Sc2rezQXPVoYnh9qKJq6pzILJS+QczUgHlBA1tDxR7zIK2koIn7kfI5+Ce
 6LfExeNxYC0fVDYZuYWwxzE+eOETaCpA9K0UAW51UVmSjZqdl1YjPPp8Bu+wsaJd0sg2
 JIDctfHwGK6mjtEJy7GyNauDVdyoTBXuRBoDZ4E2wdy8NR7PaiZYToOWuUN8uJjFme2e
 Nr7qlrnnLSJ9idsjAY6kNpcP1zTzHlo4bwpKyAdzvqjD8DgUhY1Y7isSyWvWrumsN3oK
 ERlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hD8eEEhl0gf0c8FTo/j4mZpa3IL0vB//sj7qPPdpJlM=;
 b=TVWE+h6i12Qp5/q2Wq7nHlwZTXNAFOKFy/nfO1Y9RvuMUO7jQiUApxhophEWiNuz48
 xyRVsDX6PV3bbuksAHCXg1hcYxEP9kycak9gOu1ScklVcTDHqL9NB7sTujaE/LPEipae
 R/cnxG+iaZW7GU3j21ohrKV7YijXIcscNZod6rKfI0wOAdzHd4sZE1tSDlfAH81Y05ZV
 l3tsqixKzYxi9wpEGioEpr/52aGXNfyUzuYdo10NMfaKwvPv7GhREp1lT6EIFtaCL9P0
 M9K0HzgDCjyoTw8ifhK3TXXfpao3ulfE2jVDNG+fByLvbWIxUtRi/6f6x2/Y/d7YOBlA
 SSMw==
X-Gm-Message-State: AOAM532xQGUi0BTWUy2iLZKPZAvmcIi6me0WAbJxFzUOs8tQJsPUwt9u
 DRtR6FKsjlu7ZM8h/DqwAuVRvMj8y4ReH1zKcm6z7A==
X-Google-Smtp-Source: ABdhPJy8YftxIa4tpNOnBXshcm51xZzOn54WX7lZZR0AL4+JXAhIQCYIoWqCifp63/xi7xy8pnY4KHVWC7ozxEvypAg=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr51778533ejc.382.1626098576526; 
 Mon, 12 Jul 2021 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
 <CAFEAcA_L7nrw4zBV7pKYcV+H+4qJT60PFkJYA_w-8FSwOqNmXw@mail.gmail.com>
 <CAEnQRZCJC4WmrGy6NnMmwUkscjn-HcOQmvni580t58b4s7pFKQ@mail.gmail.com>
In-Reply-To: <CAEnQRZCJC4WmrGy6NnMmwUkscjn-HcOQmvni580t58b4s7pFKQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 15:02:17 +0100
Message-ID: <CAFEAcA-ZS0anZESVD0+bLE23K6Z_TSS-=NqRZGsK-buQ9OTkyA@mail.gmail.com>
Subject: Re: [PATCH] hw: timer: Add i.MX sysctr timer implementation
To: Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mancas Viorica <vioricamancas@yahoo.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 14:58, Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Wed, Jul 7, 2021 at 10:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 7 Jul 2021 at 12:39, Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
> > >
> > > From: Viorica Mancas <vioricamancas@yahoo.com>
> > >
> > > The System Counter (SYS_CTR) is a programmable system counter, which provides a
> > > shared time base to multiple processors. It is intended for applications where the counter
> > > is always powered on, and supports multiple unrelated clocks.
> > >
> > > This system counter can be found on NXP i.MX8MN.
> > >
> > > Signed-off-by: Viorica Mancas <vioricamancas@yahoo.com>
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > Is there a board model or an update to an existing board that
> > would use this device? We don't usually take device models that
> > are completely unused upstream.
>
> Hi Peter,
>
> This can be found in i.MX8MN board. Should we add this patch together
> with the upcoming patches for i.MX8?

Yeah, you should start with a board model plus a minimal
set of devices as the initial part to try to upstream.

thanks
-- PMM

