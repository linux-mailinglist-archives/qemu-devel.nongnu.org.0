Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F215B5BB110
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZE7Y-00065r-DJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 12:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZE0K-0000rU-4u; Fri, 16 Sep 2022 12:15:48 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZE0I-0004dx-06; Fri, 16 Sep 2022 12:15:47 -0400
Received: by mail-vs1-xe36.google.com with SMTP id h1so23166669vsr.11;
 Fri, 16 Sep 2022 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lwj1fp9fc/NTvw9EDit1rmv6n34V9o7pUf/Ns7HLlcI=;
 b=eURfZxBki8rDFdH9nhr1jwhhdKE6tu0FFSx2ApgNxfY+0mbs7r1iMYhLw0/b9kiun+
 t/e7bf8KXaDqRAKsRn8SI7EAlY4JC7ieSS0ZFJv8CI3CmXMflP1e/qMquuMu700jGC/C
 Z4O4C1tsAughI2fAaHhAF/Y42yoIJ4UqVLeWvVcPMbQcTaydk8/u11T+DUPo+sMV4r2w
 7RIrIkTPxnLPLH2g9jT9/+PJH7WQhcuBmJbAqyBm4qUFnEXz3Fyz0SnKWkLonJaqR30I
 f+96kwID7eSCtSxSAaR3Zvb69a9OIWHQDGJcAQxwcx2oYtyTxRC3r82O/xB/bAESh87K
 CBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lwj1fp9fc/NTvw9EDit1rmv6n34V9o7pUf/Ns7HLlcI=;
 b=B+3r8CWi2iONsiy5j3l6i219AP7Ky484amgGCxF3Ag5kO86sZbBwalIwcGshD1JWvJ
 jbHl5v4WnyqIDyM3WDkErEfA7yEK79JGSvaoNdzcU5BJzimvOvvdwr8pzyOZ4gT0hnpf
 AAiOdM5R3plk86sxyRbGNiEOy7qHxPy4VW1RK/ii5R7pGl3NOlKBBH80cuISTb/AwWM8
 shXvcDy0VQ3y7uGIzaqe4fIkCTe8NVDIQc96FpryYhSHw4kkhd+am7Z2hKO3GMF5QOfE
 j76CqNN22Tq8mcGIAOn77ZP73aeaqAN7zBOfhfCLcQyH0LnRgBPqLLkSYdwRbRIGFEzG
 6JaA==
X-Gm-Message-State: ACrzQf2N8lsETIC6x2fgYPr7VMFtIZoPU1UYyMk3u7a5UMUflDYlAXcW
 7/sDifLYSKWQRgYUXA0ElNxvZtwlHWDVcIsSWuI=
X-Google-Smtp-Source: AMsMyM588d2raNqu4ovRi3NjBP+hFlGf7yXY0XJ8v8s0rV7T3Un14D724CR44ocsnL2odImjIxQ2DYZH3Hr29a6nrs4=
X-Received: by 2002:a67:ef43:0:b0:398:8011:63bc with SMTP id
 k3-20020a67ef43000000b00398801163bcmr2326773vsr.59.1663344944226; Fri, 16 Sep
 2022 09:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-12-shentey@gmail.com>
 <CAEUhbmXroQ7KcG3Cvb73vV0hFm8vsY-9NVCFrx8jZQuu9MY3rg@mail.gmail.com>
In-Reply-To: <CAEUhbmXroQ7KcG3Cvb73vV0hFm8vsY-9NVCFrx8jZQuu9MY3rg@mail.gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Fri, 16 Sep 2022 18:15:30 +0200
Message-ID: <CAG4p6K4-JFSp=1KURZD0wKbTQTSQRJTACLkdwop6fFcsnuEHOA@mail.gmail.com>
Subject: Re: [PATCH 11/11] hw/ppc/e500: Add Freescale eSDHC to e500 boards
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008a26cc05e8cdac7b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a26cc05e8cdac7b
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 16, 2022 at 5:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Sep 15, 2022 at 11:30 PM Bernhard Beschow <shentey@gmail.com>
> wrote:
> >
> > Adds missing functionality to emulated e500 SOCs which increases the
> > chance of given "real" firmware images to access SD cards.
>
> By "firmware" do you mean U-Boot?
>

No, I mean a proprietary flash blob including partitions for the kernel,
root fs, U-Boot, etc.

