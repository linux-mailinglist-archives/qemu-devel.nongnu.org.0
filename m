Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2A51DDB4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:37:21 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0xE-00054C-3x
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nn0ui-0003Ef-8t
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nn0ue-0006jH-NM
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651854878;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVh3VKfAV6vy8rST/EzLHCxpy6XAhLFoC8YOoI5BNsE=;
 b=jIEBYRuwHdy8EzumBxTfV4RS4jqxn5fvcjfge89uM5I4FkP2IhZF9IbDt4TVElAuZra75X
 Tla/olD/vgIBxRXA1HDwlbIAKpAnnGog2JhHSODm2HVyjsFD5oY9ycq19HsKyhg5J5JIso
 LayklSfUIKnwPEHKdxdCCXWUzXu+UD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-N0U9kK-LNRe7R1SHNVPVLA-1; Fri, 06 May 2022 12:34:34 -0400
X-MC-Unique: N0U9kK-LNRe7R1SHNVPVLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FBD1833961;
 Fri,  6 May 2022 16:34:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65225111DCF2;
 Fri,  6 May 2022 16:34:24 +0000 (UTC)
Date: Fri, 6 May 2022 17:34:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 3/3] ui/gtk: specify detached window's size and location
Message-ID: <YnVODWc9uq8sx+Cu@redhat.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-4-dongwon.kim@intel.com>
 <YnDzOlLvFNIG7y8M@redhat.com>
 <20220503233348.GA382@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503233348.GA382@dongwonk-MOBL.amr.corp.intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Tue, May 03, 2022 at 04:33:48PM -0700, Dongwon Kim wrote:
> I saw windows, especially, third and fourth ones are 1/4 size of
> the first when detached regardless of resolutions.
> 
> And the position is also pretty random and detached windows are usually
> placed somewhere on the previous window.
> 
> This patch is to make the sizes same as the original window's and make
> sure all detached windows are not overlapped each other.

In terms of size, I think you need to just honour the surface
size like this:

@@ -1354,6 +1354,9 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 
         g_signal_connect(vc->window, "delete-event",
                          G_CALLBACK(gd_tab_window_close), vc);
+        gtk_window_set_default_size(GTK_WINDOW(vc->window),
+                                    surface_width(vc->gfx.ds),
+                                    surface_height(vc->gfx.ds));
         gtk_widget_show_all(vc->window);
 
         if (qemu_console_is_graphic(vc->gfx.dcl.con)) {


for position, I don't think we should be overriding the window
manager placement, as the logic applied could result in us
placing windows off screen.

> 
> On Tue, May 03, 2022 at 10:17:46AM +0100, Daniel P. Berrangé wrote:
> > On Thu, Apr 28, 2022 at 04:13:04PM -0700, Dongwon Kim wrote:
> > > Specify location and size of detached window based on top level
> > > window's location and size info when detachment happens.
> > 
> > Can you explain what problem is being solved by this change ?
> > What's wrong with default size/placement logic ?
> > 
> > In terms of size at least, I would hope we are resizing
> > windows any time the guest changes the resolution of the
> > virtual video adapter.  If there are 2 outputs, they can
> > be at different resolution, so copying the size of the
> > existing window feels wrong - we need to copy the guest
> > resolution currently set.
> > 
> > Why do we need to mess around with position at all ?
> > 
> > > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > > ---
> > >  ui/gtk.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/ui/gtk.c b/ui/gtk.c
> > > index f1ca6a7275..7dadf3b588 100644
> > > --- a/ui/gtk.c
> > > +++ b/ui/gtk.c
> > > @@ -1338,6 +1338,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> > >                                         FALSE);
> > >      }
> > >      if (!vc->window) {
> > > +        gint x, y, w, h;
> > > +        int i;
> > >          gtk_widget_set_sensitive(vc->menu_item, false);
> > >          vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
> > >  #if defined(CONFIG_OPENGL)
> > > @@ -1351,7 +1353,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> > >          }
> > >  #endif
> > >          gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
> > > +        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
> > > +        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
> > > +
> > > +        for (i = 0; i < s->nb_vcs; i++) {
> > > +            if (vc == &s->vc[i]) {
> > > +                break;
> > > +            }
> > > +        }
> > >  
> > > +        gtk_window_move(GTK_WINDOW(vc->window),
> > > +                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
> > > +        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
> > >          g_signal_connect(vc->window, "delete-event",
> > >                           G_CALLBACK(gd_tab_window_close), vc);
> > >          gtk_widget_show_all(vc->window);
> > > -- 
> > > 2.30.2
> > > 
> > > 
> > 
> > With regards,
> > Daniel
> > -- 
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


