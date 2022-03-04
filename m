Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C94CD4A2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:01:39 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7Yw-000641-RJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7Wa-0004Re-Sj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:59:12 -0500
Received: from [2607:f8b0:4864:20::1133] (port=40008
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7WZ-0000uI-Cj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:59:12 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2dc0364d2ceso90426437b3.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+sOc2LcfKj2crC67J2KWw/mqoFs2BOQPrCYwrgUTNM=;
 b=joHUdG6vFDxNiU0aOPxLlWK15GBdgYmRadskiMUCWC5QvNdRU3Bv+YktLdKBL53zWE
 jZomPtl5UTgt95S9Z9xcw8iIhVU8Nvb+NJrR0Sf23bS+hPVIFdMPSFcnucS0NqSBkQof
 Fhv6oHKhutR1DZTS2+DValwHH7CtX1ABeIvXErdPNeNntYfKnc7jbtVmCRksTfDPHdxx
 ZKyjct2i+jM9g5IPKsMjlkZRT3DDWF3Gfcd7jRke2WwB1wPR8GobgFHOqXEkKda5UIMY
 f4TTS3yuY+mCghPrkYfFu15Y/cguxRKxaKVchP0bxeT9tIW50Rm94W8TA9+4KEG3q9TG
 5IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+sOc2LcfKj2crC67J2KWw/mqoFs2BOQPrCYwrgUTNM=;
 b=JJp9cOpBRUpeNV7WcnUGuqCw0JJNvKV5RZB6PwXNCRy0RoK/FNWM2yYoOOv25Ol3Y0
 Bn07Ha9ZpUt/Tlaw0HzFyzaUJYHypQq5w6YJxx+oxw0rplZ3Eqi+yKQVAdMzLtnUQNQt
 msbNHJfgqJrwthH65QoJLyRzWDZnF8xDSO8DmenenmG/Tff1o0ID7ZMsJyd0Vq3iPza7
 3Ru676zgyVOoquMv8PsSt0mTnJh/dRSEikwWfyZrb2S92GxGahyDA6N8ANCl9QqyLur8
 /nYhLdbJNt+n2xtXsh9e4axyN03S6XGVnif+Ootju68iyBtWT9FBe1P2liJiKwZb4RKa
 ZWfQ==
X-Gm-Message-State: AOAM533rvdc40g7b9WM7jc+u90tHFp3jbzhPDx7Roa8JnmjvQWUiA19u
 tLT1Yr8aRvIdvJh6FOJe/CavFvGruTBlEjHoc5Is3w==
X-Google-Smtp-Source: ABdhPJz6eCKPlOlB4oeyKGcpV6xR37IO+gOmjv2zyL300Wgph0gaQW9GuRnLaaTwCuQEBlEoCV1BYJPc/di/t4KgZLU=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr39853089ywh.329.1646398750323; Fri, 04
 Mar 2022 04:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
In-Reply-To: <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 12:58:59 +0000
Message-ID: <CAFEAcA8aA5=3ak4WqcgDJ=yrjKz9BKNiCW+xkXPwJ+QgvfjMWA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/nios2: Machine with a Vectored Interrupt
 Controller
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:39, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>
> Demonstrate how to use nios2 VIC on a machine.
> Introduce a new machine "10m50-ghrd-vic" which is based on "10m50-ghrd"
> with a VIC attached and internal interrupt controller removed.
>
> When VIC is present, irq0 connects the VIC to the cpu, intc_present
> is set to false to disable the internal interrupt controller, and the
> devices on the machine are attached to the VIC (and not directly to cpu).
> To allow VIC update EIC fields, we set the "cpu" property of the VIC
> with a reference to the nios2 cpu.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> ---
>  hw/nios2/10m50_devboard.c | 64 ++++++++++++++++++++++++++++++++++++---
>  hw/nios2/Kconfig          |  1 +
>  2 files changed, 61 insertions(+), 4 deletions(-)

My remarks about this from the earlier version of the patchset still
stand:
 (1) if this isn't an actual config of the real hardware, then
presumably there aren't any guests which will run on it with the
VIC enabled
 (2) if we do want to do this, we should have a machine property
for "vic=true" rather than a complete new machine type

thanks
-- PMM

