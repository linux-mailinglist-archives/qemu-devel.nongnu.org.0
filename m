Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2714565899
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:27:46 +0200 (CEST)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N3B-0007ru-Nr
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MI7-0008Ms-H3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:39:07 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:34684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MI4-00061v-Ph
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:39:07 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c86fe1dddso34945407b3.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6nr2MC1rzWsrMEqs/jeibqhu6OQ4Laugsy4/ZesQ68=;
 b=Bz9JQpkAQ5Myzsn3g6/qlntD7leW6Z9ZkeGxjE9QvDKnUq+XkCp8uLaxHo6hKxtP85
 KJgix4dUtdaiW6kPx3vbsoJyGvyhthTUnSwTdCljGNzT9CmhuZ/gSzugPDPBW5cFVUWp
 giJVOTyHr8BbnSAIKpLy7fewIdwlblP69YFpns43zf0xSVg+KvOE8mDFesjDK3o/vAFg
 XlEbeoh6mtyAElYFtuQD6VIaJtM/3ZYrK9cd2OB58RQqUpNDC+ckiRVRDnbXnB1sXPqR
 jBzE4y2uoW8tdGPj3cvijIc73Hkhch3BYm+3XKlfROBdQPKI0bSMeNQG8jbWVN7Qy1dc
 7zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6nr2MC1rzWsrMEqs/jeibqhu6OQ4Laugsy4/ZesQ68=;
 b=v5aOZEtRFUNYn+Jl/CB8jsVYVd7nk6lpqa7JERj9G+uOQrEVjDHVjmAR5Q25NqEoXR
 JaP/6UxM+gd6bLCqlsfDZYOAVpWJIgRUDkfzgQZmXmQlLWlKZ5pm5MMotCP3i3NGRqD2
 u0IQtXbb5D0F/DHtsT30WrSEhfvJYT4KonzPDVnSSVfM+DKGlc1ol0XNIZXlonylVBDN
 7YQ5z2WcDqJzhprbbT5R2Iz8F42bcNA999xUh6bK/UgGugLrYXEr8J3zhI6opqKE7a2P
 cgc112kVnVD9nypIxPhm43V3sIzbTsD66rBg1qq0lU304pEdUE06ElBhOkNmOLQqhptx
 QCQQ==
X-Gm-Message-State: AJIora9F9aRW/ui+oYD0MspXmsjCdR5fS8epd5RsXdyen/gnSfrBEdfu
 6Of1o+sh+t4LQca6EFy7wj45+O3HY2PjJF6a4gAh0A==
X-Google-Smtp-Source: AGRyM1tbrxAkPTkJ8e92BCuolNcl3IRyPirYXnt1wnCKOBTbOu/yMcJC0HbrjmgJ7QFMLMt5bRPhb7xCXgFaja77ZSY=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr918158ywb.469.1656941943688; Mon, 04
 Jul 2022 06:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:38:52 +0100
Message-ID: <CAFEAcA-D6GhmGA=Det6PGvXC-sup7pKa3KoBsUHtBkK5e1K_Eg@mail.gmail.com>
Subject: Re: [PATCH 34/40] lasips2: update VMStateDescription for LASIPS2
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Since this series has already introduced a migration break for the HPPA B160L
> machine, we can use this opportunity to improve the VMStateDescription for
> the LASIPS2 device.
>
> Add the new int_status field to the VMStateDescription and remodel the ports
> as separate VMSTATE_STRUCT instances.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index e602e3c986..ea7c07a2ba 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -35,15 +35,28 @@
>  #include "qapi/error.h"
>
>
> +static const VMStateDescription vmstate_lasips2_port = {
> +    .name = "lasips2-port",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(control, LASIPS2Port),
> +        VMSTATE_UINT8(buf, LASIPS2Port),
> +        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_lasips2 = {
>      .name = "lasips2",
> -    .version_id = 0,
> -    .minimum_version_id = 0,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
> -        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
> -        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
> +        VMSTATE_UINT8(int_status, LASIPS2State),
> +        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
> +                       vmstate_lasips2_port, LASIPS2Port),
> +        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
> +                       vmstate_lasips2_port, LASIPS2Port),
>          VMSTATE_END_OF_LIST()
>      }
>  };

The set of things we were migrating and the set of
things we now migrate don't seem to line up ?

-- PMM

