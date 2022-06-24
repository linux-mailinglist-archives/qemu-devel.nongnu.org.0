Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943D559D21
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:17:51 +0200 (CEST)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4l4A-0005hw-2n
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kwU-0002a8-Jd
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kwT-0003Mp-4P
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:09:54 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3178ea840easo27292397b3.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rNdTkCGtaBqWybng16571B9thp7pv/PBvk0H3wFvQjs=;
 b=N42zIQ0IHTQr7nSlyM4n24wGGmWE7C50pKIaIvK5y+/hTL9q7wBPgDwdSsTBsyMQ7R
 5M4psTMZGCL2U9Ij/KXUypt3dcZW/x7/aSIePlisz5tVxRqn+8k3vpD8lA1fV2GxlCtP
 AmGfEBGgr21yy2jrlvAK+Md4jE+XHncmtsqXd1sNi+BS5V3FsyU18kmloU6Ahsit1MO/
 9VgzvIkAZ3ROhC06v7cv2kQUGg+XSFgS+dcWDMCptU+gAVkzEgyS/Cu3A39BvMB8F7AQ
 Gjw37T7jRV9QsVCCq0lj09s+cw8JaUQa6zQRNcJZHgjdiow4NtDedNdCO4COzj4fyKEd
 cq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNdTkCGtaBqWybng16571B9thp7pv/PBvk0H3wFvQjs=;
 b=yxh+sXvFilnT5xEWcxgfI+ZFtYna1nmR//ZNpNFUScLsyVIjYtH+oGlY7OobJ+IB/I
 tArnCM32goJbkoGgrGlDyn3CwSXU3nuJBuueVpY16DJGbvqwZtV0JpR0KT6TbYW8c1bk
 CpwQyGEXcpAfPBlA0rfDmMGGzS9xnRoE+4AFOT/f8KCOMxWYBL0C5ak5zgA9EO3cVKWD
 JEURjlno0noU0Lc+tt3Ic9Vs1VmRkOrcZ8ER7DZ5k1sj751NglfjNJ/VDyn2szWe3RVQ
 gJB7HVJ4MrxdngiZGux9QtcqJSG1Ys6kGA2WMADTgP/qy11jp2m9jXjjgbH+AtE0iHLk
 JJUg==
X-Gm-Message-State: AJIora9E7suDHXbmAsOHu96NBcx5exT0auEUNweHW/qf39UracGCZUHV
 2WWbDBITPFBMMaeBiVqazIpznv3wiz+WuVQ2t9F4mA==
X-Google-Smtp-Source: AGRyM1vRiNyQAk/Tm99oYx7irkKBF2PMUqGpuY7RwFYKGs11GQkQmRMWXL9JfyIF6MrfIm+9a5O3vCgOuR3Rr0WFM5Y=
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr18111603ywg.469.1656083392248; Fri, 24
 Jun 2022 08:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-45-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-45-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:09:14 +0100
Message-ID: <CAFEAcA-dz9vLBY9NiuB45k9mH8W9X9CER-bG89tdrSTp7qb5fw@mail.gmail.com>
Subject: Re: [PATCH v2 44/54] lasips2: add base property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for handling vmstate_register() within the device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>  hw/input/lasips2.c         | 17 ++++++++++++++++-
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

