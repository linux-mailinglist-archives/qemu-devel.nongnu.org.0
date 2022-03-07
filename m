Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5830C4CF298
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:30:31 +0100 (CET)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7p6-000687-PD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:30:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR7db-0002Wk-Sm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:18:37 -0500
Received: from [2a00:1450:4864:20::42e] (port=41485
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR7dZ-0002xp-Lr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:18:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i8so21632331wrr.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rzqMdZGOWqfFvt2CIar9Ashym1rP/mTs6qwHgNYQpo=;
 b=Bh58JWld8Vfn2mKU0S4UxtOPxWCgeg889WaRYALE7AOxX2ZSKwJYTTALV3lRYpZZAl
 njLolNKBUnmXCcc0njgwSqEVHsnohs0xBhqNJu/Fl9EJY8Mp0KmJj/opNauWhFMK5FR+
 64MrJbhL41twMTjZXNX7R+iVfjLYimnYnymuwqQn/yrsnwCXfcgApcjsEhZqEnk2KBU/
 tHxwgeE0aHeV8wgljLJkSnHCX5f/RLJ0RynbDrOoJeTh6Dr5i/2/++kXKpvSzafEChCX
 XRAUlzDJkugmvY0cHQcliirKZ4ikx7/tVsEClm6IdfhCm9OuAbfW1wlD18GMrnICu2cZ
 qCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rzqMdZGOWqfFvt2CIar9Ashym1rP/mTs6qwHgNYQpo=;
 b=UWpvMAJWdvJpP8D3fBTl/lgclWNmOf/kMINg0C5BlCfHCErzuWrbu6Q1pyXPMdVYI/
 g3ol0I/0vkNJt1mmAToTNhKQBXGF6pusp7K5VsgYfkgW+XMafe+PZJaUPpKoqN6rAmpg
 WD67Yj7O0xyiqsawu88ZyGadDctjuO1bMgtJ4L3lVfvX61Wf59p7tgBlOTdu38V3WEVI
 DKyth808BcgpbRPmL2GADwlNlXNRsaF9BdmshGSbBugBb9wa1p2DLt3WoiPg6Thn3OEA
 lpe8nscfmyMpC391z5rZhYKQ/KlEHUkb8gaBPmZc05Ec3xe18/AkstW9LvJsH88xE4MD
 4JlQ==
X-Gm-Message-State: AOAM530Mn1RoKkGTCyKEM8CzlWMIi0Bx0TU1794Vhh0K+qX98N93mgF3
 /EjJo8A+3Nmkb1zneByPsmlCgiFqwbolwhMry9U=
X-Google-Smtp-Source: ABdhPJwH/Nj3Mfq4cOucNn3demaHOJBY10l8JLHOBe0RXIt98TFhzbf1gzL3HBRtKcwurf4Pn24drJwKQ1F+9e6mFAQ=
X-Received: by 2002:a5d:58d3:0:b0:1f1:dfb1:ab63 with SMTP id
 o19-20020a5d58d3000000b001f1dfb1ab63mr6865254wrf.326.1646637511495; Sun, 06
 Mar 2022 23:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220307062041.1376177-1-pizhenwei@bytedance.com>
In-Reply-To: <20220307062041.1376177-1-pizhenwei@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 11:18:19 +0400
Message-ID: <CAJ+F1C+Y4KWSoC1J8FHvyvUHC6fogHDxhKrK5HRW9Apif9ewVw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] qga: Introduce disk smart
To: zhenwei pi <pizhenwei@bytedance.com>
Content-Type: multipart/alternative; boundary="000000000000f2545e05d99bab13"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Keith Busch <kbusch@kernel.org>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f2545e05d99bab13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 7, 2022 at 10:24 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

