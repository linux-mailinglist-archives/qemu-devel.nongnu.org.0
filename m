Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD46B776F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:27:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhGN-0003vV-SV; Mon, 13 Mar 2023 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbhGL-0003v0-KS
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:26:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbhGJ-0004bt-Ol
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=rrwF6rm7E7HBb5KiljKKDltG7w5pX7YsOIwL1yVT0G8=; b=S/nYT1Af4hpK1z9smFJa7lRIHH
 Z5KsORrcN7KoOPN289u9/40nSsEyK1Gurk4h+3R1feM52Uh+3Mfd5jX29KzujQt9hyvs9MzPvh6Jv
 KEw35N3RRt3PJ9+BzD53gYp4+x01Yj7n3xaDTUlwjRcttUo9jkAZA+Q403veVp+pY95gBPHLs+jTr
 1Qw3uMo7LTo3QUpTaN4F0Tv3VTqo4/Zs75lOh2u8gRrhp2/8+JzUjrQXmlkL81p4MUU0y8NiC1FXR
 trd24BujEat64YZN8Xg/r5BRQrZ3OQDVmeoMlbeaz2FAlnghhhnkv1P6SVzl0SnsKkFUVgObaxYmr
 KLuuvnICH6PD78l4NSxN9cFXaInE9HagHtGNi1ey3kXvp1i7gsZiF9WK83xZdw4XAYkz7Xza5qTHB
 GoPP3VBQUj1ZguihgJOspgeVaOqYdtIS3OcggnpJ2aT/Xr9YO4L9VjNqrVB+1ENuX/C8kaFtnfnG1
 DRxoDt+/Lgyi7UlhkFtoolsXjmoaSLAGMJanAh2LZTbYkrmMiV7qBqJ+Pa15+N6in8fL1QcQPuEEn
 lQTZjdg0ymSFwFMsmvyB5I+UdNkaWg432MT7RDoaYM6J1hGQpCTzeRWl/PDjunPIptmMeIkhb1W7u
 qWgG2jQAExA+FuV0cfeLjt6di6JZkNKlTvN5czOWU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Date: Mon, 13 Mar 2023 13:26:41 +0100
Message-ID: <4105880.gIe6kQ2GIU@silver>
In-Reply-To: <3215072.rVCME8qtki@silver>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com> <3215072.rVCME8qtki@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, February 27, 2023 12:28:02 PM CET Christian Schoenebeck wrote:
> On Tuesday, December 27, 2022 5:15:31 PM CET Christian Schoenebeck wrote:
> > While mouse is grabbed, window title contains a hint for the user what
> > keyboard keys to press to release the mouse. Make that hint text a bit
> > more user friendly for a Mac user:
> > 
> >  - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
> >    keys typically displayed for them on a Mac (encode those symbols by
> >    using UTF-8 characters).
> > 
> >  - Drop " + " in between the keys, as that's not common on macOS for
> >    documenting keyboard shortcuts.
> > 
> >  - Convert lower case "g" to upper case "G", as that's common on macOS.
> > 
> >  - Add one additional space at start and end of key stroke set, to
> >    visually separate the key strokes from the rest of the text.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Ping

Gerd,

given that I got a RB and TB from Philippe, would you queue this minor macOS
patch please?

Best regards,
Christian Schoenebeck

> >  ui/cocoa.m | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index e915c344a8..289a2b193e 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -72,6 +72,9 @@
> >  
> >  #define cgrect(nsrect) (*(CGRect *)&(nsrect))
> >  
> > +#define UC_CTRL_KEY "\xe2\x8c\x83"
> > +#define UC_ALT_KEY "\xe2\x8c\xa5"
> > +
> >  typedef struct {
> >      int width;
> >      int height;
> > @@ -1135,9 +1138,9 @@ - (void) grabMouse
> >  
> >      if (!isFullscreen) {
> >          if (qemu_name)
> > -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> > +            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name]];
> >          else
> > -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
> > +            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)"];
> >      }
> >      [self hideCursor];
> >      CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
> > 
> 
> 
> 
> 




