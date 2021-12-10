Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B0470090
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:22:48 +0100 (CET)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvevG-0000O4-Qj
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mveuF-0007sQ-I9
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:21:43 -0500
Received: from [2a00:1450:4864:20::42a] (port=37872
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mveuC-0000ES-Vc
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 07:21:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d9so14649182wrw.4
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 04:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mug8XiN/UPkKN3aBQ+HH4K2M990XY4MjIOQlqvHNioo=;
 b=M4sQsrlI8GTCtj1qnMaxVD9tYdKPzYBl2brpImS6XZDqFa0a9mqm9P1mraqswymCAx
 MMOmqvWBXfnZTAHAE5wNUou64m28b1KEjGAGexLHrbeJRMUea5Ur1K0a0I4c7txsd0DV
 Yl6QKDC/S3SWpKC0PAOgGQCYuNJtEycPzo38g0siNCllu7gszraqMFr8M673lQe4RjfN
 ZxfAZ79RFVKhfo25mAE09M3242Rq/QVPxuUUTTgZZsbGk88+r0TK+CjYboulTjLc0dBs
 BWPlJPpcywktnpDjIWF6pqlMAyz1WEWoa6r3b9yGtDdg07DVo1yiqrH3s1gA0SSfI1bx
 Q5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mug8XiN/UPkKN3aBQ+HH4K2M990XY4MjIOQlqvHNioo=;
 b=X5fyLm060vCyEUcR+1X3jP1eh/lyW83ZPaES0wfAx0qeLXIgAKMkCRcKnRQ5dLxEEJ
 YlJC7JFDxgn2u4NUC8ejVvFPRCIyeJ8Q/I78hrQ25Kwq7Vti+mSTjHm9as7NS9BR96L1
 hfdLHosPHrS9X7flKZER9/6aZRyBZGCrm+NgUs2KHCuROdEnGKd0JRfpyCCZouyRPAA3
 m/1BHXSZddjsyMIEe03/49vhqHy0lH1CEQSEjwbQ6kkJYzbh56uyGJum02v/6d2EG1SP
 Uijhoi4u9chDzTxcnsMFJgaKvHrJfh2syEOs+Jyh3shroufVzdbjEaUc48h+CFtYH4mC
 w5ZQ==
X-Gm-Message-State: AOAM532leKfXXPCbbLee6b2pzsPzUOFekklxMBG9KH1LXhoXo3yu9+Kh
 eKiZA76AHKciT6VD6pER3NhkBGCpCxeAE4I65jNR5g==
X-Google-Smtp-Source: ABdhPJwvVtBBgKVgwSfei0DsJFurUvvdho8HLldYswma4qabgjV8h/BBtNzOvnS79otT5gtMfgc6R+PfarA3a8slc10=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr13086902wro.484.1639138899215; 
 Fri, 10 Dec 2021 04:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-12-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-12-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 12:21:26 +0000
Message-ID: <CAFEAcA98YGz0DG+4PVkSNqWQjdpz+pobt8XmrTd4mRXPYyoffg@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] docs/devel: Add documentation for the DMA
 control interface
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:41, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Also, since being the author, list myself as maintainer for the file.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  MAINTAINERS                |   1 +
>  docs/devel/dma-ctrl-if.rst | 320 +++++++++++++++++++++++++++++++++++++++++++++
>  docs/devel/index.rst       |   1 +
>  3 files changed, 322 insertions(+)
>  create mode 100644 docs/devel/dma-ctrl-if.rst