> After assigning a NVMe/SCSI controller to guest by VFIO, we lose
> everything on the host side. A guest uses these devices exclusively,
> we usually don't care the actions on these devices. But there is a
> low probability that hitting physical hardware warning, we need a
> chance to get the basic smart log info.
>
> Introduce disk smart, and implement NVMe smart on linux.
>
> CC: Keith Busch <kbusch@kernel.org>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qga/commands-posix.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/qapi-schema.json | 50 +++++++++++++++++++++++++++-
>  2 files changed, 127 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 4ec83bbfbc..1fa089e9c8 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -27,6 +27,7 @@
>  #include "qemu/base64.h"
>  #include "qemu/cutils.h"
>  #include "commands-common.h"
> +#include "block/nvme.h"
>
>  #ifdef HAVE_UTMPX
>  #include <utmpx.h>
> @@ -49,6 +50,7 @@ extern char **environ;
>  #include <sys/socket.h>
>  #include <net/if.h>
>  #include <sys/statvfs.h>
> +#include <linux/nvme_ioctl.h>
>
>  #ifdef CONFIG_LIBUDEV
>  #include <libudev.h>
> @@ -1390,6 +1392,81 @@ static GuestDiskInfoList *get_disk_partitions(
>      return ret;
>  }
>
> +static void get_disk_smart(GuestDiskInfo *disk)
> +{
> +    if (disk->has_address
> +        && (disk->address->bus_type =3D=3D GUEST_DISK_BUS_TYPE_NVME)) {
>

to avoid extra indentation, you could return early.


> +        int fd;
> +        GuestDiskSmart *smart;
> +        NvmeSmartLog log =3D {0};
> +        struct nvme_admin_cmd cmd =3D {
> +            .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,
> +            .nsid =3D NVME_NSID_BROADCAST,
> +            .addr =3D (uint64_t)&log,
> +            .data_len =3D sizeof(log),
> +            .cdw10 =3D NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
> +                     | (((sizeof(log) >> 2) - 1) << 16)
> +        };
> +
> +        fd =3D qemu_open_old(disk->name, O_RDONLY);
> +        if (fd =3D=3D -1) {
> +            g_debug("Failed to open device: %s", disk->name);
>

g_strerror(errno) could help


> +            return;
> +        }
> +        if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
> +            g_debug("Failed to get smart: %s", disk->name);
>

same


> +            close(fd);
> +            return;
> +        }
> +
> +        smart =3D g_new0(GuestDiskSmart, 1);
> +        smart->type =3D GUEST_DISK_BUS_TYPE_NVME;
> +        smart->u.nvme.critical_warning =3D log.critical_warning;
> +        /* unaligned 'temperature' field */
> +        smart->u.nvme.temperature =3D lduw_le_p(&log.temperature);
> +        smart->u.nvme.available_spare =3D log.available_spare;
> +        smart->u.nvme.available_spare_threshold =3D
> log.available_spare_threshold;
> +        smart->u.nvme.percentage_used =3D log.percentage_used;
> +        smart->u.nvme.data_units_read_lo =3D
> le64_to_cpu(log.data_units_read[0]);
> +        smart->u.nvme.data_units_read_hi =3D
> le64_to_cpu(log.data_units_read[1]);
> +        smart->u.nvme.data_units_written_lo =3D
> +            le64_to_cpu(log.data_units_written[0]);
> +        smart->u.nvme.data_units_written_hi =3D
> +            le64_to_cpu(log.data_units_written[1]);
> +        smart->u.nvme.host_read_commands_lo =3D
> +            le64_to_cpu(log.host_read_commands[0]);
> +        smart->u.nvme.host_read_commands_hi =3D
> +            le64_to_cpu(log.host_read_commands[1]);
> +        smart->u.nvme.host_write_commands_lo =3D
> +            le64_to_cpu(log.host_write_commands[0]);
> +        smart->u.nvme.host_write_commands_hi =3D
> +            le64_to_cpu(log.host_write_commands[1]);
> +        smart->u.nvme.controller_busy_time_lo =3D
> +            le64_to_cpu(log.controller_busy_time[0]);
> +        smart->u.nvme.controller_busy_time_hi =3D
> +            le64_to_cpu(log.controller_busy_time[1]);
> +        smart->u.nvme.power_cycles_lo =3D le64_to_cpu(log.power_cycles[0=
]);
> +        smart->u.nvme.power_cycles_hi =3D le64_to_cpu(log.power_cycles[1=
]);
> +        smart->u.nvme.power_on_hours_lo =3D
> le64_to_cpu(log.power_on_hours[0]);
> +        smart->u.nvme.power_on_hours_hi =3D
> le64_to_cpu(log.power_on_hours[1]);
> +        smart->u.nvme.unsafe_shutdowns_lo =3D
> +            le64_to_cpu(log.unsafe_shutdowns[0]);
> +        smart->u.nvme.unsafe_shutdowns_hi =3D
> +            le64_to_cpu(log.unsafe_shutdowns[1]);
> +        smart->u.nvme.media_errors_lo =3D le64_to_cpu(log.media_errors[0=
]);
> +        smart->u.nvme.media_errors_hi =3D le64_to_cpu(log.media_errors[1=
]);
> +        smart->u.nvme.number_of_error_log_entries_lo =3D
> +            le64_to_cpu(log.number_of_error_log_entries[0]);
> +        smart->u.nvme.number_of_error_log_entries_hi =3D
> +            le64_to_cpu(log.number_of_error_log_entries[1]);
> +
> +        disk->has_smart =3D true;
> +        disk->smart =3D smart;
> +
> +        close(fd);
> +    }
> +}
> +
>  GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>  {
>      GuestDiskInfoList *ret =3D NULL;
> @@ -1463,6 +1540,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp=
)
>          }
>
>          get_disk_deps(disk_dir, disk);
> +        get_disk_smart(disk);
>          ret =3D get_disk_partitions(ret, de->d_name, disk_dir, dev_name)=
;
>      }
>
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 8f73770210..8bb8731ce4 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -888,6 +888,53 @@
>             '*serial': 'str', '*dev': 'str',
>             '*ccw-address': 'GuestCCWAddress'} }
>
> +##
> +# @GuestNVMeSmart:
> +#
> +# NVMe smart informations, base on NVMe specification
>

