Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C7456F80
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:23:13 +0100 (CET)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo3rE-0002Lo-9j
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:23:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3mE-00072K-KE
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:18:02 -0500
Received: from [2607:f8b0:4864:20::12d] (port=36563
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3mB-0000Ai-Sv
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:18:02 -0500
Received: by mail-il1-x12d.google.com with SMTP id l8so10204864ilv.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TBOI4QySL8z7m5lpYeqUumm+yUmzEExHN/u3+WZGKk=;
 b=dXe8zWTkUaDzjtOLvJqKJCw049AD2gPLaUKkaLW4ZXgMBVkfGLaXkT2A0QQBUmN8xR
 G6DS3tNscaHcQa4YtF8OUFWB8ays4rFYveRADDLoC8Qgdf33/s1jgzo9cVigynxN+K7w
 0ExqkF9anEHg5VAj5ZKEDLolTYATo/R6pS+1dl1EOuqhG6w937RbtXmmdSFedGvjQ/j1
 bUw8YjiEejfEqEH7h3jwl6HehHhuk+U3v4g2s3aM4aMEYQij4B5BgbgVeUSkKYBiRH54
 ckkO5dhVmu5N+xtuFAox+meKZmgiqseBXEchdc9h9tquWI5m/l+tHRlcvr80RewZu6VB
 vDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TBOI4QySL8z7m5lpYeqUumm+yUmzEExHN/u3+WZGKk=;
 b=mQ61w71EhWsUeQuNJ9NtkwmWh3eoU1PpLP0TuJx3jf7fdgjhDp1+2JVtGiOyosyo03
 PvaT8vC2uMn8Ij7/985Y0n8ihK6OEJlM8dw6i7gBU8PR1XLu+lLLLdOxPc0BXmcUKMp8
 L1u0Sv06Hc/9K4QuD/qkIGJ4vwfMOXUZypY+Jp5Okaa08eWvEr6UigEUrTtrG8x8+cRN
 OOmtjJhDUrSDWNlGS8GJLz/OugGEn7iOX0T1mSeYMeh9bh0GUoi4NuQ6sn/fEBkR1edU
 v7/KWBF604Su9bMyMcs20aCKwqHx1i0cEXewr1/Yp/89aQh5A/53wYYw3Qd/UhleAFaW
 sa8A==
X-Gm-Message-State: AOAM532C+QORknOrIL1pHX/6dkfakcVVuj8NWMA+RTNatct34Q9aogb3
 FoRbZACLhREB28ZEWHFJh1fALwH6J2G+7UuWAk4=
X-Google-Smtp-Source: ABdhPJxBvOHhUL6wc14vEeRhyja9Rw8edhyuneofu24wp6s7jbNtGhQX2DACaPvKlexpwn09Sw+DymaMjnOlVbHOrZ8=
X-Received: by 2002:a05:6e02:1e02:: with SMTP id
 g2mr4869354ila.290.1637327877923; 
 Fri, 19 Nov 2021 05:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <20211117144703.16305-2-damien.hedde@greensocs.com>
In-Reply-To: <20211117144703.16305-2-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:17:30 +1000
Message-ID: <CAKmqyKPDntVfFDvDZHi=ieF2CbSuCeThMzTYBE0BexumEp6NZw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] rename MachineInitPhase enum constants for
 QAPI compatibility
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 12:49 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> This commit is a preparation to switch to a QAPI definition
> of the MachineInitPhase enum.
>
> QAPI will generate enumeration constants prefixed with the
> MACHINE_INIT_PHASE_, so rename values accordingly.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/qdev-core.h     | 10 +++++-----
>  hw/core/machine-qmp-cmds.c |  2 +-
>  hw/core/machine.c          |  6 +++---
>  hw/core/qdev.c             |  2 +-
>  hw/pci/pci.c               |  2 +-
>  hw/usb/core.c              |  2 +-
>  hw/virtio/virtio-iommu.c   |  2 +-
>  monitor/hmp.c              |  2 +-
>  softmmu/qdev-monitor.c     |  9 +++++----
>  softmmu/vl.c               |  6 +++---
>  ui/console.c               |  3 ++-
>  11 files changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 20d3066595..ef2d612d39 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -849,30 +849,30 @@ bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp);
>
>  typedef enum MachineInitPhase {
>      /* current_machine is NULL.  */
> -    PHASE_NO_MACHINE,
> +    MACHINE_INIT_PHASE_NO_MACHINE,
>
>      /* current_machine is not NULL, but current_machine->accel is NULL.  */
> -    PHASE_MACHINE_CREATED,
> +    MACHINE_INIT_PHASE_MACHINE_CREATED,
>
>      /*
>       * current_machine->accel is not NULL, but the machine properties have
>       * not been validated and machine_class->init has not yet been called.
>       */
> -    PHASE_ACCEL_CREATED,
> +    MACHINE_INIT_PHASE_ACCEL_CREATED,
>
>      /*
>       * machine_class->init has been called, thus creating any embedded
>       * devices and validating machine properties.  Devices created at
>       * this time are considered to be cold-plugged.
>       */
> -    PHASE_MACHINE_INITIALIZED,
> +    MACHINE_INIT_PHASE_INITIALIZED,
>
>      /*
>       * QEMU is ready to start CPUs and devices created at this time
>       * are considered to be hot-plugged.  The monitor is not restricted
>       * to "preconfig" commands.
>       */
> -    PHASE_MACHINE_READY,
> +    MACHINE_INIT_PHASE_READY,
>  } MachineInitPhase;
>
>  extern bool phase_check(MachineInitPhase phase);
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 4f4ab30f8c..ddbdc5212f 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -148,7 +148,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
>
>  void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>  {
> -    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> +    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
>          error_setg(errp, "The command is permitted only before the machine has been created");
>          return;
>      }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 26ec54e726..8560bb4c42 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1178,7 +1178,7 @@ void machine_run_board_init(MachineState *machine)
>
>      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
>      machine_class->init(machine);
> -    phase_advance(PHASE_MACHINE_INITIALIZED);
> +    phase_advance(MACHINE_INIT_PHASE_INITIALIZED);
>  }
>
>  static NotifierList machine_init_done_notifiers =
> @@ -1187,7 +1187,7 @@ static NotifierList machine_init_done_notifiers =
>  void qemu_add_machine_init_done_notifier(Notifier *notify)
>  {
>      notifier_list_add(&machine_init_done_notifiers, notify);
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
>          notify->notify(notify, NULL);
>      }
>  }
> @@ -1210,7 +1210,7 @@ void qdev_machine_creation_done(void)
>       * ok, initial machine setup is done, starting from now we can
>       * only create hotpluggable devices
>       */
> -    phase_advance(PHASE_MACHINE_READY);
> +    phase_advance(MACHINE_INIT_PHASE_READY);
>      qdev_assert_realized_properly();
>
>      /* TODO: once all bus devices are qdevified, this should be done
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..ccfd6f0dc4 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -674,7 +674,7 @@ static void device_initfn(Object *obj)
>  {
>      DeviceState *dev = DEVICE(obj);
>
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
>          dev->hotplugged = 1;
>          qdev_hot_added = true;
>      }
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e5993c1ef5..f77d9e8d57 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1102,7 +1102,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>      address_space_init(&pci_dev->bus_master_as,
>                         &pci_dev->bus_master_container_region, pci_dev->name);
>
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
>          pci_init_bus_master(pci_dev);
>      }
>      pci_dev->irq_state = 0;
> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index 975f76250a..7a9a81c4fe 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
>      USBDevice *dev = ep->dev;
>      USBBus *bus = usb_bus_from_device(dev);
>
> -    if (!phase_check(PHASE_MACHINE_READY)) {
> +    if (!phase_check(MACHINE_INIT_PHASE_READY)) {
>          /*
>           * This is machine init cold plug.  No need to wakeup anyone,
>           * all devices will be reset anyway.  And trying to wakeup can
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1b23e8e18c..b777a80be2 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -948,7 +948,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>       * accept it. Having a different masks is possible but the guest will use
>       * sub-optimal block sizes, so warn about it.
>       */
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
>          int new_granule = ctz64(new_mask);
>          int cur_granule = ctz64(cur_mask);
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index b20737e63c..3275e7aeed 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -217,7 +217,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
>
>  static bool cmd_available(const HMPCommand *cmd)
>  {
> -    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
> +    return phase_check(MACHINE_INIT_PHASE_READY) || cmd_can_preconfig(cmd);
>  }
>
>  static void help_cmd_dump_one(Monitor *mon,
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..1d6a1c4716 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -250,7 +250,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>
>      dc = DEVICE_CLASS(oc);
>      if (!dc->user_creatable ||
> -        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
> +        (phase_check(MACHINE_INIT_PHASE_READY) && !dc->hotpluggable)) {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
>                     "a pluggable device type");
>          return NULL;
> @@ -660,7 +660,8 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>          return NULL;
>      }
>
> -    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY) && bus &&
> +        !qbus_is_hotpluggable(bus)) {
>          error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
>          return NULL;
>      }
> @@ -674,7 +675,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>      dev = qdev_new(driver);
>
>      /* Check whether the hotplug is allowed by the machine */
> -    if (phase_check(PHASE_MACHINE_READY)) {
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
>          if (!qdev_hotplug_allowed(dev, errp)) {
>              goto err_del_dev;
>          }
> @@ -1040,7 +1041,7 @@ int qemu_global_option(const char *str)
>
>  bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>  {
> -    if (!phase_check(PHASE_MACHINE_READY) &&
> +    if (!phase_check(MACHINE_INIT_PHASE_READY) &&
>          !(cmd->options & QCO_ALLOW_PRECONFIG)) {
>          error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
>                     cmd->name);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1159a64bce..df19b911e6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2732,7 +2732,7 @@ static void qemu_machine_creation_done(void)
>
>  void qmp_x_exit_preconfig(Error **errp)
>  {
> -    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
> +    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
>          error_setg(errp, "The command is permitted only before machine initialization");
>          return;
>      }
> @@ -3715,14 +3715,14 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_apply_legacy_machine_options(machine_opts_dict);
>      qemu_apply_machine_options(machine_opts_dict);
>      qobject_unref(machine_opts_dict);
> -    phase_advance(PHASE_MACHINE_CREATED);
> +    phase_advance(MACHINE_INIT_PHASE_MACHINE_CREATED);
>
>      /*
>       * Note: uses machine properties such as kernel-irqchip, must run
>       * after qemu_apply_machine_options.
>       */
>      configure_accelerators(argv[0]);
> -    phase_advance(PHASE_ACCEL_CREATED);
> +    phase_advance(MACHINE_INIT_PHASE_ACCEL_CREATED);
>
>      /*
>       * Beware, QOM objects created before this point miss global and
> diff --git a/ui/console.c b/ui/console.c
> index 29a3e3f0f5..df66536a79 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1295,7 +1295,8 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
>      if (QTAILQ_EMPTY(&consoles)) {
>          s->index = 0;
>          QTAILQ_INSERT_TAIL(&consoles, s, next);
> -    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
> +    } else if (console_type != GRAPHIC_CONSOLE ||
> +               phase_check(MACHINE_INIT_PHASE_READY)) {
>          QemuConsole *last = QTAILQ_LAST(&consoles);
>          s->index = last->index + 1;
>          QTAILQ_INSERT_TAIL(&consoles, s, next);
> --
> 2.33.0
>
>

