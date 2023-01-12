Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78362667E1C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:25:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2Fp-0003DR-0K; Thu, 12 Jan 2023 13:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG2Fm-0003A7-Lq; Thu, 12 Jan 2023 13:24:42 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pG2Fk-0000ik-Qf; Thu, 12 Jan 2023 13:24:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so46810390ejc.2;
 Thu, 12 Jan 2023 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huxjxUqoz2yz6JwHPvYWWv/HMqnyaP6Qo2g1JBsO+64=;
 b=XtuD6SooK03Lyj4jqQVuzVl1/gdzMU5ofrL0ELY8+qU+ig6fa2/uHdJXpgLuKt2mDS
 mNyw7zpV3lgHd61l/MKtZDgB2gvQtfiPVKzMpFpjqcGVh2AlTRY7hAyWAI7HfBawADUa
 Hmtm4TBjaezz1Ms24nCD8r3YJGA0YKXVwbxOQB0jU0x9AivcgLF0WYPemnb53ANafCRE
 1WpF6JeH4JdsgRxc8apDB3gQf79MkOFNXErYqL2XIFbZ+QKTNym32GJr3EzT2w4zTmVA
 +U7AJI0CoaQrOAEGusuIFXjZSlTq98PC+mMIhjAdVHuuqSBQVjvItJUDcwhme7OLIoP/
 w5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huxjxUqoz2yz6JwHPvYWWv/HMqnyaP6Qo2g1JBsO+64=;
 b=0k4HdES20AVsg6KTiB7hNPJyVPeQuNQ6+lOD14exoBTa/fVU6kWRf56TVZuuk8KBz2
 uorELbLE/S2XS/xk3c3TQAHHtgqEoL7RuhXlLCfwzve+CAhVS+uW63vxHmRyu4GLbhP3
 B0ZOfpE62Gz4H36SdaL5yWskuUhG49hgZUuNEY0EnDZqPwQCP0yjtpLflkRXV44Dbu7s
 I2G5s1h7aHekOpKwrcj1Awkc2ozZ6ewVf0YD9pIcoDqRZvVEQCzypif4qZl6CbOCDq3Y
 kx1vOcIF9RS+rSb0os4WPVpU6C0L5MqI67R2dp6bHnV7Rt1RdEGXmb/iXtsW+TRdiBjL
 cirQ==
X-Gm-Message-State: AFqh2koCSA4QEAKMZsp04h2JCqQot49t/Ow/o7lPSJbCE61HRXnSjH1q
 BXKc/DFUpCZNfqD8Sr8UH/c=
X-Google-Smtp-Source: AMrXdXsnnzhLIFYUyYtcyLUe+XGZaM+RhfA3D0Sw8Wq/QxZhm1JUNXhSaC9W8NixJJ06l1Fp7w0D5g==
X-Received: by 2002:a17:907:a70d:b0:7c0:a17c:fe5 with SMTP id
 vw13-20020a170907a70d00b007c0a17c0fe5mr61032703ejc.44.1673547878211; 
 Thu, 12 Jan 2023 10:24:38 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-135-062.92.224.pool.telefonica.de.
 [92.224.135.62]) by smtp.gmail.com with ESMTPSA id
 e22-20020a170906315600b007ae10525550sm7619246eje.47.2023.01.12.10.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 10:24:37 -0800 (PST)
Date: Thu, 12 Jan 2023 18:24:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
In-Reply-To: <0c49ff50-72ee-18c8-6f3b-db5f50c88297@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
 <f4c3ec2b-6005-6b7c-9f66-a942e9e0a384@linaro.org>
 <0c49ff50-72ee-18c8-6f3b-db5f50c88297@linaro.org>
Message-ID: <EE87C699-298B-4EEC-BBE5-9FE7E32EF48F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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



Am 12=2E Januar 2023 13:32:02 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 12/1/23 13:50, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>> Now that the PIIX3 and PIIX4 device models are sufficiently consolidat=
ed,
>>> their implementations can be merged into one file for further
>>> consolidation=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>> Message-Id: <20221022150508=2E26830-37-shentey@gmail=2Ecom>
>>> ---
>>> =C2=A0 hw/isa/{piix3=2Ec =3D> piix=2Ec} | 158 ++++++++++++++++++++
>>> =C2=A0 hw/isa/piix4=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 285 -------------------------------------
>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
>>> =C2=A0 hw/i386/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 hw/isa/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
>>> =C2=A0 hw/isa/meson=2Ebuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 3 +-
>>> =C2=A0 hw/mips/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 7 files changed, 165 insertions(+), 303 deletions(-)
>>> =C2=A0 rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (75%)
>>> =C2=A0 delete mode 100644 hw/isa/piix4=2Ec
>>=20
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>
>BTW I wonder why PIIX4 isn't calling pci_bus_set_route_irq_fn()=2E=2E=2E
>Any clue?

Looks like it gets used for proxying: https://elixir=2Ebootlin=2Ecom/qemu/=
v7=2E2=2E0/C/ident/pci_device_route_intx_to_irq

