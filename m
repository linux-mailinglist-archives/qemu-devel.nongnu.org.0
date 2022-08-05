Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AC58A58E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 07:07:47 +0200 (CEST)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJpYo-0003YW-Am
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 01:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oJpWi-0001Ed-Lv; Fri, 05 Aug 2022 01:05:37 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oJpWf-0007rW-R6; Fri, 05 Aug 2022 01:05:36 -0400
Received: by mail-qv1-xf29.google.com with SMTP id j11so1082501qvt.10;
 Thu, 04 Aug 2022 22:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=qZ1B2NDi9ZR3PObJY02YqFrMb5TGImvdI9P+YPRNuyU=;
 b=XeTmf/TegY3d1+Pjb+UcRiZrGkxtgrJNRLXlznFSLlULcxPlM5ioI0f+KuPoOUR1E2
 zACxvnVqOjs0ZuUa6Emb9YiHsaaXpfQynbapLxmwzL5hw3OywPVp7LNDG6UTsVLE0Yqx
 Tb3Kwe6CmslOvkDFhiKxskfwPk8h4WpZom4izcEb7h6WFv821o6h12pJh40lO/StEuBj
 ahpkgVSR8gH3ak/nt4L2jpRoeZ6TINa/20VyFevh2MlZcChhssQF3c7RjAN8kmpwO+dr
 N0RQdvtcYED9KgNK5x5MrrDuaD+R/H7UVbtxlVnhuszTiQO7fXtEw5+4SNbB92omD4jL
 35lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=qZ1B2NDi9ZR3PObJY02YqFrMb5TGImvdI9P+YPRNuyU=;
 b=iH2Wh2CZkhk8P+80eZgRE0B8MFYLT5viD3Cw6UdLTeglxtjrOysOq9mpoeIFQCmlS6
 0bBNSOjTzucPP3KlpOQ/pMyoOAYQ03PZ7OXWeBFK7UAlLeB0MpPJTjOqQ7B4iScEQxx8
 vLlM2m75R3HGS+kdDajU8sGyGdypPRu0CEGhgPpzmG6cNlc587m8Gr0xCQIpQ9EzNUZx
 cgnma40hiQ8mCi/gSP/UOFa+CAxWAeAS4iZ3Mdqx9iNbmVV64poXjLXiUoJZkAZtoLLR
 TA9xgvk4QqMNy1LadMnvOQaNcipuV5SNbdlKDzFkXu6IuzVwWJXC9W0OmMh5QZudbW7e
 5NRg==
X-Gm-Message-State: ACgBeo10pvNUtt7VOUiHEQ1YSw+Nqe8IGqopjNI9Vso+Jx+XcNRyI7dX
 C6CnTpxAF4YC3YzWCJl4s6Grszs7n/1iPZHskgc=
X-Google-Smtp-Source: AA6agR4C3IBtcV9/ZGBe/P2uciMx8pP16JLB+ukNSM+aWkDnUJYXL8LzGlZFI4+rLEKUDDKXvd9LHQIm1JOPAoqd4Kw=
X-Received: by 2002:a05:6214:d88:b0:478:c84c:6c17 with SMTP id
 e8-20020a0562140d8800b00478c84c6c17mr2983398qve.63.1659675932090; Thu, 04 Aug
 2022 22:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220803023241.63739-1-irischenlj@gmail.com>
 <20220803023241.63739-2-irischenlj@gmail.com>
 <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
 <YuqwpCFNnh/wyNNe@pdel-mbp.dhcp.thefacebook.com>
 <CAJxKyLfMFDGhVGBCdPEm6dCyuV4NPFfn3vPZW+ugwZfsFtFgMg@mail.gmail.com>
 <YuxUfDT3H9CKGX4P@pdel-mbp.dhcp.thefacebook.com>
