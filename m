Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254564974F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 01:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4WRX-0001SP-Ui; Sun, 11 Dec 2022 19:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WRW-0001S2-B1
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:13:14 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WRU-0003Ac-PJ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:13:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id m18so24025353eji.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 16:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C26Caob0uxj1wKDD8f61QvG6qeV9/egdxmevA5TelBo=;
 b=LzZa/JCJpGmtZymqwShz3jb9c2La+JETGLFNI1GiJZGi1sC7kgNmMoKC/ZlztCy03M
 bqrHO6U7V/dJOjgNqj7M1jqMnture3IQGu3HBf3aYdbLmNjg6p8+AvXqUkH3jYBJq1B6
 TETRBwE8WzcPuLjcsv0OHRd0xPNPuXtfQ7I9glUXGEyHkZI3KgszDDYFlUuyhSvjdiUV
 pH+dYx7NVXeZo4SDJK+dN/e8zEPRL54VVMSV6PVDp6NKF/dpxq9AdPihK+VumJXyTnTV
 RDtfwt71wzkB5+828xCXfKphkpa1pekzkLTrf7jAQ+Lw+FA/Ddg4lPGDUHXef8SzHrho
 EmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C26Caob0uxj1wKDD8f61QvG6qeV9/egdxmevA5TelBo=;
 b=PTU5uZxUPHwZY7OlQgg9U4CLEWiz93xDGusQiuxuat2eqeZ3NoV3Dn89KH6kI04axh
 d2Mt7IT45xum8KgbYzPK8tk3nHyJ4z/5mo+w6EaF0dJut3JBROMCIO4q0bsVMCv0qOeY
 szy6FKSn114E2ZlxxQbEuIh4XjIHAMBKKg5AWzN5pshdYlHvHcmH7X0q8R7fKs2oEvvI
 i4wf/dSX+/KoKEWSYRqeENzkQQ+ecBNIkeP2+hXMTiqZSkIKqkBwKOJ7CRud8x1Ngctf
 UKETH0iqQ0rr1I64PqzKuQXmM2tN7jQljbjiEiIGoNxm0zHub+E5/jsVt0Syl3R1eW7/
 d+gg==
X-Gm-Message-State: ANoB5pkGUyJBwfImA8cr2RV9TvlNUwXLnER4aOBffd3RxpPaxwcQpOnt
 oD7aK51orh3ZLyyYuYvRsOg=
X-Google-Smtp-Source: AA0mqf4jC2QZSy1BXlLXtNl2LTDAB5TDsZQ2f6+axI8cn9vf0q/7fgQtXWZEUzPKJc3C36k5Z8HUOA==
X-Received: by 2002:a17:906:d18f:b0:7b2:75c6:6d3c with SMTP id
 c15-20020a170906d18f00b007b275c66d3cmr12381976ejz.74.1670803991147; 
 Sun, 11 Dec 2022 16:13:11 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a17090676d700b007c154037a81sm2064596ejn.73.2022.12.11.16.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 16:13:10 -0800 (PST)
Date: Mon, 12 Dec 2022 00:13:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-8=2E0_1/7=5D_hw/mips/Kconfig=3A_Int?=
 =?US-ASCII?Q?roduce_CONFIG=5FGT64120_to_select_gt64xxx=5Fpci=2Ec?=
In-Reply-To: <20221209151533.69516-2-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-2-philmd@linaro.org>
Message-ID: <2C6A80F9-BAD4-43D6-8DFD-7D50E477CFFB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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



Am 9=2E Dezember 2022 15:15:27 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>---
> hw/mips/Kconfig     | 6 ++++++
> hw/mips/meson=2Ebuild | 3 ++-
> 2 files changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>index 725525358d=2E=2Ed6bbbe7069 100644
>--- a/hw/mips/Kconfig
>+++ b/hw/mips/Kconfig
>@@ -1,5 +1,6 @@
> config MALTA
>     bool
>+    select GT64120
>     select ISA_SUPERIO
>=20
> config MIPSSIM
>@@ -59,3 +60,8 @@ config MIPS_BOSTON
>=20
> config FW_CFG_MIPS
>     bool
>+
>+config GT64120
>+    bool
>+    select PCI
>+    select I8259

s/select I8259/depends on I8259/ since the model needs but doesn't provide=
 I8259? Then just take my mail regarding the last patch as a reminder=2E

Otherwise:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>diff --git a/hw/mips/meson=2Ebuild b/hw/mips/meson=2Ebuild
>index dd0101ad4d=2E=2E6ccd385df0 100644
>--- a/hw/mips/meson=2Ebuild
>+++ b/hw/mips/meson=2Ebuild
>@@ -2,7 +2,8 @@ mips_ss =3D ss=2Esource_set()
> mips_ss=2Eadd(files('bootloader=2Ec', 'mips_int=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp=
=2Ec', 'loongson3_virt=2Ec'))
>-mips_ss=2Eadd(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci=2Ec', 'm=
alta=2Ec'))
>+mips_ss=2Eadd(when: 'CONFIG_MALTA', if_true: files('malta=2Ec'))
>+mips_ss=2Eadd(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_MIPS_CPS', if_true: files('cps=2Ec'))
>=20
> if 'CONFIG_TCG' in config_all

