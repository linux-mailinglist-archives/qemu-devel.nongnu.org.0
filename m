Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1A4F7CFE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 12:34:42 +0200 (CEST)
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncPTM-0004ri-LN
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 06:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncPRA-00048R-8e
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:32:24 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncPR8-0002XL-Kn
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 06:32:23 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l14so8778316ybe.4
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+gT7AkTA9kTy+5B+Ky64yAOrII/pIS8my7FWGzr/oAk=;
 b=r6NYHOQlNx08pxm74PpcC9yrMsfGulesKHLWRFzpRjGXJPaiQqpzxgrxT7HJWlMzh2
 mIkn/80ZTAlzXCZua+/z28Ifr1Y0SvaKJfv8FZfuT4oGXtrG6jVjS567viytYIMtysj5
 oq01wt0Sm2+jMFATNDPfDoHfvnV6lfDf1yF0E19mfcELHz0W0ZVt5qyTQ5EQHdTLvCuv
 1Sw7oZ0Hgkblth+f043UFVtgX+5TMih7Ue/mMN2FEi6A04N9seYtacenR+UvBrxo2OB5
 U1GBwYhoJWgKihIcFGIMJJSuaIqj6oAisDAvOMt2dxXwAF8jQthn5HyjO9I5uSXPokcl
 SqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+gT7AkTA9kTy+5B+Ky64yAOrII/pIS8my7FWGzr/oAk=;
 b=minGAXAd41mXUNmMoqEhpOgj+we/8nJxV6fxwTta1QpuWBNvMwnHhpyKungXvOlWT2
 7Jhwb91tSk2eLEEHVbdrNQHcJizxLostNut7YUnSz9rtAKuj0ob+lQxC/AfMTBWCbk4I
 KKeZmTQpfgt4yal8dAMDAyrTrysI/3k9TtHbYXn6uj8jztXt6LioKyfdF/Zb1j/if/yU
 TasSxyXOfmPNP/ZK5pxKdq+6zOELuW4kn99FFUcBJJOWZcFIYSnhIVHioi/hNJOD6G+0
 arjX/V1oQKXuCuduYiZKeH5qeMeb2SVhN9NTNzIDBZIwKMoTdO3RxSuxTQZ7WO19xxS4
 IpSg==
X-Gm-Message-State: AOAM531Vh80E75BR8dyjty9+9Wpf2cWw5ATskqcHYMtYRuNjhGjM+SN6
 vUROHYC0P+8CER5Xl9ym8OJu0tb1uNV7kMcbPsbLAKMOPXQl1Q==
X-Google-Smtp-Source: ABdhPJxbEhVbVHn2BdGhbblfZBGP/VhAupRIdwPLTf6gFm7RNKF+T/te02RV6I4TAVea788kpgdZpb0bdibAqPXkOLU=
X-Received: by 2002:a05:6902:1546:b0:63d:a6af:1c87 with SMTP id
 r6-20020a056902154600b0063da6af1c87mr9762049ybu.39.1649327541554; Thu, 07 Apr
 2022 03:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <1465913645-19346-1-git-send-email-peter.maydell@linaro.org>
 <1465913645-19346-29-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1465913645-19346-29-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2022 11:32:10 +0100
Message-ID: <CAFEAcA9z+BCgxa-M8EM3naC-3A4khLcS-MZCd-WjKg8JBddtTQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 28/30] introduce xlnx-dp
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jun 2016 at 15:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: KONRAD Frederic <fred.konrad@greensocs.com>
>
> This is the implementation of the DisplayPort.
> It has an aux-bus to access dpcd and edid.
>
> Graphic plane is connected to the channel 3.
> Video plane is connected to the channel 0.
> Audio stream are connected to the channels 4 and 5.

Very old patch, but Coverity has just pointed out an array
overrun in it (CID 1487260):

We define a set of offsets for V_BLEND registers, of which
the largest is this one:

> +#define V_BLEND_CHROMA_KEY_COMP3            (0x01DC >> 2)

> +static void xlnx_dp_vblend_write(void *opaque, hwaddr offset,
> +                                 uint64_t value, unsigned size)
> +{
> +    XlnxDPState *s = XLNX_DP(opaque);
> +    bool alpha_was_enabled;
> +
> +    DPRINTF("vblend: write @0x%" HWADDR_PRIX " = 0x%" PRIX32 "\n", offset,
> +                                                               (uint32_t)value);
> +    offset = offset >> 2;
> +
> +    switch (offset) {

> +    case V_BLEND_CHROMA_KEY_COMP1:
> +    case V_BLEND_CHROMA_KEY_COMP2:
> +    case V_BLEND_CHROMA_KEY_COMP3:
> +        s->vblend_registers[offset] = value & 0x0FFF0FFF;

We use V_BLEND_CHROMA_KEY_COMP3 as an index into the vblend_registers array...

> +        break;
> +    default:
> +        s->vblend_registers[offset] = value;
> +        break;
> +    }
> +}

> +#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> +#define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
> +#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
> +#define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)

> +    uint32_t vblend_registers[DP_VBLEND_REG_ARRAY_SIZE];

...but we have defined DP_VBLEND_REG_ARRAY_SIZE to 0x1DF >> 2,
which is the same as 0x1DC >> 2, and so the array size is too small.

The size of the memory region is also suspicious:

+    memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
+                          ".v_blend", 0x1DF);

This is a "32-bit accesses only" region, but we have defined it with a
size that is not a multiple of 4. That looks wrong... (It also means
that rather than having an array overrun I think the actual effect
is that the guest won't be able to access the last register, because
it's not entirely within the memoryregion.)

Coverity doesn't complain about it, but the DP_CORE_REG_ARRAY_SIZE
may also have a similar problem.

thanks
-- PMM