based


> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'GuestNVMeSmart',
> +  'data': {'critical-warning': 'int',
> +           'temperature': 'int',
> +           'available-spare': 'int',
> +           'available-spare-threshold': 'int',
> +           'percentage-used': 'int',
> +           'data-units-read-lo': 'uint64',
> +           'data-units-read-hi': 'uint64',
> +           'data-units-written-lo': 'uint64',
> +           'data-units-written-hi': 'uint64',
> +           'host-read-commands-lo': 'uint64',
> +           'host-read-commands-hi': 'uint64',
> +           'host-write-commands-lo': 'uint64',
> +           'host-write-commands-hi': 'uint64',
> +           'controller-busy-time-lo': 'uint64',
> +           'controller-busy-time-hi': 'uint64',
> +           'power-cycles-lo': 'uint64',
> +           'power-cycles-hi': 'uint64',
> +           'power-on-hours-lo': 'uint64',
> +           'power-on-hours-hi': 'uint64',
> +           'unsafe-shutdowns-lo': 'uint64',
> +           'unsafe-shutdowns-hi': 'uint64',
> +           'media-errors-lo': 'uint64',
> +           'media-errors-hi': 'uint64',
> +           'number-of-error-log-entries-lo': 'uint64',
> +           'number-of-error-log-entries-hi': 'uint64' } }
> +
> +##
> +# @GuestDiskSmart:
> +#
> +# Smart of disk
> +# - @nvme: NVMe disk smart
> +#
> +# Since: 7.0
> +##
> +{ 'union': 'GuestDiskSmart',
> +  'base': { 'type': 'GuestDiskBusType' },
> +  'discriminator': 'type',
> +  'data': { 'nvme': 'GuestNVMeSmart' } }
> +
>  ##
>  # @GuestDiskInfo:
>  #
>

You should update the doc about the new smart field