>
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >  docs/system/ppc/ppce500.rst | 13 +++++++++++++
> >  hw/ppc/Kconfig              |  1 +
> >  hw/ppc/e500.c               | 32 ++++++++++++++++++++++++++++++++
> >  3 files changed, 46 insertions(+)
> >
> > diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> > index c3f55c6f3d..50b199c8f3 100644
> > --- a/docs/system/ppc/ppce500.rst
> > +++ b/docs/system/ppc/ppce500.rst
> > @@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
> >  * Power-off functionality via one GPIO pin
> >  * 1 Freescale MPC8xxx PCI host controller
> >  * VirtIO devices via PCI bus
> > +* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
> >  * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
> >
> >  Hardware configuration information
> > @@ -131,6 +132,18 @@ be used as follows:
> >        -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
> >        -append "rootwait root=/dev/mtdblock0"
> >
> > +Alternatively, the root file system can also reside on an emulated SD
> card
> > +whose size must again be a power of two:
> > +
> > +.. code-block:: bash
> > +
> > +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
>
> qemu-system-ppc{64|32}
>

Will fix.


> > +      -display none -serial stdio \
> > +      -kernel vmlinux \
> > +      -device sd-card,drive=mydrive \
> > +      -drive id=mydrive,if=none,file=/path/to/rootfs.ext2,format=raw \
> > +      -append "rootwait root=/dev/mmcblk0"
> > +
> >  Running U-Boot
> >  --------------
> >
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index 769a1ead1c..6e31f568ba 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -129,6 +129,7 @@ config E500
> >      select PFLASH_CFI01
> >      select PLATFORM_BUS
> >      select PPCE500_PCI
> > +    select SDHCI
> >      select SERIAL
> >      select MPC_I2C
> >      select FDT_PPC
> > diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> > index 7843a4e04b..87a03fd4a9 100644
> > --- a/hw/ppc/e500.c
> > +++ b/hw/ppc/e500.c
> > @@ -48,6 +48,7 @@
> >  #include "hw/net/fsl_etsec/etsec.h"
> >  #include "hw/i2c/i2c.h"
> >  #include "hw/irq.h"
> > +#include "hw/sd/sdhci.h"
> >
> >  #define EPAPR_MAGIC                (0x45504150)
> >  #define DTC_LOAD_PAD               0x1800000
> > @@ -66,11 +67,14 @@
> >  #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL
> >  #define MPC8544_PCI_REGS_OFFSET    0x8000ULL
> >  #define MPC8544_PCI_REGS_SIZE      0x1000ULL
> > +#define MPC85XX_ESDHC_REGS_OFFSET  0x2e000ULL
> > +#define MPC85XX_ESDHC_REGS_SIZE    0x1000ULL
> >  #define MPC8544_UTIL_OFFSET        0xe0000ULL
> >  #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
> >  #define MPC8544_I2C_REGS_OFFSET    0x3000ULL
> >  #define MPC8XXX_GPIO_IRQ           47
> >  #define MPC8544_I2C_IRQ            43
> > +#define MPC85XX_ESDHC_IRQ          72
> >  #define RTC_REGS_OFFSET            0x68
> >
> >  #define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
> > @@ -203,6 +207,25 @@ static void dt_i2c_create(void *fdt, const char
> *soc, const char *mpic,
> >      g_free(i2c);
> >  }
> >
> > +static void dt_sdhc_create(void *fdt, const char *parent, const char
> *mpic)
> > +{
> > +    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
> > +    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
> > +    int irq = MPC85XX_ESDHC_IRQ;
> > +    char *name;
> > +
> > +    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
> > +    qemu_fdt_add_subnode(fdt, name);
> > +    /* qemu_fdt_setprop_cells(fdt, name, "voltage-ranges", 3300, 3300);
> */
>
> Drop it if it is useless
>
> > +    qemu_fdt_setprop_cells(fdt, name, "clock-frequency", 167000000);
>
> Is this an arbitrary frequency?
>

I'll drop both since the eSDHC works also without the frequency line.

> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
> > +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
> > +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
> > +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
> > +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
> > +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
> > +    g_free(name);
> > +}
> >
> >  typedef struct PlatformDevtreeData {
> >      void *fdt;
> > @@ -556,6 +579,8 @@ static int
> ppce500_load_device_tree(PPCE500MachineState *pms,
> >
> >      dt_rtc_create(fdt, "i2c", "rtc");
> >
> > +    /* sdhc */
> > +    dt_sdhc_create(fdt, soc, mpic);
> >
> >      gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
> >                              MPC8544_UTIL_OFFSET);
> > @@ -996,6 +1021,13 @@ void ppce500_init(MachineState *machine)
> >      i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
> >
> >
>
> nits: use one line for the separation
>

The extra empty line was there before and it looks like it came from moving
I2C around - notice the broken indentation of it's comment.

I'll fix that in this patch.

Best regards,
Bernhard

> +    /* eSDHC */
> > +    dev = qdev_new(TYPE_FSL_ESDHC);
> > +    s = SYS_BUS_DEVICE(dev);
> > +    sysbus_realize_and_unref(s, &error_fatal);
> > +    sysbus_mmio_map(s, 0, pmc->ccsrbar_base +
> MPC85XX_ESDHC_REGS_OFFSET);
> > +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev,
> MPC85XX_ESDHC_IRQ));
> > +
> >      /* General Utility device */
> >      dev = qdev_new("mpc8544-guts");
> >      s = SYS_BUS_DEVICE(dev);
> > --
>
> Regards,
> Bin
>

