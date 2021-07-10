Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567A3C35F8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:55:04 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HBv-0007Wk-K3
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2HAD-0005I9-Kl
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:53:17 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2HAC-00034F-BP
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:53:17 -0400
Received: by mail-ot1-f45.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so13204119otp.8
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VzLKE6IXbZNdI4I5ytpCyNg8pXYAfsve6xeSbbsX5Bc=;
 b=rhqFJWYXrmwtWzUm2YvikWntRGVCJeSIclLIwXv5IdJ5njWBR87OFOzo8Rw7w4dNFo
 Y8mlsQpDC6RnIeSioEZQbim7krmKy4qDMuVuY4QmSbrLhwlGhRpsMrmIL7QgeFU/5eUG
 Rhy2SdR8ZCR5vuy3naN3qd3sOR53KhhNN3kcnXSh6SCwz2HssEqIWZ8h1Uvk7ZBjuLhR
 Iq3eAz4C6FBLTo6ryLMbO2X7xFHjfEdneHlCcka4oo6GtfU6UZ+Lk0ylsFOACilkDzIh
 5tmqdT7/o6E4xIRSspgW8XMUhBHTEnO6KhL7q0eCZzew9tBr9JV3YYbC7X49Lrmk7MR6
 +hiA==
X-Gm-Message-State: AOAM5318VvIbCePFS19tmvaM8awxiCKBeYTHYuoKSUkBXGpJSRsWmwVJ
 dEO9LIKf5loqQDtYD68Vs6vIIBjioMjXCky4GlrvGzKlgON8Nw==
X-Google-Smtp-Source: ABdhPJwBBi/eU3sVTxsvEwxZjwRN2qh4REHjHHciatrndBMRSKpr2EmHvZCMR+FhDRctb+UfyOY4Zud1cGIlnlqUyM0=
X-Received: by 2002:a9d:73d0:: with SMTP id m16mr12053482otk.37.1625939594526; 
 Sat, 10 Jul 2021 10:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <20210710174954.2577195-3-f4bug@amsat.org>
In-Reply-To: <20210710174954.2577195-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 10 Jul 2021 19:53:02 +0200
Message-ID: <CAAdtpL41OJ6wE_eBHNBqaS-WzZbxH5DMJsZAWnxwTHtDt37dMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dp8393x: Replace 0x40 magic value by
 SONIC_REG16_COUNT definition
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.45;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f45.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo 'SONIC_REG_COUNT' in subject.

On Sat, Jul 10, 2021 at 7:50 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/dp8393x.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 9118364aa33..d1e147a82a6 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -85,6 +85,7 @@ static const char *reg_names[] =3D {
>  #define SONIC_MPT    0x2e
>  #define SONIC_MDT    0x2f
>  #define SONIC_DCR2   0x3f
> +#define SONIC_REG_COUNT  0x40
>
>  #define SONIC_CR_HTX     0x0001
>  #define SONIC_CR_TXP     0x0002
> @@ -158,7 +159,7 @@ struct dp8393xState {
>
>      /* Registers */
>      uint8_t cam[16][6];
> -    uint16_t regs[0x40];
> +    uint16_t regs[SONIC_REG_COUNT];
>
>      /* Temporaries */
>      uint8_t tx_buffer[0x10000];
> @@ -972,7 +973,7 @@ static void dp8393x_realize(DeviceState *dev, Error *=
*errp)
>
>      address_space_init(&s->as, s->dma_mr, "dp8393x");
>      memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
> -                          "dp8393x-regs", 0x40 << s->it_shift);
> +                          "dp8393x-regs", SONIC_REG_COUNT << s->it_shift=
);
>
>      s->nic =3D qemu_new_nic(&net_dp83932_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
> @@ -987,7 +988,7 @@ static const VMStateDescription vmstate_dp8393x =3D {
>      .minimum_version_id =3D 0,
>      .fields =3D (VMStateField []) {
>          VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
> -        VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
> +        VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.31.1
>

