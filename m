Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25267513A9B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 19:02:30 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk7XA-0005BQ-Do
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 13:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nk7Tp-0004Dm-Et
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:59:01 -0400
Received: from mout.gmx.net ([212.227.15.15]:44453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nk7Tk-0008C3-BD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651165132;
 bh=u1EH9UtKtMYRzeeqV+t8bmbhkkFkWltMhv/BMFiGno4=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=U5q/Sy4hY1Z1F1dBUTw6F4z1kYZquZJI43grclG+5U48Z4UVYA+4JM2x+s4qtOdlg
 qyQ/hzT5zhDe3SU+tW86OEbhLHrmo9wfSCJ6AKDTuEUnpI467NbpXqd6AcvKRIDuk3
 pzIUFaN8qIQMfifT9HkaFG/DL/KikGelDigcDblg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.133.159]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1nQGCy1yky-00JqQ4; Thu, 28
 Apr 2022 18:58:52 +0200
Message-ID: <47d4a9aa-c7e7-840b-4134-6a17307afe40@gmx.de>
Date: Thu, 28 Apr 2022 18:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/50] hppa: general improvements and tidy-ups
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jogfoiYNFPJMJ8QdAsbjq+0OylhSpzqPHao6kSbg5gwWzhB1fCJ
 RbNQhlqZBQDoMEtADk4NhexDpmX3dnrdDJRVmR+cSbJLQ8j3HD6xFPMbWYJeUvvJ/HpdCuD
 aOLNGnVrYd8aZboaXw5Qc63UI+FG2Od0DN6PDZqxd+RYw4lO6BQKmo/7JVzu+HJuGBgrOMa
 hgKF5lTS0xoQwNP5TB6kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqySh8sWetw=:3IbPSBjVXD7f2cgyDWB+dh
 lAgk50vHmMfyBVUoK7Rezri4SIMA1ZXcM6siREBES77UjeMDC1V9iTdphKKX8AlO9N66ZcSoP
 nlLqMaqg46ROYNiRVe/nJ0AeC5NBQEihWQfpSqQfK4ABC+8h5ZMDEAH3ahOmFxpuT9ZywDEYn
 lHFcBPwloWYbgDPpALvWnbgVkXJhcNVTZniIt1VhzxfIBJqnSeVa4vQNUWtzwMT6faVtAKGIb
 IEy/deVJJsQrmkX4bKBOFaKpAIdL6IkzrLDAA9FrhBNTk4i8eJY0FDNdn4bHxSU2Qf5DDlK44
 2NT7TudBp2ysT9TNU9P9Iz097k2xsRlw7B4Ab6WJP6r8+vtKtsLD8dEnwn5d8Fq650t+dZBTT
 ltP9gNh0nvv7BnC6SYtghVcPx2BBM/Btzjix4RUjVmnyToW/BYOf7/Ih8JVWcVTsWTRe492Sp
 uaAJzPWo7sY713T5yVJzxbr4eu2y7225r/2pX3x03OxCUQh+ZgtFkG93seM3sJYJnDr8qjkpV
 pYUK/trIqLb3GSDrMFfoEm2jKAbttU5on32QsgTcFkZ7kGcrto0lw5UBXun9aMaICHw3FrqL8
 62foAnT6lYaBqtoiFxM0MqK8pIkI3W7jSOq9R6YD+uPoAX6msKuWwPx6VRvtGaxrVGKl4HhnE
 vL/jD1CzoKM2440A4FYTCCxkrLAFOJcQRAeWDw6v2mKbgZVFZoV0Y410sBuJ0XhAnZvKKSK1U
 KCwO9CIvRMfoWHqmQufA+iGPhSQYW2xnlt+U7v0VXIhSJsFoKu8tdflxeksRjo3zeGzo8ama9
 Ww1cBwA1dqT1dcpAUHcVMTQqYq+PB8CNPSwBHK2CV83cLeFoIwa4d9nnrphDaFrn2iswP8xJv
 /hUAvINn8doyaccVIWN2NLZRLZ3dD+wfLSnNBMVPYASBjYU+o/BbQ208+Y3UaF2Gr4hHO5Rak
 Kpz2Pi7ym9CZAROJAeryvVu5y9LBrzyBtMcitCetNDc6eaw5h5bWPeIkfdxoRLbXFAeiURLyd
 fxA+Hzn63ylhlhRcRV7V+6Moli4RfjZMzVqbj4cmdl9EMkaJB9jetEfBKytw15zv+EXpGKRIn
 /ZhA2gSpM1xFd8=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/21/22 21:30, Mark Cave-Ayland wrote:
> This patchset started off when I noticed that dino.c was accessing paren=
t_obj
> directly rather than using a QOM cast. After fixing that I noticed quite=
 a few
> other improvements that could be done to bring hppa up to our recommende=
d
> coding standards.
>
> The main aim of this patchset is to de-couple the dino and lasi devices =
from
> the board using QOM to handle the initialisation instead of having globa=
l
> device init functions. Included in this is switching the onboard devices
> over to use qdev GPIOs for wiring instead of directly allocating QEMU IR=
Qs.
>
> Along the way I've renamed the board config from CONFIG_DINO to
> CONFIG_HPPA_GENERIC since that better represents the machine type, and t=
hen
> used CONFIG_DINO and CONFIG_LASI for the appropriate devices which have =
been
> moved to hw/pci-host/dino.c and hw/misc/lasi.c respectively.
>
> After the reorganisation it was trivial to remove hppa_sys.h and the maj=
ority
> of pci.c which wasn't being used. Finally I tidied up the use of the QOM
> machine type macros in machine.c.
>
> The result has been lightly tested with a tiny Linux image I had lying a=
round
> for testing my recent ESP changes, so more testing is welcome. There is =
a bit
> more work to be done sorting out the lasips2 device init and machine ini=
t, but
> since the patchset is already quite big I can follow up with that once t=
his
> series has been merged.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Marc, thanks a lot for this big cleanup!
I've reviewed and tested it with Linux and HP-UX guests.

