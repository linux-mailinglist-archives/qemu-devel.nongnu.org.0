Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348D32E2ED
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 08:28:52 +0100 (CET)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI4tG-00049J-RS
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 02:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4rg-00035f-T6; Fri, 05 Mar 2021 02:27:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40958
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4rd-0008Rw-UD; Fri, 05 Mar 2021 02:27:12 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lI4rM-0002B1-C8; Fri, 05 Mar 2021 07:26:57 +0000
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210304140229.575481-1-armbru@redhat.com>
 <20210304140229.575481-2-armbru@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c57e14cb-ce56-c24b-f49b-523f311805f8@ilande.co.uk>
Date: Fri, 5 Mar 2021 07:26:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304140229.575481-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 1/2] hw: Replace anti-social QOM type names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, frederic.konrad@adacore.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, mreitz@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, andrew.smirnov@gmail.com,
 marcandre.lureau@redhat.com, atar4qemu@gmail.com, ehabkost@redhat.com,
 alistair@alistair23.me, dgilbert@redhat.com, chouteau@adacore.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, jsnow@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, jcd@tribudubois.net,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/03/2021 14:02, Markus Armbruster wrote:

> Several QOM type names contain ',':
> 
>      ARM,bitband-memory
>      etraxfs,pic
>      etraxfs,serial
>      etraxfs,timer
>      fsl,imx25
>      fsl,imx31
>      fsl,imx6
>      fsl,imx6ul
>      fsl,imx7
>      grlib,ahbpnp
>      grlib,apbpnp
>      grlib,apbuart
>      grlib,gptimer
>      grlib,irqmp
>      qemu,register
>      SUNW,bpp
>      SUNW,CS4231
>      SUNW,DBRI
>      SUNW,DBRI.prom
>      SUNW,fdtwo
>      SUNW,sx
>      SUNW,tcx
>      xilinx,zynq_slcr
>      xlnx,zynqmp
>      xlnx,zynqmp-pmu-soc
>      xlnx,zynq-xadc
> 
> These are all device types.  They can't be plugged with -device /
> device_add, except for xlnx,zynqmp-pmu-soc, and I doubt that one
> actually works.
> 
> They *can* be used with -device / device_add to request help.
> Usability is poor, though: you have to double the comma, like this:
> 
>      $ qemu-system-x86_64 -device SUNW,,fdtwo,help
> 
> Trap for the unwary.  The fact that this was broken in
> device-introspect-test for more than six years until commit e27bd49876
> fixed it demonstrates that "the unwary" includes seasoned developers.
> 
> One QOM type name contains ' ': "ICH9 SMB".  Because having to
> remember just one way to quote would be too easy.
> 
> Rename the "SUNW,FOO types to "sun-FOO".  Summarily replace ',' and '
> ' by '-' in the other type names.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/arm/armv7m.h                      |  2 +-
>   include/hw/arm/fsl-imx25.h                   |  2 +-
>   include/hw/arm/fsl-imx31.h                   |  2 +-
>   include/hw/arm/fsl-imx6.h                    |  2 +-
>   include/hw/arm/fsl-imx6ul.h                  |  2 +-
>   include/hw/arm/fsl-imx7.h                    |  2 +-
>   include/hw/arm/xlnx-zynqmp.h                 |  2 +-
>   include/hw/cris/etraxfs.h                    |  2 +-
>   include/hw/i386/ich9.h                       |  2 +-
>   include/hw/misc/grlib_ahb_apb_pnp.h          |  4 ++--
>   include/hw/misc/zynq-xadc.h                  |  2 +-
>   include/hw/register.h                        |  2 +-
>   include/hw/sparc/grlib.h                     |  6 +++---
>   hw/arm/xilinx_zynq.c                         |  2 +-
>   hw/audio/cs4231.c                            |  2 +-
>   hw/block/fdc.c                               |  4 ++--
>   hw/char/etraxfs_ser.c                        |  2 +-
>   hw/cris/axis_dev88.c                         |  6 +++---
>   hw/display/tcx.c                             |  2 +-
>   hw/intc/etraxfs_pic.c                        |  2 +-
>   hw/microblaze/xlnx-zynqmp-pmu.c              |  2 +-
>   hw/misc/zynq_slcr.c                          |  2 +-
>   hw/sparc/sun4m.c                             | 12 ++++++------
>   hw/timer/etraxfs_timer.c                     |  2 +-
>   softmmu/vl.c                                 |  2 +-
>   tests/vmstate-static-checker-data/dump1.json |  4 ++--
>   tests/vmstate-static-checker-data/dump2.json |  4 ++--
>   27 files changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 0791dcb68a..189b23a8ce 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -15,7 +15,7 @@
>   #include "target/arm/idau.h"
>   #include "qom/object.h"
>   
> -#define TYPE_BITBAND "ARM,bitband-memory"
> +#define TYPE_BITBAND "ARM-bitband-memory"
>   OBJECT_DECLARE_SIMPLE_TYPE(BitBandState, BITBAND)
>   
>   struct BitBandState {
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index c1603b2ac2..1b1086e945 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -34,7 +34,7 @@
>   #include "target/arm/cpu.h"
>   #include "qom/object.h"
>   
> -#define TYPE_FSL_IMX25 "fsl,imx25"
> +#define TYPE_FSL_IMX25 "fsl-imx25"
>   OBJECT_DECLARE_SIMPLE_TYPE(FslIMX25State, FSL_IMX25)
>   
>   #define FSL_IMX25_NUM_UARTS 5
> diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
> index b9792d58ae..c116a73e0b 100644
> --- a/include/hw/arm/fsl-imx31.h
> +++ b/include/hw/arm/fsl-imx31.h
> @@ -30,7 +30,7 @@
>   #include "target/arm/cpu.h"
>   #include "qom/object.h"
>   
> -#define TYPE_FSL_IMX31 "fsl,imx31"
> +#define TYPE_FSL_IMX31 "fsl-imx31"
>   OBJECT_DECLARE_SIMPLE_TYPE(FslIMX31State, FSL_IMX31)
>   
>   #define FSL_IMX31_NUM_UARTS 2
> diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
> index 29cc425acc..83291457cf 100644
> --- a/include/hw/arm/fsl-imx6.h
> +++ b/include/hw/arm/fsl-imx6.h
> @@ -36,7 +36,7 @@
>   #include "cpu.h"
>   #include "qom/object.h"
>   
> -#define TYPE_FSL_IMX6 "fsl,imx6"
> +#define TYPE_FSL_IMX6 "fsl-imx6"
>   OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6State, FSL_IMX6)
>   
>   #define FSL_IMX6_NUM_CPUS 4
> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index f8ebfba4f9..7812e516a5 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h
> @@ -40,7 +40,7 @@
>   #include "cpu.h"
>   #include "qom/object.h"
>   
> -#define TYPE_FSL_IMX6UL "fsl,imx6ul"
> +#define TYPE_FSL_IMX6UL "fsl-imx6ul"
>   OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6ULState, FSL_IMX6UL)
>   
>   enum FslIMX6ULConfiguration {
> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index 161fdc36da..f5d527a490 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -41,7 +41,7 @@
>   #include "cpu.h"
>   #include "qom/object.h"
>   
> -#define TYPE_FSL_IMX7 "fsl,imx7"
> +#define TYPE_FSL_IMX7 "fsl-imx7"
>   OBJECT_DECLARE_SIMPLE_TYPE(FslIMX7State, FSL_IMX7)
>   
>   enum FslIMX7Configuration {
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 6f45387a17..7941e29c29 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -36,7 +36,7 @@
>   #include "qom/object.h"
>   #include "net/can_emu.h"
>   
> -#define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
> +#define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>   OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>   
>   #define XLNX_ZYNQMP_NUM_APU_CPUS 4
> diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
> index 9e99380e0c..8b01ed67d3 100644
> --- a/include/hw/cris/etraxfs.h
> +++ b/include/hw/cris/etraxfs.h
> @@ -41,7 +41,7 @@ static inline DeviceState *etraxfs_ser_create(hwaddr addr,
>       DeviceState *dev;
>       SysBusDevice *s;
>   
> -    dev = qdev_new("etraxfs,serial");
> +    dev = qdev_new("etraxfs-serial");
>       s = SYS_BUS_DEVICE(dev);
>       qdev_prop_set_chr(dev, "chardev", chr);
>       sysbus_realize_and_unref(s, &error_fatal);
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index d1ea000d3d..23ee8e371b 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -216,7 +216,7 @@ struct ICH9LPCState {
>   
>   
>   /* D31:F3 SMBus controller */
> -#define TYPE_ICH9_SMB_DEVICE "ICH9 SMB"
> +#define TYPE_ICH9_SMB_DEVICE "ICH9-SMB"
>   
>   #define ICH9_A2_SMB_REVISION                    0x02
>   #define ICH9_SMB_PI                             0x00
> diff --git a/include/hw/misc/grlib_ahb_apb_pnp.h b/include/hw/misc/grlib_ahb_apb_pnp.h
> index 341451bff6..bab0b5f47f 100644
> --- a/include/hw/misc/grlib_ahb_apb_pnp.h
> +++ b/include/hw/misc/grlib_ahb_apb_pnp.h
> @@ -25,10 +25,10 @@
>   #define GRLIB_AHB_APB_PNP_H
>   #include "qom/object.h"
>   
> -#define TYPE_GRLIB_AHB_PNP "grlib,ahbpnp"
> +#define TYPE_GRLIB_AHB_PNP "grlib-ahbpnp"
>   OBJECT_DECLARE_SIMPLE_TYPE(AHBPnp, GRLIB_AHB_PNP)
>   
> -#define TYPE_GRLIB_APB_PNP "grlib,apbpnp"
> +#define TYPE_GRLIB_APB_PNP "grlib-apbpnp"
>   OBJECT_DECLARE_SIMPLE_TYPE(APBPnp, GRLIB_APB_PNP)
>   
>   void grlib_ahb_pnp_add_entry(AHBPnp *dev, uint32_t address, uint32_t mask,
> diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/misc/zynq-xadc.h
> index 602bfb4ab1..2017b7a803 100644
> --- a/include/hw/misc/zynq-xadc.h
> +++ b/include/hw/misc/zynq-xadc.h
> @@ -23,7 +23,7 @@
>   #define ZYNQ_XADC_NUM_ADC_REGS  128
>   #define ZYNQ_XADC_FIFO_DEPTH    15
>   
> -#define TYPE_ZYNQ_XADC          "xlnx,zynq-xadc"
> +#define TYPE_ZYNQ_XADC          "xlnx-zynq-xadc"
>   OBJECT_DECLARE_SIMPLE_TYPE(ZynqXADCState, ZYNQ_XADC)
>   
>   struct ZynqXADCState {
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 03c8926d27..b480e3882c 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -87,7 +87,7 @@ struct RegisterInfo {
>       void *opaque;
>   };
>   
> -#define TYPE_REGISTER "qemu,register"
> +#define TYPE_REGISTER "qemu-register"
>   DECLARE_INSTANCE_CHECKER(RegisterInfo, REGISTER,
>                            TYPE_REGISTER)
>   
> diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
> index 2104f493f3..ef1946c7f8 100644
> --- a/include/hw/sparc/grlib.h
> +++ b/include/hw/sparc/grlib.h
> @@ -32,14 +32,14 @@
>    */
>   
>   /* IRQMP */
> -#define TYPE_GRLIB_IRQMP "grlib,irqmp"
> +#define TYPE_GRLIB_IRQMP "grlib-irqmp"
>   
>   void grlib_irqmp_ack(DeviceState *dev, int intno);
>   
>   /* GPTimer */
> -#define TYPE_GRLIB_GPTIMER "grlib,gptimer"
> +#define TYPE_GRLIB_GPTIMER "grlib-gptimer"
>   
>   /* APB UART */
> -#define TYPE_GRLIB_APB_UART "grlib,apbuart"
> +#define TYPE_GRLIB_APB_UART "grlib-apbuart"
>   
>   #endif /* GRLIB_H */
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index b72772bc82..8db6cfd47f 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -231,7 +231,7 @@ static void zynq_init(MachineState *machine)
>       clock_set_hz(zynq_machine->ps_clk, PS_CLK_FREQUENCY);
>   
>       /* Create slcr, keep a pointer to connect clocks */
> -    slcr = qdev_new("xilinx,zynq_slcr");
> +    slcr = qdev_new("xilinx-zynq_slcr");
>       qdev_connect_clock_in(slcr, "ps_clk", zynq_machine->ps_clk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(slcr), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
> diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
> index 209c05a0a0..aefc3edea1 100644
> --- a/hw/audio/cs4231.c
> +++ b/hw/audio/cs4231.c
> @@ -37,7 +37,7 @@
>   #define CS_DREGS 32
>   #define CS_MAXDREG (CS_DREGS - 1)
>   
> -#define TYPE_CS4231 "SUNW,CS4231"
> +#define TYPE_CS4231 "sun-CS4231"
>   typedef struct CSState CSState;
>   DECLARE_INSTANCE_CHECKER(CSState, CS4231,
>                            TYPE_CS4231)
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 32701c2bc5..82afda7f3a 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2537,7 +2537,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
>       DeviceState *dev;
>       FDCtrlSysBus *sys;
>   
> -    dev = qdev_new("SUNW,fdtwo");
> +    dev = qdev_new("sun-fdtwo");
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sys = SYSBUS_FDC(dev);
>       sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
> @@ -2933,7 +2933,7 @@ static void sun4m_fdc_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo sun4m_fdc_info = {
> -    .name          = "SUNW,fdtwo",
> +    .name          = "sun-fdtwo",
>       .parent        = TYPE_SYSBUS_FDC,
>       .instance_init = sun4m_fdc_initfn,
>       .class_init    = sun4m_fdc_class_init,
> diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
> index 6bee3ee18e..e8c3017724 100644
> --- a/hw/char/etraxfs_ser.c
> +++ b/hw/char/etraxfs_ser.c
> @@ -50,7 +50,7 @@
>   #define STAT_TR_IDLE 22
>   #define STAT_TR_RDY  24
>   
> -#define TYPE_ETRAX_FS_SERIAL "etraxfs,serial"
> +#define TYPE_ETRAX_FS_SERIAL "etraxfs-serial"
>   typedef struct ETRAXSerial ETRAXSerial;
>   DECLARE_INSTANCE_CHECKER(ETRAXSerial, ETRAX_SERIAL,
>                            TYPE_ETRAX_FS_SERIAL)
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index b0cb6d84af..af5a0e3517 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -289,7 +289,7 @@ void axisdev88_init(MachineState *machine)
>                                   &gpio_state.iomem);
>   
>   
> -    dev = qdev_new("etraxfs,pic");
> +    dev = qdev_new("etraxfs-pic");
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
>       sysbus_mmio_map(s, 0, 0x3001c000);
> @@ -323,8 +323,8 @@ void axisdev88_init(MachineState *machine)
>       }
>   
>       /* 2 timers.  */
> -    sysbus_create_varargs("etraxfs,timer", 0x3001e000, irq[0x1b], nmi[1], NULL);
> -    sysbus_create_varargs("etraxfs,timer", 0x3005e000, irq[0x1b], nmi[1], NULL);
> +    sysbus_create_varargs("etraxfs-timer", 0x3001e000, irq[0x1b], nmi[1], NULL);
> +    sysbus_create_varargs("etraxfs-timer", 0x3005e000, irq[0x1b], nmi[1], NULL);
>   
>       for (i = 0; i < 4; i++) {
>           etraxfs_ser_create(0x30026000 + i * 0x2000, irq[0x14 + i], serial_hd(i));
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 965f92ff6b..60d76af0fe 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -56,7 +56,7 @@
>   #define TCX_THC_CURSMASK 0x900
>   #define TCX_THC_CURSBITS 0x980
>   
> -#define TYPE_TCX "SUNW,tcx"
> +#define TYPE_TCX "sun-tcx"
>   OBJECT_DECLARE_SIMPLE_TYPE(TCXState, TCX)
>   
>   struct TCXState {
> diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
> index 54ed4c77f7..bd37d1cca0 100644
> --- a/hw/intc/etraxfs_pic.c
> +++ b/hw/intc/etraxfs_pic.c
> @@ -38,7 +38,7 @@
>   #define R_R_GURU    4
>   #define R_MAX       5
>   
> -#define TYPE_ETRAX_FS_PIC "etraxfs,pic"
> +#define TYPE_ETRAX_FS_PIC "etraxfs-pic"
>   DECLARE_INSTANCE_CHECKER(struct etrax_pic, ETRAX_FS_PIC,
>                            TYPE_ETRAX_FS_PIC)
>   
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 1d1b4b5c19..5a2016672a 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -28,7 +28,7 @@
>   
>   /* Define the PMU device */
>   
> -#define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
> +#define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx-zynqmp-pmu-soc"
>   OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPPMUSoCState, XLNX_ZYNQMP_PMU_SOC)
>   
>   #define XLNX_ZYNQMP_PMU_ROM_SIZE    0x8000
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 66504a9d3a..12290ab8f6 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -182,7 +182,7 @@ REG32(DDRIOB, 0xb40)
>   #define ZYNQ_SLCR_MMIO_SIZE     0x1000
>   #define ZYNQ_SLCR_NUM_REGS      (ZYNQ_SLCR_MMIO_SIZE / 4)
>   
> -#define TYPE_ZYNQ_SLCR "xilinx,zynq_slcr"
> +#define TYPE_ZYNQ_SLCR "xilinx-zynq_slcr"
>   OBJECT_DECLARE_SIMPLE_TYPE(ZynqSLCRState, ZYNQ_SLCR)
>   
>   struct ZynqSLCRState {
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 38ca1e33c7..faa225b442 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -496,7 +496,7 @@ static void tcx_init(hwaddr addr, qemu_irq irq, int vram_size, int width,
>       DeviceState *dev;
>       SysBusDevice *s;
>   
> -    dev = qdev_new("SUNW,tcx");
> +    dev = qdev_new("sun-tcx");
>       qdev_prop_set_uint32(dev, "vram_size", vram_size);
>       qdev_prop_set_uint16(dev, "width", width);
>       qdev_prop_set_uint16(dev, "height", height);
> @@ -970,7 +970,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>       }
>   
>       if (hwdef->sx_base) {
> -        create_unimplemented_device("SUNW,sx", hwdef->sx_base, 0x2000);
> +        create_unimplemented_device("sun-sx", hwdef->sx_base, 0x2000);
>       }
>   
>       dev = qdev_new("sysbus-m48t08");
> @@ -1045,23 +1045,23 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>                        slavio_irq[30], fdc_tc);
>   
>       if (hwdef->cs_base) {
> -        sysbus_create_simple("SUNW,CS4231", hwdef->cs_base,
> +        sysbus_create_simple("sun-CS4231", hwdef->cs_base,
>                                slavio_irq[5]);
>       }
>   
>       if (hwdef->dbri_base) {
>           /* ISDN chip with attached CS4215 audio codec */
>           /* prom space */
> -        create_unimplemented_device("SUNW,DBRI.prom",
> +        create_unimplemented_device("sun-DBRI.prom",
>                                       hwdef->dbri_base + 0x1000, 0x30);
>           /* reg space */
> -        create_unimplemented_device("SUNW,DBRI",
> +        create_unimplemented_device("sun-DBRI",
>                                       hwdef->dbri_base + 0x10000, 0x100);
>       }
>   
>       if (hwdef->bpp_base) {
>           /* parallel port */
> -        create_unimplemented_device("SUNW,bpp", hwdef->bpp_base, 0x20);
> +        create_unimplemented_device("sun-bpp", hwdef->bpp_base, 0x20);
>       }
>   
>       initrd_size = 0;
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 48f2e3ade2..5379006086 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -48,7 +48,7 @@
>   #define R_INTR        0x50
>   #define R_MASKED_INTR 0x54
>   
> -#define TYPE_ETRAX_FS_TIMER "etraxfs,timer"
> +#define TYPE_ETRAX_FS_TIMER "etraxfs-timer"
>   typedef struct ETRAXTimerState ETRAXTimerState;
>   DECLARE_INSTANCE_CHECKER(ETRAXTimerState, ETRAX_TIMER,
>                            TYPE_ETRAX_FS_TIMER)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 8097a7b5fb..295df3927f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -918,7 +918,7 @@ static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] = {
>       [VGA_TCX] = {
>           .opt_name = "tcx",
>           .name = "TCX framebuffer",
> -        .class_names = { "SUNW,tcx" },
> +        .class_names = { "sun-tcx" },
>       },
>       [VGA_CG3] = {
>           .opt_name = "cg3",
> diff --git a/tests/vmstate-static-checker-data/dump1.json b/tests/vmstate-static-checker-data/dump1.json
> index 786ca0b484..334ec07963 100644
> --- a/tests/vmstate-static-checker-data/dump1.json
> +++ b/tests/vmstate-static-checker-data/dump1.json
> @@ -823,8 +823,8 @@
>         ]
>       }
>     },
> -  "SUNW,fdtwo": {
> -    "Name": "SUNW,fdtwo",
> +  "sun-fdtwo": {
> +    "Name": "sun-fdtwo",
>       "version_id": 2,
>       "minimum_version_id": 2,
>       "Description": {
> diff --git a/tests/vmstate-static-checker-data/dump2.json b/tests/vmstate-static-checker-data/dump2.json
> index 75719f5ec9..7184e9ccbb 100644
> --- a/tests/vmstate-static-checker-data/dump2.json
> +++ b/tests/vmstate-static-checker-data/dump2.json
> @@ -628,8 +628,8 @@
>         ]
>       }
>     },
> -  "SUNW,fdtwo": {
> -    "Name": "SUNW,fdtwo",
> +  "sun-fdtwo": {
> +    "Name": "sun-fdtwo",
>       "version_id": 2,
>       "minimum_version_id": 2,
>       "Description": {
> 

For changing all the SUNW prefixes:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

