Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CE331BFD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 02:03:19 +0100 (CET)
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJQmM-00010c-Hl
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 20:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lJQlH-0000SL-K7; Mon, 08 Mar 2021 20:02:11 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lJQlD-0005DH-L6; Mon, 08 Mar 2021 20:02:09 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 17BDA5C012E;
 Mon,  8 Mar 2021 20:02:04 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 08 Mar 2021 20:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=44ilR
 FxmRuHI5Kj70bgX0bCTniwTH96Vml/oLGe7Z3M=; b=RX+tA+DVQ5OnXk7iLVIjA
 NoYTCMCDvkxFDCKIG1UOmyQD0lBko+xB+8rZJtCUwTWUPQ7keHZihYP2zqe55atb
 k/vZfj2MOIGnb+b+nFn6NLWad86I5t/p+pY2fvFKTJfDWgC3PRGbQftStpqIBlu5
 qpmwtEkJIRk68e09wT81+TVWjLO3RjOIDVvyd4pbXxvzsIyFd50GBJJKv2VmdtPz
 F8MSQCFsoMWfguiZ9BmuV0XFJMGEbNp0XifVIyqwIZXnZfMW8HHZBZmkFSQVh2dP
 xndWQbQ51p74yaQngBitgVRrsSWuuh2IGPQSB1vRFkqjaVoRGM5hnZN1MJMK7X8S
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=44ilRFxmRuHI5Kj70bgX0bCTniwTH96Vml/oLGe7Z
 3M=; b=oTYrhH7RvNpaerbb7Zb4OrJ9CF8sBRLV8LCVSKWLPI26xpfv+xj278oJQ
 54Zzgyq4aG3wTCZSjpyXEiOoYKXLBtJyROEIvJkTpnnwWUQmJgS7H7rfwRuhpZsn
 QeXT/v9Aw1c8+J8dJqhJT4UNhDTmH8hmd3HD2Qaz6XAV/WKnudNUM8oOJUAijdyG
 CppTHxz/jSVsbMeLxXKnD/JCAUsSl932AoK4Zu9TBVYd0Gtzig/+sxOgnABzfIpv
 Ar0L9z1RXYwLvXrAPj2p42da1iArN7Ty1MzZc7GjmI0xxwMjBHhTBcoaIDz/G5CG
 14kPwKVIG28ZPAHz/XYrbu2p0O1iQ==
X-ME-Sender: <xms:CslGYBR9KrdiQNQCtetmhm-HuHpwIz0lPk9sR2_08_x99H_2fVsKvw>
 <xme:CslGYKxV3RdW84gWOzMLCGDh2gy3Xnjn8-bOEgBQvd1EGFoz2DdVbyg0kon-zB0gf
 Gjsibz5JlhAu8pC6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CslGYG1aJh6ooGGCAkdGKB-qYYP5FPkuzFITW1kCLY4ygYMs1p2Wkw>
 <xmx:CslGYJDa8XJGnYPAk9LXLU4X-DZfVDDwihxlPuT0CD7wcVixGl72sA>
 <xmx:CslGYKgzW9ROR1wlc5imUaIqW8hrqwu7XR3HH_YafK1DCsIZ-0qq4A>
 <xmx:DMlGYNsN6pDqF9Qxw3-Elvw4ahiZLeXIMRX0MrzBdpRTbShoSe5yKw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A5313A00064; Mon,  8 Mar 2021 20:02:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <f0681a6f-5894-46c7-af78-286c33b69e64@www.fastmail.com>
In-Reply-To: <20210303070331.70744-2-joel@jms.id.au>
References: <20210303070331.70744-1-joel@jms.id.au>
 <20210303070331.70744-2-joel@jms.id.au>
Date: Tue, 09 Mar 2021 11:31:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 1/2] hw: Model ASPEED's Hash and Crypto Engine
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=andrew@aj.id.au;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 3 Mar 2021, at 17:33, Joel Stanley wrote:
> The HACE (Hash and Crpyto Engine) is a device that offloads MD5, SHA1,=

> SHA2, RSA and other cryptographic algorithms.
>=20
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_hace.h |  33 ++++
>  hw/misc/aspeed_hace.c         | 302 +++++++++++++++++++++++++++++++++=
+
>  hw/misc/meson.build           |   2 +-
>  3 files changed, 336 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c
>=20
> diff --git a/include/hw/misc/aspeed_hace.h=20
> b/include/hw/misc/aspeed_hace.h
> new file mode 100644
> index 000000000000..e1fce670ef9e
> --- /dev/null
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -0,0 +1,33 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ASPEED_HACE_H
> +#define ASPEED_HACE_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ASPEED_HACE "aspeed.hace"
> +#define ASPEED_HACE(obj) OBJECT_CHECK(AspeedHACEState, (obj),=20
> TYPE_ASPEED_HACE)
> +
> +#define ASPEED_HACE_NR_REGS (0x64 >> 2)

