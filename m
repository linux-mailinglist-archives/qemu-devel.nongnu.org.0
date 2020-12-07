Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFEE2D1370
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:20:57 +0100 (CET)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHNo-0005nq-7G
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmHF4-0006rP-L1
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:11:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmHF1-0004CB-Kp
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607350310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFEUth/cGI9AUGR8K5LF8ewNld0919Ky1oKlhQoWUrk=;
 b=FbgTkjqKmGfiyDZejuXCOoiR7s7gGIY28eg9r2Tcuku97Op+QKQU5+wU7U8aiZcscY0OUf
 mudaAZKiN+Ilx30R7xKbbDrYhkyjOpswiPbpPY60QDzB3jGEkzvVAuoUT0PHv//Y0DLUg9
 PlVjWuePWyYC12OxMhbtoBYiyUyDM+8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-f_E7kRZ9OBGxO2w9Ovyy9A-1; Mon, 07 Dec 2020 09:11:48 -0500
X-MC-Unique: f_E7kRZ9OBGxO2w9Ovyy9A-1
Received: by mail-pf1-f197.google.com with SMTP id v138so3567688pfc.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 06:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFEUth/cGI9AUGR8K5LF8ewNld0919Ky1oKlhQoWUrk=;
 b=aHlraBD8JZuFiWsv9x5wPpx3ScnmeH/WMSuWyOx7TCOIv2CoqDFY33hl67Bl9S2Z+i
 uLhwNJifZxdejAxJdAxwLQautgBPLJRzN3SGVtKUD0KAx+b3boJJSHg11ny8e9g4kHKk
 m98uYEUB2jqcumdBEViAmVurhC1QPBTn4B0avW2+ik6umo1YWAW3vnIGQvSR85m8tnzQ
 z995XDSV57bhPA1wb9VF+97B5H/zGtgRV+rcRGtA7UGyGMGlUx+maDg7AzTtLI7IL4u2
 t79uSIej7nBPHzCMZRPVhy1ttXUot8eM6joSnP6qiXMvjRpXBeofA9uHEWIZNI84tgmo
 nZMw==
X-Gm-Message-State: AOAM530NHSgMDXJTXmYl6z79od7/bbyNXnUStoI+zHbKSraB78gxS2Z/
 FKVI+NbkU+LeJUn2ifWGnTbm7oElZ69aUTIh9cInzGrj+uWEdObFM4a2Ipr6mFT4hc1oDPe1AlS
 yvJJ+UUsZ+YMTBAGcP1DXGvuedrYqP2Q=
X-Received: by 2002:a63:dc44:: with SMTP id f4mr18289976pgj.281.1607350306029; 
 Mon, 07 Dec 2020 06:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAj7zoiMVUJpLTD3B9KFdgnRu9Gg4TKc5lTZpensiUkjGGbX2vfKa4N/2yYSqgt/tnR9Xh1jaTFPwLJvkptcE=
X-Received: by 2002:a63:dc44:: with SMTP id f4mr18289962pgj.281.1607350305790; 
 Mon, 07 Dec 2020 06:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-2-pbonzini@redhat.com>
 <20201207145705.0d5e20ea@redhat.com>
In-Reply-To: <20201207145705.0d5e20ea@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 7 Dec 2020 15:11:34 +0100
Message-ID: <CABgObfaA72vumhcUi04wEUEmgcFrW01jFxnS_OstycV61VrLmg@mail.gmail.com>
Subject: Re: [PATCH 01/15] remove preconfig state
To: Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000001b78605b5e068aa"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001b78605b5e068aa
Content-Type: text/plain; charset="UTF-8"

Il lun 7 dic 2020, 14:57 Igor Mammedov <imammedo@redhat.com> ha scritto:

