Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA29649783
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 01:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4X6q-0008Nc-5Y; Sun, 11 Dec 2022 19:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4X6o-0008NR-IB
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:55:54 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4X6m-00061L-Th
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:55:54 -0500
Received: by mail-ed1-x530.google.com with SMTP id l11so10812381edb.4
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNR4QFDwrEs+DM9mCpVfCfFoLntNBNlangXWmdJd7jQ=;
 b=C0oZ8I0WO4cGckM6WWtq9ly8iU/zQ2PXh9OUHMf9KXJIskhyUkVYEja6iV0MolxPIV
 vKt0eHuytWywX8SSkqLd0b2OfMwmLWov8X1/mgixtGAyYPzAXwEz4JzK+pC0Ltjcprrb
 4HXC58BIgGIS2FQK3lZ5KdSLgQoYFe0mGyLYnlWubZsUwjbhgQE/UU8cc6Jr0VWV4ET8
 Z932p7z3marX/OTVnOZhWpnmaMPuATqSD2nVp2yTVfdhEdbvt36bQofBB/CqYPbTnTkW
 J9Z5A1vOoakfSFwJwijzrHDbwVSm9XVy40lV4EYAUhY9T51o0dr46AOiWu8aQ5JSJ6E9
 hsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNR4QFDwrEs+DM9mCpVfCfFoLntNBNlangXWmdJd7jQ=;
 b=hOrmnhlawwvtLC+VTFi+3PkqpuVwtVx1mR8xGolva16SIadlvVEvX0jdyFkTEoh6cR
 Kd7dAEyB+LYibfdYfkoxkhTgW8hDbCBUBdzVwZhjzNC936eXQuqJTzIFhpzKPfB5x6sE
 SnkErVwJYZyEjrGPbCYw4cRwC2f2N9FMOgqB5FirqD2isAmLVkHfq+YjN9u7b5muDNs7
 GeYnCkxmf7XVKwBKQ7O+pv38/aFtLLeandDEzRnx+JJ4IxExI0r50XOpuDy/DnpXmlBi
 UIp7qzU83vFLrhjoyvkSPWb7+Gxhno4IRVqFJeiu4LJXKd3SyoYWMqxFUpw1+puX4h5U
 pzfw==
X-Gm-Message-State: ANoB5pn8GyPTRiQl5I/1UVFze0XPjsbLviS2gcRdI1SIqzovWUxD90c+
 aTtOaeZzUacFWbALqeUFwec=
X-Google-Smtp-Source: AA0mqf7Z77JQePKAQgDjcA6OzphuFLIWzFmBMXBp7AQ7kyJMi37N1qnBvoNKDNOC5n/5ojrifOFdyA==
X-Received: by 2002:a05:6402:1f0a:b0:461:46c7:3617 with SMTP id
 b10-20020a0564021f0a00b0046146c73617mr9959963edb.30.1670806551074; 
 Sun, 11 Dec 2022 16:55:51 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 um8-20020a170906cf8800b0078d3f96d293sm2651368ejb.30.2022.12.11.16.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 16:55:50 -0800 (PST)
Date: Mon, 12 Dec 2022 00:55:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH-for-8.0 0/7] hw/mips: Make gt64xxx_pci.c endian-agnostic
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
Message-ID: <93CA6FDA-BD55-4092-B827-948D0F1A6C68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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



Am 9=2E Dezember 2022 15:15:26 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Respining an old/unfinished series=2E=2E=2E Add the 'cpu-little-endian'
>qdev property to the GT64120 north bridge so [target-specific]
>machines can set its endianness, allowing it to be endian agnostic=2E

Hi Phil,

Did you intend to use three different E-mail addresses in your series? At =
least your former @redhat=2Ecom address bounces=2E=2E=2E

Best regards,
Bernhard

>
>Philippe Mathieu-Daud=C3=A9 (7):
>  hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci=2Ec
>  hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
>  hw/mips/gt64xxx_pci: Manage endian bits with the RegisterField API
>  hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev property
>  hw/mips/malta: Explicit GT64120 endianness upon device creation
>  hw/mips/meson: Make gt64xxx_pci=2Ec endian-agnostic
>  hw/mips/gt64xxx_pci: Move it to hw/pci-host/
>
> MAINTAINERS                                   |  2 +-
> configs/devices/mips-softmmu/common=2Emak       |  1 -
> hw/mips/Kconfig                               |  1 +
> hw/mips/malta=2Ec                               | 11 ++--
> hw/mips/meson=2Ebuild                           |  2 +-
> hw/mips/trace-events                          |  6 ---
> hw/pci-host/Kconfig                           |  6 +++
> hw/{mips/gt64xxx_pci=2Ec =3D> pci-host/gt64120=2Ec} | 54 ++++++++++++++-=
----
> hw/pci-host/meson=2Ebuild                       |  1 +
> hw/pci-host/trace-events                      |  7 +++
> meson=2Ebuild                                   |  1 -
> 11 files changed, 62 insertions(+), 30 deletions(-)
> delete mode 100644 hw/mips/trace-events
> rename hw/{mips/gt64xxx_pci=2Ec =3D> pci-host/gt64120=2Ec} (95%)
>

