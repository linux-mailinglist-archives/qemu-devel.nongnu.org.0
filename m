Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743730CDC1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:11:39 +0100 (CET)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72xW-00082b-9r
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l72mf-0003As-Ld
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:00:29 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l72mb-0007ek-L6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:00:25 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so32094408ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9kYyNg6AZWN1CkQ6MdxSGgIVOJM09nhIH40Chyq9Mw8=;
 b=Rc+mW8h3iCzfbvdLsqvhyfF91Ephffwb4qt2ytjLMbTeQXDuZ5+TZkpJNyIIPOusGI
 SOnyjPLlfdOhmoxF3in/8n5YSkdpEuf7kToO3eZ5VL5gt0C+dxsbMeYYSrSTWOI07xMu
 PcQ55bD20jVRITRCqKLzhr0J1AC2H/Mr8ZPZNLgS+5IjNyLhqimL2vm0tc96ll2AIo/d
 oKWhexBM+zdg1nXDsp15nx0Qp1bRAonrxi+q9v5tTRA2uLuCts2N90tMNq32m222+pad
 TBsC1Apzam5s6UQK1kKF+844s0CDtN6WtPCrjIpe9dPpdJSNOjpFpck2yPdJfUK80OQk
 /yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9kYyNg6AZWN1CkQ6MdxSGgIVOJM09nhIH40Chyq9Mw8=;
 b=OlTuCIFpILI2yorZdk0QewsbkC1NlOGSOE+EvWgxqtRXqunQA794X5QHsyByRlXRTe
 zzslhnik3CbsfY7OWoqDsw2i27fBzoIcNIq5fMo9irXdhSqXJ2BG0v9DAI9HTdZ5WuRZ
 AwFpwi8nwyv+O3QHL604jwwi3KGFOFaJpUE/VovZ+W6pVKM+tzlytxYMZ3ZaMIDOm31+
 r/cWGJ+yLyXOJmVpAqJHWvukPJqtBUA+crSoy1XbxyrVixjTG2r8LpLC3hCa+1Au8BXq
 2PIYYdF5SweQFCET45uxJ/ohfVpyS6V0+RevQbZ/+6E2BKudAIXfqgzN5ED3yo2tqALk
 vHAA==
X-Gm-Message-State: AOAM530+8OjU+4vqqZ2cKaStBjKsV2u9ePdQrfxM6G43hnzjye0Fl+yG
 pmItS0kpamN00NbuPJ6xU0DKZ88uSufZ8QIazrQ=
X-Google-Smtp-Source: ABdhPJzCkRNYXvyXE1IiaNsgRQhenFsG/rpQerbZgt+pSEiELTYh3ANA4kiutbkXxtyHG4IVCIVxiE5uOfm7/CAkrbo=
X-Received: by 2002:a17:906:e092:: with SMTP id
 gh18mr3686229ejb.389.1612299618709; 
 Tue, 02 Feb 2021 13:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
 <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
 <20210202123829.GF4168502@redhat.com>
 <20210202133534.u364ubxxvr5xyieb@sirius.home.kraxel.org>
 <20210202163656.hpg4nbfvqbqnjsdm@sirius.home.kraxel.org>
In-Reply-To: <20210202163656.hpg4nbfvqbqnjsdm@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Feb 2021 01:00:06 +0400
Message-ID: <CAJ+F1CK_AmHD75oYNABBzMs1rkHD7zvj42TOKwnKf=NtvfpEsA@mail.gmail.com>
Subject: Re: vnc clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Christophe de Dinechin <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Feb 2, 2021 at 9:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Feb 02, 2021 at 02:35:34PM +0100, Gerd Hoffmann wrote:
> >   Hi,
> >
> > > The VNC protocol is way too crude. It is limited to transferring
> > > plain text, and provides no way to specify or negotiate a character
> > > set. The RFB spec says apps should use latin-1. In reality few, if an=
y,
> > > impls do charset conversion so most Linux impls will be sending UTF8
> > > while Windows impls will be sending Windows Codepage 1252. It clearly
> > > shows its heritage of being designed in the 1990s.
> >
> > Well, there is an extension which supports more than just text.  But it
> > is a small number of formats which clearly has window-ish background,
> > for example rich text format (windows wordpad) for formated text and di=
b
> > (aka windows device independant bitmap) for images.
>
> Well, spice isn't that much better.  Has a short, fixed list too:
>
> VD_AGENT_CLIPBOARD_UTF8_TEXT
> VD_AGENT_CLIPBOARD_IMAGE_PNG (mandatory if images supported)
> VD_AGENT_CLIPBOARD_IMAGE_{BMP,TIFF,JPEG} (optional)
>
> There also is ...
>
> VD_AGENT_CLIPBOARD_FILE_LIST
>
> ... but that works hand-in-hand with the spice webdav server.
>

There has been some attempts to support generic mime types in Spice clipboa=
rd:
https://lists.freedesktop.org/archives/spice-devel/2018-May/043782.html

(If I am not mistaken, I think it was inspired on some earlier attempt
I worked on I lost trace)

In any case, it seems there is just not enough interest for other
things beside the existing Spice clipboard types. Interoperability
between OSes quickly becomes problematic for more advanced types, I am
afraid. (and various OS-specific clipboard & dnd details may raise)

--=20
Marc-Andr=C3=A9 Lureau