Hi; I have mostly typo/grammar notes below, but one suggestion for
a tweak to the API and one question about how DMA "refill" works.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e52cc94840..ffefcc841f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -968,6 +968,7 @@ M: Francisco Iglesias <francisco.iglesias@xilinx.com>
>  S: Maintained
>  F: hw/ssi/xlnx-versal-ospi.c
>  F: include/hw/ssi/xlnx-versal-ospi.h
> +F: docs/devel/dma-ctrl-if.rst
>
>  ARM ACPI Subsystem
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
> diff --git a/docs/devel/dma-ctrl-if.rst b/docs/devel/dma-ctrl-if.rst
> new file mode 100644
> index 0000000000..480e2a7d3a
> --- /dev/null
> +++ b/docs/devel/dma-ctrl-if.rst
> @@ -0,0 +1,320 @@
> +DMA control interface
> +=====================
> +
> +About the DMA control interface
> +-------------------------------
> +
> +DMA engines embedded in peripherals can end up being controlled in
> +different ways on real hardware. One possible way is to allow software
> +drivers to access the DMA engine's register API and to allow the drivers
> +to configure and control DMA transfers through the API. A model of a DMA
> +engine in QEMU that is embedded and (re)used in this manner does not need
> +to implement the DMA control interface.
> +
> +Another option on real hardware is to allow the peripheral embedding the
> +DMA engine to control the engine through a custom hardware DMA control
> +interface between the two. Software drivers in this scenario configure and
> +trigger DMA operations through the controlling peripheral's register API
> +(for example could writing a specific bit in a register propagate down to

"could" here is misplaced:
"for example, writing a specific bit in a register could propagate"

> +a transfer start signal on the DMA control interface). At the same time
> +the status, result and interrupts for the transfer might still be intended
> +to be read and catched through the DMA engine's register API (and

"caught"

> +signals).
> +
> +::
> +
> +    Hardware example
> +                   +------------+
> +                   |            |
> +                   | Peripheral |
> +                   |            |
> +                   +------------+
> +                        /\
> +                        ||   DMA control IF (custom)
> +                        \/
> +                   +------------+
> +                   | Peripheral |
> +                   |    DMA     |
> +                   +------------+
> +
> +Figure 1. A peripheral controlling it's embedded DMA engine through a

"its"

> +custom DMA control interface
> +
> +Above scenario can be modelled in QEMU by implementing this DMA control

"The above"

> +interface in the DMA engine model. This will allow a peripheral embedding
> +the DMA engine to initiate DMA transfers through the engine using the
> +interface. At the same time the status, result and interrupts for the
> +transfer can be read and catched through the DMA engine's register API and

"caught"

> +signals. An example implementation and usage of the DMA control interface
> +can be found in the Xilinx CSU DMA model and Xilinx Versal's OSPI model.
> +
> +::
> +
> +    Memory address
> +    (register API)
> +      0xf1010000   +---------+
> +                   |         |
> +                   | Versal  |
> +                   |  OSPI   |
> +                   |         |
> +                   +---------+
> +                       /\
> +                       ||  DMA control IF
> +                       \/
> +      0xf1011000   +---------+
> +                   |         |
> +                   | CSU DMA |
> +                   |  (src)  |
> +                   |         |
> +                   +---------+
> +
> +Figure 2. Xilinx Versal's OSPI controls and initiates transfers on it's

"its"

> +CSU source DMA through a DMA control interface
> +
> +DMA control interface files
> +---------------------------
> +
> +``include/hw/dma/dma-ctrl-if.h``
> +``hw/dma/dma-ctrl-if.c``
> +
> +DmaCtrlIfClass
> +--------------
> +
> +The ``DmaCtrlIfClass`` contains the interface methods that can be
> +implemented by a DMA engine.
> +
> +.. code-block:: c
> +
> +    typedef struct DmaCtrlIfClass {
> +        InterfaceClass parent;
> +
> +        /*
> +         * read: Start a read transfer on the DMA implementing the DMA control

"on the DMA engine"

> +         * interface
> +         *
> +         * @dma_ctrl: the DMA implementing this interface

"the DMA engine"

> +         * @addr: the address to read
> +         * @len: the amount of bytes to read at 'addr'
> +         * @notify: the structure containg a callback to call and opaque pointer
> +         * to pass the callback when the transfer has been completed
> +         * @start_dma: true for starting the DMA transfer and false for just
> +         * refilling and proceding an already started transfer

"proceeding with"


The "start a read transfer" part seems clear enough. But I don't
understand how the "refill" case works (in fact, I'm not even sure
what "refill" means in a DMA context...) When should a caller pass
in start_dma = false, and how does it change the behaviour of the
DMA engine ?

> +         */
> +        void (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
> +                     DmaCtrlIfNotify *notify, bool start_dma);
> +    } DmaCtrlIfClass;
> +
> +
> +DmaCtrlIfNotify
> +---------------
> +
> +The ``DmaCtrlIfNotify`` contains a callback function that is called when a
> +transfer has been completed. It also contains an opaque pointer that is
> +passed in to the function as an argument.
> +
> +.. code-block:: c
> +
> +    typedef struct DmaCtrlIfNotify {
> +        void *opaque;
> +        dmactrlif_notify_fn cb;
> +    } DmaCtrlIfNotify;

