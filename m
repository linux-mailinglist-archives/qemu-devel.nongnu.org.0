Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF525728B6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:43:36 +0200 (CEST)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNfK-0005Ep-Ia
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNd0-00038D-1j
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:41:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBNct-0005xs-OD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:41:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so143126wmb.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 14:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0t3CY8K8KJUFI+MGrv97UERw8eIKwQF3im5xCkO6ucI=;
 b=pLSAGexSm1Uv08I6LmO44/t9hfg1lYwjQJspoKwPxnOv2/4IoKLVxVC1NaqRwwbT1c
 /1QsUoeeu1Jr6xd22fRCBcxHq1Nid23zJjd+rd6wjamWdrSRXKclZR+NFVXqbKmJU/q0
 JnSqHIlXSbBA1euDppSoDah3+WwHKorS0DUok7JE9FraWzfFJbQ3A5eT3wdhVln/DGoy
 e3GKe6bFtoSCYtFTotUOCHyFk9ujsnZA3jEq4dL9ahuI8tTv8OkxYkHOyeXpW8vY6Iaa
 yIDApiN9D+jnHwjsYW8MIf1djL5UV5uCwKJbrrZvLhPbOVBzFeMyRO0z9B5TniPqhk1l
 Ljew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0t3CY8K8KJUFI+MGrv97UERw8eIKwQF3im5xCkO6ucI=;
 b=wId3nViIOXRsV5JrCpX2+2l3G8TPxBw+yzj82aigbhursajcRYGf8ncKPBzFxfRArp
 XxrmJkj0Z6Oq8sAwgxBsiZSPttEoW/ilJytDrW0ZfXrJDmun+OBDjSGLKd6WHzdClYxE
 /GkLc8yi6ePl7QQxJlTPYHNmMnIzaL1ol0xr0xoeTKWUjgyJiFiZPlRPW2hUWcD4b7OU
 KYvadJpx4mmV2dKY3vaB+gAnWTS9VgPYqK++jHV9Ybnuc03k3ppzPuTRWkDrRfkA13im
 5BnvZT1gJ4Ihju7jz5bSKnQDSKwan3C9BzNb30qFzcV9ebPqG6ujLEyBXFeW8KwrNH7Z
 3+Rg==
X-Gm-Message-State: AJIora/ykAkLACcI2NoBgeZP/kSIt2Sd3uhiIoCuRQ+yeEuqvsj6SPgu
 +vHxrZc4+nIsKTXDmJE6rtg=
X-Google-Smtp-Source: AGRyM1twxMMgkhJstFz/YainQ8tarAt3dVJicrgZPxk8FVmgibk3teCmBqlzUZDkMtd6Wmbsqrp/8g==
X-Received: by 2002:a05:600c:3592:b0:3a1:9e9d:2595 with SMTP id
 p18-20020a05600c359200b003a19e9d2595mr6344455wmq.76.1657662061666; 
 Tue, 12 Jul 2022 14:41:01 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c0a0c00b003a02b135747sm81114wmp.46.2022.07.12.14.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:41:01 -0700 (PDT)
Message-ID: <06506e7e-a512-be55-f2c2-5899cc99898c@amsat.org>
Date: Tue, 12 Jul 2022 23:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220706021322.22570-1-akihiko.odaki@gmail.com>
 <20220706021322.22570-2-akihiko.odaki@gmail.com>
In-Reply-To: <20220706021322.22570-2-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Akihiko,

