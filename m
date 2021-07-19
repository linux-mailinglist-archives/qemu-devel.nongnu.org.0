Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A63CEB32
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:55:05 +0200 (CEST)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YPv-0008L3-Pl
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5YNp-0006dp-4Q
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:52:54 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5YNn-0002Q2-Gp
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:52:52 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gb6so30404692ejc.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P+urgK6kfhfll1hOkGgKsWqiOMFm7xPYBnnTwArx+6M=;
 b=hnmKokmwySbbzq0F568bKe5bVIJk2AyHyufnEQ3mAAEgbd4fElupx+5Eok9iJx1ghS
 YK5nOf3UDxZaLR8hgEzKNs6yKis+69mYHjZtaWbIzMzBTQbsydwq3gW00sleeA01ljws
 QD68RFMvxpGqFFr5hlIzqibwf/pSOyW3hICK5aBpofB9xMiGtuilrxG8CEwl0N6T2wvc
 0p6L1MXHgUVQ49yRzPgQ/2E88l1A2KeZmtH0bzCZ1EV7CfyWcMjb9iqqZiyNePpfsIML
 NssR/DY5Ct779dnE5dqGVNlv/fzTxOS5SZaZ4T337h8+Ym7a8xJuBqIIF7PDIvIged1J
 0n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P+urgK6kfhfll1hOkGgKsWqiOMFm7xPYBnnTwArx+6M=;
 b=Dj2p4EepqVOeIYHJdMdmb9WeovaZdlzULY2NNXxO6MDr4TU8MJuTKRfkPTLFvRcuCj
 wRm/THCbU6kddIznbDptfp4tnFav6D6nzMme2Bftp3feTis8RkAAwofWVKdzjJVLsrWH
 8wEDe3wu8iFRf7Gl521gJS6GedKxlGMYcuP+zp9ikRXxXYpb4I9YGP9q9gwc8pLRme0y
 6/+TYkAAMB8RcLGDugpvP4ma2xiM3kWDDgvNHeWc5OD8asuQgHUQ5DXeh3onC7ZMSnpe
 tYiUCy343BCuW29EGvEPt/OhaKYV84mHkETUR77nP11whbhRCU5XoAGrwIfmG5NaFuST
 wxoQ==
X-Gm-Message-State: AOAM532QzcXkgp2mZ9xYOKKrjCpnvzdiKYQtaAnAuGjbu678nwyVHPMJ
 E6vRkk5lw2d7Uwz9qNdCvU4CKM6mhXvzri7D9ql6wg==
X-Google-Smtp-Source: ABdhPJynpute9jGD7Fs/dD6mhd80110FY+Q80wh+ZaIMGpCe4wS6fBrUBKfgoyzvvqiV6h62hvtuu17W3M4xe3N6hKU=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr28867546ejb.482.1626720769953; 
 Mon, 19 Jul 2021 11:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
 <e4f3d659-aa3d-68ab-4762-ac3239c9c2ab@t-online.de>
 <CAFEAcA_MKOtquC2rRKtVJEn-Etrrjg9KEL4VaH+_2Ehz2-uPjA@mail.gmail.com>
 <YPXHOLJ9Qzvk000W@redhat.com>
In-Reply-To: <YPXHOLJ9Qzvk000W@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 19:52:09 +0100
Message-ID: <CAFEAcA_BSEq-Jr9Hmm7nwzFDabDVc2v0gwGf+yawbgbDuMS9Gg@mail.gmail.com>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Zack Marvel <zpmarvel@gmail.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 19:41, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Jul 19, 2021 at 07:37:23PM +0100, Peter Maydell wrote:
> > On Mon, 19 Jul 2021 at 19:22, Volker R=C3=BCmelin <vr_qemu@t-online.de>=
 wrote:
> > >
> > > Am 18.07.21 um 15:00 schrieb Peter Maydell:
> > >
> > > > On Sun, 18 Jul 2021 at 08:50, Volker R=C3=BCmelin <vr_qemu@t-online=
.de> wrote:
> > > >> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> > > >> characeters") it's very easy to lock up QEMU with the gtk ui.
> > > >> If you configure a guest with a serial device and the guest
> > > >> doesn't listen on this device, QEMU will lock up after
> > > >> entering two characters in the serial console.
> > > >>
> > > >> To fix this problem copy the function kbd_send_chars() and
> > > >> related code from ui/console.c to ui/gtk.c. kbd_send_chars()
> > > >> doesn't lock up because it uses a timer instead of a busy loop
> > > >> for the write retries.
> > > >>
> > > >> Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters"=
)
> > > >> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> > > >> ---
> > > >>   include/ui/gtk.h |  5 +++++
> > > >>   ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--=
------
> > > >>   2 files changed, 50 insertions(+), 8 deletions(-)
> > > > This feels like maybe it's the kind of thing that should be handled
> > > > more generically rather than in one particular UI frontend ?
> >
> > > All other UI frontends (except Spice) use the correct code in
> > > kbd_send_chars(). I think only the GTK UI code is wrong.
> >
> > Why isn't GTK able to do things the same way all the other UI
> > frontends do, then ?
>
> In the other frontends the text consoles are not directly exposed, you
> just switch into them using QEMU's console switching shortcuts.
>
> In the GTK frontend, each text console is exposed directly as a notebook
> tab in the UI, so you don't need to use QEMU's console switching.
>
> IOW, the GTK frontend is more feature rich than the other frontends and
> causes it to hit this mistake.

Then we should probably have generic code to support "the frontend
implements multiple tabs or whatever itself", so that the 2nd frontend
that decides it wants to add this feature doesn't have to implement
the same code again... (Not something we need to do for 6.1, to be
clear. I just tend to feel we don't do enough UI stuff in common
code and have weird disparities in featureset etc between our
various UI frontends.)

-- PMM