--0000000000008a26cc05e8cdac7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 16, 2022 at 5:26 PM Bin Meng =
&lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, Sep 15, 2022 at 11:30 PM Bernhard Beschow &lt;<a href=
=3D"mailto:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Adds missing functionality to emulated e500 SOCs which increases the<b=
r>
&gt; chance of given &quot;real&quot; firmware images to access SD cards.<b=
r>
<br>
By &quot;firmware&quot; do you mean U-Boot?<br></blockquote><div><br></div>=
<div>No, I mean a proprietary flash blob including partitions for the kerne=
l, root fs, U-Boot, etc. <br></div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/ppc/ppce500.rst | 13 +++++++++++++<br>
&gt;=C2=A0 hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 hw/ppc/e500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 32 ++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 46 insertions(+)<br>
&gt;<br>
&gt; diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst=
<br>
&gt; index c3f55c6f3d..50b199c8f3 100644<br>
&gt; --- a/docs/system/ppc/ppce500.rst<br>
&gt; +++ b/docs/system/ppc/ppce500.rst<br>
&gt; @@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devic=
es:<br>
&gt;=C2=A0 * Power-off functionality via one GPIO pin<br>
&gt;=C2=A0 * 1 Freescale MPC8xxx PCI host controller<br>
&gt;=C2=A0 * VirtIO devices via PCI bus<br>
&gt; +* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)<br>
&gt;=C2=A0 * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)<=
br>
&gt;<br>
&gt;=C2=A0 Hardware configuration information<br>
&gt; @@ -131,6 +132,18 @@ be used as follows:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive if=3Dpflash,file=3D/path/to/rootfs.e=
xt2,format=3Draw \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;rootwait root=3D/dev/mtdblock=
0&quot;<br>
&gt;<br>
&gt; +Alternatively, the root file system can also reside on an emulated SD=
 card<br>
