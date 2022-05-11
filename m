Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2E523354
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 14:48:54 +0200 (CEST)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nollt-0000xz-89
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 08:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noldh-00078h-C6
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noldc-0003eR-Qq
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652272819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=z/7+iA8gdUcOEp2+QP/g82+cFo7r5Y1UoBHYHH2tIts=;
 b=ShUb5uK5Keyx5X/HvzLCEhG7S6xAY7MDaozNT2evMyJiAORAdvY3amoxU9bfNNV8FMOeor
 ylnrjNsxIpIJUlsQYjv5Grgcmu+JNWrCeod6TNW4RVUpK3rt5hdfC5jpBkHv0F0h+RKPFt
 ehK300EXrm47GoJ0uLQ312eEdBTJUao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-LHlPioTPNEic6TzdQlNPvg-1; Wed, 11 May 2022 08:40:18 -0400
X-MC-Unique: LHlPioTPNEic6TzdQlNPvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B11039F9CA2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 12:40:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5882166B2F;
 Wed, 11 May 2022 12:40:05 +0000 (UTC)
Date: Wed, 11 May 2022 13:40:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com
Subject: Re: [PATCH] ui: Remove deprecated parameters of -display sdl and
 switch to QAPI parser
Message-ID: <Ynuuo02cDee1nsZL@redhat.com>
References: <20220511121725.842448-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511121725.842448-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 02:17:25PM +0200, Thomas Huth wrote:
> The "-display sdl" option still used a hand-crafted parser for its
> parameters since some of them used underscores which is forbidden
> in QAPI. Now that they've been deprecated and the deprecation period
> is over, we can remove the problematic parameters and switch to use
> the QAPI parser instead.

I'd say the removal of deprecated bits ought to be separate
from the addition of new QAPI bits.


> diff --git a/qapi/ui.json b/qapi/ui.json
> index 059302a5ef..7d5097808a 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1309,6 +1309,19 @@
>        '*swap-opt-cmd': 'bool'
>    } }
>  
> +##
> +# @DisplaySDL:
> +#
> +# SDL2 display options.
> +#
> +# @grab-mod:  Modifier keys that should be pressed together
> +#             with "G" to release the mouse grab.
> +#
> +# Since: 7.1
> +##
> +{ 'struct'  : 'DisplaySDL',
> +  'data'    : { '*grab-mod'   : 'str' } }

So any arbitrary string here, but...

> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index d3741f9b75..18c63e1fc9 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -40,6 +40,8 @@ static struct sdl2_console *sdl2_console;
>  
>  static SDL_Surface *guest_sprite_surface;
>  static int gui_grab; /* if true, all keyboard/mouse events are grabbed */
> +static bool alt_grab;
> +static bool ctrl_grab;
>  
>  static int gui_saved_grab;
>  static int gui_fullscreen;
> @@ -853,6 +855,17 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>  
>      gui_fullscreen = o->has_full_screen && o->full_screen;
>  
> +    if (o->u.sdl.has_grab_mod) {
> +        if (g_str_equal(o->u.sdl.grab_mod, "lshift-lctrl-lalt")) {
> +            alt_grab = true;
> +        } else if (g_str_equal(o->u.sdl.grab_mod, "rctrl")) {
> +            ctrl_grab = true;
> +        } else {
> +            error_report("Unsupported grab-mod: %s", o->u.sdl.grab_mod);
> +            exit(1);
> +        }
> +    }

We're treating this more like an enum here. It does leave the door
open for adding a generic parsing of arbitrary grab mods later
I guess


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