In-Reply-To: <YuxUfDT3H9CKGX4P@pdel-mbp.dhcp.thefacebook.com>
From: Dan Zhang <dz4list@gmail.com>
Date: Thu, 4 Aug 2022 22:05:20 -0700
Message-ID: <CAJxKyLfdNdGvGC+59HLJmLEjjc-_HnLiH4r8Xc9jEa47=7yisg@mail.gmail.com>
Subject: Re: [RFC 1/1] hw: tpmtisspi: add SPI support to QEMU TPM
 implementation
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Iris Chen <irischenlj@gmail.com>, Iris Chen <irischenlj@fb.com>,
 Peter Delevoryas <pdel@fb.com>, 
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 patrick@stwcx.xyz, 
 Alistair Francis <alistair@alistair23.me>, kwolf@redhat.com, hreitz@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, 
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=dz4list@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 4, 2022 at 4:21 PM Peter Delevoryas <peter@pjd.dev> wrote:
>
> On Thu, Aug 04, 2022 at 11:07:10AM -0700, Dan Zhang wrote:
> > On Wed, Aug 3, 2022 at 10:30 AM Peter Delevoryas <peter@pjd.dev> wrote:
> > >
> > > On Wed, Aug 03, 2022 at 10:52:23AM +0200, C=C3=A9dric Le Goater wrote=
:
> > > > On 8/3/22 04:32, Iris Chen wrote:
> > > > > From: Iris Chen <irischenlj@fb.com>
> > > >
> > > > A commit log telling us about this new device would be good to have=
.
> > > >
> > > >
> > > > > Signed-off-by: Iris Chen <irischenlj@fb.com>
> > > > > ---
> > > > >   configs/devices/arm-softmmu/default.mak |   1 +
> > > > >   hw/arm/Kconfig                          |   5 +
> > > > >   hw/tpm/Kconfig                          |   5 +
> > > > >   hw/tpm/meson.build                      |   1 +
> > > > >   hw/tpm/tpm_tis_spi.c                    | 311 +++++++++++++++++=
+++++++
> > > > >   include/sysemu/tpm.h                    |   3 +
> > > > >   6 files changed, 326 insertions(+)
> > > > >   create mode 100644 hw/tpm/tpm_tis_spi.c
> > > > >
> > > > > diff --git a/configs/devices/arm-softmmu/default.mak b/configs/de=
vices/arm-softmmu/default.mak
> > > > > index 6985a25377..80d2841568 100644
> > > > > --- a/configs/devices/arm-softmmu/default.mak
> > > > > +++ b/configs/devices/arm-softmmu/default.mak
> > > > > @@ -42,3 +42,4 @@ CONFIG_FSL_IMX6UL=3Dy
> > > > >   CONFIG_SEMIHOSTING=3Dy
> > > > >   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> > > > >   CONFIG_ALLWINNER_H3=3Dy
> > > > > +CONFIG_FBOBMC_AST=3Dy
> > > >
> > > > I don't think this extra config is useful for now
> > > >
> > > > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > > > index 15fa79afd3..193decaec1 100644
> > > > > --- a/hw/arm/Kconfig
> > > > > +++ b/hw/arm/Kconfig
> > > > > @@ -458,6 +458,11 @@ config ASPEED_SOC
> > > > >       select PMBUS
> > > > >       select MAX31785
> > > > > +config FBOBMC_AST
> > > > > +    bool
> > > > > +    select ASPEED_SOC
> > > > > +    select TPM_TIS_SPI
> > > > > +
> > > > >   config MPS2
> > > > >       bool
> > > > >       imply I2C_DEVICES
> > > > > diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> > > > > index 29e82f3c92..370a43f045 100644
> > > > > --- a/hw/tpm/Kconfig
> > > > > +++ b/hw/tpm/Kconfig
> > > > > @@ -8,6 +8,11 @@ config TPM_TIS_SYSBUS
> > > > >       depends on TPM
> > > > >       select TPM_TIS
> > > > > +config TPM_TIS_SPI
> > > > > +    bool
> > > > > +    depends on TPM
> > > > > +    select TPM_TIS
> > > > > +
> > > > >   config TPM_TIS
> > > > >       bool
> > > > >       depends on TPM
> > > > > diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> > > > > index 1c68d81d6a..1a057f4e36 100644
> > > > > --- a/hw/tpm/meson.build
> > > > > +++ b/hw/tpm/meson.build
> > > > > @@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: f=
iles('tpm_tis_common.c'))
> > > > >   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_=
tis_isa.c'))
> > > > >   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('t=
pm_tis_sysbus.c'))
> > > > >   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.=
c'))
> > > > > +softmmu_ss.add(when: 'CONFIG_TPM_TIS_SPI', if_true: files('tpm_t=
is_spi.c'))
> > > > >   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_=
true: files('tpm_ppi.c'))
> > > > >   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_=
true: files('tpm_ppi.c'))
> > > > > diff --git a/hw/tpm/tpm_tis_spi.c b/hw/tpm/tpm_tis_spi.c
> > > > > new file mode 100644
> > > > > index 0000000000..c98ddcfddb
> > > > > --- /dev/null
> > > > > +++ b/hw/tpm/tpm_tis_spi.c
> > > > > @@ -0,0 +1,311 @@
> > > > > +#include "qemu/osdep.h"
> > > > > +#include "hw/qdev-properties.h"
> > > > > +#include "migration/vmstate.h"
> > > > > +#include "hw/acpi/tpm.h"
> > > > > +#include "tpm_prop.h"
> > > > > +#include "tpm_tis.h"
> > > > > +#include "qom/object.h"
> > > > > +#include "hw/ssi/ssi.h"
> > > > > +#include "hw/ssi/spi_gpio.h"
> > > > > +
> > > > > +#define TPM_TIS_SPI_ADDR_BYTES 3
> > > > > +#define SPI_WRITE 0
> > > > > +
> > > > > +typedef enum {
> > > > > +    TIS_SPI_PKT_STATE_DEACTIVATED =3D 0,
> > > > > +    TIS_SPI_PKT_STATE_START,
> > > > > +    TIS_SPI_PKT_STATE_ADDRESS,
> > > > > +    TIS_SPI_PKT_STATE_DATA_WR,
> > > > > +    TIS_SPI_PKT_STATE_DATA_RD,
> > > > > +    TIS_SPI_PKT_STATE_DONE,
> > > > > +} TpmTisSpiPktState;
> > > > > +
> > > > > +union TpmTisRWSizeByte {
> > > > > +    uint8_t byte;
> > > > > +    struct {
> > > > > +        uint8_t data_expected_size:6;
> > > > > +        uint8_t resv:1;
> > > > > +        uint8_t rwflag:1;
> > > > > +    };
> > > > > +};
> > > > > +
> > > > > +union TpmTisSpiHwAddr {
> > > > > +    hwaddr addr;
> > > > > +    uint8_t bytes[sizeof(hwaddr)];
> > > > > +};
> > > > > +
> > > > > +union TpmTisSpiData {
> > > > > +    uint32_t data;
> > > > > +    uint8_t bytes[64];
> > > > > +};
> > > > > +
> > > > > +struct TpmTisSpiState {
> > > > > +    /*< private >*/
> > > > > +    SSIPeripheral parent_obj;
> > > > > +
> > > > > +    /*< public >*/
> > > > > +    TPMState tpm_state; /* not a QOM object */
> > > > > +    TpmTisSpiPktState tpm_tis_spi_state;
> > > > > +
> > > > > +    union TpmTisRWSizeByte first_byte;
> > > > > +    union TpmTisSpiHwAddr addr;
> > > > > +    union TpmTisSpiData data;
> > > >
> > > > Are these device registers ? I am not sure the unions are very usef=
ul.
> > >
> > > +1, I don't think we should be using unions, instead we should split =
out
> > > all the relevant fields we want to store and use extract32/deposit32/=
etc
> > > if necessary.
> > These union is used to saving us code to extract the bits from first by=
te
> > and assembling the hwaddr and unint32_t data from bytes.
> > I think as the bitfields has compiler implementation dependency of endi=
anness
> > we can switch to use extract8. or handle it for gcc
> > https://stackoverflow.com/questions/47600584/bitfield-endianness-in-gcc
>
> Hmmm ok, I'll let Cedric say what the preference would be in general sinc=
e
> I'm not totally sure.
>
> >
> > >
> > > >
> > > > > +    uint32_t data_size;
> > > > > +    uint8_t data_idx;
> > > > > +    uint8_t addr_idx;
> > > > > +};
> > > > > +
> > > > > +struct TpmTisSpiClass {
> > > > > +    SSIPeripheralClass parent_class;
> > > > > +};
> > > > > +
> > > > > +OBJECT_DECLARE_TYPE(TpmTisSpiState, TpmTisSpiClass, TPM_TIS_SPI)
> > > > > +
> > > > > +static void tpm_tis_spi_mmio_read(TpmTisSpiState *tts)
> > > > > +{
> > > > > +    uint16_t offset =3D tts->addr.addr & 0xffc;
> > > > > +
> > > > > +    switch (offset) {
> > > > > +    case TPM_TIS_REG_DATA_FIFO:
> > > > > +        for (uint8_t i =3D 0; i < tts->data_size; i++) {
> > > > > +            tts->data.bytes[i] =3D (uint8_t)tpm_tis_memory_ops.r=
ead(
> > > >
> > > >
> > > > you should add an address space for these memory transactions. Look=
 for
> > > > address_space_read/write calls, in the Aspeed I2C model for example=
.
> > >
> > > Yeah, or an even better example might be tpm_tis_isa. I feel like a
> > > shortcut might have been taken here to pull in tpm_tis_memory_ops
> > > directly, but we should have been treating the interface with the TPM=
 as
> > > a generic address space.
> > >
> > No, in our application we did not have those memory region
> > [0xFFD4_0000 ~ 0xFFD4_FFFF]
> > here we mapping the TPM TIS SPI message operations into mmio operations=
 is to
> > reuse the TIS registers models already implemented in tpm_tis_common.c
>
> Ehhh, I think you're misunderstanding. Yes, the ISA model is mapping the
> TPM MMIO address space into the ISA address space, and the SPI model
> doesn't have an address space like that, but we should still be using an
> MMIO address space to perform MMIO reads and writes, instead of calling
> the MMIO's callbacks directly.
>
> I think the motivation for this is that tpm_tis_common.c shouldn't even
> expose tpm_tis_memory_ops directly, it should just expose an address
> space to write to. But, I might be misunderstanding.
>
tpm_tis_common.c exposing the mmio_ops
(https://github.com/qemu/qemu/blob/master/hw/tpm/tpm_tis.h#L83)
essentially it is implementing the standard TPM TIS model (those tpm
interface registers i.e. TPM_STS etc)
while the tpm_tis_xxxx.c front ends modeling these registers' accessing met=
hod
i.e. host directly read / write memory address 0xFFD4_xxxx to access
these register,
this is modeled by tpm_tis_isa.c (x86) or tpm_tis_sysbus.c (arm).
Thus these model need create mmio region.

while BMC is sending the TPM TIS accessing SPI message to access these
registers,
NOT  mmio access to these registers, so tpmi_tis_spi model shall NOT
create memory region.

BTW, The TCG TPM TIS spec chapter 6 ( especially 6.4.6 SPI Bit Protocol) sp=
ecify
the SPI messages to read/write the TPM TIS registers.
And, on the PC or ARM host which using the mmio, under the hood, it is
the host-adapter
i.e. on PC the PCH or South Bridge, which implements the mmio,
converting the memory
 read/write operation into SPI messages. This is where the TPM
locality coming from.
> > > >
> > > > > +                                          &tts->tpm_state,
> > > > > +                                          tts->addr.addr,
> > > > > +                                          1);
> > > > > +        }
> > > > > +        break;
> > > > > +    default:
> > > > > +        tts->data.data =3D (uint32_t)tpm_tis_memory_ops.read(
> > > > > +                                   &tts->tpm_state,
> > > > > +                                   tts->addr.addr,
> > > > > +                                   tts->data_size);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void tpm_tis_spi_mmio_write(TpmTisSpiState *tts)
> > > > > +{
> > > > > +    uint16_t offset =3D tts->addr.addr & 0xffc;
> > > > > +
> > > > > +    switch (offset) {
> > > > > +    case TPM_TIS_REG_DATA_FIFO:
> > > > > +        for (uint8_t i =3D 0; i < tts->data_size; i++) {
> > > > > +            tpm_tis_memory_ops.write(&tts->tpm_state,
> > > > > +                                     tts->addr.addr,
> > > > > +                                     tts->data.bytes[i],
> > > > > +                                     1);
> > > > > +        }
> > > > > +        break;
> > > > > +    default:
> > > > > +        tpm_tis_memory_ops.write(&tts->tpm_state,
> > > > > +                                 tts->addr.addr,
> > > > > +                                 tts->data.data,
> > > > > +                                 tts->data_size);
> > > > > +        }
> > > > > +}
> > > > > +
> > > > > +static uint32_t tpm_tis_spi_transfer8(SSIPeripheral *ss, uint32_=
t tx)
> > > > > +{
> > > > > +    TpmTisSpiState *tts =3D TPM_TIS_SPI(ss);
> > > > > +    uint32_t r =3D 1;
> > > > > +
> > > > > +    switch (tts->tpm_tis_spi_state) {
> > > > > +    case TIS_SPI_PKT_STATE_START:
> > > > > +        tts->first_byte.byte =3D (uint8_t)tx;
> > > > > +        tts->data_size =3D tts->first_byte.data_expected_size + =
1;
> > > > > +        tts->data_idx =3D 0;
> > > > > +        tts->addr_idx =3D TPM_TIS_SPI_ADDR_BYTES;
> > > > > +        tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_ADDRESS;
> > > > > +        break;
> > > > > +    case TIS_SPI_PKT_STATE_ADDRESS:
> > > > > +        assert(tts->addr_idx > 0);
> > > > > +        tts->addr.bytes[--tts->addr_idx] =3D (uint8_t)tx;
> > > > > +
> > > > > +        if (tts->addr_idx =3D=3D 0) {
> > > > > +            if (tts->first_byte.rwflag =3D=3D SPI_WRITE) {
> > > > > +                tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DAT=
A_WR;
> > > > > +            } else { /* read and get the data ready */
> > > > > +                tpm_tis_spi_mmio_read(tts);
> > > > > +                tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DAT=
A_RD;
> > > > > +            }
> > > > > +        }
> > > > > +        break;
> > > > > +    case TIS_SPI_PKT_STATE_DATA_WR:
> > > > > +        tts->data.bytes[tts->data_idx++] =3D (uint8_t)tx;
> > > > > +        if (tts->data_idx =3D=3D tts->data_size) {
> > > > > +            tpm_tis_spi_mmio_write(tts);
> > > > > +            tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DONE;
> > > > > +        }
> > > > > +        break;
> > > > > +    case TIS_SPI_PKT_STATE_DATA_RD:
> > > > > +        r =3D tts->data.bytes[tts->data_idx++];
> > > > > +        if (tts->data_idx =3D=3D tts->data_size) {
> > > > > +            tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DONE;
> > > > > +        }
> > > > > +        break;
> > > > > +    default:
> > > > > +        tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DEACTIVATED=
;
> > > > > +        r =3D (uint32_t) -1;
> > > > > +    }
> > > > > +
> > > > > +    return r;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * Pre-reading logic for transfer:
> > > > > + * This is to fix the transaction between reading and writing.
> > > > > + * The first byte is arbitrarily inserted so we need to
> > > > > + * shift the all the output bytes (timeline) one byte right.
> > > > > + */
> > > > > +static uint32_t tpm_tis_spi_transfer8_ex(SSIPeripheral *ss, uint=
32_t tx)
> > > > > +{
> > > > > +    TpmTisSpiState *tts =3D TPM_TIS_SPI(ss);
> > > > > +    SSIBus *ssibus =3D (SSIBus *)qdev_get_parent_bus(DEVICE(tts)=
);
> > > > > +
> > > > > +    TpmTisSpiPktState prev_state =3D tts->tpm_tis_spi_state;
> > > > > +    uint32_t r =3D tpm_tis_spi_transfer8(ss, tx);
> > > > > +    TpmTisSpiPktState curr_state =3D tts->tpm_tis_spi_state;
> > > > > +
> > > > > +    if (ssibus->preread &&
> > > > > +       /* cmd state has changed into DATA reading state */
> > > > > +       prev_state !=3D TIS_SPI_PKT_STATE_DATA_RD &&
> > > > > +       curr_state =3D=3D TIS_SPI_PKT_STATE_DATA_RD) {
> > > > > +        r =3D tpm_tis_spi_transfer8(ss, 0xFF);
> > > > > +    }
> > > > > +
> > > > > +    return r;
> > > > > +}
> > > > > +
> > > > > +static int tpm_tis_spi_cs(SSIPeripheral *ss, bool select)
> > > > > +{
> > > > > +    TpmTisSpiState *tts =3D TPM_TIS_SPI(ss);
> > > > > +
> > > > > +    if (select) { /* cs de-assert */
> > > > > +        tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_DEACTIVATED=
;
> > > > > +    } else {
> > > > > +        tts->tpm_tis_spi_state =3D TIS_SPI_PKT_STATE_START;
> > > > > +        tts->first_byte.byte =3D 0;
> > > > > +        tts->addr.addr =3D 0;
> > > > > +        tts->data.data =3D 0;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int tpm_tis_pre_save_spi(void *opaque)
> > > > > +{
> > > > > +    TpmTisSpiState *sbdev =3D opaque;
> > > > > +
> > > > > +    return tpm_tis_pre_save(&sbdev->tpm_state);
> > > > > +}
> > > > > +
> > > > > +static const VMStateDescription vmstate_tpm_tis_spi =3D {
> > > > > +    .name =3D "tpm-tis-spi",
> > > > > +    .version_id =3D 0,
> > > > > +    .pre_save  =3D tpm_tis_pre_save_spi,
> > > > > +    .fields =3D (VMStateField[]) {
> > > > > +        VMSTATE_BUFFER(tpm_state.buffer, TpmTisSpiState),
> > > > > +        VMSTATE_UINT16(tpm_state.rw_offset, TpmTisSpiState),
> > > > > +        VMSTATE_UINT8(tpm_state.active_locty, TpmTisSpiState),
> > > > > +        VMSTATE_UINT8(tpm_state.aborting_locty, TpmTisSpiState),
> > > > > +        VMSTATE_UINT8(tpm_state.next_locty, TpmTisSpiState),
> > > > > +
> > > > > +        VMSTATE_STRUCT_ARRAY(tpm_state.loc, TpmTisSpiState, TPM_=
TIS_NUM_LOCALITIES,
> > > > > +                             0, vmstate_locty, TPMLocality),
> > > > > +
> > > > > +        VMSTATE_END_OF_LIST()
> > > > > +    }
> > > > > +};
> > > > > +
> > > > > +static void tpm_tis_spi_request_completed(TPMIf *ti, int ret)
> > > > > +{
> > > > > +    TpmTisSpiState *sbdev =3D TPM_TIS_SPI(ti);
> > > > > +    TPMState *s =3D &sbdev->tpm_state;
> > > > > +
> > > > > +    tpm_tis_request_completed(s, ret);
> > > > > +}
> > > > > +
> > > > > +static enum TPMVersion tpm_tis_spi_get_tpm_version(TPMIf *ti)
> > > > > +{
> > > > > +    TpmTisSpiState *sbdev =3D TPM_TIS_SPI(ti);
> > > > > +    TPMState *s =3D &sbdev->tpm_state;
> > > > > +
> > > > > +    return tpm_tis_get_tpm_version(s);
> > > > > +}
> > > > > +
> > > > > +static void tpm_tis_spi_reset(DeviceState *dev)
> > > > > +{
> > > > > +    TpmTisSpiState *sbdev =3D TPM_TIS_SPI(dev);
> > > > > +    TPMState *s =3D &sbdev->tpm_state;
> > > > > +
> > > > > +    return tpm_tis_reset(s);
> > > > > +}
> > > > > +
> > > > > +static Property tpm_tis_spi_properties[] =3D {
> > > > > +    DEFINE_PROP_UINT32("irq", TpmTisSpiState, tpm_state.irq_num,=
 TPM_TIS_IRQ),
> > > > > +    DEFINE_PROP_TPMBE("tpmdev", TpmTisSpiState, tpm_state.be_dri=
ver),
> > > > > +    DEFINE_PROP_BOOL("ppi", TpmTisSpiState, tpm_state.ppi_enable=
d, false),
> > > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > > +};
> > > > > +
> > > > > +static void tpm_tis_spi_realizefn(SSIPeripheral *ss, Error **err=
p)
> > > > > +{
> > > > > +    TpmTisSpiState *sbdev =3D TPM_TIS_SPI(ss);
> > > > > +
> > > > > +    if (!tpm_find()) {
> > > > > +        error_setg(errp, "at most one TPM device is permitted");
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (!sbdev->tpm_state.be_driver) {
> > > > > +        error_setg(errp, "'tpmdev' property is required");
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    DeviceState *spi_gpio =3D qdev_find_recursive(sysbus_get_def=
ault(),
> > > > > +                                                TYPE_SPI_GPIO);
> > > > > +    qdev_connect_gpio_out_named(spi_gpio,
> > > > > +                                "SPI_CS_out", 0,
> > > > > +                                qdev_get_gpio_in_named(DEVICE(ss=
),
> > > > > +                                SSI_GPIO_CS, 0));
> > > > Typically, this part is done at the machine/board level because it
> > > > has knowledge of all devices but it is possible with the TPM device=
s?
> > >
> > > +1, yeah this part should be removed.
> > >
> > > >
> > > > How do you invoke QEMU ?
> > >
> > > We have some hard-coded machine/board level code that wires up stuff,
> > > and then I think Iris was hard-coding this stuff in the TPM TIS SPI
> > > model so that the whole thing could be hidden behind a Kconfig and wi=
red
> > > in automatically when the Kconfig was enabled. But we should require
> > > users to wire it up themselves in the board code.
> > >
> > > >
> > > > Thanks,
> > > >
> > > > C.
> > > >
> > > > > +}
> > > > > +
> > > > > +static void tpm_tis_spi_class_init(ObjectClass *klass, void *dat=
a)
> > > > > +{
> > > > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > > > +    SSIPeripheralClass *k =3D SSI_PERIPHERAL_CLASS(klass);
> > > > > +    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
> > > > > +
> > > > > +    device_class_set_props(dc, tpm_tis_spi_properties);
> > > > > +    k->realize =3D tpm_tis_spi_realizefn;
> > > > > +    k->transfer =3D tpm_tis_spi_transfer8_ex;
> > > > > +    k->set_cs =3D tpm_tis_spi_cs;
> > > > > +    k->cs_polarity =3D SSI_CS_LOW;
> > > > > +
> > > > > +    dc->vmsd  =3D &vmstate_tpm_tis_spi;
> > > > > +    tc->model =3D TPM_MODEL_TPM_TIS;
> > > > > +    dc->user_creatable =3D true;
> > > > > +    dc->reset =3D tpm_tis_spi_reset;
> > > > > +    tc->request_completed =3D tpm_tis_spi_request_completed;
> > > > > +    tc->get_version =3D tpm_tis_spi_get_tpm_version;
> > > > > +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > > > > +}
> > > > > +
> > > > > +static const TypeInfo tpm_tis_spi_info =3D {
> > > > > +    .name =3D TYPE_TPM_TIS_SPI,
> > > > > +    .parent =3D TYPE_SSI_PERIPHERAL,
> > > > > +    .instance_size =3D sizeof(TpmTisSpiState),
> > > > > +    .class_size =3D sizeof(TpmTisSpiClass),
> > > > > +    .class_init  =3D tpm_tis_spi_class_init,
> > > > > +    .interfaces =3D (InterfaceInfo[]) {
> > > > > +        { TYPE_TPM_IF },
> > > > > +        { }
> > > > > +    }
> > > > > +};
> > > > > +
> > > > > +static void tpm_tis_spi_register(void)
> > > > > +{
> > > > > +    type_register_static(&tpm_tis_spi_info);
> > > > > +}
> > > > > +
> > > > > +type_init(tpm_tis_spi_register)
> > > > > diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> > > > > index fb40e30ff6..6a6b311e47 100644
> > > > > --- a/include/sysemu/tpm.h
> > > > > +++ b/include/sysemu/tpm.h
> > > > > @@ -46,6 +46,7 @@ struct TPMIfClass {
> > > > >   #define TYPE_TPM_TIS_ISA            "tpm-tis"
> > > > >   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
> > > > > +#define TYPE_TPM_TIS_SPI            "tpm-tis-spi-device"
> > > > >   #define TYPE_TPM_CRB                "tpm-crb"
> > > > >   #define TYPE_TPM_SPAPR              "tpm-spapr"
> > > > > @@ -53,6 +54,8 @@ struct TPMIfClass {
> > > > >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
> > > > >   #define TPM_IS_TIS_SYSBUS(chr)                      \
> > > > >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
> > > > > +#define TPM_IS_TIS_SPI(chr)                      \
> > > > > +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SPI)
> > > > >   #define TPM_IS_CRB(chr)                             \
> > > > >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> > > > >   #define TPM_IS_SPAPR(chr)                           \
> > > >

