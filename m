Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A648964FC74
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 22:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6eqU-0004bl-Oj; Sat, 17 Dec 2022 16:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6eqS-0004bJ-QY; Sat, 17 Dec 2022 16:35:48 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6eqR-0001jb-9j; Sat, 17 Dec 2022 16:35:48 -0500
Received: by mail-ej1-x632.google.com with SMTP id bj12so13557935ejb.13;
 Sat, 17 Dec 2022 13:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68Ne7Avk+6V4LFaKUB4ZA7pUxtVZMEXNV7IESQ+heac=;
 b=dUlVdVLXPkH2vO96U9ViiL6t1F9ItlxK8seIN4Lzcjpa3hljwEmxjZ+xFRBcHfpreA
 h64cuIEeE+RJoC2rLcFfJ4rvxJHbEbn6lNlhih+RCmHrUFQ5nHgVEdfyOvywKvc0iixN
 UFL2FeYF8SIrf6ehv+aimRS1U2hmp1yI71cscwJoXYA7AUnUVX9S269TeIl5zLe4P0kM
 GWgIHNtbnN5JuwGy20IVZM4/7WVcEr6Olcj1ry8WM4n59CjSsjECxIQ2thhKjXdrPxbi
 6FIaJd1JMaTjKh02WAR4lE1vKuUo+leBpKowqBzhlKgGt9vunqkbBkbcosW6XtqN9xYF
 l9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68Ne7Avk+6V4LFaKUB4ZA7pUxtVZMEXNV7IESQ+heac=;
 b=b9baSXp5x/B795mltnfU4WPwuOxB1laiFnD90U755rxZck4iEq+VSrJHdMYfzXT18T
 hiqB9ju5KlP13l5ue5Hdb0LCyMD93y2eZewl0VN6Uii806mXFbh8O9n7gSyETSKl7w6F
 sxKqNzGlTeBR6678w6mBS2aRm3Avb7tr/VWTKx38/4N7dVk6iRn6pof6bm4ntOWKq82C
 7mj48iBXZpjb+lNaq4bgOK1HcT5jkfS+7imPL5VP6bPmu7ClLK+vvilfpXTjhAuFv8wJ
 vQ9jV9wHjkxy8DXq487IeA0gOIueg2NryOUxvz+Mc0Uo0ZH0JwVxxlrbRAjFGGq9q+6X
 KPvw==
X-Gm-Message-State: ANoB5pnWxvxfYWFYikr9m7uLCawGMbVvLzeQKTEP5TLCuJjvffd25Z6f
 1cSAfMtJ51h1Qo6kZSgtHjDblXAXa6Q=
X-Google-Smtp-Source: AA0mqf40MsEIClmGb6Bf0W5pZS9E7iaa9WS/aknAEwcrw2fvsjdc4fqzy7iHBtIH+LyUhmrDCBzPIA==
X-Received: by 2002:a17:906:1914:b0:7c1:311f:352f with SMTP id
 a20-20020a170906191400b007c1311f352fmr32058865eje.48.1671312944351; 
 Sat, 17 Dec 2022 13:35:44 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-115-237.77.191.pool.telefonica.de.
 [77.191.115.237]) by smtp.gmail.com with ESMTPSA id
 ky16-20020a170907779000b007ae38d837c5sm2428311ejc.174.2022.12.17.13.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 13:35:43 -0800 (PST)
Date: Sat, 17 Dec 2022 21:35:40 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/7] Clean up dependencies of ACPI controllers
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
Message-ID: <D366A677-0348-4073-80A8-B169B4561624@gmail.com>
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



Am 16=2E Dezember 2022 13:03:48 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>This small series establishes consistency between ICH9, PIIX4 and VT82C68=
6 ACPI
>
>controllers to select ACPI, ACPI_SMBUS and APM since they are provided by=
 the
>
>device models=2E
>
>
>
>Due to the PIIX4 PM cleanup PEGASOS2's dependency can be reduced to just =
ACPI,
>
>eliminating 9 dependencies from the softmmu-ppc build=2E
>
>
>
>v2:
>
>- Turn "depends on ACPI" into "select ACPI" (Phil)
>
>- Remove "select ACPI" from PEGASOS2 (Phil)
>

Ping

Patches 4 & 6 still need review=2E

>- Move already reviewed patches to bottom
>
>- Split some patches into "add missing dependencies" and "remove redundan=
t
>
>  dependencies" for ease of review
>
>
>
>Bernhard Beschow (7):
>
>  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
>
>  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
>
>  hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta
=
>
>    machines
>
>  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
>
>  hw/isa/Kconfig: Add missing dependency to VT82C686
>
>  i386, mips: Resolve redundant ACPI and APM dependencies
>
>  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
>
>
>
> configs/devices/mips-softmmu/common=2Emak | 3 ---
>
> hw/acpi/Kconfig                         | 9 ++++++---
>
> hw/acpi/meson=2Ebuild                     | 2 +-
>
> hw/i2c/meson=2Ebuild                      | 2 +-
>
> hw/i386/Kconfig                         | 3 +--
>
> hw/isa/Kconfig                          | 4 ++--
>
> hw/ppc/Kconfig                          | 2 --
>
> 7 files changed, 11 insertions(+), 14 deletions(-)
>
>
>
>-- >
>2=2E39=2E0
>
>
>

