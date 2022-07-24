Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E457F756
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 00:31:05 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFk7s-0007Tw-7M
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 18:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFk4M-0005LD-Sh
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:27:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFk4K-0005De-Uo
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 18:27:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ru18so2883618pjb.0
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NKgfey2sjF2IUE60n6hqAFuEXkyq3XyheCC8MmBlijk=;
 b=nsOG8jLjhhQm6itoa3G6nOgbXqA0sE4JujXBqIuGxTCofASfibzuTJ/1AQykmGQMiq
 iqJKqFZyGawPC12FwRa8pbD7Pxhxx8j1pcnXQSDGNu87MfyAXrX2wnFup3WCasNkHY/7
 o57CTQSGZQO+OmvVL1Ck3ECkrwD95LuUBw67jA+SS7KaS7dhVQW2hmab+De4Qd8St5EU
 ci4dVu3Jp0xtUE1QPZmY7GrUA0VJ3ZR66LP9/grh6bErCZc5zku9kyulWuoWdCEy27JH
 Tufv8z4eaCP934kVS9TOcAty50vKRlx8JX1nWd/Ci8eO87P9jC8EPaYgzFnKxY7Hdx4W
 iFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NKgfey2sjF2IUE60n6hqAFuEXkyq3XyheCC8MmBlijk=;
 b=PlUqS1Hq9csgNZ6raIB4RPj1VTxt+7HEkrJ+1y0qiR1THuscIFlnQjelW5s0yO8asv
 fm0KpN364Nwcdw0R/Sn5TUC9WgaGZjsYWubSH0uIR5t8+PJJwGpjaNHTC3vOJEFGcrJh
 +l51jF/0uu4qd5M/XAXr0/bKwDMcghOM2XmcGMTq/y38KDjSdenY1U2kymNwUXgZAF+Y
 Y7dGOrJ0kPltVfWaglYxHBLUCgMc1/Ri0x7Kkc3N89zbdoe/cuaqQrFEKEH+fSTWVuQY
 7jT68vmboOo9VkXDpa1Ojw1kY99RreygvbJ2YQCSw+v/pOauiPKRPRj8nscO648M7PHU
 aKZA==
X-Gm-Message-State: AJIora/WXk16Y0VVjK+2/QRTnrKtW81YWafo4bgbhWzmmZBANp+LneXq
 GygAvpuOmzSlxDFOpZztXRSCEA==
X-Google-Smtp-Source: AGRyM1tM+M8sZMluE/GoivHTS6alKkj9AScfv/rwfpQsCuvHs8qHvKTKRCpvPDRRH2/KWnIyebXMvA==
X-Received: by 2002:a17:902:e749:b0:16c:3d6f:aba3 with SMTP id
 p9-20020a170902e74900b0016c3d6faba3mr9474048plf.135.1658701643064; 
 Sun, 24 Jul 2022 15:27:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:ef1e:c8e:be06:74d0?
 ([2602:ae:1549:801:ef1e:c8e:be06:74d0])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a62f846000000b005289ffefe82sm7955684pfm.130.2022.07.24.15.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 15:27:22 -0700 (PDT)
Message-ID: <cd5acc65-ad8c-5811-022f-a552b52ba233@linaro.org>
Date: Sun, 24 Jul 2022 15:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] qapi: Add exit-failure PanicAction
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
 <20220722233614.7254-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220722233614.7254-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/23/22 05:06, Ilya Leoshkevich wrote:
> Currently QEMU exits with code 0 on both panic an shutdown. For tests
> it is useful to return 1 on panic, so that it counts as a test
> failure.
> 
> Introduce a new exit-failure PanicAction that makes main() return
> EXIT_FAILURE. Tests can use -action panic=exit-failure option to
> activate this behavior.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

