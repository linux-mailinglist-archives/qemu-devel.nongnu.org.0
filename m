Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A331D7CE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:03:20 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKc3-00030e-NN
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKaR-0001rA-Tj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:01:39 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKaQ-00017o-46
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:01:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id do6so10927259ejc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 03:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OHycQnPt+4r0eUQpR9pBEIaQWco/NSKLSg6/EVvUmNQ=;
 b=bkJoR5ZQoxzczOgXxytjJ7TaQt1BRiQaBiqtZUQAV+YjHRCKuV3s8V+V9gjA1+jHj4
 EOyoQj95wTjqg4OS8O2LOuJp5fPVCrhUPNveOeaCeKHEXvC8kVR+kx1AjrA60QHRuuNo
 VWpEG8bEJ7dYpLhbg58vmZ6mx4NvYU/2KTrNrXzNcdyGsj+ILvUKWUQZ1YUIvnHffRgZ
 CdgjMPoP0c42acbhqbU+W9fDh1nGlS9n8jkrotBHQeyUMrYl1XCKDBvhQ7b0IPpPvZzQ
 382wHPzqcp9c1XCj+l6/tQPV28yg8Zuo1+8T4BxMcPVJeF3EqYEJf+5NknNRZ4sz9A27
 crIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHycQnPt+4r0eUQpR9pBEIaQWco/NSKLSg6/EVvUmNQ=;
 b=Ayj7kfcXVTunR4tScWKfZ7jZFgdhWIfx2N8XmJrvzWcSiOk4w8lOmkQ2dBUjttIq0t
 wq9ekwsccJYMLdp9NGVR7sxA4x/Hs+2jvNF67R4Uv5ipqqLWWwqxqnYY0ApaH+V+cMaY
 E9/3A8AtYJ0YqJW9tUPeF9F7RvIHOJLXT8f+pkYVnXsnGYZBwwpBd+EgGOhQRuXWmfKK
 Qs7MlMKrjPFiOcIzxU2yT7QKOy/ZCg7sATRB8U4vxMf/EC9YT/hvJOdO+83zQh+diHUT
 PMzqsl/JJQC5BLPbz1kH87Cxy/oR+kIOYm6tDboyS8q/3moVdRfyqHk/VX+o/2MJXgrb
 2PKw==
X-Gm-Message-State: AOAM5317TNrfiUrK97Nyw1MShaOEtKnYZCSZTLRQSpOFQN/avA6Nmsva
 FpCNCdV9Q31bV0nxq67jNZS46+umUkOlp2UGv2XnZQ==
X-Google-Smtp-Source: ABdhPJwDAW8p6EI3+JtKZ2jQpRtmklQMpb1+nq3YFH0qctimaHPSuwuqtu2vY+0sDrVNJNJVlF8RlZZphUVGOb31kNM=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr25146396ejh.85.1613559695850; 
 Wed, 17 Feb 2021 03:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20210213002520.1374134-1-dje@google.com>
 <CAFEAcA-5LdAO+m8enMxxUc7TczrKV407VGCt4vS5PS3jdDr2XQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-5LdAO+m8enMxxUc7TczrKV407VGCt4vS5PS3jdDr2XQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 11:01:24 +0000
Message-ID: <CAFEAcA_jUD6u1hn-mmmekE0nzgWSCO-uR=rWemt2dYsjcGUYUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 14:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 13 Feb 2021 at 00:25, Doug Evans <dje@google.com> wrote:
> >
> > This is a 10/100 ethernet device that has several features.
> > Only the ones needed by the Linux driver have been implemented.
> > See npcm7xx_emc.c for a list of unimplemented features.
> >
> > Doug Evans (3):
> >   hw/net: Add npcm7xx emc model
> >   hw/arm: Add npcm7xx emc model
> >   tests/qtests: Add npcm7xx emc model test
> >
>
>
> Applied to target-arm.next, thanks.

Dropped again: it failed some oddball config in the gitlab CI:
https://gitlab.com/qemu-project/qemu/-/jobs/1034174731#L12

-- PMM

