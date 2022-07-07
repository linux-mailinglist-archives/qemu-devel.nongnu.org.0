Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2569569718
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 03:00:21 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FsT-00020n-17
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 21:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9Fqu-0001M0-S3
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:58:44 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9Fqs-0008ND-5u
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:58:43 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AC8F2580583;
 Wed,  6 Jul 2022 20:58:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 06 Jul 2022 20:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657155521; x=1657159121; bh=xFRE99wcCb
 VtO2GkUSXd0f0PQrMCBpGsZ6U+BXgfHEQ=; b=tb4D8UUYPHXINO4Rp51a+E5Er4
 MiCvlpqgTAj9y04UsBUwdjzIluWIbCSMqk+k3cjlJtp0CC40lEqk92YpXwJmWGkg
 zdCVtmCyWj9LH9SOaluYNbC8Piak+cViPdrKAUWWBbGx/nDrkfounRfWvFZqf7a7
 nB5cKslDWYF1qIwJmvxKu3eM5OH2Cf/dUjFTYFLln3Tz9TE5+tQhxZvenWahIet0
 0/KiYXtVR3ACQtu/k9GBRaOx0l9SnmYVazmIXOOGHWwiV6ZTq+1VGWgK+LQVRTG5
 gRPGaGobTqa5F2Zlpoqfl1xZ/mEsVcbpRXVeK71TMbTnSOS7+vj65/2q4ZDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657155521; x=1657159121; bh=xFRE99wcCbVtO2GkUSXd0f0PQrMC
 BpGsZ6U+BXgfHEQ=; b=NognUiWjzGPRffNnczgGEZPSGB1ykjyr6q/lgOFGr4Ll
 qi+MgpgyWVoibagbDXfCmav+sm8YywNHycvH2eV7+BoIjY+64JMI9SM+vPGbaS9+
 AhFW/TiuZWYhQ75ujwaJGlZoqIfr+/QWVKthbxFTmG0mReljjBZoK+dD8P3QfC49
 BOhlLnAFa50uqWYNC0qBvZHyBgizr7ux/g1tajE9yAHOOTr64kJbCNqDxAZP8Jch
 9oD064mU+9LL6bYMH39h1OLS3Ea4YDCvUfoN6Hek8oDeIYyOxdXGWVaz2JfdC6ua
 tRKDkU157FtFFPQe7fAz94KyjM2dzmuFJjbFtlX5/w==
X-ME-Sender: <xms:wS_GYuK-aZG6g3of2la_hQpSw0adxFpT8V9trlsmYdE-HOd2KPe9rQ>
 <xme:wS_GYmJu0ydEpclfs9siape82v99etoQ2ad0D_zF13noZ9DEi7qH6G4GB1K1IvDao
 QFHibQbAxfm74rSLqA>
X-ME-Received: <xmr:wS_GYutj6p9RqyIytpe3pjYfAmjrS3CwMLyxOIJZIH92VGTKzzwrvxYwSrC3XzbvQZil7j1AVdQxbgBcsDtVdkN->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepkeffgeevuddtteevfeelgfefhfefffeugedvveduuddtteelveekkeeihfev
 uefhnecuffhomhgrihhnpehusghunhhtuhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:wS_GYjYZGdghlOe2l42QcHo1BWa5D9icbBv72GlUoG7M1qFCfzKVhg>
 <xmx:wS_GYlYEYt0EkMMo7bDk2BOx6it2lxsAJ1MrNzt72lZC7uMIYrwDlQ>
 <xmx:wS_GYvC4z2a-fBw6mXA6EFSKGxDGl_Ltno5fk9G4vVCAoU0UduTunA>
 <xmx:wS_GYpFM_PQnd8cjXqhYV8kHw9XI4buA8bpqeylD7WlcEMUgxjSQNg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 20:58:40 -0400 (EDT)
Date: Wed, 6 Jul 2022 17:58:38 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, f4bug@amsat.org,
 kraxel@redhat.com
Subject: Re: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Message-ID: <YsYvvnzmg8jU7zip@pdel-mbp.dhcp.thefacebook.com>
References: <20220702044304.90553-1-peter@pjd.dev>
 <8e54f374-d4bc-36f1-6d1c-470853174aaa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e54f374-d4bc-36f1-6d1c-470853174aaa@gmail.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Jul 02, 2022 at 11:30:16PM +0900, Akihiko Odaki wrote:
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Just checking in on the status of this: do I need to submit a pull request?
Or will this patch be picked up in a miscellaneous pull queue eventually?

> 
> On 2022/07/02 13:43, Peter Delevoryas wrote:
> > I noticed this error while building QEMU on Mac OS X:
> > 
> >      [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
> >      ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
> >          static bool switched_to_fullscreen = false;
> >                      ^
> >      1 warning generated.
> > 
> > I think the behavior is fine if you remove "switched_to_fullscreen", I can
> > still switch in and out of mouse grabbed mode and fullscreen mode with this
> > change, and Command keycodes will only be passed to the guest if the mouse
> > is grabbed, which I think is the right behavior. I'm not sure why a static
> > piece of state was needed to handle that in the first place. Perhaps the
> > refactoring of the flags-state-change fixed that by toggling the Command
> > keycode on.
> > 
> > I tested this with an Ubuntu core image on macOS 12.4
> > 
> >      wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
> >      xz -d ubuntu-core-18-i386.img.xz
> >      qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw
> > 
> > Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   ui/cocoa.m | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 84c84e98fc..13e208b037 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
> >       int buttons = 0;
> >       int keycode = 0;
> >       bool mouse_event = false;
> > -    static bool switched_to_fullscreen = false;
> >       // Location of event in virtual screen coordinates
> >       NSPoint p = [self screenLocationOfEvent:event];
> >       NSUInteger modifiers = [event modifierFlags];
> > @@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
> >               // forward command key combos to the host UI unless the mouse is grabbed
> >               if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
> > -                /*
> > -                 * Prevent the command key from being stuck down in the guest
> > -                 * when using Command-F to switch to full screen mode.
> > -                 */
> > -                if (keycode == Q_KEY_CODE_F) {
> > -                    switched_to_fullscreen = true;
> > -                }
> >                   return false;
> >               }
> 