> @@ -904,7 +951,8 @@
>  ##
>  { 'struct': 'GuestDiskInfo',
>    'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
> -           '*address': 'GuestDiskAddress', '*alias': 'str'} }
> +           '*address': 'GuestDiskAddress', '*alias': 'str',
> +           '*smart': 'GuestDiskSmart'} }
>
>  ##
>  # @guest-get-disks:
> --
> 2.20.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f2545e05d99bab13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 10:24 AM zhenwei pi &l=
t;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">After a=
ssigning a NVMe/SCSI controller to guest by VFIO, we lose<br>
everything on the host side. A guest uses these devices exclusively,<br>
we usually don&#39;t care the actions on these devices. But there is a<br>
low probability that hitting physical hardware warning, we need a<br>
chance to get the basic smart log info.<br>
<br>
Introduce disk smart, and implement NVMe smart on linux.<br>
<br>
CC: Keith Busch &lt;<a href=3D"mailto:kbusch@kernel.org" target=3D"_blank">=
kbusch@kernel.org</a>&gt;<br>
Signed-off-by: zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" ta=
rget=3D"_blank">pizhenwei@bytedance.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 78 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/qapi-schema.json | 50 +++++++++++++++++++++++++++-<br>
=C2=A02 files changed, 127 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 4ec83bbfbc..1fa089e9c8 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;qemu/base64.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;commands-common.h&quot;<br>
+#include &quot;block/nvme.h&quot;<br>
<br>
=C2=A0#ifdef HAVE_UTMPX<br>
=C2=A0#include &lt;utmpx.h&gt;<br>
@@ -49,6 +50,7 @@ extern char **environ;<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;net/if.h&gt;<br>
=C2=A0#include &lt;sys/statvfs.h&gt;<br>
+#include &lt;linux/nvme_ioctl.h&gt;<br>
<br>
=C2=A0#ifdef CONFIG_LIBUDEV<br>
=C2=A0#include &lt;libudev.h&gt;<br>
@@ -1390,6 +1392,81 @@ static GuestDiskInfoList *get_disk_partitions(<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+static void get_disk_smart(GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 if (disk-&gt;has_address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (disk-&gt;address-&gt;bus_type =3D=
=3D GUEST_DISK_BUS_TYPE_NVME)) {<br></blockquote><div><br></div><div>to avo=
id extra indentation, you could return early.</div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDiskSmart *smart;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NvmeSmartLog log =3D {0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nvme_admin_cmd cmd =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .opcode =3D NVME_ADM_CMD_GET_LOG=
_PAGE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .nsid =3D NVME_NSID_BROADCAST,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D (uint64_t)&amp;log,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data_len =3D sizeof(log),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cdw10 =3D NVME_LOG_SMART_INFO |=
 (1 &lt;&lt; 15) /* RAE bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| (((sizeof(log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(disk-&gt;name, O_RDONLY);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open dev=
ice: %s&quot;, disk-&gt;name);<br>
</blockquote><div><br></div><div>g_strerror(errno) could help<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &amp;cmd))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get smar=
t: %s&quot;, disk-&gt;name);<br>
</blockquote><div><br></div><div>same<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart =3D g_new0(GuestDiskSmart, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;type =3D GUEST_DISK_BUS_TYPE_NVME;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.critical_warning =3D log.crit=
ical_warning;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unaligned &#39;temperature&#39; field */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.temperature =3D lduw_le_p(&am=
p;log.temperature);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.available_spare =3D log.avail=
able_spare;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.available_spare_threshold =3D=
 log.available_spare_threshold;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.percentage_used =3D log.perce=
ntage_used;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.data_units_read_lo =3D le64_t=
o_cpu(log.data_units_read[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.data_units_read_hi =3D le64_t=
o_cpu(log.data_units_read[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.data_units_written_lo =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.data_units_writt=
en[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.data_units_written_hi =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.data_units_writt=
en[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.host_read_commands_lo =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.host_read_comman=
ds[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.host_read_commands_hi =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.host_read_comman=
ds[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.host_write_commands_lo =3D<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.host_write_comma=
nds[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.host_write_commands_hi =3D<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.host_write_comma=
nds[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.controller_busy_time_lo =3D<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.controller_busy_=
time[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.controller_busy_time_hi =3D<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.controller_busy_=
time[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.power_cycles_lo =3D le64_to_c=
pu(log.power_cycles[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.power_cycles_hi =3D le64_to_c=
pu(log.power_cycles[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.power_on_hours_lo =3D le64_to=
_cpu(log.power_on_hours[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.power_on_hours_hi =3D le64_to=
_cpu(log.power_on_hours[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.unsafe_shutdowns_lo =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.unsafe_shutdowns=
[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.unsafe_shutdowns_hi =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.unsafe_shutdowns=
[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.media_errors_lo =3D le64_to_c=
pu(log.media_errors[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.media_errors_hi =3D le64_to_c=
pu(log.media_errors[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.number_of_error_log_entries_l=
o =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_=
log_entries[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smart-&gt;u.nvme.number_of_error_log_entries_h=
i =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_=
log_entries[1]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;has_smart =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;smart =3D smart;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GuestDiskInfoList *ret =3D NULL;<br>
@@ -1463,6 +1540,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_disk_deps(disk_dir, disk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_disk_smart(disk);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_disk_partitions(ret, de-&gt;d=
_name, disk_dir, dev_name);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 8f73770210..8bb8731ce4 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -888,6 +888,53 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*serial&#39;: &#39;str&#39;,=
 &#39;*dev&#39;: &#39;str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*ccw-address&#39;: &#39;Gues=
tCCWAddress&#39;} }<br>
<br>
+##<br>
+# @GuestNVMeSmart:<br>
+#<br>
+# NVMe smart informations, base on NVMe specification<br>
</blockquote><div><br></div><div>based<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">+#<br>
+# Since: 7.0<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestNVMeSmart&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;critical-warning&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;temperature&#39;: &#39;int&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;available-spare&#39;: &#39;i=
nt&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;available-spare-threshold&#3=
9;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;percentage-used&#39;: &#39;i=
nt&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;data-units-read-lo&#39;: &#3=
9;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;data-units-read-hi&#39;: &#3=
9;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;data-units-written-lo&#39;: =
&#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;data-units-written-hi&#39;: =
&#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;host-read-commands-lo&#39;: =
&#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;host-read-commands-hi&#39;: =
&#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;host-write-commands-lo&#39;:=
 &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;host-write-commands-hi&#39;:=
 &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;controller-busy-time-lo&#39;=
: &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;controller-busy-time-hi&#39;=
: &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;power-cycles-lo&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;power-cycles-hi&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;power-on-hours-lo&#39;: &#39=
;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;power-on-hours-hi&#39;: &#39=
;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;unsafe-shutdowns-lo&#39;: &#=
39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;unsafe-shutdowns-hi&#39;: &#=
39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;media-errors-lo&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;media-errors-hi&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;number-of-error-log-entries-=
lo&#39;: &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;number-of-error-log-entries-=
hi&#39;: &#39;uint64&#39; } }<br>
+<br>
+##<br>
+# @GuestDiskSmart:<br>
+#<br>
+# Smart of disk<br>
+# - @nvme: NVMe disk smart<br>
+#<br>
+# Since: 7.0<br>
+##<br>
+{ &#39;union&#39;: &#39;GuestDiskSmart&#39;,<br>
+=C2=A0 &#39;base&#39;: { &#39;type&#39;: &#39;GuestDiskBusType&#39; },<br>
+=C2=A0 &#39;discriminator&#39;: &#39;type&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;nvme&#39;: &#39;GuestNVMeSmart&#39; } }<br>
+<br>
=C2=A0##<br>
=C2=A0# @GuestDiskInfo:<br>
=C2=A0#<br></blockquote><div><br></div><div>You should update the doc about=
 the new smart field</div><div>=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
@@ -904,7 +951,8 @@<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;GuestDiskInfo&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;partition=
&#39;: &#39;bool&#39;, &#39;*dependencies&#39;: [&#39;str&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*address&#39;: &#39;GuestDis=
kAddress&#39;, &#39;*alias&#39;: &#39;str&#39;} }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*address&#39;: &#39;GuestDis=
kAddress&#39;, &#39;*alias&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*smart&#39;: &#39;GuestDiskS=
mart&#39;} }<br>
<br>
=C2=A0##<br>
=C2=A0# @guest-get-disks:<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f2545e05d99bab13--