I like it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   include/sysemu/sysemu.h |  2 +-
>   qapi/run-state.json     |  4 +++-
>   qemu-options.hx         |  2 +-
>   softmmu/main.c          |  6 ++++--
>   softmmu/runstate.c      | 17 +++++++++++++----
>   5 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 812f66a31a..31aa45160b 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -103,7 +103,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
>   bool defaults_enabled(void);
>   
>   void qemu_init(int argc, char **argv, char **envp);
> -void qemu_main_loop(void);
> +int qemu_main_loop(void);
>   void qemu_cleanup(void);
>   
>   extern QemuOptsList qemu_legacy_drive_opts;
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 6e2162d7b3..d42c370c4f 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -364,10 +364,12 @@
>   #
>   # @shutdown: Shutdown the VM and exit, according to the shutdown action
>   #
> +# @exit-failure: Shutdown the VM and exit with nonzero status
> +#
>   # Since: 6.0
>   ##
>   { 'enum': 'PanicAction',
> -  'data': [ 'pause', 'shutdown', 'none' ] }
> +  'data': [ 'pause', 'shutdown', 'exit-failure', 'none' ] }
>   
>   ##
>   # @watchdog-set-action:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 79e00916a1..8e17c5064a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4239,7 +4239,7 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
>       "                   action when guest reboots [default=reset]\n"
>       "-action shutdown=poweroff|pause\n"
>       "                   action when guest shuts down [default=poweroff]\n"
> -    "-action panic=pause|shutdown|none\n"
> +    "-action panic=pause|shutdown|exit-failure|none\n"
>       "                   action when guest panics [default=shutdown]\n"
>       "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
>       "                   action when watchdog fires [default=reset]\n",
> diff --git a/softmmu/main.c b/softmmu/main.c
> index c00432ff09..1b675a8c03 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -32,11 +32,13 @@
>   
>   int qemu_main(int argc, char **argv, char **envp)
>   {
> +    int status;
> +
>       qemu_init(argc, argv, envp);
> -    qemu_main_loop();
> +    status = qemu_main_loop();
>       qemu_cleanup();
>   
> -    return 0;
> +    return status;
>   }
>   
>   #ifndef CONFIG_COCOA
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 168e1b78a0..1e68680b9d 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -482,7 +482,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
>           qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
>                                           !!info, info);
>           vm_stop(RUN_STATE_GUEST_PANICKED);
> -    } else if (panic_action == PANIC_ACTION_SHUTDOWN) {
> +    } else if (panic_action == PANIC_ACTION_SHUTDOWN ||
> +               panic_action == PANIC_ACTION_EXIT_FAILURE) {
>           qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
>                                          !!info, info);
>           vm_stop(RUN_STATE_GUEST_PANICKED);
> @@ -662,7 +663,7 @@ void qemu_system_debug_request(void)
>       qemu_notify_event();
>   }
>   
> -static bool main_loop_should_exit(void)
> +static bool main_loop_should_exit(int *status)
>   {
>       RunState r;
>       ShutdownCause request;
> @@ -680,6 +681,10 @@ static bool main_loop_should_exit(void)
>           if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
>               vm_stop(RUN_STATE_SHUTDOWN);
>           } else {
> +            if (request == SHUTDOWN_CAUSE_GUEST_PANIC &&
> +                panic_action == PANIC_ACTION_EXIT_FAILURE) {
> +                *status = EXIT_FAILURE;
> +            }
>               return true;
>           }
>       }
> @@ -715,12 +720,14 @@ static bool main_loop_should_exit(void)
>       return false;
>   }
>   
> -void qemu_main_loop(void)
> +int qemu_main_loop(void)
>   {
> +    int status = EXIT_SUCCESS;
>   #ifdef CONFIG_PROFILER
>       int64_t ti;
>   #endif
> -    while (!main_loop_should_exit()) {
> +
> +    while (!main_loop_should_exit(&status)) {
>   #ifdef CONFIG_PROFILER
>           ti = profile_getclock();
>   #endif
> @@ -729,6 +736,8 @@ void qemu_main_loop(void)
>           dev_time += profile_getclock() - ti;
>   #endif
>       }
> +
> +    return status;
>   }
>   
>   void qemu_add_exit_notifier(Notifier *notify)


