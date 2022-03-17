Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAB4DC677
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:51:51 +0100 (CET)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpbY-0005Uy-TE
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:51:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUpYP-00040y-Mo
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:48:35 -0400
Received: from [2607:f8b0:4864:20::233] (port=36430
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUpYN-0000rw-IL
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:48:33 -0400
Received: by mail-oi1-x233.google.com with SMTP id z8so5475672oix.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oGOYAdYEriPZ2iLWbahIrXO/tJRpG4ftyfAFce58bzk=;
 b=ZXeURKkX2HiuBpAQA6dDkEAVoz9ypfcGM9vocmFF8x5zb4AOqgFLvBDwFAoW+D8T9c
 qvaAK5aL+Frwj3HsuiCJYqQ9QoKNXBk0oUUo7+/+YEZqqxbaJnvRe+JLSUcex814kU+5
 zQSDnbUD67A0kLAh4xeSXBso06UphjyB6XcyZB8I3w6wi5sTC8zu0LkTctrQm8TvJt/1
 ei7UGRLB5d77xU6qrHHAHNywvp+OZX+FNN2VvWav94v0Yt7wTsPK0D8b8WxjkkjazH2r
 hFBfNetZlkcJiPjDuUX2823gjqSDldIRq6np2Q5dV8M8X24b/K04cDExmz4ltA8FMKVO
 V/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oGOYAdYEriPZ2iLWbahIrXO/tJRpG4ftyfAFce58bzk=;
 b=lPCfMDa4zqhrZ2MU16YaXT9AoLT01tI8Hi0HUCjMugBC3s151JXrPrDkdo6GUIAZ3f
 mxdwFl2Hl0osbD/XvmyznwF5MhCO7w4TOVaDuDYfOU5jUhFzYtuL0JenuT9k/zd5/ltn
 gNkYKSdbnmAfV1MVjc1PVzChmWeH/05R2UBgFN/3MZG6v7Jiuw6K5sVM84EWUlMkqiPr
 7I4XuGpVa9fnh8yO2O+yC4se1F6zw3Q2XuNzFgz8b1/JIV1Q0xm5MFh2CWx1wqtiZhI1
 opV1sq/D6+ZkzVxtnjxSTZD0uxHNgHcHKH7XO0Yd8qbcvYw0sX4PRralkuiw4bnIpClp
 7uEQ==
X-Gm-Message-State: AOAM533uFiBmaUDMZVvgMgwckMQ/zQDnVs44kEuEBk7k0aOFrerSjiV9
 75qCnsXS0+vwJSI8hCHQC8qf1xD0TQZqSomjclw=
X-Google-Smtp-Source: ABdhPJxdw3557ZgcFOcNMvwH9QTIO5d1R5aVie/eKHZ6WNAHvIXxqV8WC46Iv/KAdi9kniF5uXHYwe7bimvsLPsNNp4=
X-Received: by 2002:a05:6808:3020:b0:2d9:b433:ddbf with SMTP id
 ay32-20020a056808302000b002d9b433ddbfmr1844433oib.172.1647521307953; Thu, 17
 Mar 2022 05:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
 <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 17 Mar 2022 21:48:16 +0900
Message-ID: <CAMVc7JXVCYKt9j-nThOWyoaAMhXVWhrpW0SGiCEOA4HEGCJDtQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v3 2/2] ui/cocoa: run qemu_init in the main
 thread
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 8:57 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts.  The cocoa_display_init()
> code that is post-applicationDidFinishLaunching: moves to the
> application delegate itself, and the secondary thread only runs
> the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
>
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.  The newly-introduced assertions in the block layer
> complain about this.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
> [PMD: Fixed trivial build failures & rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  softmmu/main.c |  12 +++---
>  ui/cocoa.m     | 114 ++++++++++++++++++++-----------------------------
>  2 files changed, 54 insertions(+), 72 deletions(-)

I realized this actually breaks the "runas" option with ui/cocoa.

[+NSApplication sharedApplication] calls issetugid() to see if
setgid() or setuid() is called before and calls exit() if it evaluates
true. It does not evaluate true without this patch since setgid() and
setuid() are called after [+NSApplication sharedApplication]. This
patch, however, changes the order and triggers the check.

There are two options to solve the problem:
1. Move setgid and setuid calls after [+NSApplication
sharedApplication] to let NSApplication initialize as the original
user.
2. Do: [[NSUserDefaults standardUserDefaults] setBool:YES
forKey:@"_NSAppAllowsNonTrustedUGID"]

Option 2 would be preferred in terms of practicality since nobody
would want to initialize NSApplication as the original user (usually
superuser). However, _NSAppAllowsNonTrustedUGID is not documented by
Apple.

>
> diff --git a/softmmu/main.c b/softmmu/main.c
> index 639c67ff48..0c4384e980 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -39,16 +39,18 @@ int main(int argc, char **argv)
>  #endif
>  #endif /* CONFIG_SDL */
>
> -#ifdef CONFIG_COCOA
> -#undef main
> -#define main qemu_main
> -#endif /* CONFIG_COCOA */
> -
> +#ifndef CONFIG_COCOA
>  int main(int argc, char **argv, char **envp)
>  {
> +    /*
> +     * ui/cocoa.m relies on this being the exact content of main(),
> +     * because it has to run everything after qemu_init in a secondary
> +     * thread.
> +     */
>      qemu_init(argc, argv, envp);
>      qemu_main_loop();
>      qemu_cleanup();
>
>      return 0;
>  }
> +#endif /* CONFIG_COCOA */
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 027c3053f7..2e5130d805 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,14 +100,13 @@ static int last_buttons;
>  static int cursor_hide =3D 1;
>  static int left_command_key_enabled =3D 1;
>  static bool swap_opt_cmd;
> +static bool full_screen;
> +static bool full_grab;
> +static bool have_cocoa_ui;
>
> -static int gArgc;
> -static char **gArgv;
>  static bool stretch_video;
>  static NSTextField *pauseLabel;
>
> -static QemuSemaphore display_init_sem;
> -static QemuSemaphore app_started_sem;
>  static bool allow_events;
>
>  static NSInteger cbchangecount =3D -1;
> @@ -115,6 +114,7 @@ static QemuClipboardInfo *cbinfo;
>  static QemuClipboardPeer cbpeer;
>  static QemuCocoaPasteboardTypeOwner *cbowner;
>  static QemuEvent cbevent;
> +static QemuThread main_thread;
>
>  // Utility functions to run specified code block with iothread lock held
>  typedef void (^CodeBlock)(void);
> @@ -150,39 +150,28 @@ static bool bool_with_iothread_lock(BoolCodeBlock b=
lock)
>  /*
>   * The startup process for the OSX/Cocoa UI is complicated, because
>   * OSX insists that the UI runs on the initial main thread, and so we
> - * need to start a second thread which runs the vl.c qemu_main():
> + * need to start a second thread which runs qemu_main_loop():
>   *
>   * Initial thread:                    2nd thread:
>   * in main():
> - *  create qemu-main thread
> - *  wait on display_init semaphore
> - *                                    call qemu_main()
> - *                                    ...
> - *                                    in cocoa_display_init():
> - *                                     post the display_init semaphore
> - *                                     wait on app_started semaphore
> + *  qemu_init()
>   *  create application, menus, etc
>   *  enter OSX run loop
>   * in applicationDidFinishLaunching:
> - *  post app_started semaphore
> - *                                     tell main thread to fullscreen if=
 needed
> - *                                    [...]
> - *                                    run qemu main-loop
> - *
> - * We do this in two stages so that we don't do the creation of the
> - * GUI application menus and so on for command line options like --help
> - * where we want to just print text to stdout and exit immediately.
> + *  fullscreen if needed
> + *  create main loop thread
> + *                                    call qemu_main_loop()
>   */
>
> -static void *call_qemu_main(void *opaque)
> +static void *call_qemu_main_loop(void *opaque)
>  {
> -    int status;
> -
> -    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> -    status =3D qemu_main(gArgc, gArgv, *_NSGetEnviron());
> -    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> +    COCOA_DEBUG("Second thread: calling qemu_main_loop()\n");
> +    qemu_mutex_lock_iothread();
> +    qemu_main_loop();
> +    COCOA_DEBUG("Second thread: qemu_main_loop() returned, exiting\n");
> +    qemu_cleanup();
>      [cbowner release];
> -    exit(status);
> +    exit(0);
>  }
>
>  // Mac to QKeyCode conversion
> @@ -823,9 +812,7 @@ static CGEventRef handleTapEvent(CGEventTapProxy prox=
y, CGEventType type, CGEven
>          /*
>           * Just let OSX have all events that arrive before
>           * applicationDidFinishLaunching.
> -         * This avoids a deadlock on the iothread lock, which cocoa_disp=
lay_init()
> -         * will not drop until after the app_started_sem is posted. (In =
theory
> -         * there should not be any such events, but OSX Catalina now emi=
ts some.)
> +         * This may not be needed anymore?
>           */
>          return false;
>      }
> @@ -1323,8 +1310,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy p=
roxy, CGEventType type, CGEven
>  {
>      COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n=
");
>      allow_events =3D true;
> -    /* Tell cocoa_display_init to proceed */
> -    qemu_sem_post(&app_started_sem);
> +
> +    // register vga output callbacks
> +    register_displaychangelistener(&dcl);
> +
> +    qemu_clipboard_peer_register(&cbpeer);
> +    qemu_mutex_unlock_iothread();
> +    qemu_thread_create(&main_thread, "qemu_main_loop", call_qemu_main_lo=
op,
> +                       NULL, QEMU_THREAD_DETACHED);
> +
> +    if (full_screen) {
> +        [NSApp activateIgnoringOtherApps: YES];
> +        [self toggleFullScreen: nil];
> +    }
> +    if (full_grab) {
> +        [self setFullGrab: nil];
> +    }
>  }
>
>  - (void)applicationWillTerminate:(NSNotification *)aNotification
> @@ -1941,22 +1942,18 @@ static void cocoa_clipboard_request(QemuClipboard=
Info *info,
>      }
>  }
>
> -int main (int argc, char **argv) {
> -    QemuThread thread;
> -
> +int main(int argc, char **argv, char **envp)
> +{
>      COCOA_DEBUG("Entered main()\n");
> -    gArgc =3D argc;
> -    gArgv =3D argv;
> +    qemu_event_init(&cbevent, false);
>
> -    qemu_sem_init(&display_init_sem, 0);
> -    qemu_sem_init(&app_started_sem, 0);
> -
> -    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
> -                       NULL, QEMU_THREAD_DETACHED);
> -
> -    COCOA_DEBUG("Main thread: waiting for display_init_sem\n");
> -    qemu_sem_wait(&display_init_sem);
> -    COCOA_DEBUG("Main thread: initializing app\n");
> +    /* Takes iothread lock, released in applicationDidFinishLaunching:. =
 */
> +    qemu_init(argc, argv, envp);
> +    if (!have_cocoa_ui) {
> +         qemu_main_loop();
> +         qemu_cleanup();
> +         return 0;
> +    }
>
>      NSAutoreleasePool * pool =3D [[NSAutoreleasePool alloc] init];
>
> @@ -1978,6 +1975,7 @@ int main (int argc, char **argv) {
>       */
>      add_console_menu_entries();
>      addRemovableDevicesMenuItems();
> +    cbowner =3D [[QemuCocoaPasteboardTypeOwner alloc] init];
>
>      // Create an Application controller
>      QemuCocoaAppController *appController =3D [[QemuCocoaAppController a=
lloc] init];
> @@ -2071,24 +2069,13 @@ static void cocoa_refresh(DisplayChangeListener *=
dcl)
>  static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>  {
>      COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
> +    have_cocoa_ui =3D 1;
>
> -    /* Tell main thread to go ahead and create the app and enter the run=
 loop */
> -    qemu_sem_post(&display_init_sem);
> -    qemu_sem_wait(&app_started_sem);
> -    COCOA_DEBUG("cocoa_display_init: app start completed\n");
> -
> -    QemuCocoaAppController *controller =3D (QemuCocoaAppController *)[[N=
SApplication sharedApplication] delegate];
> -    /* if fullscreen mode is to be used */
>      if (opts->has_full_screen && opts->full_screen) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [NSApp activateIgnoringOtherApps: YES];
> -            [controller toggleFullScreen: nil];
> -        });
> +        full_screen =3D 1;

In case you missed an earlier comment: you may simply store opts and
use it later. sdl2 already does this.

Regards,
Akihiko Odaki

>      }
>      if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [controller setFullGrab: nil];
> -        });
> +        full_grab =3D 1;
>      }
>
>      if (opts->has_show_cursor && opts->show_cursor) {
> @@ -2101,13 +2088,6 @@ static void cocoa_display_init(DisplayState *ds, D=
isplayOptions *opts)
>      if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_comman=
d_key) {
>          left_command_key_enabled =3D 0;
>      }
> -
> -    // register vga output callbacks
> -    register_displaychangelistener(&dcl);
> -
> -    qemu_event_init(&cbevent, false);
> -    cbowner =3D [[QemuCocoaPasteboardTypeOwner alloc] init];
> -    qemu_clipboard_peer_register(&cbpeer);
>  }
>
>  static QemuDisplay qemu_display_cocoa =3D {
> --
> 2.34.1
>

