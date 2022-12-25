Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EE655D6D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 15:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9SSV-00054b-6d; Sun, 25 Dec 2022 09:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p9SSS-000543-4d
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 09:58:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p9SSQ-00016j-FL
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 09:58:35 -0500
Received: by mail-ej1-x633.google.com with SMTP id u19so21878307ejm.8
 for <qemu-devel@nongnu.org>; Sun, 25 Dec 2022 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3yW8H2imV4Jl/2LBRScJEFUeuwCJcdVkBRXAbX8mE0=;
 b=X+PLktEBPmYa29LC0iKL/b3s3+6uRxB9XByGH2yukjIG9NLUxh1LnXzEQtGO4id91c
 j57cMrvqQXxtUcQD2+XjvLTLh3WoWrLNemCM0SaqvuY1Q/bDzjIyK+yDBpkU8t7fFfD6
 2X34GwF9dZd1YPIcKKWqt3w+3Hm7o3SToRP7U8mP4ctwAlu5SgqIVNKJJSPfOMXWF2Tu
 /knczEhjpMoXH2LhgqQGqRLvbv4jwHaDHXcfyLKPsnfGEcnMeE7Fh0AtfTVNoLuPxsQE
 Yo/9veQlfgDtAcRw7PtazfRRjAjuK7S8aJhLzdTwrN2foXKFjJn/OytAix88vutWbcwn
 oMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3yW8H2imV4Jl/2LBRScJEFUeuwCJcdVkBRXAbX8mE0=;
 b=I1bPZAKoFAMPwBVgyyNnfHn4e/oXAsmz9UCxNuOyaphQk9+TCD/WvahK8L4AefxMio
 I7lSmLu0Mc5GSHbf7+LRdUHFypfDPRsnRrNfSUg0qyVqQVW0daQDQAmsb27qGFSjhK4b
 oAIYyEBBWV7Zk3FbfwOT7Q01G+MHMYLXLtoi4SnoofVSGFj1U36Wcvs/InJfuktW/Ugr
 6O0Cf91iIowBPkbZIRSS/DLQK81oswrODGUFb36odIaOWpGWKMrOJUdlklDBdsd8fG1u
 XL9llAoMytkzIiAbRkDCGjH76FOLEzwS7wEsErl6ahHMA6fX263y54fgfzMuHrFOLKSw
 uQPg==
X-Gm-Message-State: AFqh2kruuw703ayUXAJu7zW8AwDKi60SkAYDoxx+M/W+K5LlY6I7RVE6
 IddObcOKLsCuHqUzh4SFb09tSeavS6g=
X-Google-Smtp-Source: AMrXdXtPTXIm+rcXnjHXRHVXC4Wizl5S/X1/0scx1FwOALduXp8E2u3TTIetTil3W0zpOdGNFMq+HA==
X-Received: by 2002:a17:906:9c96:b0:7c1:1c5:c7cd with SMTP id
 fj22-20020a1709069c9600b007c101c5c7cdmr14390727ejc.5.1671980312089; 
 Sun, 25 Dec 2022 06:58:32 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b1286fdb95791fba.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b128:6fdb:9579:1fba])
 by smtp.gmail.com with ESMTPSA id
 hz8-20020a1709072ce800b007b839689adesm3746343ejc.166.2022.12.25.06.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Dec 2022 06:58:31 -0800 (PST)
Date: Sun, 25 Dec 2022 14:58:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
CC: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] hw/audio/c97: fix abort in audio_calloc()
In-Reply-To: <20221225121357.498040-1-cyruscyliu@gmail.com>
References: <20221225121357.498040-1-cyruscyliu@gmail.com>
Message-ID: <7E87B6CB-F309-41BC-B069-C443034B6A66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 25=2E Dezember 2022 12:13:57 UTC schrieb Qiang Liu <cyruscyliu@gmail=2E=
com>:
>Section 5=2E10=2E2 of the AC97 specification (https://hands=2Ecom/~lkcl/a=
c97_r23=2Epdf)
>shows the feasibility to support for rates other than 48kHZ=2E Specifical=
ly,
>AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ=2E
>
>Before Volker R=C3=BCmelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, an =
adversary
>could leverage this to crash QEMU=2E
>
>Fixes: e5c9a13e2670 ("PCI AC97 emulation by malc=2E")
>Reported-by: Volker R=C3=BCmelin <vr_qemu@t-online=2Ede>
>Reported-by: Qiang Liu <cyruscyliu@gmail=2Ecom>
>Resolves: https://gitlab=2Ecom/qemu-project/qemu/-/issues/1393
>Signed-off-by: Qiang Liu <cyruscyliu@gmail=2Ecom>
>---
> hw/audio/ac97=2Ec | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
>
>diff --git a/hw/audio/ac97=2Ec b/hw/audio/ac97=2Ec
>index be2dd701a4=2E=2E826411e462 100644
>--- a/hw/audio/ac97=2Ec
>+++ b/hw/audio/ac97=2Ec
>@@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t addr, =
uint32_t val)
>         break;
>     case AC97_PCM_Front_DAC_Rate:
>         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
>-            mixer_store(s, addr, val);
>-            dolog("Set front DAC rate to %d\n", val);
>-            open_voice(s, PO_INDEX, val);
>+            if (val >=3D 8000 && val <=3D 48000) {
>+                mixer_store(s, addr, val);
>+                dolog("Set front DAC rate to %d\n", val);
>+                open_voice(s, PO_INDEX, val);
>+            } else {
>+                dolog("Attempt to set front DAC rate to %d, but valid is=
"
>+                      "8-48kHZ\n", val);

We probably want to log a guest error here=2E Not only does this communica=
te clearly where the problem is (-> in guest code) but it is also incredibl=
y useful for development (think of reusing this code in other device models=
 such as vt82c686b if applicable)=2E

Best regards,
Bernhard

>+            }
>         } else {
>             dolog("Attempt to set front DAC rate to %d, but VRA is not s=
et\n",
>                   val);

