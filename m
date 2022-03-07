Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1E4D0310
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:38:36 +0100 (CET)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFRT-0004Kq-GM
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRFNi-00079g-M8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:34:42 -0500
Received: from [2607:f8b0:4864:20::536] (port=35623
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRFNg-0003Ns-Ny
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:34:42 -0500
Received: by mail-pg1-x536.google.com with SMTP id e6so13861945pgn.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jLNUR4s0THKei5YIh3k/7qMp5F3ugf6ZTk+Cr+SfD20=;
 b=oFj66cCOf22eVs78q2GJJ2x2ehRYFkGx/ppWuwQxo3DOq/Ia/XZzwb3SIJ3wZmxX+j
 HQjiQfLE4jwkiL4JwyxklGoH7WVO6SuhRKoKzPkqKZxe4wg2c2m1B6FNsnWSRjiWD/io
 SbqsRxWjpRzPCOND27wrF6gp6QgWndPrMO8rJji1QfVZE7OraYYKK4rEkLz5z620teDI
 /61M1j22BQ5sWnGTkGQ4HiYU5sC8fSMI4cyPT8/hyqqWINnbqta4rQ1RgVZN6yI564rw
 rrIARllJ3vSjRoUPPgF3AjreKGhFKlu5Umm8cJk8kZzy0wop4XVjHywVjqYABmUl7npM
 NjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jLNUR4s0THKei5YIh3k/7qMp5F3ugf6ZTk+Cr+SfD20=;
 b=gWd2E6OWf/bA3PMFKZmI5LT3nykZ4ESR/ZBhY3GAKek6NbBiLFFFR1+7jhh4A/qULM
 BlVX3sO1WDQcIZKtcUUtkCT8lBZNLfvTouOxgJ1mRSLPKi4aCagXMrll0sAVuAMQFeX/
 s9lGhrg1xWXqfOTiW3D9KLRfOwl6tJM/HIS/dbDCLdwhGOcCkORnuZhYMZ4w4c4cgn2M
 tMb7mcDyTRKB83ZY4bZLfSkpVHtrbkIUys0X6b0znmjnRgNS3oi9YM4mZSWJvL12eLZQ
 f6xXKK48Bv2cE9p6nEfo1i644y649SBB+wG1KGn4P0T2w9P5GDaBj80wOygPuL4TPkTQ
 YnKw==
X-Gm-Message-State: AOAM532lAiqrEW2Lh3XO9yQhpVfTa0eIAm5+x2SKFkHr/HvUItVzEPj/
 Grs3ABK23Eo9o60mVfJ7TMk=
X-Google-Smtp-Source: ABdhPJwwc38vYZv1tsNlCNltYDpMOMo5OMUXuquldSsWPJjxSJuv55jCerya7bycQzqCT6RCAAPJHQ==
X-Received: by 2002:a05:6a00:a92:b0:4e0:57a7:2d5d with SMTP id
 b18-20020a056a000a9200b004e057a72d5dmr13162284pfl.81.1646667279019; 
 Mon, 07 Mar 2022 07:34:39 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 nv4-20020a17090b1b4400b001bf64a39579sm4243546pjb.4.2022.03.07.07.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 07:34:38 -0800 (PST)
Message-ID: <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
Date: Tue, 8 Mar 2022 00:34:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307151004.578069-1-pbonzini@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220307151004.578069-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/08 0:10, Paolo Bonzini wrote:
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

Hi,

Thanks for this interesting suggestion. However I don't think this 
improves the situation much. The main contribution of this change is 
that elimination of display_init_sem but it is still necessary for 
command line usage of the executable.

display_init_sem is kind of overloaded has two roles. One is to tell 
that the QEMU is ready to initialize the display. The other is to tell 
if it is going to initialize the display, which would not happen when it 
is used entirely in the command line. The former role can be eliminated 
by waiting for qemu_init, but the latter cannot be.

Regards,
Akihiko Odaki

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/main.c |  12 +++--
>   ui/cocoa.m     | 122 +++++++++++++++++++------------------------------
>   2 files changed, 53 insertions(+), 81 deletions(-)
> 
> diff --git a/softmmu/main.c b/softmmu/main.c
> index 639c67ff48..0c4384e980 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -39,16 +39,18 @@ int main(int argc, char **argv)
>   #endif
>   #endif /* CONFIG_SDL */
>   
> -#ifdef CONFIG_COCOA
> -#undef main
> -#define main qemu_main
> -#endif /* CONFIG_COCOA */
> -
> +#ifndef CONFIG_COCOA
>   int main(int argc, char **argv, char **envp)
>   {
> +    /*
> +     * ui/cocoa.m relies on this being the exact content of main(),
> +     * because it has to run everything after qemu_init in a secondary
> +     * thread.
> +     */
>       qemu_init(argc, argv, envp);
>       qemu_main_loop();
>       qemu_cleanup();
>   
>       return 0;
>   }
> +#endif /* CONFIG_COCOA */
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index a8f1cdaf92..44d8ea7a39 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -95,14 +95,11 @@ static DisplayChangeListener dcl = {
>   };
>   static int last_buttons;
>   static int cursor_hide = 1;
> +static bool full_screen;
>   
> -static int gArgc;
> -static char **gArgv;
>   static bool stretch_video;
>   static NSTextField *pauseLabel;
>   
> -static QemuSemaphore display_init_sem;
> -static QemuSemaphore app_started_sem;
>   static bool allow_events;
>   
>   static NSInteger cbchangecount = -1;
> @@ -140,6 +137,32 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
>       return val;
>   }
>   
> +/*
> + * The startup process for the OSX/Cocoa UI is complicated, because
> + * OSX insists that the UI runs on the initial main thread, and so we
> + * need to start a second thread which runs qemu_main_loop():
> + *
> + * Initial thread:                    2nd thread:
> + * in main():
> + *  qemu_init()
> + *  create application, menus, etc
> + *  enter OSX run loop
> + * in applicationDidFinishLaunching:
> + *  fullscreen if needed
> + *  create main loop thread
> + *                                    call qemu_main_loop()
> + */
> +
> +static void *call_qemu_main_loop(void *opaque)
> +{
> +    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> +    qemu_main_loop();
> +    COCOA_DEBUG("Second thread: qemu_main_loop() returned, exiting\n");
> +    qemu_cleanup();
> +    [cbowner release];
> +    exit(0);
> +}
> +
>   // Mac to QKeyCode conversion
>   static const int mac_to_qkeycode_map[] = {
>       [kVK_ANSI_A] = Q_KEY_CODE_A,
> @@ -708,9 +731,7 @@ QemuCocoaView *cocoaView;
>           /*
>            * Just let OSX have all events that arrive before
>            * applicationDidFinishLaunching.
> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
> -         * will not drop until after the app_started_sem is posted. (In theory
> -         * there should not be any such events, but OSX Catalina now emits some.)
> +         * This may not be needed anymore?
>            */
>           return false;
>       }
> @@ -1185,8 +1206,19 @@ QemuCocoaView *cocoaView;
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
>       allow_events = true;
> -    /* Tell cocoa_display_init to proceed */
> -    qemu_sem_post(&app_started_sem);
> +
> +    // register vga output callbacks
> +    register_displaychangelistener(&dcl);
> +
> +    qemu_clipboard_peer_register(&cbpeer);
> +    qemu_mutex_unlock_iothread();
> +    qemu_thread_create(&thread, "qemu_main_loop", call_qemu_main_loop,
> +                       NULL, QEMU_THREAD_DETACHED);
> +
> +    if (full_screen) {
> +        [NSApp activateIgnoringOtherApps: YES];
> +        [self toggleFullScreen: nil];
> +    }
>   }
>   
>   - (void)applicationWillTerminate:(NSNotification *)aNotification
> @@ -1859,60 +1891,14 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>       }
>   }
>   
> -/*
> - * The startup process for the OSX/Cocoa UI is complicated, because
> - * OSX insists that the UI runs on the initial main thread, and so we
> - * need to start a second thread which runs the vl.c qemu_main():
> - *
> - * Initial thread:                    2nd thread:
> - * in main():
> - *  create qemu-main thread
> - *  wait on display_init semaphore
> - *                                    call qemu_main()
> - *                                    ...
> - *                                    in cocoa_display_init():
> - *                                     post the display_init semaphore
> - *                                     wait on app_started semaphore
> - *  create application, menus, etc
> - *  enter OSX run loop
> - * in applicationDidFinishLaunching:
> - *  post app_started semaphore
> - *                                     tell main thread to fullscreen if needed
> - *                                    [...]
> - *                                    run qemu main-loop
> - *
> - * We do this in two stages so that we don't do the creation of the
> - * GUI application menus and so on for command line options like --help
> - * where we want to just print text to stdout and exit immediately.
> - */
> -
> -static void *call_qemu_main(void *opaque)
> -{
> -    int status;
> -
> -    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> -    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
> -    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> -    [cbowner release];
> -    exit(status);
> -}
> -
>   int main (int argc, char **argv) {
>       QemuThread thread;
>   
>       COCOA_DEBUG("Entered main()\n");
> -    gArgc = argc;
> -    gArgv = argv;
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
> +    /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
> +    qemu_init(argc, argv);
>   
>       NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
>   
> @@ -1934,6 +1920,7 @@ int main (int argc, char **argv) {
>        */
>       add_console_menu_entries();
>       addRemovableDevicesMenuItems();
> +    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
>   
>       // Create an Application controller
>       QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
> @@ -2034,29 +2021,12 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
>   static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>   {
>       COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
> -
> -    /* Tell main thread to go ahead and create the app and enter the run loop */
> -    qemu_sem_post(&display_init_sem);
> -    qemu_sem_wait(&app_started_sem);
> -    COCOA_DEBUG("cocoa_display_init: app start completed\n");
> -
> -    /* if fullscreen mode is to be used */
>       if (opts->has_full_screen && opts->full_screen) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [NSApp activateIgnoringOtherApps: YES];
> -            [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
> -        });
> +        full_screen = 1;
>       }
>       if (opts->has_show_cursor && opts->show_cursor) {
>           cursor_hide = 0;
>       }
> -
> -    // register vga output callbacks
> -    register_displaychangelistener(&dcl);
> -
> -    qemu_event_init(&cbevent, false);
> -    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
> -    qemu_clipboard_peer_register(&cbpeer);
>   }
>   
>   static QemuDisplay qemu_display_cocoa = {


