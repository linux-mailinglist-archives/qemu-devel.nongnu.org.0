Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D9133A781
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:26:10 +0100 (CET)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVRJ-0007rG-05
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLV9R-0000TD-3x
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 14:07:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLV9L-0005XL-92
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 14:07:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so18922975wml.2
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6sDUoXs/iHNS+u/iPBF0bezIKcDxnIZC33YO5GLjtbk=;
 b=AM55LGMm2A1gE9X48QWQEICpqlHKP8KpxvJwTWyNYMgxOOaWpmLJbPo5UoPqh8SILB
 xpAgcpEFWHcWuoK3aKx5ji//r+2vfpqBeIFmQhSNclXvQMS/b4KTaMngl+sh0WymG5FM
 8/q0RhTOp39X74lzMkiSxBC/JDIAFmeD8jUkRjRWGVMPBJwUySSmma/3sIdF5jPjedAn
 CZalQvxfE2J2c85RoyadkRp7+mxAq4i18y5TC50BaRP5vuiYG8uMF8RVf5BZYIisRM8X
 nVQWHFoBsp6e9+jcQRufYg8r5M5u6yX/+3aLuWg14C7Y+8rqXZZlqVcNGdTDtYuVAr/L
 4Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6sDUoXs/iHNS+u/iPBF0bezIKcDxnIZC33YO5GLjtbk=;
 b=dfNP4H2PrtKo1avzey91+V673+dTiDXVr0vkOW4CN8gUmXKYwgzHgqnel5j82fazPg
 N1Wyu3wTiCa5dBw5DC4PEbxcbQrc9JHRFSyfATB9Nf+/V/oktRFo6wWKclmeA+h6Daqx
 ZPrHPpyU3Tu1TS5FOiuFZ+YlBMbNNadI6SBODE6m26G6OupIE63vP6+Y+FkyJx7HDbml
 1kLDUmEGv5y4IOIIbhuzqFREZfkXEYW8EJPA9maB5AQQhtUjmYEkk5xrTfEhdD5KbEE9
 DzWzS+7quFUV+/3EMrRxXbrfKUIeXkm2cHRZ+D+vlCLCul0t5ije9obWF7TNhN5uieHV
 rVgA==
X-Gm-Message-State: AOAM530lCQIBrIgiCFSC/czUbEkEaB6zdKijaf/q9wjyRIMYTm3s1UbN
 TC3BnZiztGWhLe0A2dHr46XoO7kebCE/JcYsFoQ=
X-Google-Smtp-Source: ABdhPJwiP9+omjB/FNVaVoD0hnTQqDFW0wAKWzSNlt1u27gboyiVNYJ9aaZacnX2Z3woGosPcL9Iu1fb8XlLkkw/4g0=
X-Received: by 2002:a05:600c:22cd:: with SMTP id
 13mr22149015wmg.90.1615745251813; 
 Sun, 14 Mar 2021 11:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210314070147.34731-1-akihiko.odaki@gmail.com>
 <924e0f6-1981-8c7f-4568-a03c2b17d02c@eik.bme.hu>
In-Reply-To: <924e0f6-1981-8c7f-4568-a03c2b17d02c@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 15 Mar 2021 03:07:21 +0900
Message-ID: <CAMVc7JWUkDNtg23Z1H4TKfKzTixRB7=2wRtRfBocYSQ3gXY+WA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not raise keys before QEMU resigns active
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8814=E6=97=A5(=E6=97=A5) 21:55 BALATON Zoltan <balaton=
@eik.bme.hu>:
>
> On Sun, 14 Mar 2021, Akihiko Odaki wrote:
> > ui/cocoa used to raise all keys before it resigns active to prevent a
> > stuck key problem caused by key up events it does not see while it is
> > inactive. The problem is solved by checking -[NSEvent modifierFlags] in
> > commit 6d73bb643aa725348aabe6a885ac5fb0b7f70252, which is better
> > because it handles the case that key *down* events are missed while it
> > is inactive.
>
> Does that commit also handle other keys than modifier keys? It's unlikely
> those get stuck but is that possible? The most likely case to happen is
> pressing Cmd+Tab to switch away and Cmd may get stuck. Can Tab get also
> stuck? Or what if you hold down space or some other key while switching
> away either with Cmd+Tab or with the mouse? That may not be a common case
> but is this here to handle that or they are already handled elsewhere so
> this is really not necessary to prevent stuck keys?

I experimented with Cmd+Tab and ui/cocoa did not respond to it at all.
Apparently events for the particular key combination is not delivered
to the application.

If you switch away while holding space or some other key, the key
remains pressed on the guest, but the guest will receive a key up
event as soon as the key are released. If an event with
NSEventTypeKeyUp is fired, a corresponding event with
NSEventTypeKeyDown will be fired eventually whether the application
remains active or not. Events with NSEventTypeFlagsChanged do not have
such assurance and the modifier state tracking requires some tricks
like the new -[NSEvent modifierFlags] checks or the obsolete solution
deleted with this patch.

Actually -[QemuCocoaView raiseAllKeys] before introducing the new
-[NSEvent modifierFlags] checks only dealt with modifiers (event
though its name suggests it raises all keys) so there should be no
regression.

Regards,
Akihiko Odaki

>
> Regards,
> BALATON Zoltan
>
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> > ui/cocoa.m | 20 --------------------
> > 1 file changed, 20 deletions(-)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index a7848ae0a30..ac8989947f5 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -326,7 +326,6 @@ - (BOOL) isAbsoluteEnabled;
> > - (float) cdx;
> > - (float) cdy;
> > - (QEMUScreen) gscreen;
> > -- (void) raiseAllKeys;
> > @end
> >
> > QemuCocoaView *cocoaView;
> > @@ -996,18 +995,6 @@ - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabl=
ed;}
> > - (float) cdx {return cdx;}
> > - (float) cdy {return cdy;}
> > - (QEMUScreen) gscreen {return screen;}
> > -
> > -/*
> > - * Makes the target think all down keys are being released.
> > - * This prevents a stuck key problem, since we will not see
> > - * key up events for those keys after we have lost focus.
> > - */
> > -- (void) raiseAllKeys
> > -{
> > -    with_iothread_lock(^{
> > -        qkbd_state_lift_all_keys(kbd);
> > -    });
> > -}
> > @end
> >
> >
> > @@ -1143,13 +1130,6 @@ - (BOOL)windowShouldClose:(id)sender
> >     return NO;
> > }
> >
> > -/* Called when QEMU goes into the background */
> > -- (void) applicationWillResignActive: (NSNotification *)aNotification
> > -{
> > -    COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n=
");
> > -    [cocoaView raiseAllKeys];
> > -}
> > -
> > /* We abstract the method called by the Enter Fullscreen menu item
> >  * because Mac OS 10.7 and higher disables it. This is because of the
> >  * menu item's old selector's name toggleFullScreen:
> >

