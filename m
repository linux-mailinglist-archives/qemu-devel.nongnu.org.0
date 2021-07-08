Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C843C1721
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:33:17 +0200 (CEST)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wxg-0007U0-Fs
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1WH4-0006tv-GY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1WH2-00018s-7R
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sIoPoS12uiPedA7xddqTORlyRmhT00h7S7e6dgadgQ=;
 b=dFZhzkxP2irke/7jrbjrJPQ2tSYVsy6ORW2qqFMwOxcTfLiPcUmjCkaybQC0md2yDTSXAk
 30RpBymtxcCRchFjRqhmuqpPNsVuwYceqVsIa5VHOeGhSIQWoJyQlm/Qdy6FYJZN5O7bvA
 1eYOc0C8LpJkjyo7y2i4xQOsZuyUfOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-xT90LozSPoeWbeXDlgJ_Kg-1; Thu, 08 Jul 2021 11:49:06 -0400
X-MC-Unique: xT90LozSPoeWbeXDlgJ_Kg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599EE1922971;
 Thu,  8 Jul 2021 15:48:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DEF17E11B;
 Thu,  8 Jul 2021 15:48:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E002E1132B52; Thu,  8 Jul 2021 17:48:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: Re: [PATCH v5] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
References: <20210625082432.55842-1-swee.aun.khor@intel.com>
Date: Thu, 08 Jul 2021 17:48:43 +0200
In-Reply-To: <20210625082432.55842-1-swee.aun.khor@intel.com> (Swee Aun Khor's
 message of "Fri, 25 Jun 2021 16:24:32 +0800")
Message-ID: <87k0m0dcx0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: khairul.anuar.romli@intel.com, Hazwan.Arif.Mazlan@intel.com,
 qemu-devel@nongnu.org, vivek.kasireddy@intel.com, kraxel@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Khor, Swee Aun" <swee.aun.khor@intel.com> writes:

> This lets user select monitor number to display QEMU in full screen
> with -display gtk,full-screen-on-monitor=<value>.

The part from here ...

> v2:
>  - https://patchew.org/QEMU/20210617020609.18089-1-swee.aun.khor@intel.com/.
>  - Added documentation for new member.
>  - Renamed member name from monitor-num to monitor.
>
> v3:
> - Changed commit message subject.
> - Cleaned up signed-off format.
> - Renamed member name from monitor to full-screen-on-monitor to make clear this option automatically enables full screen.
> - Added more detail documentation to specify full-screen-on-monitor option index started from 1.
> - Added code to check windows has been launched successfully at specified monitor.
>
> v4:
> - Used PRId64 format specifier for int64_t variable in warn_report().
>
> v5:
> - Removed gdk_screen and gdk_monitor variables as it used once only.
> - Fixed issue where v3 and v4 doesn't showing up in https://patchew.org/QEMU/.

... to here should go ...

> Signed-off-by: Khor Swee Aun <swee.aun.khor@intel.com>
> ---

... here.  If nothing else needs to be improved, I hope the maintainer
can take care of this one for you.

>  qapi/ui.json    | 10 +++++++---
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..d775c29534 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1035,13 +1035,17 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> -#
> +# @full-screen-on-monitor: Monitor number to display QEMU in full screen.
> +#                          Monitor number started from index 1. If total number
> +#                          of monitors is 3, possible values for this option are
> +#                          1, 2 or 3.

This is silently ignored unless 'full-screen': true.  Correct?

>  # Since: 2.12
>  #
>  ##
>  { 'struct'  : 'DisplayGTK',
> -  'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +  'data'    : { '*grab-on-hover'          : 'bool',
> +                '*zoom-to-fit'            : 'bool',
> +                '*full-screen-on-monitor' : 'int' } }
>  
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3..29836db663 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "            [,window_close=on|off][,gl=on|core|es|off]\n"
>  #endif
>  #if defined(CONFIG_GTK)
> -    "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
> +    "-display gtk[,grab-on-hover=on|off][,gl=on|off][,full-screen-on-monitor=<value>]\n"

Suggest full-screen-on-monitor=<number>.

>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..4da904a024 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2189,6 +2189,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>      GdkDisplay *window_display;
>      GtkIconTheme *theme;
>      char *dir;
> +    int monitor_n;
> +    bool monitor_status = false;
>  
>      if (!gtkinit) {
>          fprintf(stderr, "gtk initialization failed\n");
> @@ -2268,6 +2270,34 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>      }
>      gd_clipboard_init(s);
> +
> +    if (opts->u.gtk.has_full_screen_on_monitor) {
> +        monitor_n = gdk_display_get_n_monitors(window_display);
> +
> +        if (opts->u.gtk.full_screen_on_monitor <= monitor_n &&
> +            opts->u.gtk.full_screen_on_monitor > 0) {
> +            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
> +                gdk_display_get_default_screen(window_display),
> +                opts->u.gtk.full_screen_on_monitor - 1);
> +
> +            if (gdk_display_get_monitor(window_display,
> +                                        opts->u.gtk.full_screen_on_monitor
> +                                        - 1) != NULL) {
> +                monitor_status = true;
> +            }
> +        }
> +        if (monitor_status == false) {
> +            /*
> +             * Calling GDK API to read the number of monitors again in case
> +             * monitor added or removed since last read.
> +             */
> +            monitor_n = gdk_display_get_n_monitors(window_display);
> +            warn_report("Failed to enable full screen on monitor %" PRId64 ". "
> +                        "Current total number of monitors is %d, "
> +                        "please verify full-screen-on-monitor option value.",
> +                        opts->u.gtk.full_screen_on_monitor, monitor_n);

I wonder whether the warning should be an error, but that's for the
maintainer to decide.

> +        }
> +    }
>  }
>  
>  static void early_gtk_display_init(DisplayOptions *opts)

Ignorant question: are monitors renumbered when a monitor goes away?

Example: we have three monitors A, B, C, numbered 0, 1, 2 (GTK monitor
numbers start with 0).  Now monitor B goes away.  I figure monitor A
remains number 0.  What about C?  Does its number change from 2 to 1?

I still believe numbering monitors 1, 2, 3 instead of 0, 1, 2 in QMP is
a bad idea.  The unnecessary difference to GTK's monitor numbers is
bound to confuse.  But I'm not the maintainer here.

The code to guard against and detect errors looks highly questionable to
me.  Let me explain.

This is the actual work:

               gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
                   gdk_display_get_default_screen(window_display),
                   opts->u.gtk.full_screen_on_monitor - 1);

The function's documentation advises:

    Note that you shouldn't assume the window is definitely full screen
    afterward.

    You can track the fullscreen state via the "window-state-event"
    signal on GtkWidget.

https://developer.gnome.org/gtk3/stable/GtkWindow.html#gtk-window-fullscreen-on-monitor

You don't follow this advice.  Instead you do:

1. Guard the actual work with "the monitor with the requested number
   exists".  This guard is unreliable, because monitors can go away
   between the guard and the actual work.

2. Check whether the monitor with the requested number still exists
   after the actual work.  This is also unreliable, because the monitor
   can go away between the guard and the actual work, and come back
   between the actual work and the check.

The code to handle the error looks questionable, too.  The number of
monitors reported in the error message can be misleading.  Say the user
asked for monitor 2, and the guard found only 1.  A second monitor
appears between the guard and the error reporting.  Now the current
number of monitors reported in the error has nothing to do with the
actual error.

Is there any particular reason not to use the function the way its
documentation advises?


