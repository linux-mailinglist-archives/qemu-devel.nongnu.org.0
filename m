Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A763AC976
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:08:46 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luCMf-0001fW-KA
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luCLI-0000vB-SL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luCLE-0003gg-W6
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624014436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVy9mHxoLrRxqlzfZmidnnA7cIQs94BEmYo9oJWVVok=;
 b=DjhX1iGT/3mZmd8RXILtaI5+UD5aR+gQQeo/9/fh0uA5ksrjtmMadii9lXEe65HQC+1ZN+
 25WxIq5k06zvj4Lkzh1wNOiuZykpUbXnT3lOnrAUAHQKEJsuKkYyQZFqOPMCaoaxZ19Uhh
 7XIYKHlajyjPv/xmZ2Q7115BvDXOstg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-eXNyFkWYOhmtk6jZKP4ChQ-1; Fri, 18 Jun 2021 07:07:14 -0400
X-MC-Unique: eXNyFkWYOhmtk6jZKP4ChQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93DE4192FDB4;
 Fri, 18 Jun 2021 11:07:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AEA517D53;
 Fri, 18 Jun 2021 11:07:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87AC7113865F; Fri, 18 Jun 2021 13:07:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: sweeaun <swee.aun.khor@intel.com>
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
Date: Fri, 18 Jun 2021 13:07:06 +0200
In-Reply-To: <20210617020609.18089-1-swee.aun.khor@intel.com> (sweeaun's
 message of "Thu, 17 Jun 2021 10:06:09 +0800")
Message-ID: <8735tfsa79.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: khairul.anuar.romli@intel.com, Gerd Hoffmann <kraxel@redhat.com>,
 eblake@redhat.com, qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You neglected to cc: the Graphics maintainer.  I'm doing that for you
now.

sweeaun <swee.aun.khor@intel.com> writes:

>  -display gtk,monitor=3D<value>
>
> Signed-off-by: sweeaun <swee.aun.khor@intel.com>

Your commit message is formatted badly.  What about this:

    ui/gtk: New -display gtk parameter 'monitor'.

    This lets the user select monitor number to display QEMU in full
    screen with -display gtk,monitor=3D<value>.

Furthermore, you're Signed-off-by line may be off.  It should be of the
form

    Signed-off-by: REAL NAME <EMAIL>

Is "sweeaun" your real name?

> ---
>  qapi/ui.json    |  4 +++-
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 15 +++++++++++++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..1616f3ffbd 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1035,13 +1035,15 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @monitor: Monitor number to display qemu in full screen.

We spell it QEMU.

Should "full screen" be "full-screen" or even "fullscreen"?

>  #
>  # Since: 2.12
>  #
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*monitor' : 'int' } }

Best to make your addition "blend in" like this

   { 'struct'  : 'DisplayGTK',
     'data'    : { '*grab-on-hover' : 'bool',
                   '*zoom-to-fit'   : 'bool',
                   '*monitor'       : 'int' } }

> =20
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3..e4b89b6a72 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "            [,window_close=3Don|off][,gl=3Don|core|es|off]\n"
>  #endif
>  #if defined(CONFIG_GTK)
> -    "-display gtk[,grab_on_hover=3Don|off][,gl=3Don|off]|\n"
> +    "-display gtk[,grab_on_hover=3Don|off][,gl=3Don|off][,monitor=3D<val=
ue>]\n"
>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=3D<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..84da126611 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2268,6 +2268,21 @@ static void gtk_display_init(DisplayState *ds, Dis=
playOptions *opts)
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>      }
>      gd_clipboard_init(s);
> +
> +    if (opts->u.gtk.has_monitor) {
> +        int n_monitor;
> +        n_monitor =3D gdk_display_get_n_monitors(window_display);

Terser:

           int n_monitor =3D gdk_display_get_n_monitors(window_display);

> +
> +        if ((opts->u.gtk.monitor <=3D n_monitor) &&
> +            (opts->u.gtk.monitor > 0)) {

Suggest to drop the superfluous parenthesis:

           if (opts->u.gtk.monitor <=3D n_monitor &&
               opts->u.gtk.monitor > 0) {

> +            GdkScreen *gdk_screen;
> +            gdk_screen =3D gdk_display_get_default_screen(window_display=
);
> +            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_=
screen,
> +                                             (opts->u.gtk.monitor - 1));

Drop the superfluous parenthesis around the last argument.

Your new option argument seems to count monitors from 1, while GTK
counts them from zero.  Why the difference?

Your documentation states that @monitor applies only "in full screen",
but this code is not guarded by if (opts->full_screen).  Why is that
okay?

From gdk_display_get_n_monitors()'s documentation: "The returned number
is valid until the next emission of the =E2=80=9Cmonitor-added=E2=80=9D or
=E2=80=9Cmonitor-removed=E2=80=9D signal."  This suggests monitors can come=
 and go at
any time.  If they can, what happens when the monitor we're trying to
use here has gone away since we called gdk_display_get_n_monitors()?

> +        } else {
> +            fprintf(stderr, "Invalid GTK monitor argument\n");
> +        }
> +    }
>  }
> =20
>  static void early_gtk_display_init(DisplayOptions *opts)


