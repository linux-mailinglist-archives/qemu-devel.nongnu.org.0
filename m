Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A44686EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 12:20:06 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmy5V-0006jP-GS
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 06:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5D-0006FR-66
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5C-0004wb-7b
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:19:47 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hmy5C-0004wA-2A
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 06:19:46 -0400
Received: by mail-ot1-x344.google.com with SMTP id d17so16395329oth.5
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=NJaxPXR7Jxrl287frgOPqUvn3TPAGVR8D51mxlNs4wgqa9WpgxvFK8ZBEC6fIl+NC6
 I2fp5C0ZBV2mjBtqlf8ZbeLgHO9v8InYaR/XrVnMCDaCDkn6wTO7TftqhWeH5eaKBlwW
 0pl68SOIoc5Q5sttFlzXlwrOHDUbYFcw8j85xotZ+eG4iP8gtWxP5nSX4qIXdSiOxtjN
 zwrqlsLcBV3Jkh3uTBLPstjqKp3tXJ2j4Xm+D2YfB6GjE1bEgF+wqXLAV4rHrkZL4znH
 ffufe8v+PsSRimk6XO9RWMDDATh8LAlMspwMZVUF7WFu1KCPmn9H6Lbo8aWjmadLpvD4
 UewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=LXDIqYBoVEDNBDHTgE4zR7hBt0+NziMNiOrMxSGntjbvqljGpIiqnC+NF1HJpAh3dv
 hjqZb1ejDB3Ft+6Ikqb+LZeX9vxRzsNmjUdnD7XHFoofFaVwz3vvuKjo2hnlwGoUFUiJ
 LmHQW04GDvaOSNEyqSYtkzIb2ZoMWbY4EkgXhB8CNsQmXDPvycy5KXhfl2Xyjo9LmmCW
 i6NxvfNBwP6xOU4cjNkefWrGZP5ubM24DUBVvbo3I8wFcJ4h3kVX9H3h5BxzrIj6PhyI
 gHhnrzfFff23ojgLioGQPm44V6sb0WYqDrjmgepbxjrc3iA6/DlM/M5ftEwtdjCdKa6P
 Gc7A==
X-Gm-Message-State: APjAAAU6ZwoJvvmvyT8uITVwHIeeAQjI2Mehuh+Qh9LgCZxXaasChEZH
 pdH/EQAFkXP09VP9Pg5PsNugklSwzfxjJkciyTE6Fw==
X-Google-Smtp-Source: APXvYqwY5x2NdkXEmb5pW4QRgblB22LwfzhIEghQtU0ZM7P+StztfmQHnnRzLE05wNJOPoy/IMlOSOz8hjPWBYoXMoc=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr14428381otn.135.1563185985085; 
 Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
In-Reply-To: <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jul 2019 11:19:34 +0100
Message-ID: <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [RFC PATCH 1/3] hw/Kconfig: PCI bus implies
 PCI_DEVICES
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:
> > If a controller device provides a PCI bus, we can plug any PCI
> > daughter card on it.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---

> > diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> > index 77f8b005ff..0f7267db35 100644
> > --- a/hw/pci/Kconfig
> > +++ b/hw/pci/Kconfig
> > @@ -1,5 +1,6 @@
> >  config PCI
> >      bool
> > +    imply PCI_DEVICES
>
> No, please don't change this. This was done on purpose, since almost all
> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVICES).

But that means that every board that provides PCI has to have an
"imply PCI_DEVICES" line, which is pretty clunky just to work
around an s390x limitation.

Is there some way in the Kconfig syntax for s390x to say
"no PCI_DEVICES" so we can have the corner-case be handled
by the s390x Kconfig in one place rather than in 20 places
affecting everywhere except s390x?

thanks
-- PMM

