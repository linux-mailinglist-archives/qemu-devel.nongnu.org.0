Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C5544DBE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:33:23 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIHq-0000Gh-1d
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG9X-0007zS-D1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:16:46 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG9U-00035g-Kn
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:16:38 -0400
Received: by mail-yb1-xb35.google.com with SMTP id s39so13642285ybi.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpdV5U0nCe0xkk3ot25zi9m0siI2JbfGs1AvheXv80E=;
 b=j3z4WIc2U6ijqwlfg5WszNGfKsoUx/H/mq+Oziqf0/kBsKGhQVODdmZZgwG2k7/t4W
 PfL6vw+pphPVZBw+DKAQ7GByn5Hn/VuhDyNjD+hDod+ZLa/zQuZXpqTYzcG2AkeUiqkV
 zYp9YBlIb9J1520Iu5UEh7PTWRkNKv6BYz5Sx43EPJLA8QqtVKRG8yxvAiY/+HYowIsX
 tbEXfeugkvRzd5weOcgUSLuKsTXqRjo/fy0iLrBOsTVcPJkLpyuxJW1ZGZwKS0byaIN+
 KDX2iQXosDSh17y+K3rxo1AWgzvtztvPxkSJuH6qEsWLrQWqSyaKzoEZL3BLmPyXYzaH
 04+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpdV5U0nCe0xkk3ot25zi9m0siI2JbfGs1AvheXv80E=;
 b=fJxBRtqRoNsFYG/4SuXZ203ZiOQikainCMTWFsZvgqKO/5hUGmxwo1fnfuUElxQtBt
 rIL1oSb0PtQdDeQbrs6uXIv1aG49PYcScREzFpDfYLEhIzMpqd6q54PGf+ZbgZQ/NzY3
 vymHDnVmL5DvxPMRk8Nflx4CKVuoMk9xpBPcpIvGFXf6YQROX9KJ6nAgOE/NYGRTnnK6
 WLP+ah5X5gDkGOx/mgtMtcj+YgOcleiKQ0S8pyayVKwAO1YU4p3cdTaWmPvhKMYIXglY
 V3nczNknVvMyxjof0qWd93B4ysbmJJFVdWHBmukQwz6N7UHaGrDO+AiALLcLXXPZlPog
 Faqw==
X-Gm-Message-State: AOAM5316gkY9I0S9V4A/z3e3nyFufqeFk0x7TU+MvppjqKWIYxVP6c41
 5C81eQpVbOhVIsh3OeskTQZEE92eJkYc4zDcKUneaw==
X-Google-Smtp-Source: ABdhPJzysfocJoSiLEPNZFHSkrXmNzqw82Li8NMrIa5TT/O3ZHxp0W0LFZdX8UprSnPW2SEM7IzaOTk4sslg1wMe/JU=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24982968ybt.288.1654773395423; Thu, 09
 Jun 2022 04:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-44-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-44-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:16:24 +0100
Message-ID: <CAFEAcA_zDsbXXej0EU_HaNdodznd50ZjBnf+M2c9LD5QGBPhzw@mail.gmail.com>
Subject: Re: [PATCH 43/50] lasips2: add base property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for handling vmstate_register() within the device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 17 ++++++++++++++++-
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)


>  static const TypeInfo lasips2_info = {
>      .name          = TYPE_LASIPS2,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_init = lasips2_init,
> -    .instance_size = sizeof(LASIPS2State)
> +    .instance_size = sizeof(LASIPS2State),
> +    .class_init    = lasips2_class_init

If you put the trailing comma at the end of this last line, then
the next person who comes along to add a new line at the end of
the struct won't have to edit the preceding line to add the comma.

Anyway, as a code change this is fine, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
but as I note in review of patch 44 it would be better to
avoid vmstate_register(), in which case we don't need the property.

thanks
-- PMM

