Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5833E27A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:05:13 +0100 (CET)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJgV-0005PW-Qy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lMJem-0004s8-P0; Tue, 16 Mar 2021 20:03:24 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lMJeh-0004vC-S8; Tue, 16 Mar 2021 20:03:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 750CE5C00B4;
 Tue, 16 Mar 2021 20:03:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 16 Mar 2021 20:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=N8QCk
 O51Ivy+h98QyQ9WC1tuaG9547oUt0AzwY3UUCk=; b=UG0x9zBnsgjbR9ZzZ+Fve
 5azz+vZaPYTGwC674x04k5o2mHrGSYyhzRo7VsGf2XyXyXKmsR/WAj58Z2wbqS/d
 9wEDSYB1VCGhIKv2v4ZIviOoSjCGOTnlp2s912y8FuD76fLenxMQbAP3dfBs0wJU
 5KAsSkt1/AGz6m/fqU31ESdR1xhUQ8edNsNwRv+JQi8umDDG63usssFj0KTyLkZZ
 GUkgos+EMLWp7bfWsanXjWtEGUDtwwM1lkSJUt9n7mnVKNF/a5rlTVnkrTpWf6hT
 f+ZwSphEZbu5FWhfgSzU0MQC9EiurUoLO14JLEXMNgnj0ntCzkUXaOWDoJtWBT0q
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=N8QCkO51Ivy+h98QyQ9WC1tuaG9547oUt0AzwY3UU
 Ck=; b=dmLElmC+hi5ckCBSNlcboaG5oXRvtyTLDu+DEhdQgG2KDLnHWy/Rsew0m
 kk3L0i0gFjg9Md2p+Km/GBiZJlgIKKCgItx7xLhLbhZSn5RYRzzx3copea8Tc4BQ
 93xLWUXd8NN6lECo1TLQ4kPsVSCszY0sfXpEQ/vprYUqjlNAgcUUck5ADKR/zHR+
 OidQToV8s7n3/OjNqU2qC/n6TBr8XHUlTpO9Wd/Fa9fsr8vl8uK07gTVRER76GHq
 yDv45QcZ2mhxIiSR1967A2pBKLpYklIuTjYEyM82LHkOBbUJE4+BiGeMqbljOvLT
 77BxBj85wj1UDDfHgZNs6l9nvrzbQ==
X-ME-Sender: <xms:Q0dRYCreZXDjIsZdiu_DN_XaOyfS1YBWFSuPkyfVCVmrDGOfxSW1jQ>
 <xme:Q0dRYApwp-MBh2sh30-2aSL0iiRdQoolSkwp34b7AQyyCFa5xDRxkLgYRPMcVnnR7
 tm_wdt1c-YKnqJgQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeffedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Q0dRYHMIjEkLebTRlJbOgLjWh99CPfnaLLVF92HbbC7ytvb5eA32zQ>
 <xmx:Q0dRYB5XHulpc1lZWvkchhadWwo8lG5yRJAA_cVEr6gQmu1xRzhl7Q>
 <xmx:Q0dRYB7QGxQe6Rnf6ob3fGhUyl1Hd2nFwXAIdHIPEu3JAsNG3mmolQ>
 <xmx:REdRYPR9vt2pou1wOR0kw9LDGvZnd5KRikqf7wNn5-Jt8d33Cl6dPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 18394A00073; Tue, 16 Mar 2021 20:03:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <943cd3e4-1706-4c31-bb45-ffea4478ca70@www.fastmail.com>
In-Reply-To: <20210312105711.551423-2-joel@jms.id.au>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
Date: Wed, 17 Mar 2021 10:32:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Thomas Huth" <thuth@redhat.com>, "Laurent Vivier" <lvivier@redhat.com>
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 12 Mar 2021, at 21:27, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,=

> SHA2, RSA and other cryptographic algorithms.
>=20
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> v3:
>  - rebase on upstream to fix meson.build conflict
> v2:
>  - reorder register defines
>  - mask src/dest/len registers according to hardware
> ---
>  include/hw/misc/aspeed_hace.h |  33 ++++
>  hw/misc/aspeed_hace.c         | 312 +++++++++++++++++++++++++++++++++=
+
>  hw/misc/meson.build           |   1 +
>  3 files changed, 346 insertions(+)
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
> index 000000000000..3d02fae2dd62
> --- /dev/null
> +++ b/hw/misc/aspeed_hace.c
> @@ -0,0 +1,312 @@
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
> +#define R_CRYPT_CMD     (0x10 / 4)
> +
> +#define R_STATUS        (0x1c / 4)
> +#define HASH_IRQ        BIT(9)
> +#define CRYPT_IRQ       BIT(12)
> +#define TAG_IRQ         BIT(15)
> +
> +#define R_HASH_SRC      (0x20 / 4)
> +#define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_SRC_LEN  (0x2c / 4)
> +
> +#define R_HASH_CMD      (0x30 / 4)
> +/* Hash algorithim selection */
> +#define  HASH_ALGO_MASK                 (BIT(4) | BIT(5) | BIT(6))
> +#define  HASH_ALGO_MD5                  0
> +#define  HASH_ALGO_SHA1                 BIT(5)
> +#define  HASH_ALGO_SHA224               BIT(6)
> +#define  HASH_ALGO_SHA256               (BIT(4) | BIT(6))
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
> +
> +static int do_hash_operation(AspeedHACEState *s, int algo)
> +{
> +    hwaddr src, len, dest;
> +    uint8_t *digest_buf =3D NULL;
> +    size_t digest_len =3D 0;
> +    char *src_buf;
> +    int rc;
> +
> +    src =3D 0x80000000 | s->regs[R_HASH_SRC];

Tricky. Also doesn't work on the AST2400 where SDRAM is based at=20
0x40000000?

Other than that it looks good to me.

Andrew