0x64 is the offset of the last defined register, so this should be (0x68=
 >> 2)

> +
> +typedef struct AspeedHACEState {
> +    /* <private> */
> +    SysBusDevice parent;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t regs[ASPEED_HACE_NR_REGS];
> +
> +    MemoryRegion *dram_mr;
> +    AddressSpace dram_as;
> +} AspeedHACEState;
> +
> +#endif /* _ASPEED_HACE_H_ */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> new file mode 100644
> index 000000000000..0e402a0adea9
> --- /dev/null
> +++ b/hw/misc/aspeed_hace.c
> @@ -0,0 +1,302 @@
> +/*
> + * ASPEED Hash and Crypto Engine
> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * Joel Stanley <joel@jms.id.au>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "hw/misc/aspeed_hace.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "crypto/hash.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/irq.h"
> +
> +#define R_STATUS        (0x1c / 4)
> +#define HASH_IRQ        BIT(9)
> +#define CRYPT_IRQ       BIT(12)
> +#define TAG_IRQ         BIT(15)
> +
> +#define R_HASH_CMD      (0x30 / 4)
> +/* Hash algorithim selection */
> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))

Hmm, feels GENMASK()-y, but looks like the tree is in a bit of a weird=20=

state in that respect:

$ git grep GENMASK
include/hw/usb/dwc2-regs.h:#define GSNPSID_ID_MASK                      =
GENMASK(31, 16)
include/standard-headers/asm-x86/kvm_para.h:#define KVM_ASYNC_PF_VEC_MAS=
K                       GENMASK(7, 0)
$

> +#define  HASH_ALGO_MD5                  0
> +#define  HASH_ALGO_SHA1                 BIT(5)
> +#define  HASH_ALGO_SHA224               BIT(6)
> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))

Not something you need to fix necessarily, but it would feel more=20
intuitive to me to order these MSB to LSB, so e.g. (BIT(6) | BIT(4)).=20=

That way I can "see" the value without having to reverse the bits.

> +#define  HASH_ALGO_SHA512_SERIES        (BIT(5) | BIT(6))
> +/* SHA512 algorithim selection */
> +#define  SHA512_HASH_ALGO_MASK          (BIT(10) | BIT(11) | BIT(12))=

> +#define  HASH_ALGO_SHA512_SHA512        0
> +#define  HASH_ALGO_SHA512_SHA384        BIT(10)
> +#define  HASH_ALGO_SHA512_SHA256        BIT(11)
> +#define  HASH_ALGO_SHA512_SHA224        (BIT(10) | BIT(11))
> +/* HMAC modes */
> +#define  HASH_HMAC_MASK                 (BIT(7) | BIT(8))
> +#define  HASH_DIGEST                    0
> +#define  HASH_DIGEST_HMAC               BIT(7)
> +#define  HASH_DIGEST_ACCUM              BIT(8)
> +#define  HASH_HMAC_KEY                  (BIT(7) | BIT(8))
> +/* Cascscaed operation modes */
> +#define  HASH_ONLY                      0
> +#define  HASH_ONLY2                     BIT(0)
> +#define  HASH_CRYPT_THEN_HASH           BIT(1)
> +#define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
> +/* Other cmd bits */
> +#define  HASH_IRQ_EN                    BIT(9)
> +#define  HASH_SG_EN                     BIT(18)
> +
> +#define R_CRYPT_CMD             (0x10 / 4)
> +
> +#define R_HASH_SRC              (0x20 / 4)
> +#define R_HASH_DEST             (0x24 / 4)
> +#define R_HASH_SRC_LEN          (0x2c / 4)

In general, ordering the registers and fields in datasheet-order is=20
helpful to me as a reviewer...

> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf =3D NULL;
> +    size_t digest_len =3D 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src =3D s->regs[R_HASH_SRC];
> +    len =3D s->regs[R_HASH_SRC_LEN];
> +    dest =3D s->regs[R_HASH_DEST];

These values should be masked according to the fields described in the=20=

datasheet. That doesn't appear to be done in the write() callback,=20
though it probably should be as the reserved bits are read-only.

> +
> +    src_buf =3D address_space_map(&s->dram_as, src, &len, false,
> +                                MEMTXATTRS_UNSPECIFIED);
> +    if (!src_buf) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n",=20=

