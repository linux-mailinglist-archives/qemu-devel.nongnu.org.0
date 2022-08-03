Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A415888F6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 10:59:02 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJADV-0003G5-PK
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 04:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJA7R-0006zL-Vu
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:52:46 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:58173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJA7H-0002Xd-11
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:52:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 05F3721A7B;
 Wed,  3 Aug 2022 08:52:31 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 10:52:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012c017a39-ac20-4c76-8aac-49e1909a297e,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
Date: Wed, 3 Aug 2022 10:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 1/1] hw: tpmtisspi: add SPI support to QEMU TPM
 implementation
Content-Language: en-US
To: Iris Chen <irischenlj@gmail.com>
CC: <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>, Stefan Berger
 <stefanb@linux.ibm.com>
References: <20220803023241.63739-1-irischenlj@gmail.com>
 <20220803023241.63739-2-irischenlj@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803023241.63739-2-irischenlj@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5df9b9fc-b37b-4a34-9ce7-dc25bbd549f0
X-Ovh-Tracer-Id: 3985122720548489997
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/3/22 04:32, Iris Chen wrote:
> From: Iris Chen <irischenlj@fb.com>

A commit log telling us about this new device would be good to have.


> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
>   configs/devices/arm-softmmu/default.mak |   1 +
>   hw/arm/Kconfig                          |   5 +
>   hw/tpm/Kconfig                          |   5 +
>   hw/tpm/meson.build                      |   1 +
>   hw/tpm/tpm_tis_spi.c                    | 311 ++++++++++++++++++++++++
>   include/sysemu/tpm.h                    |   3 +
>   6 files changed, 326 insertions(+)
>   create mode 100644 hw/tpm/tpm_tis_spi.c
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 6985a25377..80d2841568 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -42,3 +42,4 @@ CONFIG_FSL_IMX6UL=y
>   CONFIG_SEMIHOSTING=y
>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>   CONFIG_ALLWINNER_H3=y
> +CONFIG_FBOBMC_AST=y

