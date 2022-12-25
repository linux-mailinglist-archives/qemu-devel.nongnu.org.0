Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF979655EC1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 00:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9aEz-0003yJ-EP; Sun, 25 Dec 2022 18:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p9aEh-0003wM-Pk
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 18:16:56 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p9aEg-0008CQ-0F
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 18:16:55 -0500
Received: by mail-ej1-x631.google.com with SMTP id x22so23261401ejs.11
 for <qemu-devel@nongnu.org>; Sun, 25 Dec 2022 15:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SInUcKJLN8cROBM1zrTCvIqV1EKb5PI1zmCJ7piWEow=;
 b=Y/c5e86LtUQMyXgrNtx9SOszMTQBHTK8bKtozyRaS20Hz7ovatPwchOkChU9iZgakE
 nBldO1AQes8+aXisRWH9G3dHGIqQx1QB+vzQeqBRxNzpuZBdduRXH1FS+RnIu/WvVqUT
 EdPJTRh6gGZuvE6y/fRlAkUGh9QCNyibnwMZwM3tgifgtxXAHd9kxA3HRqOtZ/EzAEdT
 aSiu+vt/8gw6pIkujqPNLziAWERKv5rWuDUSIACT8EOqRTGDGFCzQFgLIAaM7oNQEWmx
 fDjBKQkXWaZlW7DuB5NWjx0O0puIEoBnqfTkyHkAFsQ0zGYMzruFttrsVp6qH745YVcP
 K14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SInUcKJLN8cROBM1zrTCvIqV1EKb5PI1zmCJ7piWEow=;
 b=04/jLkiMepAaEuHMUYlpNXtRqkaxQQtpdh0CxidEVUXu9R6o1H+019PqpvKUS7bVz1
 WU89nPoIkT4dNFWA1NM+ZlcfrVECBcw7OYFzZkKMRrzuZ/jGOTbqQxkRBlVIZvdtyqs7
 tMeqJaMNjmJU7QLopOfaZUodrQ9Jg4utRixnTXnhSDcPkI7UMUtOEdJ4K9DGa/4pAEl5
 AxpNcEnPXZqrc6SIoh2tw7dgqDCa9yDArHqenvPF+z8d/z/+vFAP/QwusMyn8WwXi8pT
 5fHgmMY5Gmumn5eVhIDe3lZuFuJCb4HP7BgHnobrDScR2h278VyuFLJ6ArSjX3dV1F9e
 hbHw==
X-Gm-Message-State: AFqh2kqPXktw6jk5YY0h9VrGyHkDs4Mu/QDC+e2zLpQfPRIfK5trXOmR
 xk6dM/JRDfAuzZ63RzjZJil912GevK4=
X-Google-Smtp-Source: AMrXdXuEBLrIjimiW2hn7ZnDT/nUWaoFnTMJWOlsNeEN8OyzKMbp4CSALJbSbn++BhiEKkeymADnUQ==
X-Received: by 2002:a17:906:3707:b0:828:76a3:e6bf with SMTP id
 d7-20020a170906370700b0082876a3e6bfmr16516133ejc.50.1672010211157; 
 Sun, 25 Dec 2022 15:16:51 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20074fe6f92c82370a4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:74fe:6f92:c823:70a4])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090638c400b007c16f120aacsm4091450ejd.121.2022.12.25.15.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Dec 2022 15:16:50 -0800 (PST)
Date: Sun, 25 Dec 2022 23:16:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>
CC: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] hw/audio/c97: fix abort in audio_calloc()
In-Reply-To: <20221225121357.498040-1-cyruscyliu@gmail.com>
References: <20221225121357.498040-1-cyruscyliu@gmail.com>
Message-ID: <6302EB41-FC6A-49FE-AAFC-881FEC3857FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

There is an 'a' missing in the topic: It should be ac97, not c97=2E

Best regards,
Bernhard

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
>+            }
>         } else {
>             dolog("Attempt to set front DAC rate to %d, but VRA is not s=
et\n",
>                   val);