On 6/7/22 04:13, Akihiko Odaki wrote:
> This work is based on:
> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
> 
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts. The secondary thread only
> runs only qemu_main_loop() and qemu_cleanup().
> 
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.
> 
> Overriding the code after calling qemu_init() is done by dynamically
> replacing a function pointer variable, qemu_main when initializing
> ui/cocoa, which unifies the static implementation of main() for
> builds with ui/cocoa and ones without ui/cocoa.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   docs/devel/fuzzing.rst  |   4 +-
>   include/qemu-main.h     |   3 +-
>   include/sysemu/sysemu.h |   2 +-
>   softmmu/main.c          |  14 +--
>   softmmu/vl.c            |   2 +-
>   tests/qtest/fuzz/fuzz.c |   2 +-
>   ui/cocoa.m              | 185 ++++++++++++----------------------------
>   7 files changed, 69 insertions(+), 143 deletions(-)
> 
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 784ecb99e66..715330c8561 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -287,8 +287,8 @@ select the fuzz target. Then, the qtest client is initialized. If the target
>   requires qos, qgraph is set up and the QOM/LIBQOS modules are initialized.
>   Then the QGraph is walked and the QEMU cmd_line is determined and saved.
>   
> -After this, the ``vl.c:qemu_main`` is called to set up the guest. There are
> -target-specific hooks that can be called before and after qemu_main, for
> +After this, the ``vl.c:main`` is called to set up the guest. There are
> +target-specific hooks that can be called before and after main, for
>   additional setup(e.g. PCI setup, or VM snapshotting).
>   
>   ``LLVMFuzzerTestOneInput``: Uses qtest/qos functions to act based on the fuzz
> diff --git a/include/qemu-main.h b/include/qemu-main.h
> index 6a3e90d0ad5..6889375e7c2 100644
> --- a/include/qemu-main.h
> +++ b/include/qemu-main.h
> @@ -5,6 +5,7 @@
>   #ifndef QEMU_MAIN_H
>   #define QEMU_MAIN_H
>   
> -int qemu_main(int argc, char **argv, char **envp);
> +void qemu_default_main(void);
> +extern void (*qemu_main)(void);
>   
>   #endif /* QEMU_MAIN_H */
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 812f66a31a9..254c1eabf57 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -102,7 +102,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
>   
>   bool defaults_enabled(void);
>   
> -void qemu_init(int argc, char **argv, char **envp);
> +void qemu_init(int argc, char **argv);
>   void qemu_main_loop(void);
>   void qemu_cleanup(void);
>   
> diff --git a/softmmu/main.c b/softmmu/main.c
> index c00432ff098..41a091f2c72 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -30,18 +30,18 @@
>   #include <SDL.h>
>   #endif
>   
> -int qemu_main(int argc, char **argv, char **envp)
> +void qemu_default_main(void)
>   {
> -    qemu_init(argc, argv, envp);
>       qemu_main_loop();
>       qemu_cleanup();
> -
> -    return 0;
>   }
>   
> -#ifndef CONFIG_COCOA
> +void (*qemu_main)(void) = qemu_default_main;
> +
>   int main(int argc, char **argv)
>   {
> -    return qemu_main(argc, argv, NULL);
> +    qemu_init(argc, argv);
> +    qemu_main();
> +
> +    return 0;
>   }
> -#endif
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 3f264d4b093..e8c73d0bb40 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2589,7 +2589,7 @@ void qmp_x_exit_preconfig(Error **errp)
>       }
>   }
>   
> -void qemu_init(int argc, char **argv, char **envp)
> +void qemu_init(int argc, char **argv)
>   {
>       QemuOpts *opts;
>       QemuOpts *icount_opts = NULL, *accel_opts = NULL;
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 2062b40d82b..0bde925bf83 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -221,7 +221,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>           g_free(pretty_cmd_line);
>       }
>   
> -    qemu_init(result.we_wordc, result.we_wordv, NULL);
> +    qemu_init(result.we_wordc, result.we_wordv);
>   
>       /* re-enable the rcu atfork, which was previously disabled in qemu_init */
>       rcu_enable_atfork();
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 6a4dccff7f0..55413594d14 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,15 +100,11 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>   static int left_command_key_enabled = 1;
>   static bool swap_opt_cmd;
>   
> -static int gArgc;
> -static char **gArgv;
> +static QemuThread qemu_main_thread;
> +static bool qemu_main_terminating;
>   static bool stretch_video;
>   static NSTextField *pauseLabel;
>   
> -static QemuSemaphore display_init_sem;
> -static QemuSemaphore app_started_sem;
> -static bool allow_events;
> -
>   static NSInteger cbchangecount = -1;
>   static QemuClipboardInfo *cbinfo;
>   static QemuEvent cbevent;
> @@ -581,18 +577,6 @@ - (void) updateUIInfoLocked
>   
>   - (void) updateUIInfo
>   {
> -    if (!allow_events) {
> -        /*
> -         * Don't try to tell QEMU about UI information in the application
> -         * startup phase -- we haven't yet registered dcl with the QEMU UI
> -         * layer, and also trying to take the iothread lock would deadlock.
> -         * When cocoa_display_init() does register the dcl, the UI layer
> -         * will call cocoa_switch(), which will call updateUIInfo, so
> -         * we don't lose any information here.
> -         */
> -        return;
> -    }
> -
>       with_iothread_lock(^{
>           [self updateUIInfoLocked];
>       });
> @@ -778,16 +762,6 @@ - (void) handleMonitorInput:(NSEvent *)event
>   
>   - (bool) handleEvent:(NSEvent *)event
>   {
> -    if(!allow_events) {
> -        /*
> -         * Just let OSX have all events that arrive before
> -         * applicationDidFinishLaunching.
> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
> -         * will not drop until after the app_started_sem is posted. (In theory
> -         * there should not be any such events, but OSX Catalina now emits some.)
> -         */
> -        return false;
> -    }
>       return bool_with_iothread_lock(^{
>           return [self handleEventLocked:event];
>       });
> @@ -1279,29 +1253,18 @@ - (void) dealloc
>       [super dealloc];
>   }
>   
> -- (void)applicationDidFinishLaunching: (NSNotification *) note
> -{
> -    COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
> -    allow_events = true;
> -    /* Tell cocoa_display_init to proceed */
> -    qemu_sem_post(&app_started_sem);
> -}
> -
>   - (void)applicationWillTerminate:(NSNotification *)aNotification
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
>   
>       with_iothread_lock(^{
> -        shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> -        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> +        if (!qemu_main_terminating) {
> +            shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> +        }
>       });
>   
> -    /*
> -     * Sleep here, because returning will cause OSX to kill us
> -     * immediately; the QEMU main loop will handle the shutdown
> -     * request and terminate the process.
> -     */
> -    [NSThread sleepForTimeInterval:INFINITY];
> +    qemu_thread_join(&qemu_main_thread);
>   }
>   
>   - (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
> @@ -1313,7 +1276,7 @@ - (NSApplicationTerminateReply)applicationShouldTerminate:
>                                                            (NSApplication *)sender
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationShouldTerminate\n");
> -    return [self verifyQuit];
> +    return qatomic_read(&qemu_main_terminating) || [self verifyQuit];
>   }
>   
>   - (void)windowDidChangeScreen:(NSNotification *)notification
> @@ -1915,92 +1878,35 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>   /*
>    * The startup process for the OSX/Cocoa UI is complicated, because
>    * OSX insists that the UI runs on the initial main thread, and so we
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
> + * need to start a second thread which runs the qemu_default_main().
>    */
>   
>   static void *call_qemu_main(void *opaque)
>   {
> -    int status;
> -
> -    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> -    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
> -    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> +    COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
> +    qemu_mutex_lock_iothread();
> +    qemu_default_main();
> +    qatomic_set(&qemu_main_terminating, true);
> +    qemu_mutex_unlock_iothread();
> +    COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\n");
>       [cbowner release];
> -    exit(status);
> -}
> -
> -int main (int argc, char **argv) {
> -    QemuThread thread;
> -
> -    COCOA_DEBUG("Entered main()\n");
> -    gArgc = argc;
> -    gArgv = argv;
> +    [NSApp terminate:nil];
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
> -
> -    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
> -
> -    // Pull this console process up to being a fully-fledged graphical
> -    // app with a menubar and Dock icon
> -    ProcessSerialNumber psn = { 0, kCurrentProcess };
> -    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
> -
> -    [QemuApplication sharedApplication];
> -
> -    create_initial_menus();
> +    return NULL;
> +}
>   
> -    /*
> -     * Create the menu entries which depend on QEMU state (for consoles
> -     * and removeable devices). These make calls back into QEMU functions,
> -     * which is OK because at this point we know that the second thread
> -     * holds the iothread lock and is synchronously waiting for us to
> -     * finish.
> -     */
> -    add_console_menu_entries();
> -    addRemovableDevicesMenuItems();
> +static void cocoa_main()
> +{
> +    COCOA_DEBUG("Entered %s()\n", __func__);
>   
> -    // Create an Application controller
> -    QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
> -    [NSApp setDelegate:appController];
> +    qemu_mutex_unlock_iothread();
> +    qemu_thread_create(&qemu_main_thread, "qemu_main", call_qemu_main,
> +                       NULL, QEMU_THREAD_JOINABLE);
>   
>       // Start the main event loop
>       COCOA_DEBUG("Main thread: entering OSX run loop\n");
>       [NSApp run];
>       COCOA_DEBUG("Main thread: left OSX run loop, exiting\n");
> -
> -    [appController release];
> -    [pool release];
> -
> -    return 0;
>   }
>   
>   
> @@ -2079,25 +1985,42 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
>   
>   static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>   {
> +    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
> +
>       COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
>   
> -    /* Tell main thread to go ahead and create the app and enter the run loop */
> -    qemu_sem_post(&display_init_sem);
> -    qemu_sem_wait(&app_started_sem);
> -    COCOA_DEBUG("cocoa_display_init: app start completed\n");
> +    qemu_main = cocoa_main;
> +
> +    // Pull this console process up to being a fully-fledged graphical
> +    // app with a menubar and Dock icon
> +    ProcessSerialNumber psn = { 0, kCurrentProcess };
> +    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
> +
> +    [QemuApplication sharedApplication];
> +
> +    create_initial_menus();
> +
> +    /*
> +     * Create the menu entries which depend on QEMU state (for consoles
> +     * and removeable devices). These make calls back into QEMU functions,
> +     * which is OK because at this point we know that the second thread
> +     * holds the iothread lock and is synchronously waiting for us to
> +     * finish.
> +     */
> +    add_console_menu_entries();
> +    addRemovableDevicesMenuItems();
> +
> +    // Create an Application controller
> +    QemuCocoaAppController *controller = [[QemuCocoaAppController alloc] init];
> +    [NSApp setDelegate:controller];
>   
> -    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
>       /* if fullscreen mode is to be used */
>       if (opts->has_full_screen && opts->full_screen) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [NSApp activateIgnoringOtherApps: YES];
> -            [controller toggleFullScreen: nil];
> -        });
> +        [NSApp activateIgnoringOtherApps: YES];
> +        [controller toggleFullScreen: nil];
>       }
>       if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [controller setFullGrab: nil];
> -        });
> +        [controller setFullGrab: nil];
>       }
>   
>       if (opts->has_show_cursor && opts->show_cursor) {
> @@ -2117,6 +2040,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>       qemu_event_init(&cbevent, false);
>       cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
>       qemu_clipboard_peer_register(&cbpeer);
> +
> +    [pool release];
>   }
>   
>   static QemuDisplay qemu_display_cocoa = {

This doesn't work for me:

(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = 
EXC_BAD_ACCESS (code=1, address=0x18)
   * frame #0: 0x0000000100012bf0 
qemu-system-x86_64`update_displaychangelistener(dcl=0x00000001007d5f90, 
interval=16) at console.c:1671:14
     frame #1: 0x000000010001d150 qemu-system-x86_64`-[QemuCocoaView 
updateUIInfoLocked](self=<unavailable>, _cmd=<unavailable>) at 
cocoa.m:568:17
     frame #2: 0x00000001ae31d2a8 AppKit`-[NSView _setWindow:] + 2196
     frame #3: 0x00000001ae3266bc AppKit`-[NSView addSubview:] + 176
     frame #4: 0x00000001ae32d898 AppKit`-[NSFrameView addSubview:] + 52
     frame #5: 0x00000001ae32d84c AppKit`-[NSThemeFrame addSubview:] + 468
     frame #6: 0x00000001ae32d394 AppKit`-[NSView 
addSubview:positioned:relativeTo:] + 216
     frame #7: 0x00000001ae32d220 AppKit`-[NSThemeFrame 
addSubview:positioned:relativeTo:] + 52
     frame #8: 0x00000001ae32d1d4 AppKit`-[NSThemeFrame 