Please add:
Acked-by: Helge Deller <deller@gmx.de>

Thanks!!
Helge

>
> Mark Cave-Ayland (50):
>   dino: checkpatch fixes
>   dino: move registers from dino_init() to DINO_PCI_BRIDGE init function
>   dino: move PCI bus initialisation to dino_pcihost_init()
>   dino: move PCI windows initialisation to dino_pcihost_init()
>   dino: add memory-as property containing a link to the memory address
>     space
>   dino: move pci_setup_iommu() to dino_pcihost_init()
>   dino: move PCI bus master address space setup to
>     dino_pcihost_realize()
>   dino: move initial register configuration to new dino_pcihost_reset()
>     function
>   dino: use QOM cast instead of directly referencing parent_obj
>   dino: return PCIBus from dino_init() using qdev_get_child_bus()
>   dino: split declarations from dino.c into dino.h
>   hppa: use new CONFIG_HPPA_GENERIC option instead of CONFIG_DINO to
>     build hppa machine
>   dino: change dino_init() to return the DINO device instead of PCIBus
>   machine.c: map DINO device during board configuration
>   dino.h: add defines for DINO IRQ numbers
>   dino: define IRQ inputs as qdev GPIOs
>   dino: wire up serial IRQ using a qdev GPIO in machine.c
>   dino: remove unused dino_set_timer_irq() IRQ handler
>   hppa: move dino_init() from dino.c to machine.c
>   dino: use numerical constant for iar0 and iar1 reset values
>   dino: move DINO HPA constants from hppa_hardware.h to dino.h
>   dino: move from hw/hppa to hw/pci-host
>   lasi: checkpatch fixes
>   lasi: move memory region initialisation to new lasi_init() function
>   lasi: move register memory mapping from lasi.c to machine.c
>   lasi: move initialisation of iar and rtc to new lasi_reset() function
>   lasi: move LASIState and associated QOM structures to lasi.h
>   lasi: replace lasi_get_irq() with defined constants
>   lasi: define IRQ inputs as qdev GPIOs
>   lasi: use qdev GPIOs to wire up IRQs in lasi_initfn()
>   lasi: fix serial port initialisation
>   lasi: update lasi_initfn() to return LASIState
>   lasi: move LAN initialisation to machine.c
>   lasi: move parallel port initialisation to machine.c
>   lasi: move second serial port initialisation to machine.c
>   lasi: move PS2 initialisation to machine.c
>   lasi: remove address space parameter from lasi_initfn()
>   lasi: move lasi_initfn() to machine.c
>   lasi: use constants for device register offsets
>   lasi: use numerical constant for iar reset value
>   hppa: move device headers from hppa_sys.h into individual .c files
>   lasi: move from hw/hppa to hw/misc
>   hppa: move hppa_pci_ignore_ops from pci.c to machine.c
>   hppa: remove hw/hppa/pci.c
>   hppa: remove unused trace-events from from hw/hppa
>   hppa: move enable_lan() define from hppa_sys.h to machine.c
>   hppa: remove the empty hppa_sys.h file
>   hppa: use MACHINE QOM macros for defining the hppa machine
>   hppa: fold machine_hppa_machine_init() into
>     machine_hppa_machine_init_class_init()
>   hppa: simplify machine function names in machine.c
>
>  MAINTAINERS                              |   4 +
>  configs/devices/hppa-softmmu/default.mak |   2 +-
>  hw/hppa/Kconfig                          |   5 +-
>  hw/hppa/hppa_hardware.h                  |   5 -
>  hw/hppa/hppa_sys.h                       |  24 ---
>  hw/hppa/machine.c                        | 122 +++++++++---
>  hw/hppa/meson.build                      |   2 +-
>  hw/hppa/pci.c                            |  88 ---------
>  hw/hppa/trace-events                     |  14 --
>  hw/misc/Kconfig                          |   3 +
>  hw/{hppa =3D> misc}/lasi.c                 | 161 ++++------------
>  hw/misc/meson.build                      |   3 +
>  hw/misc/trace-events                     |   5 +
>  hw/pci-host/Kconfig                      |   4 +
>  hw/{hppa =3D> pci-host}/dino.c             | 231 +++++++---------------=
-
>  hw/pci-host/meson.build                  |   3 +
>  hw/pci-host/trace-events                 |   5 +
>  include/hw/misc/lasi.h                   |  78 ++++++++
>  include/hw/pci-host/dino.h               | 146 ++++++++++++++
>  meson.build                              |   1 -
>  20 files changed, 462 insertions(+), 444 deletions(-)
>  delete mode 100644 hw/hppa/hppa_sys.h
>  delete mode 100644 hw/hppa/pci.c
>  delete mode 100644 hw/hppa/trace-events
>  rename hw/{hppa =3D> misc}/lasi.c (60%)
>  rename hw/{hppa =3D> pci-host}/dino.c (71%)
>  create mode 100644 include/hw/misc/lasi.h
>  create mode 100644 include/hw/pci-host/dino.h
>


