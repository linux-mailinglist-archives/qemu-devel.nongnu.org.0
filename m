Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B92D14C1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:34:11 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIWg-00050r-5L
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmIRU-0002cJ-4f
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:28:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmIRD-0005N5-6A
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607354909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wahxTperPWagNI6N7QumS3h7aObH8i9XCSmj1GaPFoc=;
 b=KPISOMaW8kxXhoMiNdkzLcLZ1O7gWw9Wquym6fmEAU9PDX9rcn/jmO/E/M1FhE3Ev6GvmN
 sysoYgAYKwuc8vxRg7B/+k6rlxjKLsekESgsWJCXaP3fkblvtQreScqRZtdyFob8q638iw
 ozsOsU5levZWNKcqlMQQDqDqRTk2NQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-y5BDewvMOp6ayuQhHxrOEg-1; Mon, 07 Dec 2020 10:28:26 -0500
X-MC-Unique: y5BDewvMOp6ayuQhHxrOEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F513A0C24
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 15:28:12 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D01FC19C59;
 Mon,  7 Dec 2020 15:28:10 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:28:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/15] machine: introduce MachineInitPhase
Message-ID: <20201207162809.7b6d8962@redhat.com>
In-Reply-To: <20201202081854.4126071-9-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-9-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Dec 2020 03:18:47 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Generalize the qdev_hotplug variable to the different phases of
> machine initialization.  We would like to allow different
> monitor commands depending on the phase.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine-qmp-cmds.c |  6 +++---
>  hw/core/machine.c          |  8 +++-----
>  hw/core/qdev.c             | 16 ++++++++++++++--
>  hw/pci/pci.c               |  2 +-
>  hw/usb/core.c              |  2 +-
>  hw/virtio/virtio-iommu.c   |  2 +-
>  include/hw/qdev-core.h     | 32 +++++++++++++++++++++++++++++++-
>  monitor/hmp.c              |  2 +-
>  softmmu/qdev-monitor.c     | 24 +++++++++++++-----------
>  softmmu/vl.c               |  9 ++++-----
>  ui/console.c               |  2 +-
>  11 files changed, 73 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index cb9387c5f5..87f14140a3 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -286,9 +286,9 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
>  
>  void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>  {
> -    if (qdev_hotplug) {
> -         error_setg(errp, "The command is permitted only before the machine has been created");
> -         return;
> +    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> +        error_setg(errp, "The command is permitted only before the machine has been created");
> +        return;
>      }
>  
>      set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 40876ddd8e..2c0bc15143 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1171,17 +1171,16 @@ void machine_run_board_init(MachineState *machine)
>      }
>  
>      machine_class->init(machine);
> +    phase_advance(PHASE_MACHINE_INITIALIZED);
>  }
>  
>  static NotifierList machine_init_done_notifiers =
>      NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
>  
> -static bool machine_init_done;
> -
>  void qemu_add_machine_init_done_notifier(Notifier *notify)
>  {
>      notifier_list_add(&machine_init_done_notifiers, notify);
> -    if (machine_init_done) {
> +    if (phase_check(PHASE_MACHINE_READY)) {
>          notify->notify(notify, NULL);
>      }
>  }
> @@ -1204,7 +1203,7 @@ void qdev_machine_creation_done(void)
>       * ok, initial machine setup is done, starting from now we can
>       * only create hotpluggable devices
>       */
> -    qdev_hotplug = true;
> +    phase_advance(PHASE_MACHINE_READY);
>      qdev_assert_realized_properly();
>  
>      /* TODO: once all bus devices are qdevified, this should be done
> @@ -1219,7 +1218,6 @@ void qdev_machine_creation_done(void)
>       */
>      qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
>  
> -    machine_init_done = true;
>      notifier_list_notify(&machine_init_done_notifiers, NULL);
>  
>      if (rom_check_and_register_reset() != 0) {
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index bc5df8ce69..beb35879c6 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -41,7 +41,6 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  
> -bool qdev_hotplug = false;
>  static bool qdev_hot_added = false;
>  bool qdev_hot_removed = false;
>  
> @@ -1023,7 +1022,7 @@ static void device_initfn(Object *obj)
>  {
>      DeviceState *dev = DEVICE(obj);
>  
> -    if (qdev_hotplug) {
> +    if (phase_check(PHASE_MACHINE_READY)) {
>          dev->hotplugged = 1;
>          qdev_hot_added = true;
>      }
> @@ -1267,6 +1266,19 @@ Object *qdev_get_machine(void)
>      return dev;
>  }
>  
> +static MachineInitPhase machine_phase;
> +
> +bool phase_check(MachineInitPhase phase)
> +{
> +    return machine_phase >= phase;
> +}
> +
> +void phase_advance(MachineInitPhase phase)
> +{
> +    assert(machine_phase == phase - 1);
> +    machine_phase = phase;
> +}
> +
>  static const TypeInfo device_type_info = {
>      .name = TYPE_DEVICE,
>      .parent = TYPE_OBJECT,
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 9424231542..d4349ea577 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1062,7 +1062,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>      address_space_init(&pci_dev->bus_master_as,
>                         &pci_dev->bus_master_container_region, pci_dev->name);
>  
> -    if (qdev_hotplug) {
> +    if (phase_check(PHASE_MACHINE_READY)) {
>          pci_init_bus_master(pci_dev);
>      }
>      pci_dev->irq_state = 0;
> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index 5234dcc73f..e960036f4d 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
>      USBDevice *dev = ep->dev;
>      USBBus *bus = usb_bus_from_device(dev);
>  
> -    if (!qdev_hotplug) {
> +    if (!phase_check(PHASE_MACHINE_READY)) {
>          /*
>           * This is machine init cold plug.  No need to wakeup anyone,
>           * all devices will be reset anyway.  And trying to wakeup can
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index fc5c75d693..8370fd80d7 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -928,7 +928,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>       * accept it. Having a different masks is possible but the guest will use
>       * sub-optimal block sizes, so warn about it.
>       */
> -    if (qdev_hotplug) {
> +    if (phase_check(PHASE_MACHINE_READY)) {
>          int new_granule = ctz64(new_mask);
>          int cur_granule = ctz64(cur_mask);
>  
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 6446846752..12612ed682 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -821,7 +821,6 @@ Object *qdev_get_machine(void);
>  /* FIXME: make this a link<> */
>  bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
>  
> -extern bool qdev_hotplug;
>  extern bool qdev_hot_removed;
>  
>  char *qdev_get_dev_path(DeviceState *dev);
> @@ -847,4 +846,35 @@ void device_listener_unregister(DeviceListener *listener);
>   */
>  bool qdev_should_hide_device(QemuOpts *opts);
>  
> +typedef enum MachineInitPhase {
> +    /* current_machine is NULL.  */
> +    PHASE_NO_MACHINE,
> +
> +    /* current_machine is not NULL, but current_machine->accel is NULL.  */
> +    PHASE_MACHINE_CREATED,
> +
> +    /*
> +     * current_machine->accel is not NULL, but the machine properties have
> +     * not been validated and machine_class->init has not yet been called.
> +     */
> +    PHASE_ACCEL_CREATED,
> +
> +    /*
> +     * machine_class->init has been called, thus creating any embedded
> +     * devices and validating machine properties.  Devices created at
> +     * this time are considered to be cold-plugged.
> +     */
> +    PHASE_MACHINE_INITIALIZED,
> +
> +    /*
> +     * QEMU is ready to start CPUs and devices created at this time
> +     * are considered to be hot-plugged.  The monitor is not restricted
> +     * to "preconfig" commands.
> +     */
> +    PHASE_MACHINE_READY,
> +} MachineInitPhase;
> +
> +extern bool phase_check(MachineInitPhase phase);
> +extern void phase_advance(MachineInitPhase phase);
> +
>  #endif
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index f2fe192d69..6c0b33a0b1 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -216,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
>  
>  static bool cmd_available(const HMPCommand *cmd)
>  {
> -    return qdev_hotplug || cmd_can_preconfig(cmd);
> +    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
>  }
>  
>  static void help_cmd_dump_one(Monitor *mon,
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index e967d13bd0..184fe317af 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -244,7 +244,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>  
>      dc = DEVICE_CLASS(oc);
>      if (!dc->user_creatable ||
> -        (qdev_hotplug && !dc->hotpluggable)) {
> +        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
>                     "pluggable device type");
>          return NULL;
> @@ -637,7 +637,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>      }
>      hide = should_hide_device(opts);
>  
> -    if ((hide || qdev_hotplug) && bus && !qbus_is_hotpluggable(bus)) {
> +    if ((hide || phase_check(PHASE_MACHINE_READY)) && bus && !qbus_is_hotpluggable(bus)) {
>          error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
>          return NULL;
>      }
> @@ -655,15 +655,17 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>      dev = qdev_new(driver);
>  
>      /* Check whether the hotplug is allowed by the machine */
> -    if (qdev_hotplug && !qdev_hotplug_allowed(dev, errp)) {
> -        goto err_del_dev;
> -    }
> +    if (phase_check(PHASE_MACHINE_READY)) {
> +        if (!qdev_hotplug_allowed(dev, errp)) {
> +            goto err_del_dev;
> +        }
>  
> -    if (!bus && qdev_hotplug && !qdev_get_machine_hotplug_handler(dev)) {
> -        /* No bus, no machine hotplug handler --> device is not hotpluggable */
> -        error_setg(errp, "Device '%s' can not be hotplugged on this machine",
> -                   driver);
> -        goto err_del_dev;
> +        if (!bus && !qdev_get_machine_hotplug_handler(dev)) {
> +            /* No bus, no machine hotplug handler --> device is not hotpluggable */
> +            error_setg(errp, "Device '%s' can not be hotplugged on this machine",
> +                       driver);
> +            goto err_del_dev;
> +        }
>      }
>  
>      qdev_set_id(dev, qemu_opts_id(opts));
> @@ -1001,7 +1003,7 @@ int qemu_global_option(const char *str)
>  
>  bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>  {
> -    if (!qdev_hotplug &&
> +    if (!phase_check(PHASE_MACHINE_READY) &&
>          !(cmd->options & QCO_ALLOW_PRECONFIG)) {
>          error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
>                     cmd->name);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 8e18c52f6e..4fece1b9db 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2406,10 +2406,6 @@ static void qemu_init_displays(void)
>      }
>  }
>  
> -/*
> - * Called after leaving preconfig state.  From here on runstate is
> - * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
> - */
>  static void qemu_init_board(void)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
> @@ -2424,6 +2420,7 @@ static void qemu_init_board(void)
>          exit(1);
>      }
>  
> +    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
>      machine_run_board_init(current_machine);
>  
>      /*
> @@ -2490,7 +2487,7 @@ static void qemu_machine_creation_done(void)
>  
>  void qmp_x_exit_preconfig(Error **errp)
>  {
> -    if (qdev_hotplug) {
> +    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
>          error_setg(errp, "The command is permitted only before machine initialization");
>          return;
>      }
> @@ -3469,12 +3466,14 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_create_early_backends();
>  
>      qemu_apply_machine_options();
> +    phase_advance(PHASE_MACHINE_CREATED);
>  
>      /*
>       * Note: uses machine properties such as kernel-irqchip, must run
>       * after machine_set_property().
>       */
>      configure_accelerators(argv[0]);
> +    phase_advance(PHASE_ACCEL_CREATED);
>  
>      /*
>       * Beware, QOM objects created before this point miss global and
> diff --git a/ui/console.c b/ui/console.c
> index 53dee8e26b..89f625116d 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1345,7 +1345,7 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
>      if (QTAILQ_EMPTY(&consoles)) {
>          s->index = 0;
>          QTAILQ_INSERT_TAIL(&consoles, s, next);
> -    } else if (console_type != GRAPHIC_CONSOLE || qdev_hotplug) {
> +    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
>          QemuConsole *last = QTAILQ_LAST(&consoles);
>          s->index = last->index + 1;
>          QTAILQ_INSERT_TAIL(&consoles, s, next);


