Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747484D00B5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:07:00 +0100 (CET)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE0p-0006u3-Hn
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDth-0007dI-FM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:59:39 -0500
Received: from [2a00:1450:4864:20::52f] (port=38495
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDtb-0001DJ-AC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:59:34 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h13so7882921ede.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=bf+iX2o3O9l2G7SWUG/ZZ8BnGfU63V74IaKm1svboR8=;
 b=kxMfwwMrpcy07JBhKOPWKwAeFJt70aDVoUDnkK8gqw5SG2Jn6sNjh1uAa9SywC6f+u
 +F3Gi1q2I8sGr9DE8paaejOLWmo/QJt56KwjnqfK+hAl69z11uetqffUGT6I1p+MNnKN
 oSIZ8lmKm2NKAiDTi18J1GQilpxgDZztrpxRquT9Tj6ObiUFfJPsAC9WCPvGd/1rplSl
 udgE4z1N5kKTW0Uge+EUxs4+pyOIndMjeO6YCyfaC9MJEmBnklEowfFHv+Qrmmchh7QR
 zFgoHQn5qBri8uNX4NEq03co264yEOFg2AloFxoSghml2L3FrR2EHzeYdATYf9Cpc2s+
 FYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=bf+iX2o3O9l2G7SWUG/ZZ8BnGfU63V74IaKm1svboR8=;
 b=7WBB3H4fDNeRC4sMf5bXfR9yJ88ZixDBcf02pwCA4ZW0s8mq7I1Ar3hY2DXZzs1/zP
 06/cYxLHCIkisiLt0eoUGWBOjyDCAl8/8rHWiyL307wcJ7elTsZcAaqA7PlFJb4UzH+S
 Yeh9kGDKndSPFDVn56iqeDrE+NGS9jG+8P0yiaoSLB2/OjlPjNYZvcX3AgLYbUhs+rFF
 5AEWXyva+yty67/3iByx1+GhwDoHmHfmmnUO8CWdvfPZymHT7hnYuNB4wDEXLtAbKPqe
 tNF9UKfQ25/i4tamqxb/Lx13H7aSHUfDsFrAuUyh0UUcNAqqTGVbut/gp0BgfO23wEzD
 VHMg==
X-Gm-Message-State: AOAM531F6DLR0FVTNTpdXZA2NQiXIrh7e8bC8P9wwMBo+L7EDl1b+D23
 ggBtZ8C3JL/FB0eUt1ySkUUEIcw0X+4=
X-Google-Smtp-Source: ABdhPJwqoSs/v0vttn6L3zGUuMwi4FaMIvdsH6tR8iaERm/Xkocaluct6bl3QXzXIpQIpTROGrc/7Q==
X-Received: by 2002:aa7:de0e:0:b0:416:607c:6d45 with SMTP id
 h14-20020aa7de0e000000b00416607c6d45mr1284511edv.127.1646661567286; 
 Mon, 07 Mar 2022 05:59:27 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 r14-20020a1709067fce00b006db0edb8a80sm1800063ejs.225.2022.03.07.05.59.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 05:59:26 -0800 (PST)
Date: Mon, 07 Mar 2022 13:59:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 09/13] hw/rtc/m48t59-isa: QOM'ify IRQ number
In-Reply-To: <20220307134353.1950-10-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-10-philippe.mathieu.daude@gmail.com>
Message-ID: <790C07C7-9301-485E-A7A0-D79DA48C2F89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 13:43:49 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Exposing the IRQ number as a QOM property not only allows it to be
>configurable but also to be printed by standard QOM mechanisms=2E This al=
lows
>isabus_dev_print() to be retired eventually=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Message-Id: <20220301220037=2E76555-3-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/rtc/m48t59-isa=2Ec | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/hw/rtc/m48t59-isa=2Ec b/hw/rtc/m48t59-isa=2Ec
>index dc21fb10a5=2E=2Ee9086eada4 100644
>--- a/hw/rtc/m48t59-isa=2Ec
>+++ b/hw/rtc/m48t59-isa=2Ec
>@@ -42,6 +42,7 @@ struct M48txxISAState {
>     ISADevice parent_obj;
>     M48t59State state;
>     uint32_t io_base;
>+    uint8_t isairq;
>     MemoryRegion io;
> };
>=20
>@@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock=
)
> static Property m48t59_isa_properties[] =3D {
>     DEFINE_PROP_INT32("base-year", M48txxISAState, state=2Ebase_year, 0)=
,
>     DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
>+    DEFINE_PROP_UINT8("irq", M48txxISAState, isairq, 8),
>     DEFINE_PROP_END_OF_LIST(),
> };
>=20
>@@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error=
 **errp)
>     M48txxISAState *d =3D M48TXX_ISA(dev);
>     M48t59State *s =3D &d->state;
>=20
>+    if (d->isairq >=3D ISA_NUM_IRQS) {
>+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQ=
S - 1);
>+        return;
>+    }
>+
>     s->model =3D u->info=2Emodel;
>     s->size =3D u->info=2Esize;
>-    isa_init_irq(isadev, &s->IRQ, 8);
>+    isa_init_irq(isadev, &s->IRQ, d->isairq);
>     m48t59_realize_common(s, errp);
>     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t5=
9", 4);
>     if (d->io_base !=3D 0) {

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>


