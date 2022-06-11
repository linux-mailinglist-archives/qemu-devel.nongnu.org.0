Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172F854734D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 11:35:10 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzxWO-0002OQ-P0
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 05:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxSs-000130-AK; Sat, 11 Jun 2022 05:31:30 -0400
Received: from mail-oa1-f42.google.com ([209.85.160.42]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxSk-0006Bq-U5; Sat, 11 Jun 2022 05:31:28 -0400
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-100eb6f7782so2203746fac.2; 
 Sat, 11 Jun 2022 02:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sYFWxf2tjreZ4hn+Tll8QshX0PjpSdctnnBM7Vadu6s=;
 b=mOP/DXXbSmUoikSCIq7exO0LYTVD5cHVVBkSRlzYxGiZbW2ocbdFAJb0UXcXVvfCZI
 UIiLilvYL4wcib8MIg95VuO+63DagJLhE6ITTE2D9pSsGD/HJy7EDc2ihloj7Xb836wu
 78BAZ2LKmhzxnSMH7X9mOk7u3NYORo+2xIElc13Peuh1lhg3EBOYtznZYw7XM93D2ISA
 Hl68iptF5gITMEgZHvmRVY1lvftJiMb+yGg7sZcJqzvZ9eM2cwejWP+9xva0eHSdq/1O
 cZ8R9C27VuKWuegfVjbZTQuQI+HG6vY4WAJHVdBqsfaopxj88K4d3C5ZoN0LL85FEcHJ
 hbGw==
X-Gm-Message-State: AOAM531N8KScm7ymfzpDDfHP+apbj8DN4CkGWVU0Fiv7dX4PMJYJtXjS
 lYDEahjgVW/qRRdtHMgnxCfQ3V66ZhiaSCg38AE=
X-Google-Smtp-Source: ABdhPJxSeB6hs1ctvYUIJ7xGlVT1WtAA+JR8PQpEetI58AEGAO+rheVT+FUuxVer4n760ndRNG2iT994uuoC6vo/zmE=
X-Received: by 2002:a05:6870:14c1:b0:e6:5ba1:6194 with SMTP id
 l1-20020a05687014c100b000e65ba16194mr2185093oab.242.1654939881328; Sat, 11
 Jun 2022 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <9608d355-8582-69e0-50ee-de48e0ef561f@ilande.co.uk>
 <aee30abd-bfad-d023-ae38-ad1600b02016@amsat.org>
 <82f46299-34cb-463e-5177-a5c350242421@ilande.co.uk>
In-Reply-To: <82f46299-34cb-463e-5177-a5c350242421@ilande.co.uk>
Date: Sat, 11 Jun 2022 11:31:10 +0200
Message-ID: <CAAdtpL6J1my5pMUKYUO=3WPA_piqo1oY9b8DxcgYcxpNMjBn1Q@mail.gmail.com>
Subject: Re: [PATCH 00/50] PS2 device QOMification - part 1
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.160.42;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oa1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Fri, Jun 10, 2022 at 5:43 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 10/06/2022 16:35, Philippe Mathieu-Daud=C3=A9 wrote:
>
> > On 7/6/22 17:54, Mark Cave-Ayland wrote:
> >> On 22/05/2022 19:17, Mark Cave-Ayland wrote:
> >>
> >>> This series came about when looking at improving the LASI PS2 device =
for
> >>> the HPPA machine: there were improvements that I was keen to make, bu=
t
> >>> was restricted because the PS2 device(s) weren't QOMified.
> >>>
> >>> Trying to do everything in a single patchset would be a very large se=
ries
> >>> indeed, so here is part 1 of the series which does the basic QOMifica=
tion
> >>> process and consists of:
> >>>
> >>> - QOMifying the basic PS2, PS2 keyboard and PS2 mouse types
> >>>
> >>> - Moving any functionality that exists in a global device init functi=
on
> >>>    directly into the relevant device, so that all device behaviour is
> >>>    configured using qdev properties and QOM
> >>>
> >>> - Introducing a new I8042_MMIO type for use by the MIPS magnum machin=
e
> >>>
> >>> - Switch all PS2 devices to use qdev gpios for IRQs instead of using =
the
> >>>    update_irq() callback function along with the update_arg opaque
> >>>
> >>> Once this work has been done, a follow-up part 2 series will finish t=
he
> >>> remainder of the work which involves i) improving the QOM object mode=
l
> >>> now QOMification is complete and ii) removing the legacy global devic=
e
> >>> init functions for PS2 and related devices.
> >>>
> >>> Testing for this series has comprised of booting a machine with each =
type
> >>> of PS2 device and confirming that i) the machine responds to keypress=
es
> >>> when using a graphical console and ii) completing a successful migrat=
ion
> >>> from a machine with this series applies back to a machine running lat=
est
> >>> git master. The test machines I used were:
> >>>
> >>> - qemu-system-x86_64 -M pc for the I8042 device
> >>> - qemu-system-hppa for the LASIPS2 device
> >>> - qemu-system-arm -M versatilepb for the PL050 device
> >>> - qemu-system-mips64el -M magnum for the I8042_MMIO device
> >>>
> >>> Finally the QOM tree changes caused by QOMification of the PS2 device=
s
> >>> trigger a failure due to a bug in the bios-tables-test qtest for subt=
est
> >>> /x86_64/acpi/q35/viot. This can be fixed by applying the series at
> >>> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04266.html
> >>> "hw/acpi/viot: generate stable VIOT ACPI tables" first.
> >>>
> >>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>>
> >>>
> >>> Mark Cave-Ayland (50):
> >>>    ps2: checkpatch fixes
> >>>    ps2: QOMify PS2State
> >>>    ps2: QOMify PS2KbdState
> >>>    ps2: QOMify PS2MouseState
> >>>    ps2: move QOM type definitions from ps2.c to ps2.h
> >>>    ps2: improve function prototypes in ps2.c and ps2.h
> >>>    ps2: introduce PS2DeviceClass
> >>>    ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
> >>>      ps2_common_reset()
> >>>    ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
> >>>    ps2: implement ps2_kbd_realize() and use it to register
> >>>      ps2_keyboard_handler
> >>>    ps2: implement ps2_mouse_realize() and use it to register
> >>>      ps2_mouse_handler
> >>>    ps2: don't use vmstate_register() in ps2_kbd_init()
> >>>    ps2: don't use vmstate_register() in ps2_mouse_init()
> >>>    pl050: checkpatch fixes
> >>>    pl050: split pl050_update_irq() into separate pl050_set_irq() and
> >>>      pl050_update_irq() functions
> >>>    lasips2: spacing fixes
> >>>    lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
> >>>    pckbd: checkpatch fixes
> >>>    pckbd: move KBDState from pckbd.c to i8042.h
> >>>    pckbd: move ISAKBDState from pckbd.c to i8042.h
> >
> >> Ping? I've had an R-B from Phil for patches 1-20 along with a Tested-b=
y from Helge
> >> for the entire series, but that still leaves the last 30 patches unrev=
iewed...
> >
> > I'm queuing patches 1-20 (fixing the typo in patch 9) via mips-next,
> > and will review v2.
>
> Hi Phil,
>
> I've also got a local fix that needs to be squashed into one of these ear=
ly patches,
> so could you drop this series for now? As well as this extra fix (thanks =
Asan!) it
> will make it easier to rebase and update the series according to Peter's =
review comments.

Sure, patches removed from mips-next queue.

> ATB,
>
> Mark.