&gt; +whose size must again be a power of two:<br>
&gt; +<br>
&gt; +.. code-block:: bash<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \<br>
<br>
qemu-system-ppc{64|32}<br></blockquote><div><br></div><div>Will fix.</div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 -display none -serial stdio \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -kernel vmlinux \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -device sd-card,drive=3Dmydrive \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -drive id=3Dmydrive,if=3Dnone,file=3D/path/to/ro=
otfs.ext2,format=3Draw \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -append &quot;rootwait root=3D/dev/mmcblk0&quot;=
<br>
&gt; +<br>
&gt;=C2=A0 Running U-Boot<br>
&gt;=C2=A0 --------------<br>
&gt;<br>
&gt; diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig<br>
&gt; index 769a1ead1c..6e31f568ba 100644<br>
&gt; --- a/hw/ppc/Kconfig<br>
&gt; +++ b/hw/ppc/Kconfig<br>
&gt; @@ -129,6 +129,7 @@ config E500<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select PFLASH_CFI01<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select PLATFORM_BUS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select PPCE500_PCI<br>
&gt; +=C2=A0 =C2=A0 select SDHCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select SERIAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select MPC_I2C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select FDT_PPC<br>
&gt; diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c<br>
&gt; index 7843a4e04b..87a03fd4a9 100644<br>
&gt; --- a/hw/ppc/e500.c<br>
&gt; +++ b/hw/ppc/e500.c<br>
&gt; @@ -48,6 +48,7 @@<br>
&gt;=C2=A0 #include &quot;hw/net/fsl_etsec/etsec.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i2c/i2c.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;hw/sd/sdhci.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #define EPAPR_MAGIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (0x45504150)<br>
&gt;=C2=A0 #define DTC_LOAD_PAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x1800000<br>
&gt; @@ -66,11 +67,14 @@<br>
&gt;=C2=A0 #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL<br>
&gt;=C2=A0 #define MPC8544_PCI_REGS_OFFSET=C2=A0 =C2=A0 0x8000ULL<br>
&gt;=C2=A0 #define MPC8544_PCI_REGS_SIZE=C2=A0 =C2=A0 =C2=A0 0x1000ULL<br>
&gt; +#define MPC85XX_ESDHC_REGS_OFFSET=C2=A0 0x2e000ULL<br>
&gt; +#define MPC85XX_ESDHC_REGS_SIZE=C2=A0 =C2=A0 0x1000ULL<br>
&gt;=C2=A0 #define MPC8544_UTIL_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xe0000UL=
L<br>
&gt;=C2=A0 #define MPC8XXX_GPIO_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000FF00=
0ULL<br>
&gt;=C2=A0 #define MPC8544_I2C_REGS_OFFSET=C2=A0 =C2=A0 0x3000ULL<br>
&gt;=C2=A0 #define MPC8XXX_GPIO_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A047<br>
&gt;=C2=A0 #define MPC8544_I2C_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 43<br>
&gt; +#define MPC85XX_ESDHC_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 72<br>
&gt;=C2=A0 #define RTC_REGS_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x68<br>
&gt;<br>
&gt;=C2=A0 #define PLATFORM_CLK_FREQ_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A0(400 * 10=
00 * 1000)<br>
&gt; @@ -203,6 +207,25 @@ static void dt_i2c_create(void *fdt, const char *=
soc, const char *mpic,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(i2c);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void dt_sdhc_create(void *fdt, const char *parent, const char =
*mpic)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 hwaddr mmio =3D MPC85XX_ESDHC_REGS_OFFSET;<br>
&gt; +=C2=A0 =C2=A0 hwaddr size =3D MPC85XX_ESDHC_REGS_SIZE;<br>
&gt; +=C2=A0 =C2=A0 int irq =3D MPC85XX_ESDHC_IRQ;<br>
&gt; +=C2=A0 =C2=A0 char *name;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;%s/sdhc@%&quot; PRIx64, =
parent, mmio);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, name);<br>
&gt; +=C2=A0 =C2=A0 /* qemu_fdt_setprop_cells(fdt, name, &quot;voltage-rang=
es&quot;, 3300, 3300); */<br>
<br>
Drop it if it is useless<br>
<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cells(fdt, name, &quot;clock-frequency=
&quot;, 167000000);<br>
<br>
Is this an arbitrary frequency?<br></blockquote><div><br></div><div>I&#39;l=
l drop both since the eSDHC works also without the frequency line.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop(fdt, name, &quot;sdhci,auto-cmd12&quot=
;, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_phandle(fdt, name, &quot;interrupt-par=
ent&quot;, mpic);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cells(fdt, name, &quot;bus-width&quot;=
, 4);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cells(fdt, name, &quot;interrupts&quot=
;, irq, 0x2);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cells(fdt, name, &quot;reg&quot;, mmio=
, size);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_string(fdt, name, &quot;compatible&quo=
t;, &quot;fsl,esdhc&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_free(name);<br>
&gt; +}<br>
&gt;<br>
&gt;=C2=A0 typedef struct PlatformDevtreeData {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void *fdt;<br>
&gt; @@ -556,6 +579,8 @@ static int ppce500_load_device_tree(PPCE500Machine=
State *pms,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dt_rtc_create(fdt, &quot;i2c&quot;, &quot;rtc&quot=
;);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 /* sdhc */<br>
&gt; +=C2=A0 =C2=A0 dt_sdhc_create(fdt, soc, mpic);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gutil =3D g_strdup_printf(&quot;%s/global-utilitie=
s@%llx&quot;, soc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPC8544_UTIL_OFFSET);<br>
&gt; @@ -996,6 +1021,13 @@ void ppce500_init(MachineState *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 i2c_slave_create_simple(i2c, &quot;ds1338&quot;, R=
TC_REGS_OFFSET);<br>
&gt;<br>
&gt;<br>
<br>
nits: use one line for the separation<br></blockquote><div><br></div><div>T=
he extra empty line was there before and it looks like it came from moving =
I2C around - notice the broken indentation of it&#39;s comment.</div><div><=
br></div><div>I&#39;ll fix that in this patch.</div><div><br></div><div>Bes=
t regards,</div><div>Bernhard<br></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /* eSDHC */<br>
&gt; +=C2=A0 =C2=A0 dev =3D qdev_new(TYPE_FSL_ESDHC);<br>
&gt; +=C2=A0 =C2=A0 s =3D SYS_BUS_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 sysbus_realize_and_unref(s, &amp;error_fatal);<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(s, 0, pmc-&gt;ccsrbar_base + MPC85XX_ES=
DHC_REGS_OFFSET);<br>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC8=
5XX_ESDHC_IRQ));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* General Utility device */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dev =3D qdev_new(&quot;mpc8544-guts&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s =3D SYS_BUS_DEVICE(dev);<br>
&gt; --<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>

--0000000000008a26cc05e8cdac7b--

