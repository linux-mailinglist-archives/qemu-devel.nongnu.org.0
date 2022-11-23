Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702706351C1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 09:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxkfX-0001Tr-Je; Wed, 23 Nov 2022 02:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oxkfV-0001Ti-4o
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:59:41 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oxkfO-0007zv-OZ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:59:40 -0500
Received: by mail-lf1-x12c.google.com with SMTP id bp15so26969574lfb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAZFDl9IxE43XLRkZltBU9zOLrdMCObrG+kl+tnF5LI=;
 b=Iqn1vWzjfAhUzv1d17xFxiBR0DQBjWnFIYByDng+tIHsR7CL5k993NvUsLT7h8P6qN
 2er3QvIHwOLOHrEJAMmg3yma7O2Snm87DO14ZuIDkYu7YhXHCUGMSJe49DB1K2TdTWYA
 81bWHZ77uHM2FnrVbwyE5gtp0MCl/Ll/hw+59MDLxrZRkHZnkKfU5S6FJTaXCvdaG0RX
 PnVGNpW2ZY712IDkOwghBCxe1/R6It+1Q44KaYQvENIg/+/dEyz09LLNEyrVmOBKUWck
 0++c1CMkKpw4EDVRyu7oPi2e+3XmMSBQDDLrtJWhje2qPkeE6IDsedU87miUJuUyJqfJ
 FLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAZFDl9IxE43XLRkZltBU9zOLrdMCObrG+kl+tnF5LI=;
 b=qPZeDxDRUZCoJmLBWW6ltlNSwuIfsLOomeqFumDd7rPYyAEzP8HczP6sl/mEFqzYOX
 R/L6H1yjtpxfO9BgpDBZgzm617pDP8ZNsYYFbYiFmgvti+Ql01xGVoQ1WNODYMR9YasG
 nduHx71uvESuH9MrIKxJiY1TOLUznwIIM96VeItvd8IySgq1zSTMQ8kYaNSOi3sacmwa
 v3OKhxu0YkGcW+PEQsaCG8TWDu4hqxVz7DDF5Tj49jfS7UKjVla1dIDtPBXtFUH+Wiw4
 GeRurY5rQzWPzIHVbe5aGMmvyhG79toLLkT6wBQu7td6ATNT9csUkaxpmk7MPZ3dbkYr
 YYsg==
X-Gm-Message-State: ANoB5pmsEqaNYMhykxvOtxVnh54ZkHebJ72xJl51teR8OkvVbWnb62PW
 gksyC9N9IL+3cpJTUZPCvD8wOgFajhXe43zSK40=
X-Google-Smtp-Source: AA0mqf4zi2UZeSwLE4c+2qn7kG3BlUVjAKIrdbZxyF3h+4Wh/vaG/tlh8FJx0zV6cV8e60CENK3IyuXmVJAfMB+gLe0=
X-Received: by 2002:a05:6512:4029:b0:4b4:e26b:2c28 with SMTP id
 br41-20020a056512402900b004b4e26b2c28mr2199990lfb.356.1669190372023; Tue, 22
 Nov 2022 23:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20221123021842.1588898-1-jmaloy@redhat.com>
In-Reply-To: <20221123021842.1588898-1-jmaloy@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 23 Nov 2022 11:59:20 +0400
Message-ID: <CAJ+F1CKbwgVQjXo3F_r0JsnSLfO14tyq_vX5MSwnVV3pWbEJNQ@mail.gmail.com>
Subject: Re: [PATCH] hw/usb: add configuration flags for emulated and passthru
 usb smartcard
To: Jon Maloy <jmaloy@redhat.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, philmd@linaro.com, 
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Wed, Nov 23, 2022 at 6:21 AM Jon Maloy <jmaloy@redhat.com> wrote:
>
> We add two new configuration flags, USB_SMARTCARD_PASSTHRU and
> USB_SMARTCARD_EMULATED in order to improve configurability
> of these two functionalities.
>
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
> ---
>  hw/usb/Kconfig     | 12 ++++++++++++
>  hw/usb/meson.build |  4 ++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index ce4f433976..50a82badd6 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -108,6 +108,18 @@ config USB_SMARTCARD
>      bool
>      default y
>      depends on USB
> +    select USB_SMARTCARD_PASSTHRU
> +    select USB_SMARTCARD_EMULATED
> +
> +config USB_SMARTCARD_PASSTHRU
> +    bool
> +    default y
> +    depends on USB

Wouldn't this be better instead? (I don't think USB_SMARTCARD should
select PASSTHRU & EMULATED, but rather be selected for common shared
code)

config USB_SMARTCARD
    bool
    depends on USB

config USB_SMARTCARD_PASSTHRU
    bool
    default y
    select USB_SMARTCARD

config USB_SMARTCARD_EMULATED
    bool
    default y
    select USB_SMARTCARD


> +
> +config USB_SMARTCARD_EMULATED
> +    bool
> +    default y
> +    depends on USB
>
>  config USB_STORAGE_MTP
>      bool
> diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> index 793df42e21..353006fb6c 100644
> --- a/hw/usb/meson.build
> +++ b/hw/usb/meson.build
> @@ -51,8 +51,8 @@ softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: f=
iles('dev-smartcard-reade
>
>  if cacard.found()
>    usbsmartcard_ss =3D ss.source_set()
> -  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD',
> -                      if_true: [cacard, files('ccid-card-emulated.c', 'c=
cid-card-passthru.c')])
> +  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_EMULATED', if_true: [c=
acard, files('ccid-card-emulated.c')])
> +  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_PASSTHRU', if_true: [c=
acard, files('ccid-card-passthru.c')])
>    hw_usb_modules +=3D {'smartcard': usbsmartcard_ss}
>  endif
>
> --
> 2.35.3
>
>


--=20
Marc-Andr=C3=A9 Lureau

