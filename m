Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804066982BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLzJ-0004mo-1M; Wed, 15 Feb 2023 12:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSLzG-0004hT-Ei; Wed, 15 Feb 2023 12:54:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSLzE-0006Nk-90; Wed, 15 Feb 2023 12:54:33 -0500
Received: by mail-ed1-x52e.google.com with SMTP id dz21so11903010edb.13;
 Wed, 15 Feb 2023 09:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgwUmq12UB0+4N/Yp54VGsGowTFwnNhKoKJwJt4kBPM=;
 b=j5bERwqfdKNoZvG+4cbsrGgzc1efCiVUEJwcEQ1nwU9E8Zu18Y1DTlrOes4aZjNApU
 k+n2ciE6eVAdlCQUayma2CbFBB5PqzT9WRBELSSH7UQBIc9ijWzCli0ChDKYpeJq6cZy
 LP9foiF50HauN4rxxxWvDhAq7jpItAAqcXtQCZdLSvtMk6DGij6ldKtBIKDksQWnrSe+
 /eckbI5+KnslR71XGJu6I+bh7GbfilIsPQHklmWNyizMs91IcttYGnciq0T4aGF7N9/L
 rqR6Fne6uEqiCey0DBuFjFMvkmRn0DSYeC9Kn8csXlWD7z6LIE6z/MtwJfhKaWXO4jOJ
 45Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgwUmq12UB0+4N/Yp54VGsGowTFwnNhKoKJwJt4kBPM=;
 b=i2ch1V2Eo5QvDudufHTnkJkYm5+Kzp3pccSCDjliAFdW8rvF09d/8UVcm9QZ8GeYUK
 50vHyjf4Lzqpa7oSYm/0dbyeRaPtDpL3ePAOuaU37oISgaBg5+V076LywMhCYRe0+1+u
 kQGfCcrwdmD1CzIFaeU8jmXSlJrUhPw7zMzPrTJWVSnP7SFkrKOCdjR46J8tZmRYkPqs
 +N3JLzYgk4LeUikMC7IdgpjH3Pl871BZmDzOSPPRwKqT57SZcmxSXkwacNFnMD0BP3eM
 EbVhYcfJSi8NwDWjwBuGkVnMK49hrzolCZQk98y/JaxP3kb0SImQAs0I374ZI0nuL4dX
 9t6A==
X-Gm-Message-State: AO0yUKWhq87Lodv2ZDs7mN4dU04cpTSrcoGhdxfMPLOuG5Azqn/9vi1j
 xnX6mvkgS/fsIN8e2dxpW0Fr901yDdo=
X-Google-Smtp-Source: AK7set9kxZ7g3oc3kVvCryu3PM6k3k8B4447JIKyfzQMmq+5UBAHG1KhzroMkSOF3nacX98y3awy1g==
X-Received: by 2002:a05:6402:885:b0:4aa:a248:a153 with SMTP id
 e5-20020a056402088500b004aaa248a153mr2879182edy.3.1676483668507; 
 Wed, 15 Feb 2023 09:54:28 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-243-024.77.183.pool.telefonica.de.
 [77.183.243.24]) by smtp.gmail.com with ESMTPSA id
 v23-20020a509557000000b004acba0afaa3sm6669860eda.21.2023.02.15.09.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 09:54:28 -0800 (PST)
Date: Wed, 15 Feb 2023 17:54:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_05/20=5D_hw/ide/isa=3A_Remove_?=
 =?US-ASCII?Q?intermediate_ISAIDEState=3A=3Airq_variable?=
In-Reply-To: <20230215112712.23110-6-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-6-philmd@linaro.org>
Message-ID: <0EB402C0-FBE9-4746-83FA-C9D3F5606DD5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 15=2E Februar 2023 11:26:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>The intermediate ISAIDEState::irq variable just add noise, remove it=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/ide/isa=2Ec | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/hw/ide/isa=2Ec b/hw/ide/isa=2Ec
>index 5c3e83a0fc=2E=2Ead47e0899e 100644
>--- a/hw/ide/isa=2Ec
>+++ b/hw/ide/isa=2Ec
>@@ -45,7 +45,6 @@ struct ISAIDEState {
>     uint32_t  iobase;
>     uint32_t  iobase2;
>     uint32_t  irqnum;
>-    qemu_irq  irq;
> };
>=20
> static void isa_ide_reset(DeviceState *d)
>@@ -73,8 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error *=
*errp)
>=20
>     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>-    s->irq =3D isa_get_irq(isadev, s->irqnum);
>-    ide_init2(&s->bus, s->irq);
>+    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
>     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>     ide_register_restart_cb(&s->bus);
> }

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

