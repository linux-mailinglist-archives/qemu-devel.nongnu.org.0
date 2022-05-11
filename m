Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC83522FBC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:44:23 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noitK-0003fu-Ey
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noiqW-0002G5-Hz; Wed, 11 May 2022 05:41:28 -0400
Received: from mail-yb1-f177.google.com ([209.85.219.177]:33418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noiqU-0002XR-Uf; Wed, 11 May 2022 05:41:28 -0400
Received: by mail-yb1-f177.google.com with SMTP id j2so3003442ybu.0;
 Wed, 11 May 2022 02:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o5g7qqGOeGDSMZIV4ROfhvj7Ax0xYCXbHcbIFiOQwCU=;
 b=ChwPzyvmYczZh9YDP1Q2iy578xwjVHfuFtbhKmW+QY8M6D+02qWOWQ5UJp4fPhrwRz
 /NklQZjdOtOLxHDcDLhypLwYGZ8ep++VBbjzCG0QMpf9BMgtnL+LdFdbtAe4TS3zqK9b
 frA4A1OLI8t9JbAblJ/7a6smhEHQfzniDhQjq0khJvPUYcJNcgCqcaL6g0EgmObwZY0U
 rauNuR2L9SDZuyL0rCx5wQDtf745NqSFpv4xthK5Vir90hxuiuL7QTDMT7xDdQCVtkzj
 4+akYgavEq51kexqhFdteEitLG2zCk9dXxLWYyVxW1hc0TeHOH6Wwjvjb2Nl4LOBFX9/
 GuZg==
X-Gm-Message-State: AOAM5328KEAXTiZ5NtT8wiX3piUjv7l9RF6nTRxflcbI0dHkf6tuj2gP
 G+x9OHh+hXJfEzsI/v32zdnUvDEztOabS2Uuw4Y=
X-Google-Smtp-Source: ABdhPJzm5iSVzJ6pO205acF74ICS6K1Xv4kePjukvqP3+d5l4E5QW2D+gc/LNfb7ejE9I5B4OJJ5glT+f1xdEmS3vas=
X-Received: by 2002:a25:4ac4:0:b0:64b:343b:799f with SMTP id
 x187-20020a254ac4000000b0064b343b799fmr1931542yba.335.1652262084847; Wed, 11
 May 2022 02:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <YiotlroslM5hcR04@p100>
In-Reply-To: <YiotlroslM5hcR04@p100>
Date: Wed, 11 May 2022 11:41:13 +0200
Message-ID: <CAAdtpL44p=kPaRYSi8Y1HLrsQnc3e5Z_BRd1yjH=h7DDBwWWSw@mail.gmail.com>
Subject: Re: [PATCH] tulip: Assign default MAC address if not specified
To: Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Helge Deller <deller@gmx.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.177;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Hi Jason,

Do you mind taking this single patch via your networking tree?
Otherwise I Cc'ed qemu-trivial :)

Thanks!

On Thu, Mar 10, 2022 at 5:56 PM Helge Deller <deller@gmx.de> wrote:
>
> The MAC of the tulip card is stored in the EEPROM and at startup
> tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
> address given on the command line, e.g.:
>     -device tulip,mac=00:11:22:33:44:55
>
> In case the mac address was not given on the command line,
> tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:00
> which breaks e.g. a HP-UX guest.
>
> Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
> up, so that a default mac address is assigned before tulip_fill_eeprom()
> initializes the EEPROM.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index d5b6cc5ee6..097e905bec 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>      pci_conf = s->dev.config;
>      pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
>
> +    qemu_macaddr_default_if_unset(&s->c.macaddr);
> +
>      s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
>      tulip_fill_eeprom(s);
>
> @@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>
>      s->irq = pci_allocate_irq(&s->dev);
>
> -    qemu_macaddr_default_if_unset(&s->c.macaddr);
> -
>      s->nic = qemu_new_nic(&net_tulip_info, &s->c,
>                            object_get_typename(OBJECT(pci_dev)),
>                            pci_dev->qdev.id, s);
>

