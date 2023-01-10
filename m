Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339EE663D03
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:36:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFB2D-0007nm-6f; Tue, 10 Jan 2023 04:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFB1q-0007k0-3f; Tue, 10 Jan 2023 04:34:48 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFB1o-0006Zl-Hh; Tue, 10 Jan 2023 04:34:45 -0500
Received: by mail-ej1-x632.google.com with SMTP id u19so26936051ejm.8;
 Tue, 10 Jan 2023 01:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQ7Jgw2EXbPEY3OEtjHxlEVNbqMCv9WHP6KBYJx+wTA=;
 b=e062I5w/oFZFjGnMWbZxPM6pXs9dw7OYthZiRDyuPN8Q/dDzCAdb8MYDJkBBtU2W0s
 e0qCYEvqZU36qoEDxVEkklyQmwnUvvIjzuT12A0aBuus2x0QfsXfdPshQyoBYMNt4JwV
 /jevDFDuXI6lCYWN08VUptC1cAO95sitSSMisWqpOndUbdV+Hj2fsFh/YJI10mqDuTqz
 Z/Q8C8WRNYJPV+D2vBj4WPI2AbH2t4wPDIN4beQpOjzAHZpRrskzP5ZNluk9h1M8fX8v
 yoaaGwplr7zz0IJmd53cIswuLXbl5SOEgL3eqvKwrft+C+ULZWYeAzucyP9+lQphnZ2t
 UHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQ7Jgw2EXbPEY3OEtjHxlEVNbqMCv9WHP6KBYJx+wTA=;
 b=7/+YnDNAyF9WT+4jnGgYj1WKu9awjv/xRSDQCzNWNYz/QI9uvlhWTluCO3CnxG4gpm
 HWegAjHcI4ncKxQHAV6zczbaQI+Sl3xCBFVe4OtNRmoazuRAH8fd81wJw58pV0+hVZgZ
 jOzAOb/ou4TolWC4X74ETYIhX4G/uSX+FAkwA4PNae/pYn+D6HH1aTww9uc2bOou/Ojh
 zFYETU107JqmmKd+631Vp+jP4DNnXz99/BNKsZrK/OLOWi55a+9qpb1/oHFSNp7LlawE
 HNOVAXsn3ZXkSOar/wtxrS4xFQeX/Qnrfx/fT1kYEI4EbiNw1lbACO677pxb3EvsyGUc
 RJ0w==
X-Gm-Message-State: AFqh2kq9ylk6u5TBXAc3BWaDlQJLA8mdQwv+T8X9zaLGlsR4EzpRuGMD
 4n14DV/SKFmhxV3RPLzmu69mj03LjYw=
X-Google-Smtp-Source: AMrXdXv1vkgyZZskUE4aG0JJOnIryfFBy5rtH7otwseJF2Q2s4iVDE3DGWniraBxaniQz2e9U1VFaQ==
X-Received: by 2002:a17:907:6f09:b0:7c0:a877:1cf1 with SMTP id
 sy9-20020a1709076f0900b007c0a8771cf1mr64829929ejc.12.1673343282369; 
 Tue, 10 Jan 2023 01:34:42 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-133-171.77.191.pool.telefonica.de.
 [77.191.133.171]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b007b839689adesm4643948ejh.166.2023.01.10.01.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 01:34:41 -0800 (PST)
Date: Tue, 10 Jan 2023 09:34:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_4/4=5D_qom=3A_Warn_when_de?=
 =?US-ASCII?Q?precated_class_property_can_be_removed?=
In-Reply-To: <20230109225419.22621-5-philmd@linaro.org>
References: <20230109225419.22621-1-philmd@linaro.org>
 <20230109225419.22621-5-philmd@linaro.org>
Message-ID: <F8BED4EB-8931-4B6F-B844-9F1B3C2006B6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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



Am 9=2E Januar 2023 22:54:19 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>Per docs/system/deprecated=2Erst, a deprecated feature can be
>removed after 2 releases=2E Since we commit when a class property
>is deprecated, we can warn when the deprecation period is over=2E
>
>See also commit ef1f5b0a96 ("docs: clarify deprecation schedule")=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> qom/object=2Ec | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/qom/object=2Ec b/qom/object=2Ec
>index 05b97cd424=2E=2Ecb829f1e44 100644
>--- a/qom/object=2Ec
>+++ b/qom/object=2Ec
>@@ -17,6 +17,7 @@
> #include "qom/object_interfaces=2Eh"
> #include "qemu/cutils=2Eh"
> #include "qemu/memalign=2Eh"
>+#include "qemu/qemu-version=2Eh"
> #include "qapi/visitor=2Eh"
> #include "qapi/string-input-visitor=2Eh"
> #include "qapi/string-output-visitor=2Eh"
>@@ -1300,6 +1301,12 @@ void object_class_property_deprecate(ObjectClass *=
klass,
>     ObjectProperty *prop =3D object_class_property_find(klass, name);
>=20
>     assert(prop);
>+    if (qemu_version_delta_current(version_major, version_minor) <=3D 2)=
 {
>+        warn_report_once("Property '%s=2E%s' has been deprecated in rele=
ase"
>+                         " v%u=2E%u and can be removed=2E",
>+                         object_class_get_name(klass), name,
>+                         version_major, version_minor);
>+    }
>     prop->deprecation_reason =3D reason;
> }
>=20

Great series!

Perhaps turn object_class_property_deprecate() into a macro and warn at co=
mpile time already? That way we won't miss removing any properties and user=
s won't see a warning they can't do anything about=2E

Best regards,
Bernhard

