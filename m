Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDF4754EC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:14:49 +0100 (CET)
Received: from localhost ([::1]:54134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQN5-0003Ie-T9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:14:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxQKt-0005ep-UJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxQKs-0000Ee-AS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639559549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bB3/OdO9916/izlv5oPeMOTJw2eguHHbTUJAp4KN620=;
 b=Z3jxkgjN8MnDp8CHg5Q8/brsht3KDQd6HYju9aa/eV/VqmDno0nyFbNZ7y+Ixptvy+pJwI
 xsRgoaXLTJCPFrotl/0bQpx+kbrFzWLSs586hYqmlhI1YybYYs1xoApxHbGkjC44bgqNjY
 ogGKJDDOsoOToetAeYdF2UXTgoYtIHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-8AlnjOXbPaCOo03MNmQBMw-1; Wed, 15 Dec 2021 04:12:26 -0500
X-MC-Unique: 8AlnjOXbPaCOo03MNmQBMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD71C92500;
 Wed, 15 Dec 2021 09:12:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD59010841E3;
 Wed, 15 Dec 2021 09:11:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 34C52113865F; Wed, 15 Dec 2021 10:11:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qemu-options: Remove the deprecated -no-quit option
References: <20211215082417.180735-1-thuth@redhat.com>
Date: Wed, 15 Dec 2021 10:11:36 +0100
In-Reply-To: <20211215082417.180735-1-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 15 Dec 2021 09:24:17 +0100")
Message-ID: <878rwm5j1z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> This option was just a wrapper around the -display ...,window-close=off
> parameter, and the name "no-quit" is rather confusing compared to
> "window-close" (since there are still other means to quit the emulator),
> so let's remove this now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst       | 6 ------
>  docs/about/removed-features.rst | 7 +++++++
>  qemu-options.hx                 | 8 --------
>  softmmu/vl.c                    | 8 +-------
>  4 files changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7f12f53713..6f85afdee4 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -134,12 +134,6 @@ specified.
>  Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
>  an underscore between "window" and "close").
>  
> -``-no-quit`` (since 6.1)
> -''''''''''''''''''''''''
> -
> -The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
> -should be used instead.
> -
>  ``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index f92b8bd738..380a1b30ea 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -330,6 +330,13 @@ RISC-V firmware not booted by default (removed in 5.1)
>  QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios default``
>  for the RISC-V ``virt`` machine and ``sifive_u`` machine.
>  
> +``-no-quit`` (removed in 7.0)
> +'''''''''''''''''''''''''''''
> +
> +The ``-no-quit`` was a synonym for ``-display ...,window-close=off`` which
> +should be used instead.
> +
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ae2c6dbbfc..e2b73f6e5d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2002,14 +2002,6 @@ SRST
>      ``-display sdl,grab-mod=rctrl`` instead.
>  ERST
>  
> -DEF("no-quit", 0, QEMU_OPTION_no_quit,
> -    "-no-quit        disable SDL/GTK window close capability (deprecated)\n", QEMU_ARCH_ALL)
> -SRST
> -``-no-quit``
> -    Disable window close capability (SDL and GTK only). This option is
> -    deprecated, please use ``-display ...,window-close=off`` instead.
> -ERST
> -
>  DEF("sdl", 0, QEMU_OPTION_sdl,
>      "-sdl            shorthand for -display sdl\n", QEMU_ARCH_ALL)
>  SRST
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 620a1f1367..163ab355f5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1938,7 +1938,7 @@ static void qemu_create_early_backends(void)
>                       "for SDL, ignoring option");
>      }
>      if (dpy.has_window_close && !use_gtk && !use_sdl) {
> -        error_report("-no-quit is only valid for GTK and SDL, "
> +        error_report("window-close is only valid for GTK and SDL, "
>                       "ignoring option");
>      }
>  

Bonus: the error message in now in terms of the non-deprecated
interface.  Suggest to mention this in the commit message.

Sadly, it lacks context:

    qemu-system-x86_64: window-close is only valid for GTK and SDL, ignoring option

If we check in parse_display() instead, we should be able to get
something like

    qemu-system-x86_64: -display none,window-close=off: window-close is only valid for GTK and SDL, ignoring option

Funny: we get a different error with VNC:

    qemu-system-x86_64: -display vnc=:0,window-close=off: Invalid parameter 'window-close'

That's because parse_display() uses separate parsers for SDL, VNC and
the rest, and only SDL and the rest accept window-close.

Finally, why isn't this an error?  Invalid configuration should be...

If we decide not to error out in this case, we should use warn_report()
instead of error_report().

All this can be addressed on top.

> @@ -3298,12 +3298,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                  warn_report("-ctrl-grab is deprecated, please use "
>                              "-display sdl,grab-mod=rctrl instead.");
>                  break;
> -            case QEMU_OPTION_no_quit:
> -                dpy.has_window_close = true;
> -                dpy.window_close = false;
> -                warn_report("-no-quit is deprecated, please use "
> -                            "-display ...,window-close=off instead.");
> -                break;
>              case QEMU_OPTION_sdl:
>                  warn_report("-sdl is deprecated, use -display sdl instead.");
>  #ifdef CONFIG_SDL

Reviewed-by: Markus Armbruster <armbru@redhat.com>


