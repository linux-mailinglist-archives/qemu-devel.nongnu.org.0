Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEBA456FB8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:34:50 +0100 (CET)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo42T-0004bB-M0
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3pv-0002U1-Va
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:21:53 -0500
Received: from [2607:f8b0:4864:20::134] (port=42597
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo3pu-0002JF-Bs
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:21:51 -0500
Received: by mail-il1-x134.google.com with SMTP id e8so10187609ilu.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 05:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VV+7xRLkffBKFaZK7eRFSVs9Dt48sGUX/ER42apTKTI=;
 b=T/IVkasnkVzhsyH8mTAeInVnYVyLW2id2xnnOHVRxrtrtoHsugGy2h8ldDg9QVgQPx
 9uVpw+szXWoD8n3r58GnlgPkFhFUSCPDgn6kUfIZKiE0gm5YGDW3X7TmqAI+1Ri/xaIm
 5UC/lHELk1v0UC99UXn+6Hc7dAqhopAYoUaIBavlY46tYGaTFRdPaXYWJ54nckkVfQL9
 CXKyQOwaw1o1abi+5LSqCF7LppYd3yYiFoaC9LQSuzoILpVzutVWQgRmYO8OiXIIKhMk
 1wLWQD+isFHlQ8gssCUtXQlxnkmYf16s8P4nTn6dZxiiZBXRxCLlinjXNi7HkrSvKZaW
 ieyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VV+7xRLkffBKFaZK7eRFSVs9Dt48sGUX/ER42apTKTI=;
 b=T2qJQlh36yqX47JmhS4gtIKu75KtWzbS/KfU9zmjGpDogLRo12NuaRdZgDryTUXv4r
 UaFMP/clUMBzh9Cn50h+J5V393VMz8+IVCY0d/qe49ccPahsQIPY3PQoRN2Tb2RX3jUL
 WQUpUxwgEdXdPkyDYEeKOs/jxqbCCt+V7uqXRY804SGllV/ufT1My27YZMJVI69Nez5d
 2/RbSEtCNBWWPouCMV9Lc/h6zGlwzyQjJDymGHihoUN6NAUwELOJhDAFMtoKl4Iu/zHJ
 kA+SC+xCjkZdeNC8T8qAtdXdLoG95DpM/fFhKkxicNpjesRq5SWReVQ18m8OXDfpsCf+
 0iDw==
X-Gm-Message-State: AOAM531bXa46OhiHCqlwAVWPqt8oAd5FFgFefEvnf8jqxarG4/BvlXxd
 eEmGNIOKexOSyxqToC+3AkdGbQyyzdnxTSUrk32cESzdR+L9jzDy
X-Google-Smtp-Source: ABdhPJyxv2wM/EnOYgqo47pidyroqKTJOA6t/JDC53Lq6H882XK/SsOkh/VTvsWosgo1CfwjbwGr607hVYfzXy8n5Io=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr4771277ilo.208.1637328109278; 
 Fri, 19 Nov 2021 05:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <20211117144703.16305-3-damien.hedde@greensocs.com>
In-Reply-To: <20211117144703.16305-3-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 23:21:22 +1000
Message-ID: <CAKmqyKMXo22k+qfAZwnaZE_JSFEXEA9=F2bYYTgKfJuQo42ssA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] qapi: Implement query-machine-phase QMP command
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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

