Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF51D559D26
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:21:30 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l7h-0004xk-ST
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kzU-0002R4-ON
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:13:00 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kzT-00041a-7y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:13:00 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317710edb9dso28334137b3.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbDSbubxl3XKcu6DS0t3+SygjIjOCQ84yNRhq13faLY=;
 b=MpHBQSYzZ2PvN6wU4WB2E8T/LWyf9QKS9reFcO3zv4saFsKQ6R8yrecPJVF7n/ZmlA
 u0pKZHIatleFAPH5VOao953O4+OUorlquIqOvanqwgJxOKM6wVeM7pgITVYCorepeQvk
 WD7bJSvYRP4YPKcQr/Y1I2mvwFHbGMDSGVFrykeRYFLb2MpcK+cVar4QnlpIxuL799sd
 LuLWQcNpL14dOv22NX3HgQQn8z0T5mKMBEtxfobIJYRwIl6yZDmFmv7wBWGTwe9F1GGT
 Zh2o9tfvqilxrqbVkGS2u9LkRXumy8SDptT+ZBT3A0Rsj+N2U44lZ3/inkOlwDrftw3b
 ld2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbDSbubxl3XKcu6DS0t3+SygjIjOCQ84yNRhq13faLY=;
 b=HXIaWtDVkJ75whK3WehoDpTBdN3rsusGNnXSiS9/qJJbEOQxyoBcpIwzXUQPsB0VW8
 LL0CMg63rVdVkX8OhmHHq5hSOKs+SK8fGGK6vl5eczpb+Tg1SZ2lwXDw7IObh3nZHYwj
 KbwDTs+zDQidfl+MIpAUpOs5vxJJMcBdx8+B5+IPX7UAI2arNNtxbMSYOGqZBwh0fWvR
 7oXSmUae9jB0qJBs+8GnOmHfKoI/6QYc0EgUGkbQPyTSkV0RptdSaDHnOL590/ZSYieg
 dAMVcOVlzrsiJQWSKBzEiSXd8aSPH/41SAUB3ad/nq+Z/zGgM2s9f4Oqb6XHYTBO55Ju
 aw6A==
X-Gm-Message-State: AJIora87XZgj0ceTr7zYW91JOKzKFfMqfMFGzkb/NSPXeX81x9jS6XOu
 Fj/DeuNNajtaxNEaulo5+Dc2SHmdpHxbeFJPcEaEaw==
X-Google-Smtp-Source: AGRyM1s+6xe9smZHpvjWO9Vcf+x3YqTqaU93RDpSCHk07CFQUD7TAR5GMSTy9JjFR8EvdeH29kBmRE+UfPv6NSNg1B8=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr17504693ywd.64.1656083578007; Fri, 24
 Jun 2022 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:12:20 +0100
Message-ID: <CAFEAcA_Wqv9n7C0cSoycZHC8zLtnrOzLWu_ktNjN_pL+CS_Riw@mail.gmail.com>
Subject: Re: [PATCH v2 53/54] pckbd: add QEMU interface comment for I8042
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jun 2022 at 14:54, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the I8042 device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/input/i8042.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

