Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A04A61A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:02:28 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdGZ0-0005w2-To
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41943)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdFOL-00010u-7L
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdFOA-0000cV-Bs
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdFOA-0000a7-1P
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:47:10 -0400
Received: by mail-ot1-x341.google.com with SMTP id r6so15067488oti.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CM2l+0mD9tyQ0ZlijD1jvdtcyKrRsOsYT2OndT2Y20=;
 b=YpU71m5o43TJNxtBJ6bOQnJhsnD4VViaczgKKYzhS1zSO6Wyrkci13fVBAEsXjjXLo
 yHF3n8klMa6SKVRwSJEAOneyHyuPQPK4X/JTpttKcrzXe9YXGPfthqgTgdZqg6G7SvdM
 mJvlULZh4+7VYgC3VWtRGi8nE4Ue3T355ClL0bBZSsvx0h6IBBat3GGpVoKY9WAO8rGq
 AbxLc3+h4X8nDK1ELSFnX9dxjeh2S9WlOIGnlUTLgpBg6cSz4WaErXLflcmqqox/+Mob
 xWDtU/tgzrmvOpnS7MpiXbkxJurZk+88v35jKqZVPSv+U9FqExmamDrRGfqIL5QXKuXq
 5pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CM2l+0mD9tyQ0ZlijD1jvdtcyKrRsOsYT2OndT2Y20=;
 b=gQ2mRA0YdqvPzrOmZNUv2i3Uq1hM2kCNaE1qp7kc7mftrXv08mq9BBZl2aNNqBTh9Z
 81jLQYBBNWtStQvSGObEo3NWoPXCqRvaUnlZquF0TFT479dDe1Vqbp0YBRhH/TIrw8f/
 kfLeb+2eF/Fkl6w1VA2Fcv6/IlEAEcTMkczyL14HsrOeKlC1awbUjRM90lpGCQF4iu3Q
 jm0CICO/+Sspb8nPj2SPONQ5UpXCar75v9XxchlOJ3aNdHTi0kpOaYOlXpnNGP8soQaI
 DQpZemktKYsIjWrazc240DMUzKDBBVau+LISfPc/HViM1WD1IzjPsI5oSYBo4nhC3nHZ
 eZjQ==
X-Gm-Message-State: APjAAAVFJei4aPvYGMq64ZJ5LV038oQyPaILg4+gAwqxMADF0wFzPEVy
 E8/OJsFpidDpZETdeSlmJbUwInlsrNUA8e23mHsSgA==
X-Google-Smtp-Source: APXvYqzb0aXooI7Tfjs9xWNahpNg4D8iA2oYY7uL469FT9wyEQObK52Uypae2WmwhI+kj9GJK8P9dQBif1X3mCB/EZ0=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr5564260oti.91.1560869227248; 
 Tue, 18 Jun 2019 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190617160130.3207-1-peter.maydell@linaro.org>
 <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
In-Reply-To: <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 15:46:56 +0100
Message-ID: <CAFEAcA_ZJhhWrV1bKfXhTOAmv4kmmoRg-GmqY_ST-Jf4Uf9Ntw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] target/arm: Check for dp support for dp
 VFM, not sp
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jun 2019 at 20:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/17/19 9:01 AM, Peter Maydell wrote:
> > In commit 1120827fa182f0e7622 we accidentally put the
> > "UNDEF unless FPU has double-precision support" check in
> > the single-precision VFM function. Put it in the dp
> > function where it belongs.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > I just merged the pullreq with 1120827fa182f0e7622 an hour
> > ago and then I spotted this bug in it...
> >
> >  target/arm/translate-vfp.inc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Oops.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to master, given it was a silly regression.

-- PMM

