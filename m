Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48BE2DF1D0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 22:34:24 +0100 (CET)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqjrr-0008CE-FJ
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 16:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqjpN-0007EU-AW
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 16:31:49 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:54801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqjnm-0007ot-H4
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 16:31:49 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MrQ2R-1kKeqI1waV-00oTxw; Sat, 19 Dec 2020 22:30:05 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-3-pbonzini@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 02/45] vl: remove separate preconfig main_loop
Message-ID: <e28196a5-2221-fcd6-c497-f7c595e2c3e0@vivier.eu>
Date: Sat, 19 Dec 2020 22:30:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215175445.1272776-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2FYnISeUw+x4jmnRrhngbIOgN20dGWk1M+uqohXPNcrxvDn7HU/
 YtgIsgtGcZTjx5wuZt+pgQBxOCrlLx4egVNDSktL0gn61fVt3mgzAJCleAyGRDim849vcGV
 WWmDPFVGDjCzq0h7oDBRFKsnMRunZnM2QIowI2wc21RbAlxs7M8YAB8o+SPLLX5LrZi6o1v
 PeNfJYvR6LYCDanOd7+Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pgB6S1+r0v8=:73VrRZkrY2TjchObKyTWaI
 XMJkmvQUx3/3wbc/U7owq0u73Lkfx75GRtfAUgfTXymKaiCBEB5ajoh7UbhyzkEZlyYumCify
 MYG8SeA0K57TV+cSjreubYdJJUE2KFnc8qTCHiUFx+k3upeGjYIBFUi82BshgeEIyJVdngF0V
 BkYSg+fuSnmTlJaPcEfpntZVCjsNO/QM/Ojt8bDv0+brKq5M5Tgc/ElA5RHUPRbLT7vYNyJ2J
 +gepqk4RD9JS8zn1P4mLSBgTEky6nZ/aK1HNlIKBh3bf+1IxV//eBLZNp/8fZ5MHbStjB2Ad0
 mSvS23vfPqdt+yfzfshn4wtico2/OPzI7tuxcQDMlB9RiWNUyVaP90AigiQN0s2t4C3ZM+U9g
 BBczCuFtHDk/5AusrK6Yy+DZMtRb63m6peyZyhvzVl2fyswmD1Q2vIW+LPc8F7qf+qUdnlED2
 gIznjY8Gaw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/12/2020 à 18:54, Paolo Bonzini a écrit :
> Move post-preconfig initialization to the x-exit-preconfig.  If preconfig
> is not requested, just exit preconfig mode immediately with the QMP
> command.
> 
> As a result, the preconfig loop will run with accel_setup_post
> and os_setup_post restrictions (xen_restrict, chroot, etc.)
> already done.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/sysemu/runstate.h |  1 -
>  monitor/qmp-cmds.c        |  9 ----
>  softmmu/vl.c              | 95 +++++++++++++++++----------------------
>  3 files changed, 41 insertions(+), 64 deletions(-)

Moving the qemu_init_displays() before qemu_create_cli_devices() breaks the display when the graphic
card is provided by the cli.

Try:

qemu-system-x86_64 -device virtio-gpu-pci

-> we don't have any display, only the parallel port output...

Then:

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0ed5c5ba9348..2f198e0023e0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2525,6 +2525,7 @@ void qmp_x_exit_preconfig(Error **errp)

     qemu_init_board();
     qemu_create_cli_devices();
+    qemu_init_displays();
     qemu_machine_creation_done();

     if (loadvm) {
@@ -3529,7 +3530,6 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(0);
     }

-    qemu_init_displays();
     if (!preconfig_requested) {
         qmp_x_exit_preconfig(&error_fatal);
     }

and then re-try:

qemu-system-x86_64 -device virtio-gpu-pci

-> we have the BIOS boot screen.

Any idea?

Thanks,
Laurent


> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index f760094858..e557f470d4 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -41,7 +41,6 @@ typedef enum WakeupReason {
>      QEMU_WAKEUP_REASON_OTHER,
>  } WakeupReason;
>  
> -void qemu_exit_preconfig_request(void);
>  void qemu_system_reset_request(ShutdownCause reason);
>  void qemu_system_suspend_request(void);
>  void qemu_register_suspend_notifier(Notifier *notifier);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 639a219294..d141aaa132 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -102,15 +102,6 @@ void qmp_system_powerdown(Error **errp)
>      qemu_system_powerdown_request();
>  }
>  
> -void qmp_x_exit_preconfig(Error **errp)
> -{
> -    if (qdev_hotplug) {
> -        error_setg(errp, "The command is permitted only before machine initialization");
> -        return;
> -    }
> -    qemu_exit_preconfig_request();
> -}
> -
>  void qmp_cont(Error **errp)
>  {
>      BlockBackend *blk;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ab2210bc79..abbbb83e1a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1151,7 +1151,6 @@ static pid_t shutdown_pid;
>  static int powerdown_requested;
>  static int debug_requested;
>  static int suspend_requested;
> -static bool preconfig_exit_requested = true;
>  static WakeupReason wakeup_reason;
>  static NotifierList powerdown_notifiers =
>      NOTIFIER_LIST_INITIALIZER(powerdown_notifiers);
> @@ -1238,11 +1237,6 @@ static int qemu_debug_requested(void)
>      return r;
>  }
>  
> -void qemu_exit_preconfig_request(void)
> -{
> -    preconfig_exit_requested = true;
> -}
> -
>  /*
>   * Reset the VM. Issue an event unless @reason is SHUTDOWN_CAUSE_NONE.
>   */
> @@ -1464,10 +1458,6 @@ static bool main_loop_should_exit(void)
>      RunState r;
>      ShutdownCause request;
>  
> -    if (preconfig_exit_requested) {
> -        preconfig_exit_requested = false;
> -        return true;
> -    }
>      if (qemu_debug_requested()) {
>          vm_stop(RUN_STATE_DEBUG);
>      }
> @@ -3283,6 +3273,43 @@ static void qemu_machine_creation_done(void)
>      register_global_state();
>  }
>  
> +void qmp_x_exit_preconfig(Error **errp)
> +{
> +    if (qdev_hotplug) {
> +        error_setg(errp, "The command is permitted only before machine initialization");
> +        return;
> +    }
> +
> +    qemu_init_board();
> +    qemu_create_cli_devices();
> +    qemu_machine_creation_done();
> +
> +    if (loadvm) {
> +        Error *local_err = NULL;
> +        if (load_snapshot(loadvm, &local_err) < 0) {
> +            error_report_err(local_err);
> +            autostart = 0;
> +            exit(1);
> +        }
> +    }
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        replay_vmstate_init();
> +    }
> +
> +    if (incoming) {
> +        Error *local_err = NULL;
> +        if (strcmp(incoming, "defer") != 0) {
> +            qmp_migrate_incoming(incoming, &local_err);
> +            if (local_err) {
> +                error_reportf_err(local_err, "-incoming %s: ", incoming);
> +                exit(1);
> +            }
> +        }
> +    } else if (autostart) {
> +        qmp_cont(NULL);
> +    }
> +}
> +
>  void qemu_init(int argc, char **argv, char **envp)
>  {
>      QemuOpts *opts;
> @@ -3847,7 +3874,6 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  break;
>              case QEMU_OPTION_preconfig:
> -                preconfig_exit_requested = false;
>                  preconfig_requested = true;
>                  break;
>              case QEMU_OPTION_enable_kvm:
> @@ -4272,57 +4298,18 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_resolve_machine_memdev();
>      parse_numa_opts(current_machine);
>  
> -    if (preconfig_requested) {
> -        qemu_init_displays();
> -    }
> -
> -    /* do monitor/qmp handling at preconfig state if requested */
> -    qemu_main_loop();
> -
> -    qemu_init_board();
> -
> -    qemu_create_cli_devices();
> -
> -    /* initialize displays after all errors have been reported */
> -    if (!preconfig_requested) {
> -        qemu_init_displays();
> -    }
> -    qemu_machine_creation_done();
> -
> -    if (loadvm) {
> -        Error *local_err = NULL;
> -        if (load_snapshot(loadvm, &local_err) < 0) {
> -            error_report_err(local_err);
> -            autostart = 0;
> -            exit(1);
> -        }
> -    }
> -    if (replay_mode != REPLAY_MODE_NONE) {
> -        replay_vmstate_init();
> -    }
> -
>      if (vmstate_dump_file) {
>          /* dump and exit */
>          dump_vmstate_json_to_file(vmstate_dump_file);
>          exit(0);
>      }
> -    if (incoming) {
> -        Error *local_err = NULL;
> -        if (strcmp(incoming, "defer") != 0) {
> -            qmp_migrate_incoming(incoming, &local_err);
> -            if (local_err) {
> -                error_reportf_err(local_err, "-incoming %s: ", incoming);
> -                exit(1);
> -            }
> -        }
> -    } else if (autostart) {
> -        qmp_cont(NULL);
> -    }
>  
> +    qemu_init_displays();
> +    if (!preconfig_requested) {
> +        qmp_x_exit_preconfig(&error_fatal);
> +    }
>      accel_setup_post(current_machine);
>      os_setup_post();
> -
> -    return;
>  }
>  
>  void qemu_cleanup(void)
> 


