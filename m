Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE36529DA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7m0g-0002LU-Ta; Tue, 20 Dec 2022 18:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7m0e-0002LA-66; Tue, 20 Dec 2022 18:26:56 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7m0c-0002yx-HJ; Tue, 20 Dec 2022 18:26:55 -0500
Received: by mail-ej1-x62c.google.com with SMTP id x22so32861249ejs.11;
 Tue, 20 Dec 2022 15:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMa+Dr0Zcqig38qOu5o9wKaeLQp4JhlgNvBSTwdlQQc=;
 b=BRhxlGTJRIiYZaMkCguw3WOAfIS5nY6mWc56Foiur/HR3M/NYJvwp7CI0Wl87tTCS7
 lXgHi9G2Ho7Qq+3M0u13NBGrtkr7iyv/xQ7yy6WjDeJf9wO6abF5upfaQx+oWa3DpPKo
 Z8no084ebrh3eHZGoCHMyGkcTq02c8KGdp2P0JD6bn1rAqsdUP/U2GeG/1xQr4Tncehx
 jUf4QSJGKT6jGl7aa1kLIhwzLoGC/I/8e878j15BXL9JhYmNH1gTnbT/zoF8jOLNZNzv
 m9RqqdgQeq9x891bUIYUI487YEx+S68Vpav4prJ4+ZF5LIRmPydMOW1UCPvvXui9Pcmx
 xcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMa+Dr0Zcqig38qOu5o9wKaeLQp4JhlgNvBSTwdlQQc=;
 b=ZUk/v4fm3M+RwYvR9POiL0GAzTaaZZObuLrvEYp6fF7ydXnJjqiQ0eBbB+4M5UKGqw
 LleUQCnT4Pk6Gpdc3jWhnh8AUzyLp4pImJbj3slEvIp2Tj3w+Ki2cA10/jhb82HqojpZ
 MvKL94lawcGkBFPeorcDMNZsFAqctrie/A99QM9/FhChqyMx7myT4CVquisX1SGUJO5u
 mqGC0bYAwSogXZTpb6x0YVa4LF8q9AjQ82xV0Cw3nvnbPWw7xYqmdh7nh4K+tdP8u0T4
 ICvDBEkAKbNyDCUpUzuGT5876tSjqzEg5IImsLqULl8fXz6UzPpaoGAjOnu9Sv2tFVvb
 S+cw==
X-Gm-Message-State: AFqh2kp8rjXcDy4Mvas+bdvmmplAN9GEmz3K8itBSZM9wPGcSCsdwX82
 mHn1equNDkCN5GXh2Wqws8Q=
X-Google-Smtp-Source: AMrXdXubmUOZhiHpIqeEDkWRJs7MIx+0s8ivWzIOhBXjIOZ4CEtnBMxSN9Arlw+Pb8p1UyxctRL15g==
X-Received: by 2002:a17:906:4809:b0:78d:f454:ba4c with SMTP id
 w9-20020a170906480900b0078df454ba4cmr2960302ejq.75.1671578812228; 
 Tue, 20 Dec 2022 15:26:52 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-170-133.89.14.pool.telefonica.de.
 [89.14.170.133]) by smtp.gmail.com with ESMTPSA id
 c2-20020a17090618a200b008318e6d09easm2246706ejf.103.2022.12.20.15.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 15:26:51 -0800 (PST)
Date: Tue, 20 Dec 2022 23:26:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
In-Reply-To: <20221220181024-mutt-send-email-mst@kernel.org>
References: <20221120150550.63059-1-shentey@gmail.com>
 <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
 <3F5A5F52-5815-4CB2-9DE8-894D59B0EB8C@gmail.com>
 <20221220181024-mutt-send-email-mst@kernel.org>
Message-ID: <B8EAD0D4-F86D-4FDB-A1B9-D4A1612CE40C@gmail.com>
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



Am 20=2E Dezember 2022 23:10:45 UTC schrieb "Michael S=2E Tsirkin" <mst@re=
dhat=2Ecom>:
>On Sun, Dec 18, 2022 at 10:21:49AM +0000, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 9=2E Dezember 2022 15:23:59 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>> >On 20/11/22 16:05, Bernhard Beschow wrote:
>> >> v1:
>> >> =3D=3D=3D
>> >>=20
>> >> During my PIIX consolidation work [1] I've noticed that both PIIX mo=
dels have
>> >> quite different pci_slot_get_pirq() implementations=2E These functio=
ns seem to
>> >> map PCI INTx pins to input pins of a programmable interrupt router w=
hich is
>> >> AFAIU board-specific=2E IOW, board-specific assumptions are baked in=
to the device
>> >> models which prevent e=2Eg=2E the whole PIIX4 south bridge to be reu=
sable in the PC
>> >> machine=2E
>> >>=20
>> >> This series first factors out pci_bus_map_irqs() from pci_bus_irqs()=
 which
>> >> then allowes for moving the two board-specific PIIX pci_slot_get_pir=
q()
>> >> funtions into their respective boards=2E With these changes, the PII=
X4 south
>> >> bridge could eventually become an alternative to the PIIX3-Frankenst=
ein
>> >> solution in the PC machine=2E
>> >
>> >Series:
>> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>=20
>> Ping
>>=20
>> Who will pull this?
>
>To clarify, you want this dropped for now?

Yeah, let's merge via mips-next since this series is related to the PIIX c=
onsolidation series (see above) and mips-next is planned to be pulled soon=
=2E

Thanks,
Bernhard

