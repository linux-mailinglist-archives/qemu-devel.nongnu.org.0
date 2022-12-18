Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040464FE79
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 11:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6r1y-00058W-J6; Sun, 18 Dec 2022 05:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6r1e-000586-31; Sun, 18 Dec 2022 05:36:10 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6r1b-0005nP-EP; Sun, 18 Dec 2022 05:36:09 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jo4so6616884ejb.7;
 Sun, 18 Dec 2022 02:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ie5JNV/CkMcdMPRtOn9Z+af+0+llFireQ+R9GwMwUVY=;
 b=ZXxE8toee80W2PmCbYgeds48e2SS4TZc0JUmK5hBMVrwp3RrYJuhd7jiFowBCeeXXo
 liQWYcqDVL2j8VJRpHT/0OdtkLe/FhtGRScb5+9A1lm8WuTsVu+tkMIXEdYbNJFSknnD
 8lJtakzl7iGnwkCYCNjGG4h1qW2QsroRWyA4wPV1AOfZz8quCTfZC/IgUnn/A2G3xtSc
 1uAXlilpr+0YksB6kddGOArdNMIcb0UOiRnknyEu07lAhVolkd+67jwcWaZpcldYBnDO
 NRs5elnmqGyVRaQO47UrrEnAGdxDwz5cbDY4R7Fkodu5jcP8oSvTKY1ihlNSddMVXB+c
 6Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ie5JNV/CkMcdMPRtOn9Z+af+0+llFireQ+R9GwMwUVY=;
 b=aKmwTPBZD4U3sPDimcqyG46Apd5i0wPDDRW0K6GPvK3jrkM9kHSVyxKRHX0nIgiIJW
 ZnWFETNmWsi+aC9KzwpQqpH1V6/v4ZjCs6NFiaZaqhsOhf8CkEWulg6LlzUc248xL9XB
 japxuFAOJcXW+b1uxnch6hFbc5lGkOblq6fSVzAOw/lHQ8bjRHwH7rTI8/1QlsN2Ympg
 W2mys3STbCIo3puzkvl81ZdBSJZjtaIPVH9Y/t1icHeqDCFwqSt0SffqkoKxRmCPSzb4
 wA0zgmxJsKpaEWF1tLHilcmQb59hRFAdN4VgZkURNF1NxqHyXeFFdQFGeYhaFChgdvIE
 xMgg==
X-Gm-Message-State: ANoB5pmGdtT9NWdFlZFFn5+UETbwPGxxHGZ1RgFKD2qzeejndn/yKMs9
 oOLgivKCipbzV3ofjhDHHu5qI0VDfIA=
X-Google-Smtp-Source: AA0mqf4+1zjINKlvRulv026gWFWPCK49P+FUQY5USkWSx3RwSCIC2QgOiaKjBfo3Y9rUm8OInZmz8Q==
X-Received: by 2002:a17:906:fb13:b0:7c1:ed:171c with SMTP id
 lz19-20020a170906fb1300b007c100ed171cmr30910840ejb.26.1671359765138; 
 Sun, 18 Dec 2022 02:36:05 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-166-058.77.183.pool.telefonica.de.
 [77.183.166.58]) by smtp.gmail.com with ESMTPSA id
 11-20020a170906300b00b007bee745759bsm3006011ejz.20.2022.12.18.02.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 02:36:04 -0800 (PST)
Date: Sun, 18 Dec 2022 10:35:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 32/32] hw/isa/piix: Drop the "3" from the PIIX base class
In-Reply-To: <20221204190553.3274-33-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221204190553.3274-33-shentey@gmail.com>
Message-ID: <2287014C-88E0-405A-B550-A37006857D12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 4=2E Dezember 2022 19:05:53 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Now that the base class is used for both PIIX3 and PIIX4, the "3"
>became misleading=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Message-Id: <20221022150508=2E26830-43-shentey@gmail=2Ecom>
>---

This patch could be merged into "[PATCH 19/32] hw/isa/piix3: Rename typede=
f PIIX3State to PIIXState" -- let me know!

Best regards,
Bernhard

> hw/isa/piix=2Ec                 | 8 ++++----
> include/hw/southbridge/piix=2Eh | 6 ++----
> 2 files changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>index 70fe1166c1=2E=2E84b27b36ea 100644
>--- a/hw/isa/piix=2Ec
>+++ b/hw/isa/piix=2Ec
>@@ -469,7 +469,7 @@ static void pci_piix_class_init(ObjectClass *klass, v=
oid *data)
> }
>=20
> static const TypeInfo piix_pci_type_info =3D {
>-    =2Ename =3D TYPE_PIIX3_PCI_DEVICE,
>+    =2Ename =3D TYPE_PIIX_PCI_DEVICE,
>     =2Eparent =3D TYPE_PCI_DEVICE,
>     =2Einstance_size =3D sizeof(PIIXState),
>     =2Einstance_init =3D pci_piix_init,
>@@ -519,7 +519,7 @@ static void piix3_class_init(ObjectClass *klass, void=
 *data)
>=20
> static const TypeInfo piix3_info =3D {
>     =2Ename          =3D TYPE_PIIX3_DEVICE,
>-    =2Eparent        =3D TYPE_PIIX3_PCI_DEVICE,
>+    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>     =2Einstance_init =3D piix3_init,
>     =2Eclass_init    =3D piix3_class_init,
> };
>@@ -559,7 +559,7 @@ static void piix3_xen_class_init(ObjectClass *klass, =
void *data)
>=20
> static const TypeInfo piix3_xen_info =3D {
>     =2Ename          =3D TYPE_PIIX3_XEN_DEVICE,
>-    =2Eparent        =3D TYPE_PIIX3_PCI_DEVICE,
>+    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>     =2Einstance_init =3D piix3_init,
>     =2Eclass_init    =3D piix3_xen_class_init,
> };
>@@ -608,7 +608,7 @@ static void piix4_class_init(ObjectClass *klass, void=
 *data)
>=20
> static const TypeInfo piix4_info =3D {
>     =2Ename          =3D TYPE_PIIX4_PCI_DEVICE,
>-    =2Eparent        =3D TYPE_PIIX3_PCI_DEVICE,
>+    =2Eparent        =3D TYPE_PIIX_PCI_DEVICE,
>     =2Einstance_init =3D piix4_init,
>     =2Eclass_init    =3D piix4_class_init,
> };
>diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/pii=
x=2Eh
>index a489f52d1b=2E=2E65ad8569da 100644
>--- a/include/hw/southbridge/piix=2Eh
>+++ b/include/hw/southbridge/piix=2Eh
>@@ -72,11 +72,9 @@ struct PIIXState {
>     bool has_usb;
>     bool smm_enabled;
> };
>-typedef struct PIIXState PIIXState;
>=20
>-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>-DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
>-                         TYPE_PIIX3_PCI_DEVICE)
>+#define TYPE_PIIX_PCI_DEVICE "pci-piix"
>+OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>=20
> #define TYPE_PIIX3_DEVICE "PIIX3"
> #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"