_addKnownSubview:positioned:relativeTo:] + 52
     frame #9: 0x00000001ae34d9a4 AppKit`-[NSWindow setContentView:] + 376
     frame #10: 0x000000010001e574 
qemu-system-x86_64`-[QemuCocoaAppController 
init](self=0x00006000000265f0, _cmd=<unavailable>) at cocoa.m:1230:9
     frame #11: 0x0000000100020be4 
qemu-system-x86_64`cocoa_display_init(ds=<unavailable>, 
opts=0x0000000100b5d678) at cocoa.m:2018:42
     frame #12: 0x00000001001c17b4 qemu-system-x86_64`qemu_init 
[inlined] qemu_init_displays at vl.c:2449:5
     frame #13: 0x00000001001c17a4 
qemu-system-x86_64`qemu_init(argc=<unavailable>, argv=<unavailable>) at 
vl.c:3566:5
     frame #14: 0x000000010000dc5c 
qemu-system-x86_64`main(argc=<unavailable>, argv=<unavailable>) at 
main.c:43:5
     frame #15: 0x000000010107108c dyld`start + 520

* thread #1, queue = 'com.apple.main-thread', stop reason = 
EXC_BAD_ACCESS (code=1, address=0x18)
     frame #0: 0x0000000100012bf0 
qemu-system-x86_64`update_displaychangelistener(dcl=0x00000001007d5f90, 
interval=16) at console.c:1671:14
    1668	    DisplayState *ds = dcl->ds;
    1669	
    1670	    dcl->update_interval = interval;
-> 1671	    if (!ds->refreshing && ds->update_interval > interval) {
    1672	        timer_mod(ds->gui_timer, ds->last_update + interval);
    1673	    }
    1674	}

(lldb) p ds
(DisplayState *) $0 = NULL

It seems what was discussed here:
https://lore.kernel.org/qemu-devel/89a0316d-7e9a-46d9-31cc-c3507483fffb@redhat.com/
register_displaychangelistener() not yet called.

Regards,

Phil.