I don't think this extra config is useful for now

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 15fa79afd3..193decaec1 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -458,6 +458,11 @@ config ASPEED_SOC
>       select PMBUS
>       select MAX31785
>   
> +config FBOBMC_AST
> +    bool
> +    select ASPEED_SOC
> +    select TPM_TIS_SPI
> +
>   config MPS2
>       bool
>       imply I2C_DEVICES
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> index 29e82f3c92..370a43f045 100644
> --- a/hw/tpm/Kconfig
> +++ b/hw/tpm/Kconfig
> @@ -8,6 +8,11 @@ config TPM_TIS_SYSBUS
>       depends on TPM
>       select TPM_TIS
>   
> +config TPM_TIS_SPI
> +    bool
> +    depends on TPM
> +    select TPM_TIS
> +
>   config TPM_TIS
>       bool
>       depends on TPM
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 1c68d81d6a..1a057f4e36 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
> +softmmu_ss.add(when: 'CONFIG_TPM_TIS_SPI', if_true: files('tpm_tis_spi.c'))
>   
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
> diff --git a/hw/tpm/tpm_tis_spi.c b/hw/tpm/tpm_tis_spi.c
> new file mode 100644
> index 0000000000..c98ddcfddb
> --- /dev/null
> +++ b/hw/tpm/tpm_tis_spi.c
> @@ -0,0 +1,311 @@
> +#include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "hw/acpi/tpm.h"
> +#include "tpm_prop.h"
> +#include "tpm_tis.h"
> +#include "qom/object.h"
> +#include "hw/ssi/ssi.h"
> +#include "hw/ssi/spi_gpio.h"
> +
> +#define TPM_TIS_SPI_ADDR_BYTES 3
> +#define SPI_WRITE 0
> +
> +typedef enum {
> +    TIS_SPI_PKT_STATE_DEACTIVATED = 0,
> +    TIS_SPI_PKT_STATE_START,
> +    TIS_SPI_PKT_STATE_ADDRESS,
> +    TIS_SPI_PKT_STATE_DATA_WR,
> +    TIS_SPI_PKT_STATE_DATA_RD,
> +    TIS_SPI_PKT_STATE_DONE,
> +} TpmTisSpiPktState;
> +
> +union TpmTisRWSizeByte {
> +    uint8_t byte;
> +    struct {
> +        uint8_t data_expected_size:6;
> +        uint8_t resv:1;
> +        uint8_t rwflag:1;
> +    };
> +};
> +
> +union TpmTisSpiHwAddr {
> +    hwaddr addr;
> +    uint8_t bytes[sizeof(hwaddr)];
> +};
> +
> +union TpmTisSpiData {
> +    uint32_t data;
> +    uint8_t bytes[64];
> +};
> +
> +struct TpmTisSpiState {
> +    /*< private >*/
> +    SSIPeripheral parent_obj;
> +
> +    /*< public >*/
> +    TPMState tpm_state; /* not a QOM object */
> +    TpmTisSpiPktState tpm_tis_spi_state;
> +
> +    union TpmTisRWSizeByte first_byte;
> +    union TpmTisSpiHwAddr addr;
> +    union TpmTisSpiData data;

Are these device registers ? I am not sure the unions are very useful.

> +    uint32_t data_size;
> +    uint8_t data_idx;
> +    uint8_t addr_idx;
> +};
> +
> +struct TpmTisSpiClass {
> +    SSIPeripheralClass parent_class;
> +};
> +
> +OBJECT_DECLARE_TYPE(TpmTisSpiState, TpmTisSpiClass, TPM_TIS_SPI)
> +
> +static void tpm_tis_spi_mmio_read(TpmTisSpiState *tts)
> +{
> +    uint16_t offset = tts->addr.addr & 0xffc;
> +
> +    switch (offset) {
> +    case TPM_TIS_REG_DATA_FIFO:
> +        for (uint8_t i = 0; i < tts->data_size; i++) {
> +            tts->data.bytes[i] = (uint8_t)tpm_tis_memory_ops.read(


you should add an address space for these memory transactions. Look for
address_space_read/write calls, in the Aspeed I2C model for example.

> +                                          &tts->tpm_state,
> +                                          tts->addr.addr,
> +                                          1);
> +        }
> +        break;
> +    default:
> +        tts->data.data = (uint32_t)tpm_tis_memory_ops.read(
> +                                   &tts->tpm_state,
> +                                   tts->addr.addr,
> +                                   tts->data_size);
> +    }
> +}
> +
> +static void tpm_tis_spi_mmio_write(TpmTisSpiState *tts)
> +{
> +    uint16_t offset = tts->addr.addr & 0xffc;
> +
> +    switch (offset) {
> +    case TPM_TIS_REG_DATA_FIFO:
> +        for (uint8_t i = 0; i < tts->data_size; i++) {
> +            tpm_tis_memory_ops.write(&tts->tpm_state,
> +                                     tts->addr.addr,
> +                                     tts->data.bytes[i],
> +                                     1);
> +        }
> +        break;
> +    default:
> +        tpm_tis_memory_ops.write(&tts->tpm_state,
> +                                 tts->addr.addr,
> +                                 tts->data.data,
> +                                 tts->data_size);
> +        }
> +}
> +
> +static uint32_t tpm_tis_spi_transfer8(SSIPeripheral *ss, uint32_t tx)
> +{
> +    TpmTisSpiState *tts = TPM_TIS_SPI(ss);
> +    uint32_t r = 1;
> +
> +    switch (tts->tpm_tis_spi_state) {
> +    case TIS_SPI_PKT_STATE_START:
> +        tts->first_byte.byte = (uint8_t)tx;
> +        tts->data_size = tts->first_byte.data_expected_size + 1;
> +        tts->data_idx = 0;
> +        tts->addr_idx = TPM_TIS_SPI_ADDR_BYTES;
> +        tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_ADDRESS;
> +        break;
> +    case TIS_SPI_PKT_STATE_ADDRESS:
> +        assert(tts->addr_idx > 0);
> +        tts->addr.bytes[--tts->addr_idx] = (uint8_t)tx;
> +
> +        if (tts->addr_idx == 0) {
> +            if (tts->first_byte.rwflag == SPI_WRITE) {
> +                tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DATA_WR;
> +            } else { /* read and get the data ready */
> +                tpm_tis_spi_mmio_read(tts);
> +                tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DATA_RD;
> +            }
> +        }
> +        break;
> +    case TIS_SPI_PKT_STATE_DATA_WR:
> +        tts->data.bytes[tts->data_idx++] = (uint8_t)tx;
> +        if (tts->data_idx == tts->data_size) {
> +            tpm_tis_spi_mmio_write(tts);
> +            tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DONE;
> +        }
> +        break;
> +    case TIS_SPI_PKT_STATE_DATA_RD:
> +        r = tts->data.bytes[tts->data_idx++];
> +        if (tts->data_idx == tts->data_size) {
> +            tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DONE;
> +        }
> +        break;
> +    default:
> +        tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DEACTIVATED;
> +        r = (uint32_t) -1;
> +    }
> +
> +    return r;
> +}
> +
> +/*
> + * Pre-reading logic for transfer:
> + * This is to fix the transaction between reading and writing.
> + * The first byte is arbitrarily inserted so we need to
> + * shift the all the output bytes (timeline) one byte right.
> + */
> +static uint32_t tpm_tis_spi_transfer8_ex(SSIPeripheral *ss, uint32_t tx)
> +{
> +    TpmTisSpiState *tts = TPM_TIS_SPI(ss);
> +    SSIBus *ssibus = (SSIBus *)qdev_get_parent_bus(DEVICE(tts));
> +
> +    TpmTisSpiPktState prev_state = tts->tpm_tis_spi_state;
> +    uint32_t r = tpm_tis_spi_transfer8(ss, tx);
> +    TpmTisSpiPktState curr_state = tts->tpm_tis_spi_state;
> +
> +    if (ssibus->preread &&
> +       /* cmd state has changed into DATA reading state */
> +       prev_state != TIS_SPI_PKT_STATE_DATA_RD &&
> +       curr_state == TIS_SPI_PKT_STATE_DATA_RD) {
> +        r = tpm_tis_spi_transfer8(ss, 0xFF);
> +    }
> +
> +    return r;
> +}
> +
> +static int tpm_tis_spi_cs(SSIPeripheral *ss, bool select)
> +{
> +    TpmTisSpiState *tts = TPM_TIS_SPI(ss);
> +
> +    if (select) { /* cs de-assert */
> +        tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_DEACTIVATED;
> +    } else {
> +        tts->tpm_tis_spi_state = TIS_SPI_PKT_STATE_START;
> +        tts->first_byte.byte = 0;
> +        tts->addr.addr = 0;
> +        tts->data.data = 0;
> +    }
> +
> +    return 0;
> +}
> +
> +static int tpm_tis_pre_save_spi(void *opaque)
> +{
> +    TpmTisSpiState *sbdev = opaque;
> +
> +    return tpm_tis_pre_save(&sbdev->tpm_state);
> +}
> +
> +static const VMStateDescription vmstate_tpm_tis_spi = {
> +    .name = "tpm-tis-spi",
> +    .version_id = 0,
> +    .pre_save  = tpm_tis_pre_save_spi,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BUFFER(tpm_state.buffer, TpmTisSpiState),
> +        VMSTATE_UINT16(tpm_state.rw_offset, TpmTisSpiState),
> +        VMSTATE_UINT8(tpm_state.active_locty, TpmTisSpiState),
> +        VMSTATE_UINT8(tpm_state.aborting_locty, TpmTisSpiState),
> +        VMSTATE_UINT8(tpm_state.next_locty, TpmTisSpiState),
> +
> +        VMSTATE_STRUCT_ARRAY(tpm_state.loc, TpmTisSpiState, TPM_TIS_NUM_LOCALITIES,
> +                             0, vmstate_locty, TPMLocality),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void tpm_tis_spi_request_completed(TPMIf *ti, int ret)
> +{
> +    TpmTisSpiState *sbdev = TPM_TIS_SPI(ti);
> +    TPMState *s = &sbdev->tpm_state;
> +
> +    tpm_tis_request_completed(s, ret);
> +}
> +
> +static enum TPMVersion tpm_tis_spi_get_tpm_version(TPMIf *ti)
> +{
> +    TpmTisSpiState *sbdev = TPM_TIS_SPI(ti);
> +    TPMState *s = &sbdev->tpm_state;
> +
> +    return tpm_tis_get_tpm_version(s);
> +}
> +
> +static void tpm_tis_spi_reset(DeviceState *dev)
> +{
> +    TpmTisSpiState *sbdev = TPM_TIS_SPI(dev);
> +    TPMState *s = &sbdev->tpm_state;
> +
> +    return tpm_tis_reset(s);
> +}
> +
> +static Property tpm_tis_spi_properties[] = {
> +    DEFINE_PROP_UINT32("irq", TpmTisSpiState, tpm_state.irq_num, TPM_TIS_IRQ),
> +    DEFINE_PROP_TPMBE("tpmdev", TpmTisSpiState, tpm_state.be_driver),
> +    DEFINE_PROP_BOOL("ppi", TpmTisSpiState, tpm_state.ppi_enabled, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void tpm_tis_spi_realizefn(SSIPeripheral *ss, Error **errp)
> +{
> +    TpmTisSpiState *sbdev = TPM_TIS_SPI(ss);
> +
> +    if (!tpm_find()) {
> +        error_setg(errp, "at most one TPM device is permitted");
> +        return;
> +    }
> +
> +    if (!sbdev->tpm_state.be_driver) {
> +        error_setg(errp, "'tpmdev' property is required");
> +        return;
> +    }
> +
> +    DeviceState *spi_gpio = qdev_find_recursive(sysbus_get_default(),
> +                                                TYPE_SPI_GPIO);
> +    qdev_connect_gpio_out_named(spi_gpio,
> +                                "SPI_CS_out", 0,
> +                                qdev_get_gpio_in_named(DEVICE(ss),
> +                                SSI_GPIO_CS, 0));
Typically, this part is done at the machine/board level because it
has knowledge of all devices but it is possible with the TPM devices?

How do you invoke QEMU ?

Thanks,

C.

> +}
> +
> +static void tpm_tis_spi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SSIPeripheralClass *k = SSI_PERIPHERAL_CLASS(klass);
> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
> +
> +    device_class_set_props(dc, tpm_tis_spi_properties);
> +    k->realize = tpm_tis_spi_realizefn;
> +    k->transfer = tpm_tis_spi_transfer8_ex;
> +    k->set_cs = tpm_tis_spi_cs;
> +    k->cs_polarity = SSI_CS_LOW;
> +
> +    dc->vmsd  = &vmstate_tpm_tis_spi;
> +    tc->model = TPM_MODEL_TPM_TIS;
> +    dc->user_creatable = true;
> +    dc->reset = tpm_tis_spi_reset;
> +    tc->request_completed = tpm_tis_spi_request_completed;
> +    tc->get_version = tpm_tis_spi_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo tpm_tis_spi_info = {
> +    .name = TYPE_TPM_TIS_SPI,
> +    .parent = TYPE_SSI_PERIPHERAL,
> +    .instance_size = sizeof(TpmTisSpiState),
> +    .class_size = sizeof(TpmTisSpiClass),
> +    .class_init  = tpm_tis_spi_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_TPM_IF },
> +        { }
> +    }
> +};
> +
> +static void tpm_tis_spi_register(void)
> +{
> +    type_register_static(&tpm_tis_spi_info);
> +}
> +
> +type_init(tpm_tis_spi_register)
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index fb40e30ff6..6a6b311e47 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -46,6 +46,7 @@ struct TPMIfClass {
>   
>   #define TYPE_TPM_TIS_ISA            "tpm-tis"
>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
> +#define TYPE_TPM_TIS_SPI            "tpm-tis-spi-device"
>   #define TYPE_TPM_CRB                "tpm-crb"
>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>   
> @@ -53,6 +54,8 @@ struct TPMIfClass {
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>   #define TPM_IS_TIS_SYSBUS(chr)                      \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
> +#define TPM_IS_TIS_SPI(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SPI)
>   #define TPM_IS_CRB(chr)                             \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>   #define TPM_IS_SPAPR(chr)                           \


