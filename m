Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184A20CD85
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 11:21:52 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jppz5-00012M-Kj
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 05:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jppyL-0000cE-2M
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 05:21:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jppyJ-00066O-4y
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 05:21:04 -0400
Received: by mail-ot1-x344.google.com with SMTP id t18so2029206otq.5
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nt61I248tmn/nxKC8UME0I3rhMqA1kRSiuRX4iI8N+8=;
 b=iouCfk8vi5YD3Gf95oA8GsmyDpWs9dcxDOnGa1UZnoS/8XBiLxzgz1ABJNCvgoBF7X
 tN3TRNQoFVP52KMC+UQc5k+O0C7eIfyQrOuP63GL42N8LoS6iwkNAUSERvR6MjkFsC7R
 C/71UejLOPoVxceRh0n2NRdzTcNs1rBKbm5jCx/0Ylh3/6dGLd+/m5siqFhKULEURT+v
 VfxshVwE/HSeWmyOHUDTkFw8BwI3vbvXOI7lG6py4YWvGMe5tjmvyqdZMX7k3oBKbJUb
 95gf/mwPtDCafCEqOick4dVkMpYOWQbF3gozX243Z5GuIcTMyIcDGvv+QWUvCwQDdt7Q
 px9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nt61I248tmn/nxKC8UME0I3rhMqA1kRSiuRX4iI8N+8=;
 b=VgVopQlVyjcbk5rTQMEXbQ0jK5fNYJuM0r93U6f7iMlHPJw6jjMaYApgWlqBEH2Ann
 3tkPKeSNlH2OpXi8gtGHSfsKhiOH7P1+TkVxfQl8NK22a0ARn1/oduM0Ci1coWkW4BZP
 c7URye5aQl+D8cjqxBUpepx62UYBb0UAUnMxhZWBQhnmqzorAs5Xt+ZT5Kf/CWy82AFH
 lewFpdAjhV2E/vHtPCk9BiYIG1+EtNic+yuTUlSl8nSCRDdoMsQj9XmS5Sa4gep3Yy2i
 9SlyGOjoJv+7+pF6RAc4NqVMqRgwru4x+35hyQLM5vtqxckDL4zk1iy8kgFEB8YVrUN3
 i3vQ==
X-Gm-Message-State: AOAM532Bf/qBDf9gMifjY/DZvurZYagvMqeHZANjEFDolqz8cQf9qVDW
 vOR48JrITyV8gyzTAf2+JtnPcYmQ+SL5VFTfGE4=
X-Google-Smtp-Source: ABdhPJyQ5uzbolynnLWqoVg1EFUBe6CLFXXbxKLpc0ehXBOdYng9HhGk98Hgkq32SyWBKE5VKUF/xw8o3OQ/A8JpIZ0=
X-Received: by 2002:a05:6830:1ad5:: with SMTP id
 r21mr8954294otc.181.1593422461439; 
 Mon, 29 Jun 2020 02:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200624185523.762240-1-ppandit@redhat.com>
 <20200624185523.762240-2-ppandit@redhat.com>
In-Reply-To: <20200624185523.762240-2-ppandit@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 29 Jun 2020 17:20:25 +0800
Message-ID: <CAKXe6S+Hu+n1bNzzmFwiWSMpbEOuT-e_dmgyStEataZEFJ0aWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/pci-host: add pci-intack write method
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2020=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:59=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> Add pci-intack mmio write method to avoid NULL pointer dereference
> issue.
>
> Reported-by: Lei Sun <slei.casper@gmail.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/pci-host/prep.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 367e408b91..3c8ff6af03 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -26,6 +26,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/units.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -119,8 +120,15 @@ static uint64_t raven_intack_read(void *opaque, hwad=
dr addr,
>      return pic_read_irq(isa_pic);
>  }
>
> +static void raven_intack_write(void *opaque, hwaddr addr,
> +                                        uint64_t data, unsigned size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
> +}
> +
>  static const MemoryRegionOps raven_intack_ops =3D {
>      .read =3D raven_intack_read,
> +    .write =3D raven_intack_write,
>      .valid =3D {
>          .max_access_size =3D 1,
>      },
> --
> 2.26.2
>