I don't think we really need this struct. The read method on
DmaCtrlIfClass can just take two arguments, one for the
function pointer and one for the opaque pointer. I think this is
the more usual convention in C: you can see uses of the two-argument
approach in QEMU in aio_wait_bh_oneshot(), timerlist_new() and
memory_region_init_io(), among other places.

Looking at your implementation, the implementation of the read
method immediately pulls the two fields out of the struct and
deals with them separately, and the caller puts together the
struct only as a way to pass the two things it wants. So the
struct isn't really bringing anything much here.

> +dma_ctrl_if_read_with_notify
> +----------------------------
> +
> +The ``dma_ctrl_if_read_with_notify`` function is used from a model
> +embedding the DMA engine for starting DMA read transfers.
> +
> +.. code-block:: c
> +
> +    /*
> +     * Start a read transfer on a DMA implementing the DMA control interface.

"a DMA engine"

> +     * The DMA will notify the caller that 'len' bytes have been read at 'addr'

"The DMA engine"

> +     * through the callback in the DmaCtrlIfNotify structure. For allowing refilling
> +     * an already started transfer the DMA notifies the caller before considering

"the DMA engine"

> +     * the transfer done (e.g. before setting done flags, generating IRQs and
> +     * modifying other relevant internal device state).
> +     *
> +     * @dma_ctrl: the DMA implementing this interface

"the DMA engine"

> +     * @addr: the address to read
> +     * @len: the amount of bytes to read at 'addr'

"number of bytes"

> +     * @notify: the structure containing a callback to call and opaque pointer
> +     * to pass the callback when the transfer has been completed

As noted above, we should just pass in the callback and opaque as
two arguments.

> +     * @start_dma: true for starting the DMA transfer and false for just
> +     * refilling and proceding an already started transfer

"proceeding with"

> +     */
> +    void dma_ctrl_if_read_with_notify(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
> +                                      DmaCtrlIfNotify *notify, bool start_dma);
> +
> +Example implementation of the DMA control interface
> +---------------------------------------------------
> +
> +The example code below showing an implementation of the DMA control
> +interface is taken from the Xilinx CSU DMA model.
> +
> +The DMA control interface related code in
> +``include/hw/dma/xlnx_csu_dma.h`` is found below. The header includes
> +``include/hw/dma/dma-ctrl-if.h`` and makes it possible to keep track of a
> +notifier function with a corresponding opaque. The notifier is called when
> +the transfer has been completed (with the opaque passed in as argument).
> +
> +.. code-block:: c
> +
> +    .
> +    .
> +    .
> +    #include "hw/dma/dma-ctrl-if.h"
> +    .
> +    .
> +    .
> +    typedef struct XlnxCSUDMA {
> +    .
> +    .
> +    .
> +        dmactrlif_notify_fn dmactrlif_notify;
> +        void *dmactrlif_opaque;
> +    .
> +    .
> +    .
> +    } XlnxCSUDMA;
> +    .
> +    .
> +    .
> +
> +The DMA control interface related code inside ``hw/dma/xlnx_csu_dma.c`` is
> +shown below. A DMA control interface read function gets installed in the
> +class init function through which DMA read transfers can be started. The
> +DMA control interface notifier is called once a transfer has been
> +completed (with the opaque passed in as argument) but before any DMA
> +status has been updated (for allowing refilling the transfer).
> +
> +.. code-block:: c
> +
> +    .
> +    .
> +    .
> +    static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
> +    {
> +    .
> +    .
> +    .
> +        /* Notify dma-ctrl-if clients when the transfer has been completed */
> +        if (size == 0 && s->dmactrlif_notify) {
> +            s->dmactrlif_notify(s->dmactrlif_opaque);
> +        }
> +
> +        if (size == 0) {
> +            xlnx_csu_dma_done(s);
> +        }
> +
> +        return size;
> +    }
> +    .
> +    .
> +    .
> +    static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
> +                                              uint32_t len, DmaCtrlIfNotify *notify,
> +                                              bool start_dma)
> +    {
> +    .
> +    .
> +    .
> +    static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
> +    {
> +        DeviceClass *dc = DEVICE_CLASS(klass);
> +        StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
> +        DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
> +    .
> +    .
> +    .
> +        dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
> +    }
> +    .
> +    .
> +    .
> +    static const TypeInfo xlnx_csu_dma_info = {
> +    .
> +    .
> +    .
> +        .interfaces = (InterfaceInfo[]) {
> +            { TYPE_STREAM_SINK },
> +            { TYPE_DMA_CTRL_IF },
> +            { }
> +        }
> +    };
> +
> +Example DMA control interface read transfer start
> +-------------------------------------------------
> +
> +The DMA read transfer example is taken from the Xilinx Versal's OSPI
> +model. The DMA read transfer is started by a register write to the OSPI
> +controller.
> +
> +The DMA control interface related code inside
> +``include/hw/ssi/xlnx-versal-ospi.h`` is shown below. The header includes
> +``include/hw/dma/dma-ctrl-if.h`` and the state structure contains a
> +pointer to a DMA engine that has implemented the DMA control interface.
> +
> +.. code-block:: c
> +
> +    .
> +    .
> +    .
> +    #include "hw/dma/dma-ctrl-if.h"
> +    .
> +    .
> +    .
> +    typedef struct XlnxVersalOspi {
> +    .
> +    .
> +    .
> +        DmaCtrlIf *dma_src;
> +    .
> +    .
> +    .
> +    } XlnxVersalOspi;
> +    .
> +    .
> +    .
> +
> +The DMA control interface related code inside
> +``hw/ssi/xlnx-versal-ospi.c`` can be seen below. OSPI DMA read transfers
> +are performed and executed through the DMA control interface read function
> +(and with the CSU source DMA). The OSPI controller is also able to refill
> +the transfer as required through the notifier (which is called when the
> +transfer has been completed).
> +
> +.. code-block:: c
> +
> +    static void ospi_dma_read(XlnxVersalOspi *s, bool start_dma)
> +    {
> +    .
> +    .
> +    .
> +        DmaCtrlIfNotify notify = { .cb = ospi_notify,
> +                                   .opaque = (void *)s };
> +    .
> +    .
> +    .
> +            dma_ctrl_if_read_with_notify(s->dma_src, 0, dma_len,
> +                                         &notify, start_dma);
> +    .
> +    .
> +    .
> +    }
> +    .
> +    .
> +    .
> +    static void xlnx_versal_ospi_init(Object *obj)
> +    {
> +    .
> +    .
> +    .
> +        object_property_add_link(obj, "dma-src", TYPE_DMA_CTRL_IF,
> +                                 (Object **)&s->dma_src,
> +                                 object_property_allow_set_link,
> +                                 OBJ_PROP_LINK_STRONG);
> +    .
> +    .
> +    .
> +    }
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index afd937535e..0d424bdf34 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -37,6 +37,7 @@ modifying QEMU's source code.
>     reset
>     s390-dasd-ipl
>     clocks
> +   dma-ctrl-if
>     qom
>     modules
>     block-coroutine-wrapper

thanks
-- PMM

