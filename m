Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E46D4466
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:28:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJHd-00070J-30; Mon, 03 Apr 2023 08:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pjJHX-0006zd-34
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:27:31 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1pjJHV-0003VD-DJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:27:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t10so116456160edd.12
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680524847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tiE7fi8L9R9ZN6JJC1ebw86MnpKbIthjLM1TAQ6wdds=;
 b=SLWKoRIjJSc15Z3iJSvUSE+xWKgnWLllIi48RMO+zJuuH7Zh+wfu6mQWj4g/CMbfvm
 LWfIFDCmD3now078RwoRVxGcd8QMPVa+yEXuGB84+ZsddkMy2ELo100vpXSifKl7azhg
 G71yRxDmgpp1CcWAbCQh56I92k7s7x2wSPsH3y0Dt5YrQvWc+cFhTfnwthmTY/O6uIAv
 ISyhl5lRlzuTNHuNdBi+JjIHUTb8vHrXTyHW4xoJCTvMXX1xftq912OTVPjEAFu5wsXj
 l7W7wkKhz8g9ZI8NY7YozGaSM3disnulAoQVpVCB88s5dMMeJb6JWKiQ5BugpfwBvtvR
 jGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680524847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tiE7fi8L9R9ZN6JJC1ebw86MnpKbIthjLM1TAQ6wdds=;
 b=DMA73STzSwm8MaJHByQDaBGR7aQ3gV4DOseQM0Vx8zOQsUqz6gSMMeTX8P47LaKr0r
 lIEVO7wbbuZDPdE/eb8lWy8a0RNBlTOgIOcQXqdAFMxl8Jq4JEC8Wtq+lNo69LsyMnwI
 xDunOVgZq/x1kAPHIxd4bHzhJLh3hdXNt+jxxs9XkxUNxPEQBdBNH5bt6MJyqvKOW3Oz
 KPf76qcwu+LKIgNUOAR8lP7Nq1DG7TpxZDr0pUk/fKuihoBieZmdOMd+pQ2l5ekV3KYm
 ATiWM9u83bCfKxUvVc2KC46rkEWHOK/mWRK1eYp5gkf0QjOFc1OES9FmC9czSLIn2toP
 k8XQ==
X-Gm-Message-State: AAQBX9cnC1X3G9ieQPQgvjAitsxV3QJoLzwkPur2QAlsZ2GZNAA2tK8p
 W4x99MBDlniGBM3uYsO283uqVh94IlMSFVheF2o=
X-Google-Smtp-Source: AKy350bvj5HIZOXxODdl9HmyUeSupI0oslUbBLSEUl1HB1gkoU4xmW0A4xcnaidpOajdABK2WAs4EAaIQ4xHo6NgWLI=
X-Received: by 2002:a17:907:20bc:b0:92a:581:ac49 with SMTP id
 pw28-20020a17090720bc00b0092a0581ac49mr15671469ejb.3.1680524847399; Mon, 03
 Apr 2023 05:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
 <622b9674-fffd-4634-ac30-d0db3230478e@perard>
In-Reply-To: <622b9674-fffd-4634-ac30-d0db3230478e@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 3 Apr 2023 08:27:14 -0400
Message-ID: <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 Paul Durrant <paul@xen.org>, 
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chuck Zmudzinski <brchuckz@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jandryuk@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Apr 3, 2023 at 5:33=E2=80=AFAM Anthony PERARD <anthony.perard@citri=
x.com> wrote:
>
> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
> >
> >
> > Am 30. M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony.pera=
rd@citrix.com>:
> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
> > >> This is a preparational patch for the next one to make the following
> > >> more obvious:
> > >>
> > >> First, pci_bus_irqs() is now called twice in case of Xen where the
> > >> second call overrides the pci_set_irq_fn with the Xen variant.
> > >
> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call i=
n
> > >piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
> > >call, or maybe some other way to avoid the leak?
> >
> > Thanks for catching this! I'll post a v4.
> >
> > I think the most fool-proof way to fix this is to free irq_count just b=
efore the assignment. pci_bus_irqs_cleanup() would then have to NULL the at=
tribute such that pci_bus_irqs() can be called afterwards.
> >
> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as=
 Xen guest with my pc-piix4 branch without success. This branch essentially=
 just provides slightly different PCI IDs for PIIX. Does xl or something el=
se in Xen check these? If not then this means I'm still missing something. =
Under KVM this branch works just fine. Any idea?
>
> Maybe the ACPI tables provided by libxl needs to be updated.
> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
> id (I know that the PCI id of the root bus is checked, but I don't know
> if that's the one that's been changed).

Xen also has hvmloader, which runs before SeaBIOS/OVMF.  Looking at
tools/firmware/hvmloader/pci.c, it has
        ASSERT((devfn !=3D PCI_ISA_DEVFN) ||
               ((vendor_id =3D=3D 0x8086) && (device_id =3D=3D 0x7000)));

From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0).  Maybe try removing
that check?

Regards,
Jason

