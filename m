Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B363309E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 00:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxG02-0006WA-LT; Mon, 21 Nov 2022 18:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oxG00-0006Vn-Fg
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:14:48 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oxFzy-0001Pv-IE
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:14:47 -0500
Received: by mail-ej1-x632.google.com with SMTP id f18so31998020ejz.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 15:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQKZ7v06d46nWOLe6Wd1/EO+qwN9PQGNeMiBXdhMyg0=;
 b=G3uNLhEm6W2XAkmRqXKWnJiyF1aKPHg4h+JobAAZBLz3wMT+11u16/E1OGGMaytqL/
 3W7LgKWr0KJbNzsGzTo4u/4WPvYYsd2ZE5UD386Ur+PSU6exKuZBERt4OtbCEpDS98Qk
 6UejgqhoyinM16Gtpr8Cqy4KhmDRcXi3/K3SSL4SAsFCmJKCCwb5DHRvz28a9+FJtTET
 7EE/0vJF3TIhml9Ia2GZGkJUVMqvj+rZPWTD2TtW72vQiOAMVdmwht3/up9UZ6Uru0yF
 MTgrRnttMGVAKUcGxgTaLSDXFdA8MwWvapdAvWiaWfFSA6KxbPccqmJy49FRb7IPZ/YQ
 iA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nQKZ7v06d46nWOLe6Wd1/EO+qwN9PQGNeMiBXdhMyg0=;
 b=ywC1uEU3HKj10xjDsLWhYalq1AKou95RSUQZ+xuHtUKMRHOQtAfAH1pNxh7WFMt1zp
 qyMharGwEglvQ86oonY2/ley+q/xkhaWfGk3pQi4rZX+9z0QzwxhB4MtqlBqDOhZcrwI
 ojnpjprVNjv35OBJqe/v+1aHgC02SAe/DtL+JI6nuSD1OncjajYMLXwVFB49EsSn7pfy
 F/WX0i3BzH5QDgZWsKzRjuAm8j+V2WVEXnmDxMur5glt8mfyLEsxOaKsCS9CltnYkj/q
 KlnCtO7x74RNxp1NOuQIyA/fW+ln0PYpmObLnVAiAi90R1Jz/3PXj7VuyBbQc7rixtY/
 R5pw==
X-Gm-Message-State: ANoB5pld/sx513vq8as7YzmDEs5yS0ioOdI9m/j6BPYBRqhxr1/h9Rxe
 Qc8ADkpYKu0CKBmf7ZNLSzI=
X-Google-Smtp-Source: AA0mqf5J9y+AzSfJd67J7OiyRdQPDM/zMNlewmysLH0UOyvu775t7kd/DhOs0SVTRhoStCATQ90vsQ==
X-Received: by 2002:a17:906:444b:b0:7ad:dd43:5d53 with SMTP id
 i11-20020a170906444b00b007addd435d53mr578065ejp.376.1669072484762; 
 Mon, 21 Nov 2022 15:14:44 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-039-218.89.12.pool.telefonica.de.
 [89.12.39.218]) by smtp.gmail.com with ESMTPSA id
 qp25-20020a170907207900b007081282cbd8sm5389760ejb.76.2022.11.21.15.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 15:14:44 -0800 (PST)
Date: Mon, 21 Nov 2022 23:14:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_hw/mips/malta=3A_Set_?=
 =?US-ASCII?Q?PIIX4_IRQ_routes_in_embedded_bootloader?=
In-Reply-To: <29561bcc-a8d2-639a-8662-cf15fbeb5928@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <29561bcc-a8d2-639a-8662-cf15fbeb5928@linaro.org>
Message-ID: <B64DB06E-A125-47E7-9E11-828A763AD590@gmail.com>
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



Am 21=2E November 2022 22:43:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 21/11/22 16:34, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 27=2E Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>> Linux kernel expects the northbridge & southbridge chipsets
>>> configured by the BIOS firmware=2E We emulate that by writing
>>> a tiny bootloader code in write_bootloader()=2E
>>>=20
>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>> the PIIX4 configuration space included values specific to
>>> the Malta board=2E
>>>=20
>>> Set the Malta-specific IRQ routing values in the embedded
>>> bootloader, so the next commit can remove the Malta specific
>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>> (matching the real hardware)=2E
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>> ---
>>> FIXME: Missing the nanoMIPS counter-part!
>>=20
>> Who will be taking care of this? I have absolutely no clue how the writ=
e_bootloader functions work, so I don't see how to fix it=2E
>
>Oh actually I wrote that and tested it but context switched and forgot
>about it=2E=2E=2E I'll look back when I get some time, probably around th=
e
>release=2E
>
>> Couldn't we just do it like in pegasos2_init() where the registers are =
initialized by QEMU directly if there is no bootloader binary configured? I=
 could do that=2E
>I rather mimic bootloaders=2E=2E=2E maybe a matter of taste?

I don't mind either way=2E I meant that I could help with the second appro=
ach but not with the current one since I have no clue whatsoever how it wor=
ks=2E There are just too many magic constants that don't make any sense to =
me, and too many layers of indirection, for example=2E

Anyway, I'm asking for the current state because I'm pretty much ready for=
 posting a v3 of my PIIX consolidation series which now depends on this ser=
ies=2E

Best regards,
Bernhard

>
>Regards,
>
>Phil=2E

