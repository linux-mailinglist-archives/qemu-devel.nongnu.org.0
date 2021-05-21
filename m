Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096438C7F3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:26:22 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5AT-0004nd-6d
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lk59Q-00046n-Px
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:25:16 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lk59P-0004T5-3c
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:25:16 -0400
Received: by mail-yb1-xb36.google.com with SMTP id w1so16147842ybt.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=926mP2+pXjpQo8UYSo66c5ZOuFL/wVlqHaq/Z5wrx8E=;
 b=avq6x4AxACjNPyjyAR3F+4isOoJAlfA3Lr/HJhM2gnBS1k6jKq2Df7QFcSlaEQKr4c
 eOBXqRxUc5M29Dh2MKJrJapJJXzIMbVfMFWnr2x6EVv7qKhhelSkpie+AZLqrkQa+3cv
 f/02im0o1h2aKQXrzuTV1dQzIrZ+M+Xq5KiuLOOggnEYB0Y1W5ms6Klev+0Jwsjkm2IW
 qtUCn76hYoMuSroyyw6p4hoBheAhOiEBNLROPla5/fB4LTEUqKAmDBW4dI9fNU0oojHX
 vPRnsju3xoEeZvGiW4I5vH61Ei1Z7jP5E3nfyhFqBW6b6s1q+BvrcCKP0nARRBeaylQJ
 8b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=926mP2+pXjpQo8UYSo66c5ZOuFL/wVlqHaq/Z5wrx8E=;
 b=Nl3cjLMQl02DBQK+pc0dh/pJ2zPuIDU6d+aNjLM00p9MdqSzQLHX9L5jsL/ucHLUF/
 pGiiWWWDZ08A9ujHMT2LepIH63xmPWiYLLZcAgYfxfCxnHbi5+tRJ0ey92vZKMnuqVM8
 n2xoZ0UtTJ6HVGmhxGNTgBqKFQfpOc/k4PNahMN4Bb1XHqvXP+0vRy4WsbcFfXCVc3z4
 v9K5/nMLOXO/bQRiVMpgc2sZ3pprc9kG99YZpFs42XupWPF+r98bhhh92W2ryvogIazV
 ZpMPW4OyT35rjd8YryO+E9WCuP7L/Vtp/vm8eoTdDZ2socQ0oaXiQJUOBuEa9DC39W+n
 d9rg==
X-Gm-Message-State: AOAM5317wjK1MbEeZgljTUOJOVqSVWRU2DDsFsHesGK2S52GRdGR5W8e
 U/Wl1L+0qm1ksmJHqyP0BUpwsM5t9+n5G646FVU=
X-Google-Smtp-Source: ABdhPJx2sLu8x12n9HargijOsZKD6b4cxjKU2lCpuopGQpdS593Ec1YBlCc850HWyunZsfBmibdA/36Ziw6Em4jWCBc=
X-Received: by 2002:a25:ad85:: with SMTP id z5mr15139310ybi.314.1621603513308; 
 Fri, 21 May 2021 06:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
 <20210521024224.2277634-2-bmeng.cn@gmail.com>
 <7feeff48-6fa0-19bf-eb72-09caaba8cdb3@redhat.com>
In-Reply-To: <7feeff48-6fa0-19bf-eb72-09caaba8cdb3@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 May 2021 21:25:03 +0800
Message-ID: <CAEUhbmVx72gwUsCEfG5Zg-jG7ZSCtrAebr1vKVpLWkw+m9K=fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/usb: hcd-xhci-pci: Fix spec violation of IP flag
 for MSI/MSI-X
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 8:46 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/21/21 4:42 AM, Bin Meng wrote:
> > From: Ruimei Yan <ruimei.yan@windriver.com>
> >
> > Per xHCI spec v1.2 chapter 4.17.5 page 296:
> >
> >   If MSI or MSI-X interrupts are enabled, Interrupt Pending (IP)
> >   shall be cleared automatically when the PCI dword write generated
> >   by the interrupt assertion is complete.
> >
> > Currently QEMU does not clear the IP flag in the MSI / MSI-X mode.
> > This causes subsequent spurious interrupt to be delivered to guests.
> > To solve this, we change the xhci intr_raise() hook routine to have
> > a bool return value that is passed to its caller (the xhci core),
> > with true indicating that IP should be self-cleared.
> >
> > Fixes: 62c6ae04cf43 ("xhci: Initial xHCI implementation")
> > Fixes: 4c47f800631a ("xhci: add msix support")
> > Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> > [bmeng: move IP clear codes from xhci pci to xhci core]
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/usb/hcd-xhci.h        | 2 +-
> >  hw/usb/hcd-xhci-pci.c    | 8 +++++---
> >  hw/usb/hcd-xhci-sysbus.c | 4 +++-
> >  hw/usb/hcd-xhci.c        | 8 ++++++--
> >  4 files changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> > index 7bba361f3b..98f598382a 100644
> > --- a/hw/usb/hcd-xhci.h
> > +++ b/hw/usb/hcd-xhci.h
> > @@ -194,7 +194,7 @@ typedef struct XHCIState {
> >      uint32_t flags;
> >      uint32_t max_pstreams_mask;
> >      void (*intr_update)(XHCIState *s, int n, bool enable);
> > -    void (*intr_raise)(XHCIState *s, int n, bool level);
> > +    bool (*intr_raise)(XHCIState *s, int n, bool level);
> >      DeviceState *hostOpaque;
> >
> >      /* Operational Registers */
> > diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> > index b6acd1790c..e934b1a5b1 100644
> > --- a/hw/usb/hcd-xhci-pci.c
> > +++ b/hw/usb/hcd-xhci-pci.c
> > @@ -57,7 +57,7 @@ static void xhci_pci_intr_update(XHCIState *xhci, int=
 n, bool enable)
> >      }
> >  }
> >
> > -static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
> > +static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
> >  {
> >      XHCIPciState *s =3D container_of(xhci, XHCIPciState, xhci);
> >      PCIDevice *pci_dev =3D PCI_DEVICE(s);
> > @@ -70,13 +70,15 @@ static void xhci_pci_intr_raise(XHCIState *xhci, in=
t n, bool level)
> >
> >      if (msix_enabled(pci_dev) && level) {
> >          msix_notify(pci_dev, n);
> > -        return;
> > +        return true;
> >      }
> >
> >      if (msi_enabled(pci_dev) && level) {
> >          msi_notify(pci_dev, n);
> > -        return;
> > +        return true;
> >      }
> > +
> > +    return false;
> >  }
>
> Could be simplified as:
>
>   if (!level) {
>     return false;
>   }
>   if (msix_enabled(pci_dev)) {
>     msix_notify(pci_dev, n);
>   }
>   if (msi_enabled(pci_dev)) {
>     msi_notify(pci_dev, n);
>   }
>   return true;

The simplified logic will deliver both interrupts if both msix and msi
are enabled. The previous logic prevents such from happening.

>
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Regards,
Bin