> On Wed,  2 Dec 2020 03:18:40 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> > The preconfig state is only used if -incoming is not specified, which
> > makes the RunState state machine more tricky than it need be.  However
> > there is already an equivalent condition which works even with -incoming,
> > namely qdev_hotplug.  Use it instead of a separate runstate.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/core/machine-qmp-cmds.c    |  5 ++---
> >  include/qapi/qmp/dispatch.h   |  1 +
> >  monitor/hmp.c                 |  7 ++++---
> >  monitor/qmp-cmds.c            |  5 ++---
> >  qapi/qmp-dispatch.c           |  5 +----
> >  qapi/run-state.json           |  5 +----
> >  softmmu/qdev-monitor.c        | 12 ++++++++++++
> >  softmmu/vl.c                  | 13 ++-----------
> >  stubs/meson.build             |  1 +
> >  stubs/qmp-command-available.c |  7 +++++++
> >  tests/qtest/qmp-test.c        |  2 +-
> >  11 files changed, 34 insertions(+), 29 deletions(-)
> >  create mode 100644 stubs/qmp-command-available.c
> >
> > diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> > index 5362c80a18..cb9387c5f5 100644
> > --- a/hw/core/machine-qmp-cmds.c
> > +++ b/hw/core/machine-qmp-cmds.c
> > @@ -286,9 +286,8 @@ HotpluggableCPUList
> *qmp_query_hotpluggable_cpus(Error **errp)
> >
> >  void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
> >  {
> > -    if (!runstate_check(RUN_STATE_PRECONFIG)) {
> > -        error_setg(errp, "The command is permitted only in '%s' state",
> > -                   RunState_str(RUN_STATE_PRECONFIG));
> > +    if (qdev_hotplug) {
> it's too late for qmp_set_numa_node(), but given it's temporary
> and patch 8/15 changes it to correct state it should be fine.
> so
>
>   Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>

It's too late according to the fine grained distinction of phases that will
be introduced later. For the two phases that are possible with current QEMU
(before or after preconfig) it should be indistinguishable, right?

Paolo


>
> > +         error_setg(errp, "The command is permitted only before the
> machine has been created");
> >           return;
> >      }
> >
> > diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> > index af8d96c570..1486cac3ef 100644
> > --- a/include/qapi/qmp/dispatch.h
> > +++ b/include/qapi/qmp/dispatch.h
> > @@ -48,6 +48,7 @@ void qmp_disable_command(QmpCommandList *cmds, const
> char *name);
> >  void qmp_enable_command(QmpCommandList *cmds, const char *name);
> >
> >  bool qmp_command_is_enabled(const QmpCommand *cmd);
> > +bool qmp_command_available(const QmpCommand *cmd, Error **errp);
> >  const char *qmp_command_name(const QmpCommand *cmd);
> >  bool qmp_has_success_response(const QmpCommand *cmd);
> >  QDict *qmp_error_response(Error *err);
> > diff --git a/monitor/hmp.c b/monitor/hmp.c
> > index d40f4f4391..f2fe192d69 100644
> > --- a/monitor/hmp.c
> > +++ b/monitor/hmp.c
> > @@ -24,6 +24,7 @@
> >
> >  #include "qemu/osdep.h"
> >  #include <dirent.h>
> > +#include "hw/qdev-core.h"
> >  #include "monitor-internal.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qmp/qdict.h"
> > @@ -215,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
> >
> >  static bool cmd_available(const HMPCommand *cmd)
> >  {
> > -    return !runstate_check(RUN_STATE_PRECONFIG) ||
> cmd_can_preconfig(cmd);
> > +    return qdev_hotplug || cmd_can_preconfig(cmd);
> >  }
> >
> >  static void help_cmd_dump_one(Monitor *mon,
> > @@ -658,8 +659,8 @@ static const HMPCommand
> *monitor_parse_command(MonitorHMP *hmp_mon,
> >          return NULL;
> >      }
> >      if (!cmd_available(cmd)) {
> > -        monitor_printf(mon, "Command '%.*s' not available with
> -preconfig "
> > -                            "until after exit_preconfig.\n",
> > +        monitor_printf(mon, "Command '%.*s' not available "
> > +                            "until machine initialization has
> completed.\n",
> >                         (int)(p - cmdp_start), cmdp_start);
> >          return NULL;
> >      }
> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > index 6299c0c8c7..501a3024c7 100644
> > --- a/monitor/qmp-cmds.c
> > +++ b/monitor/qmp-cmds.c
> > @@ -104,9 +104,8 @@ void qmp_system_powerdown(Error **errp)
> >
> >  void qmp_x_exit_preconfig(Error **errp)
> >  {
> > -    if (!runstate_check(RUN_STATE_PRECONFIG)) {
> > -        error_setg(errp, "The command is permitted only in '%s' state",
> > -                   RunState_str(RUN_STATE_PRECONFIG));
> > +    if (qdev_hotplug) {
> > +        error_setg(errp, "The command is permitted only before machine
> initialization");
> >          return;
> >      }
> >      qemu_exit_preconfig_request();
> > diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> > index 9a2d7dd29a..0a2b20a4e4 100644
> > --- a/qapi/qmp-dispatch.c
> > +++ b/qapi/qmp-dispatch.c
> > @@ -167,10 +167,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
> >          goto out;
> >      }
> >
> > -    if (runstate_check(RUN_STATE_PRECONFIG) &&
> > -        !(cmd->options & QCO_ALLOW_PRECONFIG)) {
> > -        error_setg(&err, "The command '%s' isn't permitted in '%s'
> state",
> > -                   cmd->name, RunState_str(RUN_STATE_PRECONFIG));
> > +    if (!qmp_command_available(cmd, &err)) {
> >          goto out;
> >      }
> >
> > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > index 964c8ef391..38194b0e44 100644
> > --- a/qapi/run-state.json
> > +++ b/qapi/run-state.json
> > @@ -50,15 +50,12 @@
> >  # @colo: guest is paused to save/restore VM state under colo checkpoint,
> >  #        VM can not get into this state unless colo capability is
> enabled
> >  #        for migration. (since 2.8)
> > -# @preconfig: QEMU is paused before board specific init callback is
> executed.
> > -#             The state is reachable only if the --preconfig CLI option
> is used.
> > -#             (Since 3.0)
> >  ##
> >  { 'enum': 'RunState',
> >    'data': [ 'debug', 'inmigrate', 'internal-error', 'io-error',
> 'paused',
> >              'postmigrate', 'prelaunch', 'finish-migrate', 'restore-vm',
> >              'running', 'save-vm', 'shutdown', 'suspended', 'watchdog',
> > -            'guest-panicked', 'colo', 'preconfig' ] }
> > +            'guest-panicked', 'colo' ] }
> >
> >  ##
> >  # @ShutdownCause:
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index d060e765da..e967d13bd0 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -25,6 +25,7 @@
> >  #include "sysemu/arch_init.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-commands-qdev.h"
> > +#include "qapi/qmp/dispatch.h"
> >  #include "qapi/qmp/qdict.h"
> >  #include "qapi/qmp/qerror.h"
> >  #include "qemu/config-file.h"
> > @@ -997,3 +998,14 @@ int qemu_global_option(const char *str)
> >
> >      return 0;
> >  }
> > +
> > +bool qmp_command_available(const QmpCommand *cmd, Error **errp)
> > +{
> > +    if (!qdev_hotplug &&
> > +        !(cmd->options & QCO_ALLOW_PRECONFIG)) {
> > +        error_setg(errp, "The command '%s' is permitted only after
> machine initialization has completed",
> > +                   cmd->name);
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 7146fbe219..ab2210bc79 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -557,7 +557,7 @@ static int default_driver_check(void *opaque,
> QemuOpts *opts, Error **errp)
> >  /***********************************************************/
> >  /* QEMU state */
> >
> > -static RunState current_run_state = RUN_STATE_PRECONFIG;
> > +static RunState current_run_state = RUN_STATE_PRELAUNCH;
> >
> >  /* We use RUN_STATE__MAX but any invalid value will do */
> >  static RunState vmstop_requested = RUN_STATE__MAX;
> > @@ -569,13 +569,7 @@ typedef struct {
> >  } RunStateTransition;
> >
> >  static const RunStateTransition runstate_transitions_def[] = {
> > -    /*     from      ->     to      */
> > -    { RUN_STATE_PRECONFIG, RUN_STATE_PRELAUNCH },
> > -      /* Early switch to inmigrate state to allow  -incoming CLI option
> work
> > -       * as it used to. TODO: delay actual switching to inmigrate state
> to
> > -       * the point after machine is built and remove this hack.
> > -       */
> > -    { RUN_STATE_PRECONFIG, RUN_STATE_INMIGRATE },
> > +    { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> >
> >      { RUN_STATE_DEBUG, RUN_STATE_RUNNING },
> >      { RUN_STATE_DEBUG, RUN_STATE_FINISH_MIGRATE },
> > @@ -1471,9 +1465,6 @@ static bool main_loop_should_exit(void)
> >      ShutdownCause request;
> >
> >      if (preconfig_exit_requested) {
> > -        if (runstate_check(RUN_STATE_PRECONFIG)) {
> > -            runstate_set(RUN_STATE_PRELAUNCH);
> > -        }
> >          preconfig_exit_requested = false;
> >          return true;
> >      }
> > diff --git a/stubs/meson.build b/stubs/meson.build
> > index 82b7ba60ab..cc56c83063 100644
> > --- a/stubs/meson.build
> > +++ b/stubs/meson.build
> > @@ -29,6 +29,7 @@ stub_ss.add(files('pci-bus.c'))
> >  stub_ss.add(files('pci-host-piix.c'))
> >  stub_ss.add(files('qemu-timer-notify-cb.c'))
> >  stub_ss.add(files('qmp_memory_device.c'))
> > +stub_ss.add(files('qmp-command-available.c'))
> >  stub_ss.add(files('qtest.c'))
> >  stub_ss.add(files('ram-block.c'))
> >  stub_ss.add(files('ramfb.c'))
> > diff --git a/stubs/qmp-command-available.c
> b/stubs/qmp-command-available.c
> > new file mode 100644
> > index 0000000000..46540af7bf
> > --- /dev/null
> > +++ b/stubs/qmp-command-available.c
> > @@ -0,0 +1,7 @@
> > +#include "qemu/osdep.h"
> > +#include "qapi/qmp/dispatch.h"
> > +
> > +bool qmp_command_available(const QmpCommand *cmd, Error **errp)
> > +{
> > +    return true;
> > +}
> > diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> > index eb1cd8abb8..11614bf63f 100644
> > --- a/tests/qtest/qmp-test.c
> > +++ b/tests/qtest/qmp-test.c
> > @@ -295,7 +295,7 @@ static void test_qmp_preconfig(void)
> >      rsp = qtest_qmp(qs, "{ 'execute': 'query-status' }");
> >      ret = qdict_get_qdict(rsp, "return");
> >      g_assert(ret);
> > -    g_assert_cmpstr(qdict_get_try_str(ret, "status"), ==, "preconfig");
> > +    g_assert_cmpstr(qdict_get_try_str(ret, "status"), ==, "prelaunch");
> >      qobject_unref(rsp);
> >
> >      /* exit preconfig state */
>
>

--00000000000001b78605b5e068aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 7 dic 2020, 14:57 Igor Mammedov &lt;<a href=3D"=
mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Wed,=C2=A0 2 Dec 2020 03:18:40 -0500<br=
>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
<br>
&gt; The preconfig state is only used if -incoming is not specified, which<=
br>
&gt; makes the RunState state machine more tricky than it need be.=C2=A0 Ho=
wever<br>
&gt; there is already an equivalent condition which works even with -incomi=
ng,<br>
&gt; namely qdev_hotplug.=C2=A0 Use it instead of a separate runstate.<br>
&gt; <br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/core/machine-qmp-cmds.c=C2=A0 =C2=A0 |=C2=A0 5 ++---<br>
&gt;=C2=A0 include/qapi/qmp/dispatch.h=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 monitor/hmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 ++++---<br>
&gt;=C2=A0 monitor/qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 5 ++---<br>
&gt;=C2=A0 qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +----<br>
&gt;=C2=A0 qapi/run-state.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +----<br>
&gt;=C2=A0 softmmu/qdev-monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++++++=
+++<br>
&gt;=C2=A0 softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 13 ++-----------<br>
&gt;=C2=A0 stubs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 stubs/qmp-command-available.c |=C2=A0 7 +++++++<br>
&gt;=C2=A0 tests/qtest/qmp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
&gt;=C2=A0 11 files changed, 34 insertions(+), 29 deletions(-)<br>
&gt;=C2=A0 create mode 100644 stubs/qmp-command-available.c<br>
&gt; <br>
&gt; diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c<b=
r>
&gt; index 5362c80a18..cb9387c5f5 100644<br>
&gt; --- a/hw/core/machine-qmp-cmds.c<br>
&gt; +++ b/hw/core/machine-qmp-cmds.c<br>
&gt; @@ -286,9 +286,8 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(E=
rror **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (!runstate_check(RUN_STATE_PRECONFIG)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is per=
mitted only in &#39;%s&#39; state&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
RunState_str(RUN_STATE_PRECONFIG));<br>
&gt; +=C2=A0 =C2=A0 if (qdev_hotplug) {<br>
it&#39;s too late for qmp_set_numa_node(), but given it&#39;s temporary<br>
and patch 8/15 changes it to correct state it should be fine.<br>
so<br>
<br>
=C2=A0 Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">imammedo@redhat.com</a>&gt;<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s =
too late according to the fine grained distinction of phases that will be i=
ntroduced later. For the two phases that are possible with current QEMU (be=
fore or after preconfig) it should be indistinguishable, right?</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;The command =
is permitted only before the machine has been created&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h=
<br>
&gt; index af8d96c570..1486cac3ef 100644<br>
&gt; --- a/include/qapi/qmp/dispatch.h<br>
&gt; +++ b/include/qapi/qmp/dispatch.h<br>
&gt; @@ -48,6 +48,7 @@ void qmp_disable_command(QmpCommandList *cmds, const=
 char *name);<br>
&gt;=C2=A0 void qmp_enable_command(QmpCommandList *cmds, const char *name);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 bool qmp_command_is_enabled(const QmpCommand *cmd);<br>
&gt; +bool qmp_command_available(const QmpCommand *cmd, Error **errp);<br>
&gt;=C2=A0 const char *qmp_command_name(const QmpCommand *cmd);<br>
&gt;=C2=A0 bool qmp_has_success_response(const QmpCommand *cmd);<br>
&gt;=C2=A0 QDict *qmp_error_response(Error *err);<br>
&gt; diff --git a/monitor/hmp.c b/monitor/hmp.c<br>
&gt; index d40f4f4391..f2fe192d69 100644<br>
&gt; --- a/monitor/hmp.c<br>
&gt; +++ b/monitor/hmp.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 #include &lt;dirent.h&gt;<br>
&gt; +#include &quot;hw/qdev-core.h&quot;<br>
&gt;=C2=A0 #include &quot;monitor-internal.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; @@ -215,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cm=
d)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static bool cmd_available(const HMPCommand *cmd)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return !runstate_check(RUN_STATE_PRECONFIG) || cmd_can_=
preconfig(cmd);<br>
&gt; +=C2=A0 =C2=A0 return qdev_hotplug || cmd_can_preconfig(cmd);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void help_cmd_dump_one(Monitor *mon,<br>
&gt; @@ -658,8 +659,8 @@ static const HMPCommand *monitor_parse_command(Mon=
itorHMP *hmp_mon,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!cmd_available(cmd)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_printf(mon, &quot;Command &#39;%.=
*s&#39; not available with -preconfig &quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;until after exit_preconfig.\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_printf(mon, &quot;Command &#39;%.=
*s&#39; not available &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;until machine initialization has complet=
ed.\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(int)(p - cmdp_start), cmdp_start);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
&gt; index 6299c0c8c7..501a3024c7 100644<br>
&gt; --- a/monitor/qmp-cmds.c<br>
&gt; +++ b/monitor/qmp-cmds.c<br>
&gt; @@ -104,9 +104,8 @@ void qmp_system_powerdown(Error **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void qmp_x_exit_preconfig(Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 if (!runstate_check(RUN_STATE_PRECONFIG)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is per=
mitted only in &#39;%s&#39; state&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
RunState_str(RUN_STATE_PRECONFIG));<br>
&gt; +=C2=A0 =C2=A0 if (qdev_hotplug) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command is per=
mitted only before machine initialization&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_exit_preconfig_request();<br>
&gt; diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
&gt; index 9a2d7dd29a..0a2b20a4e4 100644<br>
&gt; --- a/qapi/qmp-dispatch.c<br>
&gt; +++ b/qapi/qmp-dispatch.c<br>
&gt; @@ -167,10 +167,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, Q=
Object *request,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_PRECONFIG) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(cmd-&gt;options &amp; QCO_ALLOW_PRECONF=
IG)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;err, &quot;The command &#=
39;%s&#39; isn&#39;t permitted in &#39;%s&#39; state&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
cmd-&gt;name, RunState_str(RUN_STATE_PRECONFIG));<br>
&gt; +=C2=A0 =C2=A0 if (!qmp_command_available(cmd, &amp;err)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/qapi/run-state.json b/qapi/run-state.json<br>
&gt; index 964c8ef391..38194b0e44 100644<br>
&gt; --- a/qapi/run-state.json<br>
&gt; +++ b/qapi/run-state.json<br>
&gt; @@ -50,15 +50,12 @@<br>
&gt;=C2=A0 # @colo: guest is paused to save/restore VM state under colo che=
ckpoint,<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 VM can not get into this state unle=
ss colo capability is enabled<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 for migration. (since 2.8)<br>
&gt; -# @preconfig: QEMU is paused before board specific init callback is e=
xecuted.<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The state is reachab=
le only if the --preconfig CLI option is used.<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Since 3.0)<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;RunState&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;debug&#39;, &#39;inmigrate&#39;, &=
#39;internal-error&#39;, &#39;io-error&#39;, &#39;paused&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;postmigrate&#39;,=
 &#39;prelaunch&#39;, &#39;finish-migrate&#39;, &#39;restore-vm&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;running&#39;, &#3=
9;save-vm&#39;, &#39;shutdown&#39;, &#39;suspended&#39;, &#39;watchdog&#39;=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;guest-panicked&#39;, &=
#39;colo&#39;, &#39;preconfig&#39; ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;guest-panicked&#39;, &=
#39;colo&#39; ] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @ShutdownCause:<br>
&gt; diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
&gt; index d060e765da..e967d13bd0 100644<br>
&gt; --- a/softmmu/qdev-monitor.c<br>
&gt; +++ b/softmmu/qdev-monitor.c<br>
&gt; @@ -25,6 +25,7 @@<br>
&gt;=C2=A0 #include &quot;sysemu/arch_init.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-commands-qdev.h&quot;<br>
&gt; +#include &quot;qapi/qmp/dispatch.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/qdict.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/qerror.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/config-file.h&quot;<br>
&gt; @@ -997,3 +998,14 @@ int qemu_global_option(const char *str)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +bool qmp_command_available(const QmpCommand *cmd, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_hotplug &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(cmd-&gt;options &amp; QCO_ALLOW_PRECONF=
IG)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;The command &#39;%=
s&#39; is permitted only after machine initialization has completed&quot;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
cmd-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index 7146fbe219..ab2210bc79 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -557,7 +557,7 @@ static int default_driver_check(void *opaque, Qemu=
Opts *opts, Error **errp)<br>
&gt;=C2=A0 /***********************************************************/<br=
>
&gt;=C2=A0 /* QEMU state */<br>
&gt;=C2=A0 <br>
&gt; -static RunState current_run_state =3D RUN_STATE_PRECONFIG;<br>
&gt; +static RunState current_run_state =3D RUN_STATE_PRELAUNCH;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* We use RUN_STATE__MAX but any invalid value will do */<br>
&gt;=C2=A0 static RunState vmstop_requested =3D RUN_STATE__MAX;<br>
&gt; @@ -569,13 +569,7 @@ typedef struct {<br>
&gt;=C2=A0 } RunStateTransition;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const RunStateTransition runstate_transitions_def[] =3D {=
<br>
&gt; -=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0from=C2=A0 =C2=A0 =C2=A0 -&gt;=C2=
=A0 =C2=A0 =C2=A0to=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 { RUN_STATE_PRECONFIG, RUN_STATE_PRELAUNCH },<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 /* Early switch to inmigrate state to allow=C2=
=A0 -incoming CLI option work<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* as it used to. TODO: delay actual switch=
ing to inmigrate state to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* the point after machine is built and rem=
ove this hack.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 { RUN_STATE_PRECONFIG, RUN_STATE_INMIGRATE },<br>
&gt; +=C2=A0 =C2=A0 { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 { RUN_STATE_DEBUG, RUN_STATE_RUNNING },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { RUN_STATE_DEBUG, RUN_STATE_FINISH_MIGRATE },<br>
&gt; @@ -1471,9 +1465,6 @@ static bool main_loop_should_exit(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ShutdownCause request;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (preconfig_exit_requested) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (runstate_check(RUN_STATE_PRECONFIG)) =
{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 runstate_set(RUN_STATE_PREL=
AUNCH);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 preconfig_exit_requested =3D false;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/stubs/meson.build b/stubs/meson.build<br>
&gt; index 82b7ba60ab..cc56c83063 100644<br>
&gt; --- a/stubs/meson.build<br>
&gt; +++ b/stubs/meson.build<br>
&gt; @@ -29,6 +29,7 @@ stub_ss.add(files(&#39;pci-bus.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;pci-host-piix.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;qemu-timer-notify-cb.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;qmp_memory_device.c&#39;))<br>
&gt; +stub_ss.add(files(&#39;qmp-command-available.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;qtest.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;ram-block.c&#39;))<br>
&gt;=C2=A0 stub_ss.add(files(&#39;ramfb.c&#39;))<br>
&gt; diff --git a/stubs/qmp-command-available.c b/stubs/qmp-command-availab=
le.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..46540af7bf<br>
&gt; --- /dev/null<br>
&gt; +++ b/stubs/qmp-command-available.c<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/qmp/dispatch.h&quot;<br>
&gt; +<br>
&gt; +bool qmp_command_available(const QmpCommand *cmd, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c<br>
&gt; index eb1cd8abb8..11614bf63f 100644<br>
&gt; --- a/tests/qtest/qmp-test.c<br>
&gt; +++ b/tests/qtest/qmp-test.c<br>
&gt; @@ -295,7 +295,7 @@ static void test_qmp_preconfig(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rsp =3D qtest_qmp(qs, &quot;{ &#39;execute&#39;: &=
#39;query-status&#39; }&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D qdict_get_qdict(rsp, &quot;return&quot;);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert(ret);<br>
&gt; -=C2=A0 =C2=A0 g_assert_cmpstr(qdict_get_try_str(ret, &quot;status&quo=
t;), =3D=3D, &quot;preconfig&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpstr(qdict_get_try_str(ret, &quot;status&quo=
t;), =3D=3D, &quot;prelaunch&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qobject_unref(rsp);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* exit preconfig state */<br>
<br>
</blockquote></div></div></div>

--00000000000001b78605b5e068aa--


