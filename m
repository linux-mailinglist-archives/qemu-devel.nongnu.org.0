Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638B570E9E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 02:09:00 +0200 (CEST)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB3SU-0002FQ-KM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 20:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB3PS-0000jB-57
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 20:05:50 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oB3PQ-0001kz-0w
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 20:05:49 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5F9358329A;
 Mon, 11 Jul 2022 20:05:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 20:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657584345; x=1657587945; bh=mKCbmFJBgf
 1i0Ix5kZ1g/arwzQVNQdWVuqtiBFbJEac=; b=U+3Iv5yB1Ro+1EWuGQVlufI6cM
 zHfm70dVhBiPLKH5OPXyGhuQ7NsodLlQRdeBq3+VFGX8goRQJBi+fUx6waSThaiP
 ZDxc9PDSW+eWg4wrSOjAohE8rqhx3UkYfDeeeECmMFAPE6PCroWc1ZsteLjkJGWq
 BUmVZRO2mUVTZUOY+KfckoNo5HmhtKt2oHQ8cvlJ7FLQ/wGiByRrrW3bWQLp8rJo
 g9F6nMcWEHRN2Sb9jEuxqJ+CnlvUl5GTd0y4fEm33GMn4J2kc+ls7jMZ+oWOpWny
 lpz08RuzdCGgFyZzF03YsUCw567HED8daxzoLZgef0U01xMdq74TsPfsllKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657584345; x=1657587945; bh=mKCbmFJBgf1i0Ix5kZ1g/arwzQVN
 QdWVuqtiBFbJEac=; b=YW7ByUmP0Rbcg4j38GW9wA3ITGkW+IZ8VyBIwH0a5IWB
 LH0lBDm/BEQ/63NNytNPZJB3QsWQ2JLtqOvrraIQo3AN5RvcKui9rabsoVLxPMTb
 loUp/xZhK3vgMm/Ou8PXmpYJISOV8mvN/ZmPEpo33q469LC29KruQqVBvEVq/2OA
 IGnzWOxZfq9sXkDk87SkigKX0y1ObmblUifcO1DL5U2FtCNaL55QOJhQD6BMOrB5
 FHKRyliiU27lGqKxYyat/yEcnGGpmVpLGMAOT1/i3xVjdHzRy2dYD+xhPTjihdJS
 f5j2naboWx+VFbxlANgVC4EaIMLvQrRIcSGuPzS0kg==
X-ME-Sender: <xms:2brMYlI2xzz6ichymw4pftusu_cnNUF_t9u-rdmiwAP598vmMIRMPg>
 <xme:2brMYhLpLVOaKmZBKzwzxNFI2cltUDfslUC59qfq04MSr5b0jFcw8TsDAH4M8RmgZ
 UL8q8VPLghYyiSmkyE>
X-ME-Received: <xmr:2brMYtvA6hnJ0uzZsm0S52Lje-g9YKVYWgjRzC9JRK4dvEXf7XrV_tjevMJsBWm83PBwVCZP0tIicJZ4OCTkoCsF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepkeffgeevuddtteevfeelgfefhfefffeugedvveduuddtteelveekkeeihfev
 uefhnecuffhomhgrihhnpehusghunhhtuhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:2brMYmZLAOsIDxhDIpazcCOQqP4AZdqzffdDUsCPA3pvzXjII7nBnQ>
 <xmx:2brMYsaCKYVcjFC8KzQw2De_zBDfeb4yMHrgxYw29ydXxdr9_X_pNg>
 <xmx:2brMYqAumcFGmJSvdSpqRE7XlzTUmw54jVZo7KGvfLXu4ry2k6Oykw>
 <xmx:2brMYkHIfBuEfluQQ4OsSMmJ_c14kypFUgOISqcorFmHo-ex3335bg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 20:05:44 -0400 (EDT)
Date: Mon, 11 Jul 2022 17:05:42 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, f4bug@amsat.org,
 kraxel@redhat.com
Subject: Re: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Message-ID: <Ysy61jH53fDEgJfs@pdel-mbp.dhcp.thefacebook.com>
References: <20220702044304.90553-1-peter@pjd.dev>
 <8e54f374-d4bc-36f1-6d1c-470853174aaa@gmail.com>
 <YsYvvnzmg8jU7zip@pdel-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsYvvnzmg8jU7zip@pdel-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 06, 2022 at 05:58:38PM -0700, Peter Delevoryas wrote:
> On Sat, Jul 02, 2022 at 11:30:16PM +0900, Akihiko Odaki wrote:
> > Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> 
> Just checking in on the status of this: do I need to submit a pull request?
> Or will this patch be picked up in a miscellaneous pull queue eventually?

Pinging this thread again, does this change need anyone else to review it?

> 
> > 
> > On 2022/07/02 13:43, Peter Delevoryas wrote:
> > > I noticed this error while building QEMU on Mac OS X:
> > > 
> > >      [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
> > >      ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
> > >          static bool switched_to_fullscreen = false;
> > >                      ^
> > >      1 warning generated.
> > > 
> > > I think the behavior is fine if you remove "switched_to_fullscreen", I can
> > > still switch in and out of mouse grabbed mode and fullscreen mode with this
> > > change, and Command keycodes will only be passed to the guest if the mouse
> > > is grabbed, which I think is the right behavior. I'm not sure why a static
> > > piece of state was needed to handle that in the first place. Perhaps the
> > > refactoring of the flags-state-change fixed that by toggling the Command
> > > keycode on.
> > > 
> > > I tested this with an Ubuntu core image on macOS 12.4
> > > 
> > >      wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
> > >      xz -d ubuntu-core-18-i386.img.xz
> > >      qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw
> > > 
> > > Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > ---
> > >   ui/cocoa.m | 8 --------
> > >   1 file changed, 8 deletions(-)
> > > 
> > > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > > index 84c84e98fc..13e208b037 100644
> > > --- a/ui/cocoa.m
> > > +++ b/ui/cocoa.m
> > > @@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
> > >       int buttons = 0;
> > >       int keycode = 0;
> > >       bool mouse_event = false;
> > > -    static bool switched_to_fullscreen = false;
> > >       // Location of event in virtual screen coordinates
> > >       NSPoint p = [self screenLocationOfEvent:event];
> > >       NSUInteger modifiers = [event modifierFlags];
> > > @@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
> > >               // forward command key combos to the host UI unless the mouse is grabbed
> > >               if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
> > > -                /*
> > > -                 * Prevent the command key from being stuck down in the guest
> > > -                 * when using Command-F to switch to full screen mode.
> > > -                 */
> > > -                if (keycode == Q_KEY_CODE_F) {
> > > -                    switched_to_fullscreen = true;
> > > -                }
> > >                   return false;
> > >               }
> > 
> 

