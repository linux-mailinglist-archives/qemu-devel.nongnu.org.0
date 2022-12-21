Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A339665354C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:33:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82d7-0003zE-Jh; Wed, 21 Dec 2022 12:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82d4-0003sh-UN; Wed, 21 Dec 2022 12:11:42 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82d3-00024K-0Y; Wed, 21 Dec 2022 12:11:42 -0500
Received: by mail-ej1-x636.google.com with SMTP id kw15so38300019ejc.10;
 Wed, 21 Dec 2022 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ioe6Hg6xqZ8FseCcQFtepzBG40ScTtGiEsVHaVRQtVo=;
 b=Eq3igo3HSspO+62vOLFLGCaAVQ80zBXfoS6PlI/c2zL4GdoYeRcRmqxuQ0Cy5RHoMK
 gPaBC5WmdNJmBZMSpp0Stb0ybcR6F5xUYmrxEHFxs4AhaTLHiZo/8SWLffBgBlpmDDQg
 gl0AGQS2OIirmwAOhHbL0q2OyRinSgDJKBIZTO8f0i9czVhvwFAidPAvUEnWoWXI38LM
 A9g5wY+oEBcRdhcR9OY0xRJaAdBXpUjp9Jwp1RUndNOlBpnQajw8XN7g5sDxITeWX9eW
 LejCbz3/5iSCGyxJjLQ//nJ35fZ/4/FSv6HORxXcxqgLoGnAbd3AkD6pU1QjtgcbaIPx
 X8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ioe6Hg6xqZ8FseCcQFtepzBG40ScTtGiEsVHaVRQtVo=;
 b=HOCoN7JLHdrhWDOx5arq9/Nobsb2j3tST/wpi8MUz2q9remrpPLD0MoGYflWAC6/xa
 XPepfFrLFl4QAhPBaMvLjT4B6kVYLw41y3VGun+FEly35FGApOhk+1uyz0YYJq60Exq3
 7MFYIctmTC28pR+Shgd+XHFZTxaU1eEvoTu/BWljTW8OjS4KlN+SPcwQABbffNxqP7NC
 jJa6JJ+VSjRR93emjzodvKezXqUFqPE3KgK3axhB16nF+Ev5t+pfD1LFKwXQxwrC8RBl
 djS8Zf+9+m5+w9CcmYQ3DWggbMg2540cYrrZ/fkF2wM8MGXHNUY7T6ZWa3yvfgnlYrVT
 BwkQ==
X-Gm-Message-State: AFqh2kotXYL+Cxu/YYJSfgaukQdT5gbCqEkaeY5mMpGQ3i6ez5dfZwkc
 8XlZ8nP73uHX2vsBysIgSBI=
X-Google-Smtp-Source: AMrXdXsHkSGn2KZJ4bZdAaiwQHv/cthI/obJedC0lKMXkU6iH8idCltsun739TCw81+758rfGhyRKg==
X-Received: by 2002:a17:907:c301:b0:7fd:ecee:c8ba with SMTP id
 tl1-20020a170907c30100b007fdeceec8bamr3152832ejc.42.1671642698958; 
 Wed, 21 Dec 2022 09:11:38 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-051-061.92.224.pool.telefonica.de.
 [92.224.51.61]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906375500b00781be3e7badsm7343893ejc.53.2022.12.21.09.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:11:38 -0800 (PST)
Date: Wed, 21 Dec 2022 17:11:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
In-Reply-To: <7030BFB2-DD96-4900-991C-DC962875D4D4@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221220094738-mutt-send-email-mst@kernel.org>
 <d5e1af45-9ff9-6b01-9650-bf5b960abee7@linaro.org>
 <7030BFB2-DD96-4900-991C-DC962875D4D4@gmail.com>
Message-ID: <55DE5DD2-A889-4694-B46B-ECEC3EB3794F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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



Am 20=2E Dezember 2022 22:35:23 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>
>
>Am 20=2E Dezember 2022 15:08:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>>On 20/12/22 15:48, Michael S=2E Tsirkin wrote:
>>> On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
>>>> This series consolidates the implementations of the PIIX3 and PIIX4 s=
outh
>>>> bridges and is an extended version of [1]=2E The motivation is to sha=
re as much
>>>> code as possible and to bring both device models to feature parity su=
ch that
>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc ma=
chine=2E This
>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed =
on this
>>>> list before=2E
>>>>=20
>>>> The series is structured as follows: First, PIIX3 is changed to insta=
ntiate
>>>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 get=
s prepared
>>>> for the merge with PIIX4 which includes some fixes, cleanups, and ren=
amings=2E
>>>> Third, the same is done for PIIX4=2E In step four the implementations=
 are merged=2E
>>>> Since some consolidations could be done easier with merged implementa=
tions, the
>>>> consolidation continues in step five which concludes the series=2E
>>>>=20
>>>> One particular challenge in this series was that the PIC of PIIX3 use=
d to be
>>>> instantiated outside of the south bridge while some sub functions req=
uire a PIC
>>>> with populated qemu_irqs=2E This has been solved by introducing a pro=
xy PIC which
>>>> furthermore allows PIIX3 to be agnostic towards the virtualization te=
chnology
>>>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy P=
IC as well=2E
>>>>=20
>>>> Another challenge was dealing with optional devices where Peter alrea=
dy gave
>>>> advice in [1] which this series implements=2E
>>>>=20
>>>> A challenge still remains with consolidating PCI interrupt handling=
=2E There are
>>>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get=
_pirq()
>>>> which are implemented in isa/piix=2Ec=2E Any advice how to resolve th=
ese would be
>>>> highly appreaciated=2E See [2] for details=2E
>>>>=20
>>>> Last but not least there might be some opportunity to consolidate VM =
state
>>>> handling, probably by reusing the one from PIIX3=2E Since I'm not ver=
y familiar
>>>> with the requirements I didn't touch it so far=2E
>>>>=20
>>>> Testing done:
>>>> * make check
>>>> * make check-avocado
>>>> * Boot live CD:
>>>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manj=
aro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom man=
jaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malt=
a -hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 cons=
ole=3DttyS0"`
>>>>=20
>>>> v3:
>>>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_=
USB_UHCIx (Philippe)
>>>> - Make proxy PIC generic (Philippe)
>>>> - Track Malta's PIIX dependencies through KConfig
>>>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bi=
ts' series [3]
>>>> - Also rebase onto latest master to resolve merge conflicts=2E This r=
equired copying
>>>>    Philippe's series as first three patches - please ignore=2E
>>>=20
>>> So IIUC, you are waiting for Philippe to respin his series then
>>> you can include it all in v4, right?
>>Correct=2E And mine is waiting for few more R-b tags=2E If you can Ack
>>this series, no need for v4 and I can pick it via mips-next once the
>>rest is ready (before Xmas I hope)=2E
>
>Nice!
>
>Shall we integrate [1] 'Decouple INTx-to-LNKx routing from south bridges'=
 via mips-next rather than x86 as well? This would 1/ make the consolidatio=
n more complete and 2/ simplify the process since these series conflict wit=
h one another=2E
>
>I could rebase [1] onto this series (perhaps simpler to review) or the ot=
her way around (less code movement)=2E Please let me know what you'd prefer=
=2E

[1] is now queued to mips-next, so I've respun a v4 of this series=2E

Thanks,
Bernhard

>
>[1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03310=
=2Ehtml
>
>>
>>Regards=2E
>>
>>Phil=2E