On Thu, Nov 18, 2021 at 12:53 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> The command returns current machine initialization phase.
> From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> v3:
>  + add 'unstable' feature
>  + bump to version 7.0
> ---
>  qapi/machine.json          | 60 ++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h     | 30 ++-----------------
>  hw/core/machine-qmp-cmds.c |  9 ++++++
>  hw/core/qdev.c             |  5 ++++
>  4 files changed, 76 insertions(+), 28 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..8e9a8afb1d 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1557,3 +1557,63 @@
>  { 'command': 'x-query-usb',
>    'returns': 'HumanReadableText',
>    'features': [ 'unstable' ] }
> +
> +##
> +# @MachineInitPhase:
> +#
> +# Enumeration of machine initialization phases.
> +#
> +# @no-machine: machine does not exist
> +#
> +# @machine-created: machine is created, but its accelerator is not
> +#
> +# @accel-created: accelerator is created, but the machine properties hav=
e not
> +#                 been validated and machine initialization is not done =
yet
> +#
> +# @initialized: machine is initialized, thus creating any embedded devic=
es and
> +#               validating machine properties. Devices created at this t=
ime are
> +#               considered to be cold-plugged.
> +#
> +# @ready: QEMU is ready to start CPUs and devices created at this time a=
re
> +#         considered to be hot-plugged. The monitor is not restricted to
> +#         "preconfig" commands.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'MachineInitPhase',
> +  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initializ=
ed',
> +            'ready' ] }
> +
> +##
> +# @MachineInitPhaseStatus:
> +#
> +# Information about machine initialization phase
> +#
> +# @phase: the machine initialization phase
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'MachineInitPhaseStatus',
> +  'data': { 'phase': 'MachineInitPhase' } }
> +
> +##
> +# @query-machine-phase:
> +#
> +# Return machine initialization phase
> +#
> +# Features:
> +# @unstable: This command is part of the experimental preconfig mode.
> +#
> +# Since: 7.0
> +#
> +# Returns: MachineInitPhaseStatus
> +#
> +# Example:
> +#
> +# -> { "execute": "query-machine-phase" }
> +# <- { "return": { "phase": "initialized" } }
> +#
> +##
> +{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
> +  'features' : ['unstable'],
> +  'allow-preconfig': true }
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index ef2d612d39..ac856821ab 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -1,6 +1,7 @@
>  #ifndef QDEV_CORE_H
>  #define QDEV_CORE_H
>
> +#include "qapi/qapi-types-machine.h"
>  #include "qemu/queue.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/rcu.h"
> @@ -847,35 +848,8 @@ void device_listener_unregister(DeviceListener *list=
ener);
>   */
>  bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **=
errp);
>
> -typedef enum MachineInitPhase {
> -    /* current_machine is NULL.  */
> -    MACHINE_INIT_PHASE_NO_MACHINE,
> -
> -    /* current_machine is not NULL, but current_machine->accel is NULL. =
 */
> -    MACHINE_INIT_PHASE_MACHINE_CREATED,
> -
> -    /*
> -     * current_machine->accel is not NULL, but the machine properties ha=
ve
> -     * not been validated and machine_class->init has not yet been calle=
d.
> -     */
> -    MACHINE_INIT_PHASE_ACCEL_CREATED,
> -
> -    /*
> -     * machine_class->init has been called, thus creating any embedded
> -     * devices and validating machine properties.  Devices created at
> -     * this time are considered to be cold-plugged.
> -     */
> -    MACHINE_INIT_PHASE_INITIALIZED,
> -
> -    /*
> -     * QEMU is ready to start CPUs and devices created at this time
> -     * are considered to be hot-plugged.  The monitor is not restricted
> -     * to "preconfig" commands.
> -     */
> -    MACHINE_INIT_PHASE_READY,
> -} MachineInitPhase;
> -
>  extern bool phase_check(MachineInitPhase phase);
>  extern void phase_advance(MachineInitPhase phase);
> +extern MachineInitPhase phase_get(void);
>
>  #endif
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index ddbdc5212f..19f9da4c2d 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -244,3 +244,12 @@ HumanReadableText *qmp_x_query_numa(Error **errp)
>   done:
>      return human_readable_text_from_str(buf);
>  }
> +
> +MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
> +{
> +    MachineInitPhaseStatus *status =3D g_malloc0(sizeof(*status));
> +
> +    status->phase =3D phase_get();
> +
> +    return status;
> +}
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index ccfd6f0dc4..f22c050c89 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -921,6 +921,11 @@ void phase_advance(MachineInitPhase phase)
>      machine_phase =3D phase;
>  }
>
> +MachineInitPhase phase_get(void)
> +{
> +    return machine_phase;
> +}
> +
>  static const TypeInfo device_type_info =3D {
>      .name =3D TYPE_DEVICE,
>      .parent =3D TYPE_OBJECT,
> --
> 2.33.0
>
>

