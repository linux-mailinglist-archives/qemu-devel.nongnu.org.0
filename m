Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DDE5E6048
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:58:48 +0200 (CEST)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJup-00017J-5B
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obJPd-0000hB-J2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obJPZ-00055h-Js
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663842388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ys/nl/1i9xmm8xNNBIq5UO2Smh6k2Pwxk/NygLdf4jk=;
 b=UkdPQ+RsEimYLqaUtjVNtkssfHVhik9cCy8GLxfu2NNuLNkfD6CxbJIba1AzAM1Oms2VLL
 K1gX6/6pb0LsGawQ+oHh4APlXRZ4uFKzDFZY7XVYHjeoPQuTautEWvxxsEdbzUnlfDzWmj
 mXYjkzAb2hw/0zGRlCimvVmAI2s8qFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-aEPl_YyeNzm4QJgfAN7n9Q-1; Thu, 22 Sep 2022 06:26:27 -0400
X-MC-Unique: aEPl_YyeNzm4QJgfAN7n9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so586555wml.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ys/nl/1i9xmm8xNNBIq5UO2Smh6k2Pwxk/NygLdf4jk=;
 b=GtXcJPMkk7bVj5ruPQ1tDciao7DDBLYhA3dMq6qjQsrWfGWT4ajU1q4aMw5QpCDYAt
 yNvGGrCGJKwW41aPklEcBYvhuv/+ynniMpiFNOW/Q05qXcAulTJQno2g53/WmG+WYaDm
 racHPzDA4OTIgypC36bMuEJ63ULXa3GUjsNf+fclN6ruP0tlHmf45IYe8mMkX5Ylv/Id
 AHylFk3aES9iFr1V/aJhfVSQ7voPKwSKPtaqJYykkltyjUuFC7HWVuA3gnnpsad+oXAy
 1y+qoSwa8afvbOZRQcu/XpanXhlG1TmL19bjemln38IYT9cRXVT1m4WEv2DSxKS9CX9g
 ufXg==
X-Gm-Message-State: ACrzQf3CxXeL1OQJHA6Jaariyxc6L2lxWazb9wMtqC71JWxK43nCsbqV
 Z7YD1hYhVTcQgC9/ljEAwBzqS4aXKPDjJQdCb1dKALKCn1PUYTRr7malPkF9o9mNMo5BjaM5zNi
 MhXJCHrfgMv5+aIw=
X-Received: by 2002:adf:fe08:0:b0:22b:311:afcd with SMTP id
 n8-20020adffe08000000b0022b0311afcdmr1562173wrr.629.1663842385961; 
 Thu, 22 Sep 2022 03:26:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hx2IbP2+byM7Gy0AqGsN7hPHj/nXrhTDgzC5EBG7Bbbc+iZely7GHkjD+D7K+vFkL0TWt9g==
X-Received: by 2002:adf:fe08:0:b0:22b:311:afcd with SMTP id
 n8-20020adffe08000000b0022b0311afcdmr1562105wrr.629.1663842384558; 
 Thu, 22 Sep 2022 03:26:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a3170a7af9sm7295901wmq.4.2022.09.22.03.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:26:23 -0700 (PDT)
Message-ID: <498e32cb-1bc5-1ca1-11cb-52647e56e51c@redhat.com>
Date: Thu, 22 Sep 2022 12:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] watchdog: remove -watchdog option
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220922092955.220029-1-pbonzini@redhat.com>
Cc: Libvirt <libvir-list@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220922092955.220029-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/09/2022 11.29, Paolo Bonzini wrote:
> This was deprecated in 6.2 and is ready to go.  It removes quite a bit
> of code that handled the registration of watchdog models.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       |  5 ----
>   docs/about/removed-features.rst |  5 ++++
>   hw/watchdog/sbsa_gwdt.c         |  6 -----
>   hw/watchdog/watchdog.c          | 45 ---------------------------------
>   hw/watchdog/wdt_aspeed.c        |  6 -----
>   hw/watchdog/wdt_diag288.c       |  6 -----
>   hw/watchdog/wdt_i6300esb.c      |  6 -----
>   hw/watchdog/wdt_ib700.c         |  6 -----
>   hw/watchdog/wdt_imx2.c          |  6 -----
>   include/sysemu/watchdog.h       | 12 ---------
>   qemu-options.hx                 | 33 ++----------------------
>   softmmu/vl.c                    | 16 ------------
>   12 files changed, 7 insertions(+), 145 deletions(-)

