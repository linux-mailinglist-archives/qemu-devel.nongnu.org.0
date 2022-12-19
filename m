Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC9650B40
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F2e-0006rV-Ei; Mon, 19 Dec 2022 07:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7F2c-0006qJ-Op; Mon, 19 Dec 2022 07:14:46 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7F2a-0005MX-Pl; Mon, 19 Dec 2022 07:14:46 -0500
Received: by mail-ej1-x635.google.com with SMTP id ud5so21005061ejc.4;
 Mon, 19 Dec 2022 04:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=derpuGDC4NK96PelJbV9Yfkh6stLkxDwTskS7LM7f5w=;
 b=Jhz2L8DHfNGvdX+Un+VMPDaVTV5pLg8VJSp5+Xck0AR+QJMaKNUvUq3TpktrQGpDwU
 Q/y6J7GVFLaInY+zjG0FJazugrH5ZHxmd2Ta7JeQ8QXD/rDQcvlVUeJmL3RsEPIoPms6
 13cvqIRlNoApBJokbb/XSC0aD3rEfo86jTwjpRoSEGnA3rMyTM3I7TQ6jrdbBjj5Nk0u
 YRVayo7rQv8Unk7RreE806Hufl3cxpJvv6XTAxr1SiR28ky7olrZAAXz78PaWZ9bEgQU
 UbcxrLnsDdZymPDLj3kvcnf06df/8GaZ+USsE44QydGKW8eN5DD+tweXCrf71Q2iD79b
 vjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=derpuGDC4NK96PelJbV9Yfkh6stLkxDwTskS7LM7f5w=;
 b=Not+RSmKC6GugdTMlVeMDV72uy9/6T3zHcBpiEzS8yMGPhb2223yloCxnnE/t6zIFK
 QCk9zkxypGkRPu7liHehn6Xiv8SNNBQjxDA8JfTGxppeHQ3Gnxjz++yf9muZK8bxdGB0
 X3ODX9vb3rwQ6J+dJ5SNIqzkcf88MltN0CAw7yjvqmYBMFmR/Pp72wzdehJaWCa8OyrR
 PIuHObFPgvMREkuZtfzQHPQKK1I1L/ng3wuicdLUdKxpsFNzyOZAzSn0L3BOou70i97s
 Z0b/XLRkQtpqhAIVtQ+kuXH5ShlaeKuK6xL9EUntzc3w/+WW43XDj7VTeImTcaf1LyYt
 C6kg==
X-Gm-Message-State: AFqh2kq1uIIoCDrACljsUA9q2Jffd2Hx6v0/rBw++lm8qayhqKQUOOrf
 nsUXFDTlSegezURj9vypAck=
X-Google-Smtp-Source: AMrXdXvu2TPuSv718nROdKJGtwI79kPcOxLfwihoSCM6RmUgBk/SxFKc9aV3EwxftfpRa6ZsJDm4wg==
X-Received: by 2002:a17:906:9f26:b0:7cd:dbe8:e4f7 with SMTP id
 fy38-20020a1709069f2600b007cddbe8e4f7mr17568845ejc.77.1671452082480; 
 Mon, 19 Dec 2022 04:14:42 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-056-244.78.55.pool.telefonica.de.
 [78.55.56.244]) by smtp.gmail.com with ESMTPSA id
 d22-20020a056402401600b004585eba4baesm4272963eda.80.2022.12.19.04.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 04:14:42 -0800 (PST)
Date: Mon, 19 Dec 2022 12:14:33 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
In-Reply-To: <3aace928-1f23-acc3-9643-29f540b3f744@linaro.org>
References: <20221204190553.3274-1-shentey@gmail.com>
 <B5EE1B75-28AF-406F-96BE-9247E1D1C08D@gmail.com>
 <3aace928-1f23-acc3-9643-29f540b3f744@linaro.org>
Message-ID: <B525722E-0E68-4C4C-9B82-A86F23768341@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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



Am 18=2E Dezember 2022 14:17:48 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 18/12/22 11:33, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 4=2E Dezember 2022 19:05:21 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>>> This series consolidates the implementations of the PIIX3 and PIIX4 so=
uth
>>>=20
>>> bridges and is an extended version of [1]=2E The motivation is to shar=
e as much
>>>=20
>>> code as possible and to bring both device models to feature parity suc=
h that
>>>=20
>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mac=
hine=2E This
>>>=20
>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed o=
n this
>>>=20
>>> list before=2E
>>>=20
>>>=20
>>>=20
>>> The series is structured as follows: First, PIIX3 is changed to instan=
tiate
>>>=20
>>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets=
 prepared
>>>=20
>>> for the merge with PIIX4 which includes some fixes, cleanups, and rena=
mings=2E
>>>=20
>>> Third, the same is done for PIIX4=2E In step four the implementations =
are merged=2E
>>>=20
>>> Since some consolidations could be done easier with merged implementat=
ions, the
>>>=20
>>> consolidation continues in step five which concludes the series=2E
>>>=20
>>>=20
>>>=20
>>> One particular challenge in this series was that the PIC of PIIX3 used=
 to be
>>>=20
>>> instantiated outside of the south bridge while some sub functions requ=
ire a PIC
>>>=20
>>> with populated qemu_irqs=2E This has been solved by introducing a prox=
y PIC which
>>>=20
>>> furthermore allows PIIX3 to be agnostic towards the virtualization tec=
hnology
>>>=20
>>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PI=
C as well=2E
>>>=20
>>>=20
>>>=20
>>> Another challenge was dealing with optional devices where Peter alread=
y gave
>>>=20
>>> advice in [1] which this series implements=2E
>>>=20
>>>=20
>>>=20
>>> A challenge still remains with consolidating PCI interrupt handling=2E=
 There are
>>>=20
>>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_=
pirq()
>>>=20
>>> which are implemented in isa/piix=2Ec=2E Any advice how to resolve the=
se would be
>>>=20
>>> highly appreaciated=2E See [2] for details=2E
>>>=20
>>>=20
>>>=20
>>> Last but not least there might be some opportunity to consolidate VM s=
tate
>>>=20
>>> handling, probably by reusing the one from PIIX3=2E Since I'm not very=
 familiar
>>>=20
>>> with the requirements I didn't touch it so far=2E
>>>=20
>>>=20
>>>=20
>>> Testing done:
>>>=20
>>> * make check
>>>=20
>>> * make check-avocado
>>>=20
>>> * Boot live CD:
>>>=20
>>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjar=
o-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>=20
>>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manja=
ro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>=20
>>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta=
 -hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 conso=
le=3DttyS0"`
>>>=20
>>>=20
>>>=20
>>> v3:
>>>=20
>>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_U=
SB_UHCIx (Philippe)
>>>=20
>>> - Make proxy PIC generic (Philippe)
>>>=20
>>> - Track Malta's PIIX dependencies through KConfig
>>>=20
>>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bit=
s' series [3]
>>>=20
>>> - Also rebase onto latest master to resolve merge conflicts=2E This re=
quired copying
>>>=20
>>>   Philippe's series as first three patches - please ignore=2E
>>>=20
>>=20
>> Ping
>
>Could you review patches 1-3?

I reviewed patches 1 & 3=2E Patch 2 still has the todo [1]=2E Could you re=
spin v2?

[1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg05367=
=2Ehtml ?