> __func__);
> +        return -EACCES;
> +    }
> +
> +    rc =3D qcrypto_hash_bytes(algo, src_buf, len, &digest_buf,=20
> &digest_len,
> +                            &error_fatal);

Neat :)

> +    if (rc < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",=20
> __func__);
> +        return rc;
> +    }
> +
> +    rc =3D address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIF=
IED,
> +                             digest_buf, digest_len);
> +    if (rc) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: address space write failed\n", __func__);
> +    }
> +    g_free(digest_buf);
> +
> +    address_space_unmap(&s->dram_as, src_buf, len, false, len);
> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware=
=20
> sets
> +     * these irrespective of HASH_IRQ_EN.
> +     */
> +    s->regs[R_STATUS] |=3D HASH_IRQ;
> +
> +    return 0;
> +}
> +
> +
> +static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned=20=

> int size)
> +{
> +    AspeedHACEState *s =3D ASPEED_HACE(opaque);
> +
> +    addr >>=3D 2;
> +
> +    if (addr >=3D ASPEED_HACE_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read at offset 0x%"=20
> HWADDR_PRIx "\n",
> +                      __func__, addr << 2);
> +        return 0;
> +    }
> +
> +    return s->regs[addr];
> +}
> +
> +static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t dat=
a,
> +                              unsigned int size)
> +{
> +    AspeedHACEState *s =3D ASPEED_HACE(opaque);
> +
> +    addr >>=3D 2;
> +
> +    if (addr >=3D ASPEED_HACE_NR_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write at offset 0x%"=20
> HWADDR_PRIx "\n",
> +                      __func__, addr << 2);
> +        return;
> +    }
> +
> +    switch (addr) {
> +    case R_STATUS:
> +        if (data & HASH_IRQ) {
> +            data &=3D ~HASH_IRQ;

So the datasheet claims 'Writing "1" to this bit will clear this=20
register'. Have you followed up on whether they really mean what they=20=

say here? Because that's not what's implemented (having said that, what=20=

you have implemented is at least intuitive).

> +
> +            if (s->regs[addr] & HASH_IRQ) {
> +                qemu_irq_lower(s->irq);
> +            }
> +        }
> +        break;
> +    case R_HASH_CMD: {
> +        int algo =3D -1;
> +        if ((data & HASH_HMAC_MASK)) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: HMAC engine command mode %ld not imple=
mented",
> +                          __func__, (data & HASH_HMAC_MASK) >> 8);
> +        }
> +        if (data & HASH_SG_EN) {
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Hash scatter gather mode not implement=
ed",
> +                          __func__);
> +        }
> +        if (data & BIT(1)) {

Why leave this bit without a name?

> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: Cascaded mode not implemented",
> +                          __func__);
> +        }
> +        switch (data & HASH_ALGO_MASK) {
> +        case HASH_ALGO_MD5:
> +            algo =3D QCRYPTO_HASH_ALG_MD5;
> +            break;
> +        case HASH_ALGO_SHA1:
> +            algo =3D QCRYPTO_HASH_ALG_SHA1;
> +            break;
> +        case HASH_ALGO_SHA224:
> +            algo =3D QCRYPTO_HASH_ALG_SHA224;
> +            break;
> +        case HASH_ALGO_SHA256:
> +            algo =3D QCRYPTO_HASH_ALG_SHA256;
> +            break;
> +        case HASH_ALGO_SHA512_SERIES:
> +            switch (data & SHA512_HASH_ALGO_MASK) {
> +            case HASH_ALGO_SHA512_SHA512:
> +                algo =3D QCRYPTO_HASH_ALG_SHA512;
> +                break;
> +            case HASH_ALGO_SHA512_SHA384:
> +                algo =3D QCRYPTO_HASH_ALG_SHA384;
> +                break;
> +            case HASH_ALGO_SHA512_SHA256:
> +                algo =3D QCRYPTO_HASH_ALG_SHA256;
> +                break;
> +            case HASH_ALGO_SHA512_SHA224:
> +                algo =3D QCRYPTO_HASH_ALG_SHA224;
> +                break;
> +            default:
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                        "%s: Invalid sha512 hash algorithm selection=20=

> 0x%03lx\n",
> +                        __func__, data & SHA512_HASH_ALGO_MASK);
> +                break;
> +            }
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Invalid hash algorithm selection 0x%03lx\n=
",
> +                      __func__, data & HASH_ALGO_MASK);
> +            break;
> +        }

The nested switches get a bit hectic. I feel like it would be worth=20
pulling them out to helper functions.

Andrew

