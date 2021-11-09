Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862B44B323
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 20:22:11 +0100 (CET)
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkWh6-00070b-4N
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 14:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWfY-0005yh-QI
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 14:20:32 -0500
Received: from [2a00:1450:4864:20::32e] (port=42563
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWfX-0006B3-8e
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 14:20:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so240687wmd.1
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 11:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q0E/cZ2QnjSuOBZWZiBKdhyCdeqaoA6GIRkljIyjT/U=;
 b=xz+wHtFPUP8qJuAr5YU4VTstrz3NBMwDBShAVHQHSGB4kwKTRLIpmTgjmURQueIBmo
 CAhhkqUS3H4QOVP0r3sJyLZGUu+s3wLFV2ltQBma1eml7E51lqRDfkcfuKMOTEzHl8cl
 LmQicPFBeITufbu39Y/XWB9gxObkjed4ZOLqK1AgERtAemADJv0IY93+E4rdmi/HeiOb
 GZCQiWclMD77gVSzMI2JFplaELS5qQ5src5Kw+2naRl3FKFie+FLrCT5dmBL5GGSYouR
 sK9xl90zabr8ltiDyp1s/QOMekHEHm7xZE2lJhVj5y8AbrUYa2KIvjE3qXJxRBybYiOK
 mjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q0E/cZ2QnjSuOBZWZiBKdhyCdeqaoA6GIRkljIyjT/U=;
 b=TMJGdFn5KY8D9KtPDc255eksqWWnmzbtsGFHscWL4zBKsd4bQOnpn5CNaqxnXAo1Rz
 mgP6QYuM1hLCQoo6mF0dW1sFQEVN+c8mt84yVzTqUNmfKw1SICsB4pf7RleTGMfQV+n7
 pAUhh4Z/I/0O5QmuPz5Voq5jJY5B9+PBPVPOISPNBh5OUGTn9xmEDDsXae7Hvk/D+kTk
 MtBcgjOaNK7Jus/ow6cDx/ffB/OJSn1xXHEa7FGLeecfaMzbKOdNcAxHiyS/m7Ee3VMR
 aw46Oyd6Mkvwnn4wsdZg1gRy8aAHLNwBSClBHGIISh/nZhkauWGa8eKTUUMXXT3LjjLS
 KGPw==
X-Gm-Message-State: AOAM530h4lftvOLab924duWjnC+lPSU/oWCoxDu/6d8Zf+0cipjkHfCY
 w/BUtsFd3UKRO6SrNogekx6A1UdMPmVxWK4l41wOuQ==
X-Google-Smtp-Source: ABdhPJya43OrNbXHZAKtvVAbpnC3ZxrE/Pz122TTlBBJf6WtFpAt0w651J0Ok/pISLFUtm5gj2qvd2t/BXw5nbKUGY0=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr9731960wme.32.1636485629175; 
 Tue, 09 Nov 2021 11:20:29 -0800 (PST)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
 <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
 <CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com>
 <d1175f18-ba8a-3022-916f-395e0937b92e@tribudubois.net>
In-Reply-To: <d1175f18-ba8a-3022-916f-395e0937b92e@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 19:20:18 +0000
Message-ID: <CAFEAcA8BYNq4hBxx2stR9XoocLWwGcacxNSGcjWibHyXGKP5OQ@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 at 19:06, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
> So basically the Qemu i.MX7 processor code needs to set psci-conduit to S=
MC
> because we want to be able to boot the Linux kernel directly (without u-b=
oot)
> with Qemu emulating the PSCI services when an SMC instruction is triggere=
d.
>
> As I see it we also need a way to disable this Qemu PSCI emulation in cas=
e we
> want to boot an EL3 software (u-boot, optee or other).

Yes; we definitely want to support both of these use cases.

> We could certainly pass a command line option to explicitly tell Qemu to =
disable
> the PCSI emulation. But this would be a bit cumbersome as the board level
> code would then need to call to the SOC code to disable the psci setting =
on all cores.

We definitely don't want a new command line option. We just want to
use the information we already have (whether we're going to start the
guest code in secure/at EL3 or not) to make this decision.

> So I am wondering if we could be more "clever" solution and have things s=
orted out automatically. I would like to suggest 2 solutions;
>
> The first solution could be based on the mode of the processor when it st=
arts executing the provided software. If I remember correctly what you expl=
ained, if an ELF file is provided then the processor boots in the highest l=
evel (EL3 for i.MX6/i.MX7) while if a non ELF file is provided (uImage ...)=
 then the processor boots in EL2 (or lower depending on the processor) to e=
mulate the uboot behavior.
>
> if the processor starts the software in EL3 then we need to disable the "=
psci-conduit" through SMC (if set) because the EL3 software should install/=
provide the necessary firmware.
> If the processor starts the software in EL2 then we need to disable the "=
psci-conduit" through HVC (if set) because the EL2 software should install/=
provide the necessary firmware.

This is the right approach. The idea I suggested in the previous email
was that rather than having the SoC object code setting psci-conduit
always, and then something else coming along later and changing it,
we should instead not set it in the first place. It's a simple QOM property
which means it's not writable after the CPU object has been realized, I thi=
nk,
so we'd have to jump through some hoops to get it to be writable later.
On the other hand looking in hw/arm/boot.c we don't decide whether this
is a Linux boot (which means it will be to non-secure) or a non-Linux
boot (which means it will be to EL3) until quite late, so that's awkward
too (plus there's potentially duplication between board/SoC code of
the logic to decide whether to set psci-conduit or not). Let me have
a think about the cleanest way to arrange this.

-- PMM

