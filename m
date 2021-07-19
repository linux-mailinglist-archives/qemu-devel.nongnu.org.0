Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4443CEB0E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:39:19 +0200 (CEST)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YAg-0000jS-4D
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Y9Y-0008SH-2u
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:38:08 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Y9W-0000uv-At
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:38:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb6so30337777ejc.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NbgU7d9aBaiSHyUbs9PeD3kCNlxuWVtscduPN+SDk9g=;
 b=H/y3UNA5sK5igpPpKbHTVC+XDKMVqK0F1I5h9bvxDg+MBYM36LNhVKMy9qd9/hKOSZ
 CQ7ziwzi2zWQ3GZiaw7UFTQ7/PMPycpo5OCyiSDxHvp3iVYrjUVWOHXMEtk9VedN41zD
 zonCedGLvDc3Ri0RG4NwlJcusU6vRFXTaDe1d499ckvLWz44mo5GqQsiwcvjDK8WKuC/
 FQ6dp2ltDPHD8ukE6Qfh2LsqfI3SYsUsym3uOy9VVIqtORnydrwJ0eaqjvouvRxpOITY
 psvz5oMJ+J3R6C6ifu/JDxjwCxxMaALJhdTP0d1zE3/lJafbZAUDO89MmxDyelAAiMe/
 IFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NbgU7d9aBaiSHyUbs9PeD3kCNlxuWVtscduPN+SDk9g=;
 b=GcBfs0Ra0MAXJhsGtUpfLyIZXOIRcfbFBcbSrDhE95ZGVTDAis9v7CxMiCE2zp0vy5
 N/l/kMEVd3eaNFntqd5KppxsvkDZhLeui9Uwye5SczKOJX/hieW1pmeFnJ68ccEkcTyb
 DLAaWDnsS6qqALD0usRHSzOOXx7s+GPAjj6x8B7SkTwxaom7hQ5UufjbFY/ZhWq5X2Cv
 cTmxthNB+zHaaOkXmAyOglEJbbo2cT3VIEBS0aa+AGahfM94s/UbC8a0teIliR3bEp1i
 Su6MoAi8oHLIbFXtzZLGiddBIPr8GOwp88pF7DXtQNnKsar7JxZ4xA41IkMWiiBKkc7i
 iZkw==
X-Gm-Message-State: AOAM531vv0A9HNYtu+fQUaH7frf/zGJUSIWaw2mWpaAOAu80EbtLNd3O
 9x3k/4u1IIjklEMDHTiDsN2crY2BYw2xdNxtZbQFNA==
X-Google-Smtp-Source: ABdhPJyFlihRBw6c7KfBhY4NB2oxj52lZG/NrMu4sc4NXUm2hG521vJ3CMCUNLbt2kQmh1BvIxZzaAa1+FFrZR37N+M=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr28815857ejb.482.1626719884020; 
 Mon, 19 Jul 2021 11:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
 <e4f3d659-aa3d-68ab-4762-ac3239c9c2ab@t-online.de>
In-Reply-To: <e4f3d659-aa3d-68ab-4762-ac3239c9c2ab@t-online.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 19:37:23 +0100
Message-ID: <CAFEAcA_MKOtquC2rRKtVJEn-Etrrjg9KEL4VaH+_2Ehz2-uPjA@mail.gmail.com>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zack Marvel <zpmarvel@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 19:22, Volker R=C3=BCmelin <vr_qemu@t-online.de> wro=
te:
>
> Am 18.07.21 um 15:00 schrieb Peter Maydell:
>
> > On Sun, 18 Jul 2021 at 08:50, Volker R=C3=BCmelin <vr_qemu@t-online.de>=
 wrote:
> >> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> >> characeters") it's very easy to lock up QEMU with the gtk ui.
> >> If you configure a guest with a serial device and the guest
> >> doesn't listen on this device, QEMU will lock up after
> >> entering two characters in the serial console.
> >>
> >> To fix this problem copy the function kbd_send_chars() and
> >> related code from ui/console.c to ui/gtk.c. kbd_send_chars()
> >> doesn't lock up because it uses a timer instead of a busy loop
> >> for the write retries.
> >>
> >> Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
> >> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> >> ---
> >>   include/ui/gtk.h |  5 +++++
> >>   ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++------=
--
> >>   2 files changed, 50 insertions(+), 8 deletions(-)
> > This feels like maybe it's the kind of thing that should be handled
> > more generically rather than in one particular UI frontend ?

> All other UI frontends (except Spice) use the correct code in
> kbd_send_chars(). I think only the GTK UI code is wrong.

Why isn't GTK able to do things the same way all the other UI
frontends do, then ?

-- PMM

