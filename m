Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DB4DC588
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:08:28 +0100 (CET)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUovb-00026m-9Q
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:08:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUops-0007Qb-CE
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:02:35 -0400
Received: from [2607:f8b0:4864:20::1035] (port=52858
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUopm-0001Cx-Tc
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:02:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id v4so4672416pjh.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mjNyOS73mb+i4RtjW9+4r2Cne3FgKYu8fpV0ZhlSAvo=;
 b=VWsLTcQzgtLPiuOyD71CEuPKRGCytraaWNJE+ji+b1fPcj1KgbprshYj1MZWe3qZSs
 RmvzmcgqxRx28yLoi4PLVtGaYTh5kQBZ0sN/0lwFe2mndDS5tluyD3IRlfG5IutyGq2s
 Oxkwij+HuUUGG6SzILEACqp4R6jvF56bTTzEv+VQ8g8ovQkmpCw9Vg1SbvLCC5CLSl1V
 svKvdiyGTmRblX8MFkaBdTPoFIx4qUkJfBvtygXVJ+wWEN6AJAGBV4QzMCAKXQATEagm
 34dDgnmD6Zwt+cfxh2Eb8VDxfW8C3jVmZHapvJaZwYb7FRd3B0Qqv0QhMmssCo3idWP3
 jo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mjNyOS73mb+i4RtjW9+4r2Cne3FgKYu8fpV0ZhlSAvo=;
 b=xx+fqJcrajh6pl0qH6YXSRp1477mSiagAiaUymv9rctJczUDkWL1mH9W+vM6uROsso
 x7tUTsi5OXnBzyuEjwL73m4gm6Vc7sHqZOWJgCqT35r9b21OS4GT5nkiJ/zwY4oDYWpR
 eCyAM9PnJNjTxNSDPJMVRcnjoSie+BYmqUHx9iaNRde+ipkC2qsjJcmQogSzRu3IM5mH
 fJRXlGY7APfodSteyzoHXimtWX6MkD48QsK7yMxwRahoFC9AC+IZlkTkhRrH7Nq8P7v1
 w5RDE3fmUs1ixLrZoyWJpCGEKa7bPHBTIjFvjRlugB6eBZAH78g+SJHrwzS1r9f6ylms
 EL1A==
X-Gm-Message-State: AOAM531xfFVX1okUXiUHk3eNBAubBa0NzQUx7g7VQRZ6NbVD4Z9YdOTe
 Qg0xAFON7sL6Vg9D/oM7phk+s1K7Kj8=
X-Google-Smtp-Source: ABdhPJxbJUSwoj3XuUyLCO5SbzUtiwn3MgQColazEN06FZqPQBLj6+PdRL/t1DZTisOY5FpEM/IbFg==
X-Received: by 2002:a17:90b:3846:b0:1c6:841b:7470 with SMTP id
 nl6-20020a17090b384600b001c6841b7470mr3000364pjb.193.1647518545296; 
 Thu, 17 Mar 2022 05:02:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a056a00238a00b004f79504efc1sm6736619pfc.214.2022.03.17.05.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 05:02:24 -0700 (PDT)
Message-ID: <3c581089-9abb-6576-1c94-28108206ebff@gmail.com>
Date: Thu, 17 Mar 2022 13:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v3 2/2] ui/cocoa: run qemu_init in the main
 thread
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
 <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 12:56, Philippe Mathieu-Daudé wrote:
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   softmmu/main.c |  12 +++---
>   ui/cocoa.m     | 114 ++++++++++++++++++++-----------------------------
>   2 files changed, 54 insertions(+), 72 deletions(-)

> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 027c3053f7..2e5130d805 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,14 +100,13 @@ static int last_buttons;
>   static int cursor_hide = 1;
>   static int left_command_key_enabled = 1;
>   static bool swap_opt_cmd;
> +static bool full_screen;
> +static bool full_grab;
> +static bool have_cocoa_ui;
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
> @@ -115,6 +114,7 @@ static QemuClipboardInfo *cbinfo;
>   static QemuClipboardPeer cbpeer;
>   static QemuCocoaPasteboardTypeOwner *cbowner;
>   static QemuEvent cbevent;
> +static QemuThread main_thread;

This variable doesn't need to be in global scope, I'll
move it to applicationDidFinishLaunching().

> @@ -1323,8 +1310,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
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
> +    qemu_thread_create(&main_thread, "qemu_main_loop", call_qemu_main_loop,
> +                       NULL, QEMU_THREAD_DETACHED);
> +
> +    if (full_screen) {
> +        [NSApp activateIgnoringOtherApps: YES];
> +        [self toggleFullScreen: nil];
> +    }
> +    if (full_grab) {
> +        [self setFullGrab: nil];
> +    }
>   }

