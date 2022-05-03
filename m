Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BF51925E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:38:11 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm25q-0004zB-FA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm21j-0000Fk-O5
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:33:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:9972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm21h-0001bk-5M
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651620833; x=1683156833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cDewra8mDIDSKVUZQQUo26K570mEo1JGHzY3e0Ij0+w=;
 b=J7faVWX4FCHn+iDfa6mxUUYeYkZ1lyPkSSY80yA6QKK6Z7CYWnfSAfgY
 dt42phHn83FdmgPck0Az9dfyoVQlLUYyL3eqwbIRgztqmAZsdpZd+rmtr
 aJ2WA0iVN7dRWKezy4u6K3fc3b8o9R/4D+O4sCLbzroxig0rXrgNWTIMG
 2hX3n4v8vIMm3NXM8lYpTjc3H/+KkWCB4kWPZHfMoz/ZRY6SI4xsDXXMg
 mb856f7W6phzSLh3oYgGmADuIpikdZa78nVLLhJvCVJ8IqFDYsCnxuvlx
 pwkbTF0qWNGN3+zZLwecqotEz8muxbZ1HfL9HkMwtsTElF2J3J+yKj1aL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330606442"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="330606442"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:33:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="562441747"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.213.160.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:33:50 -0700
Date: Tue, 3 May 2022 16:33:48 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 3/3] ui/gtk: specify detached window's size and location
Message-ID: <20220503233348.GA382@dongwonk-MOBL.amr.corp.intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-4-dongwon.kim@intel.com>
 <YnDzOlLvFNIG7y8M@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnDzOlLvFNIG7y8M@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=dongwon.kim@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I saw windows, especially, third and fourth ones are 1/4 size of
the first when detached regardless of resolutions.

And the position is also pretty random and detached windows are usually
placed somewhere on the previous window.

This patch is to make the sizes same as the original window's and make
sure all detached windows are not overlapped each other.

On Tue, May 03, 2022 at 10:17:46AM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 28, 2022 at 04:13:04PM -0700, Dongwon Kim wrote:
> > Specify location and size of detached window based on top level
> > window's location and size info when detachment happens.
> 
> Can you explain what problem is being solved by this change ?
> What's wrong with default size/placement logic ?
> 
> In terms of size at least, I would hope we are resizing
> windows any time the guest changes the resolution of the
> virtual video adapter.  If there are 2 outputs, they can
> be at different resolution, so copying the size of the
> existing window feels wrong - we need to copy the guest
> resolution currently set.
> 
> Why do we need to mess around with position at all ?
> 
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  ui/gtk.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index f1ca6a7275..7dadf3b588 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -1338,6 +1338,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> >                                         FALSE);
> >      }
> >      if (!vc->window) {
> > +        gint x, y, w, h;
> > +        int i;
> >          gtk_widget_set_sensitive(vc->menu_item, false);
> >          vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
> >  #if defined(CONFIG_OPENGL)
> > @@ -1351,7 +1353,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> >          }
> >  #endif
> >          gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
> > +        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
> > +        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
> > +
> > +        for (i = 0; i < s->nb_vcs; i++) {
> > +            if (vc == &s->vc[i]) {
> > +                break;
> > +            }
> > +        }
> >  
> > +        gtk_window_move(GTK_WINDOW(vc->window),
> > +                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
> > +        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
> >          g_signal_connect(vc->window, "delete-event",
> >                           G_CALLBACK(gd_tab_window_close), vc);
> >          gtk_widget_show_all(vc->window);
> > -- 
> > 2.30.2
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

