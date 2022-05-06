Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288651DE1F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:08:00 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1Qt-0006f6-6i
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nn1Ou-0005vE-4o
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:05:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:58052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nn1Or-0003GB-PM
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651856753; x=1683392753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VCcuDIGkUArFP8wmkrf6ILandXq9gtiE4f6SWt2oAA8=;
 b=NI5c0d6foco55yb2QIizSKzMC/mfRHaoMQE27sm5Vy0eUXVHhotlgXkK
 LhjtlmE7HwgXzAzKRMq18hGSQCopfX5R1vBcGmo4aX+HrHLhcrWyBd6ub
 ADZPsm++TqtfiLtbTv90FpilNPiiqJhCMApMdWXWuQIZ2uNzOD6r6Nl7v
 ebU2dIO4gCQJy/MtAV7hfwGvrE9J8MPvzogS1ZI5J2QKItAq+MvDkKyF6
 BFORbqHt5RUwbCWxakUOFl+MpJDe8Rb1h3n2j8aEtBtnea740O4zhMIpI
 /bdod02jhuBh8lrUH9j4cL0InHk02TZbdRVtmtAiD7mYyj4i1OhpZYPsW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="256006086"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="256006086"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:05:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="665559322"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.121.200.203])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:05:30 -0700
Date: Fri, 6 May 2022 10:05:29 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 3/3] ui/gtk: specify detached window's size and location
Message-ID: <20220506170529.GA369@dongwonk-MOBL.amr.corp.intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-4-dongwon.kim@intel.com>
 <YnDzOlLvFNIG7y8M@redhat.com>
 <20220503233348.GA382@dongwonk-MOBL.amr.corp.intel.com>
 <YnVODWc9uq8sx+Cu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnVODWc9uq8sx+Cu@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=dongwon.kim@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 06, 2022 at 05:34:21PM +0100, Daniel P. Berrangé wrote:
> On Tue, May 03, 2022 at 04:33:48PM -0700, Dongwon Kim wrote:
> > I saw windows, especially, third and fourth ones are 1/4 size of
> > the first when detached regardless of resolutions.
> > 
> > And the position is also pretty random and detached windows are usually
> > placed somewhere on the previous window.
> > 
> > This patch is to make the sizes same as the original window's and make
> > sure all detached windows are not overlapped each other.
> 
> In terms of size, I think you need to just honour the surface
> size like this:
> 
> @@ -1354,6 +1354,9 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
>  
>          g_signal_connect(vc->window, "delete-event",
>                           G_CALLBACK(gd_tab_window_close), vc);
> +        gtk_window_set_default_size(GTK_WINDOW(vc->window),
> +                                    surface_width(vc->gfx.ds),
> +                                    surface_height(vc->gfx.ds));

Thanks for this. I will modify the code and test it.

>          gtk_widget_show_all(vc->window);
>  
>          if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
> 
> 
> for position, I don't think we should be overriding the window
> manager placement, as the logic applied could result in us
> placing windows off screen.

Ok, I think what you are saying makes sense.

> 
> > 
> > On Tue, May 03, 2022 at 10:17:46AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Apr 28, 2022 at 04:13:04PM -0700, Dongwon Kim wrote:
> > > > Specify location and size of detached window based on top level
> > > > window's location and size info when detachment happens.
> > > 
> > > Can you explain what problem is being solved by this change ?
> > > What's wrong with default size/placement logic ?
> > > 
> > > In terms of size at least, I would hope we are resizing
> > > windows any time the guest changes the resolution of the
> > > virtual video adapter.  If there are 2 outputs, they can
> > > be at different resolution, so copying the size of the
> > > existing window feels wrong - we need to copy the guest
> > > resolution currently set.
> > > 
> > > Why do we need to mess around with position at all ?
> > > 
> > > > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > > > ---
> > > >  ui/gtk.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > > 
> > > > diff --git a/ui/gtk.c b/ui/gtk.c
> > > > index f1ca6a7275..7dadf3b588 100644
> > > > --- a/ui/gtk.c
> > > > +++ b/ui/gtk.c
> > > > @@ -1338,6 +1338,8 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> > > >                                         FALSE);
> > > >      }
> > > >      if (!vc->window) {
> > > > +        gint x, y, w, h;
> > > > +        int i;
> > > >          gtk_widget_set_sensitive(vc->menu_item, false);
> > > >          vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
> > > >  #if defined(CONFIG_OPENGL)
> > > > @@ -1351,7 +1353,18 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
> > > >          }
> > > >  #endif
> > > >          gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
> > > > +        gtk_window_get_position(GTK_WINDOW(s->window), &x, &y);
> > > > +        gtk_window_get_size(GTK_WINDOW(s->window), &w, &h);
> > > > +
> > > > +        for (i = 0; i < s->nb_vcs; i++) {
> > > > +            if (vc == &s->vc[i]) {
> > > > +                break;
> > > > +            }
> > > > +        }
> > > >  
> > > > +        gtk_window_move(GTK_WINDOW(vc->window),
> > > > +                        x + w * (i % (s->nb_vcs/2) + 1), y + h * (i / (s->nb_vcs/2)));
> > > > +        gtk_window_resize(GTK_WINDOW(vc->window), w, h);
> > > >          g_signal_connect(vc->window, "delete-event",
> > > >                           G_CALLBACK(gd_tab_window_close), vc);
> > > >          gtk_widget_show_all(vc->window);
> > > > -- 
> > > > 2.30.2
> > > > 
> > > > 
> > > 
> > > With regards,
> > > Daniel
> > > -- 
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