Nice clean-up!

Reviewed-by: Thomas Huth <thuth@redhat.com>

> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a72fedba5f..93affe3669 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -81,11 +81,6 @@ the process listing. This is replaced by the new ``password-secret``
>   option which lets the password be securely provided on the command
>   line using a ``secret`` object instance.
>   
> -``-watchdog`` (since 6.2)
> -'''''''''''''''''''''''''
> -
> -Use ``-device`` instead.
> -
>   ``-smp`` ("parameter=0" SMP configurations) (since 6.2)
>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index a4aa3dca69..63df9848fd 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -403,6 +403,11 @@ Sound card devices should be created using ``-device`` or ``-audio``.
>   The exception is ``pcspk`` which can be activated using ``-machine
>   pcspk-audiodev=<name>``.
>   
> +``-watchdog`` (since 7.2)
> +'''''''''''''''''''''''''
> +
> +Use ``-device`` instead.
> +
>   
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index e49cacd0e2..7aa57a8c51 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -24,11 +24,6 @@
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = TYPE_WDT_SBSA,
> -    .wdt_description = "SBSA-compliant generic watchdog device",
> -};
> -
>   static const VMStateDescription vmstate_sbsa_gwdt = {
>       .name = "sbsa-gwdt",
>       .version_id = 1,
> @@ -287,7 +282,6 @@ static const TypeInfo wdt_sbsa_gwdt_info = {
>   
>   static void wdt_sbsa_gwdt_register_types(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&wdt_sbsa_gwdt_info);
>   }
>   
> diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
> index 1437e6c5b6..b132546516 100644
> --- a/hw/watchdog/watchdog.c
> +++ b/hw/watchdog/watchdog.c
> @@ -31,51 +31,6 @@
>   #include "hw/nmi.h"
>   #include "qemu/help_option.h"
>   
> -static WatchdogAction watchdog_action = WATCHDOG_ACTION_RESET;
> -static QLIST_HEAD(, WatchdogTimerModel) watchdog_list;
> -
> -void watchdog_add_model(WatchdogTimerModel *model)
> -{
> -    QLIST_INSERT_HEAD(&watchdog_list, model, entry);
> -}
> -
> -/* Returns:
> - *   0 = continue
> - *   1 = exit program with error
> - *   2 = exit program without error
> - */
> -int select_watchdog(const char *p)
> -{
> -    WatchdogTimerModel *model;
> -    QemuOpts *opts;
> -
> -    /* -watchdog ? lists available devices and exits cleanly. */
> -    if (is_help_option(p)) {
> -        QLIST_FOREACH(model, &watchdog_list, entry) {
> -            fprintf(stderr, "\t%s\t%s\n",
> -                     model->wdt_name, model->wdt_description);
> -        }
> -        return 2;
> -    }
> -
> -    QLIST_FOREACH(model, &watchdog_list, entry) {
> -        if (strcasecmp(model->wdt_name, p) == 0) {
> -            /* add the device */
> -            opts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
> -                                    &error_abort);
> -            qemu_opt_set(opts, "driver", p, &error_abort);
> -            return 0;
> -        }
> -    }
> -
> -    fprintf(stderr, "Unknown -watchdog device. Supported devices are:\n");
> -    QLIST_FOREACH(model, &watchdog_list, entry) {
> -        fprintf(stderr, "\t%s\t%s\n",
> -                 model->wdt_name, model->wdt_description);
> -    }
> -    return 1;
> -}
> -
>   WatchdogAction get_watchdog_action(void)
>   {
>       return watchdog_action;
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 31855afdf4..d753693a2e 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -202,11 +202,6 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>       return;
>   }
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = TYPE_ASPEED_WDT,
> -    .wdt_description = "Aspeed watchdog device",
> -};
> -
>   static const VMStateDescription vmstate_aspeed_wdt = {
>       .name = "vmstate_aspeed_wdt",
>       .version_id = 0,
> @@ -416,7 +411,6 @@ static const TypeInfo aspeed_1030_wdt_info = {
>   
>   static void wdt_aspeed_register_types(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&aspeed_wdt_info);
>       type_register_static(&aspeed_2400_wdt_info);
>       type_register_static(&aspeed_2500_wdt_info);
> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
> index 9e8882a11c..76d89fbf78 100644
> --- a/hw/watchdog/wdt_diag288.c
> +++ b/hw/watchdog/wdt_diag288.c
> @@ -19,11 +19,6 @@
>   #include "migration/vmstate.h"
>   #include "qemu/log.h"
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = TYPE_WDT_DIAG288,
> -    .wdt_description = "diag288 device for s390x platform",
> -};
> -
>   static const VMStateDescription vmstate_diag288 = {
>       .name = "vmstate_diag288",
>       .version_id = 0,
> @@ -138,7 +133,6 @@ static const TypeInfo wdt_diag288_info = {
>   
>   static void wdt_diag288_register_types(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&wdt_diag288_info);
>   }
>   
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index f99a1c9d29..5693ec6a09 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -457,11 +457,6 @@ static void i6300esb_exit(PCIDevice *dev)
>       timer_free(d->timer);
>   }
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = "i6300esb",
> -    .wdt_description = "Intel 6300ESB",
> -};
> -
>   static void i6300esb_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -493,7 +488,6 @@ static const TypeInfo i6300esb_info = {
>   
>   static void i6300esb_register_types(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&i6300esb_info);
>   }
>   
> diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
> index 91d1bdc0da..b116c3a3aa 100644
> --- a/hw/watchdog/wdt_ib700.c
> +++ b/hw/watchdog/wdt_ib700.c
> @@ -128,11 +128,6 @@ static void wdt_ib700_reset(DeviceState *dev)
>       timer_del(s->timer);
>   }
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = "ib700",
> -    .wdt_description = "iBASE 700",
> -};
> -
>   static void wdt_ib700_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -153,7 +148,6 @@ static const TypeInfo wdt_ib700_info = {
>   
>   static void wdt_ib700_register_types(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&wdt_ib700_info);
>   }
>   
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index c3128370b5..e776a2fbd4 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -291,14 +291,8 @@ static const TypeInfo imx2_wdt_info = {
>       .class_init    = imx2_wdt_class_init,
>   };
>   
> -static WatchdogTimerModel model = {
> -    .wdt_name = "imx2-watchdog",
> -    .wdt_description = "i.MX2 Watchdog",
> -};
> -
>   static void imx2_wdt_register_type(void)
>   {
> -    watchdog_add_model(&model);
>       type_register_static(&imx2_wdt_info);
>   }
>   type_init(imx2_wdt_register_type)
> diff --git a/include/sysemu/watchdog.h b/include/sysemu/watchdog.h
> index d2d4901dbb..745c89b02b 100644
> --- a/include/sysemu/watchdog.h
> +++ b/include/sysemu/watchdog.h
> @@ -25,20 +25,8 @@
>   #include "qemu/queue.h"
>   #include "qapi/qapi-types-run-state.h"
>   
> -struct WatchdogTimerModel {
> -    QLIST_ENTRY(WatchdogTimerModel) entry;
> -
> -    /* Short name of the device - used to select it on the command line. */
> -    const char *wdt_name;
> -    /* Longer description (eg. manufacturer and full model number). */
> -    const char *wdt_description;
> -};
> -typedef struct WatchdogTimerModel WatchdogTimerModel;
> -
>   /* in hw/watchdog.c */
> -int select_watchdog(const char *p);
>   WatchdogAction get_watchdog_action(void);
> -void watchdog_add_model(WatchdogTimerModel *model);
>   void watchdog_perform_action(void);
>   
>   #endif /* QEMU_WATCHDOG_H */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d8b5ce5b43..df4b8c8f1a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4330,7 +4330,7 @@ SRST
>   
>       ``-action panic=none``
>       ``-action reboot=shutdown,shutdown=pause``
> -    ``-watchdog i6300esb -action watchdog=pause``
> +    ``-device i6300esb -action watchdog=pause``
>   
>   ERST
>   
> @@ -4448,35 +4448,6 @@ SRST
>       specifies the snapshot name used to load the initial VM state.
>   ERST
>   
> -DEF("watchdog", HAS_ARG, QEMU_OPTION_watchdog, \
> -    "-watchdog model\n" \
> -    "                enable virtual hardware watchdog [default=none]\n",
> -    QEMU_ARCH_ALL)
> -SRST
> -``-watchdog model``
> -    Create a virtual hardware watchdog device. Once enabled (by a guest
> -    action), the watchdog must be periodically polled by an agent inside
> -    the guest or else the guest will be restarted. Choose a model for
> -    which your guest has drivers.
> -
> -    The model is the model of hardware watchdog to emulate. Use
> -    ``-watchdog help`` to list available hardware models. Only one
> -    watchdog can be enabled for a guest.
> -
> -    The following models may be available:
> -
> -    ``ib700``
> -        iBASE 700 is a very simple ISA watchdog with a single timer.
> -
> -    ``i6300esb``
> -        Intel 6300ESB I/O controller hub is a much more featureful
> -        PCI-based dual-timer watchdog.
> -
> -    ``diag288``
> -        A virtual watchdog for s390x backed by the diagnose 288
> -        hypercall (currently KVM only).
> -ERST
> -
>   DEF("watchdog-action", HAS_ARG, QEMU_OPTION_watchdog_action, \
>       "-watchdog-action reset|shutdown|poweroff|inject-nmi|pause|debug|none\n" \
>       "                action when watchdog fires [default=reset]\n",
> @@ -4498,7 +4469,7 @@ SRST
>   
>       Examples:
>   
> -    ``-watchdog i6300esb -watchdog-action pause``; \ ``-watchdog ib700``
> +    ``-device i6300esb -watchdog-action pause``
>   
>   ERST
>   
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index e62b9cc35d..b8788e765a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -53,7 +53,6 @@
>   #include "hw/isa/isa.h"
>   #include "hw/scsi/scsi.h"
>   #include "hw/display/vga.h"
> -#include "sysemu/watchdog.h"
>   #include "hw/firmware/smbios.h"
>   #include "hw/acpi/acpi.h"
>   #include "hw/xen/xen.h"
> @@ -181,7 +180,6 @@ static Chardev **serial_hds;
>   static const char *log_mask;
>   static const char *log_file;
>   static bool list_data_dirs;
> -static const char *watchdog;
>   static const char *qtest_chrdev;
>   static const char *qtest_log;
>   
> @@ -2329,12 +2327,6 @@ static void qemu_process_sugar_options(void)
>           }
>           object_register_sugar_prop("memory-backend", "prealloc", "on", false);
>       }
> -
> -    if (watchdog) {
> -        int i = select_watchdog(watchdog);
> -        if (i > 0)
> -            exit (i == 1 ? 1 : 0);
> -    }
>   }
>   
>   /* -action processing */
> @@ -3107,14 +3099,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                       default_monitor = 0;
>                   }
>                   break;
> -            case QEMU_OPTION_watchdog:
> -                if (watchdog) {
> -                    error_report("only one watchdog option may be given");
> -                    exit(1);
> -                }
> -                warn_report("-watchdog is deprecated; use -device instead.");
> -                watchdog = optarg;
> -                break;
>               case QEMU_OPTION_action:
>                   olist = qemu_find_opts("action");
>                   if (!qemu_opts_parse_noisily(olist, optarg, false)) {


