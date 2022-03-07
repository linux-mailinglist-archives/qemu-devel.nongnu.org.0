Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B54CF41E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:56:14 +0100 (CET)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9A5-0001pj-IB
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR980-00008r-AL
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:54:04 -0500
Received: from [2a00:1450:4864:20::42d] (port=40950
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR97y-0000gm-2G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:54:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k24so12549202wrd.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGiphW3M4cdOMwD5KjyBXNwbBzsA09kW2BFAusm+2zw=;
 b=KyhPqqCsR79/yS1WL/ucs+hRdlU6TQt6pMWEP12RwMWRYUzho4GUdS4/Hvy4ZDyS+R
 KhNqf933uw0tURGPv0oIguGh6i9SemjyXVKIGgjOaJzSTTz1425S5BzAKCq37AIHPq0c
 oPNTGWlH8ThCKUn959y/lEocgx5eKeg7KuwkjBAhuFZjlUDGEi8BXlMrnYcIBR0l+gd2
 lIJnk1p9mzkGvM6vLGxhjm2kFitrJ9qJa5xD2VqwjNFA90Q6I87106xG1oQGvjfm6vjY
 HvoYBr4UrC6OekqEPPXGYUCVyn4GHRhtWd5LICGfoQuw1vGR2R92Pugt3vynsZfvPke2
 EW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGiphW3M4cdOMwD5KjyBXNwbBzsA09kW2BFAusm+2zw=;
 b=tdk98eeY1TWvXIcsYBan5uMlGMkBZ9y3g53OqysY4VFi8W/WfD4A1ba9BmhXNBjXoq
 UGEY98kG5MqwvlBGRON0PUVxbcAuog8Y9O73/k1afaINVw0IitWQxNFJREk2/N3uDfqE
 zrbCTVdWPIg9gy1TthXwmc1b8ZYGaMvn7Y2X9bQQsoSt8SsAbOtNw0CJYBQh5HoxRXkh
 Ghn+nDBOhsumAa+Pq5Zl537XdvoOxXFowm8QrYQFQoAW9viMfN6tjn+8iCnJ78yWwIWh
 zVIT61H0lAKkUwMdV6IywLHBF0yUBZ/KBVQjL7CnC00+rxDPttlrDER0Etyqu+g6HudF
 E94w==
X-Gm-Message-State: AOAM530AE03ABuStNhUOAcPm3GeLWCzGqAjff7wTvtp+TXig9xj7Ltcw
 FQ/er3/UglEGr41+rtsGHvmrYQ1UDsxO0PunMHhBbbrj
X-Google-Smtp-Source: ABdhPJypMlOZechk/ZKxF+WTBck9cM3BENimbsYSZMVmlO0QqGvjumM9l+fBK5ztUAMwhswtZGAJvlrnu6bKuHdtMLI=
X-Received: by 2002:a5d:58d3:0:b0:1f1:dfb1:ab63 with SMTP id
 o19-20020a5d58d3000000b001f1dfb1ab63mr7136204wrf.326.1646643240799; Mon, 07
 Mar 2022 00:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20220307084307.1379107-1-pizhenwei@bytedance.com>
In-Reply-To: <20220307084307.1379107-1-pizhenwei@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 12:53:48 +0400
Message-ID: <CAJ+F1CKgoMYMRz9J0PgQ31NvKciWi=76k-hYZUxYkxNqEPN-QA@mail.gmail.com>
Subject: Re: [PATCH v3] qga: Introduce disk smart
To: zhenwei pi <pizhenwei@bytedance.com>
Content-Type: multipart/alternative; boundary="00000000000070922d05d99d0153"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
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

--00000000000070922d05d99d0153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2022 at 12:46 PM zhenwei pi <pizhenwei@bytedance.com> wrote:

> After assigning a NVMe/SCSI controller to guest by VFIO, we lose
> everything on the host side. A guest uses these devices exclusively,
> we usually don't care the actions on these devices. But there is a
> low probability that hitting physical hardware warning, we need a
> chance to get the basic smart log info.
>
> Introduce disk smart, and implement NVMe smart on linux.
>
> Thanks to Keith and Marc-Andr=C3=A9.
>
> CC: Keith Busch <kbusch@kernel.org>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/qapi-schema.json | 53 +++++++++++++++++++++++++++++++-
>  2 files changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 4ec83bbfbc..383bbebe42 100644
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
> @@ -1390,6 +1392,76 @@ static GuestDiskInfoList *get_disk_partitions(
>      return ret;
>  }
>
> +static void get_nvme_smart(GuestDiskInfo *disk)
> +{
> +    int fd;
> +    GuestNVMeSmart *smart;
> +    NvmeSmartLog log =3D {0};
> +    struct nvme_admin_cmd cmd =3D {
> +        .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,
> +        .nsid =3D NVME_NSID_BROADCAST,
> +        .addr =3D (uint64_t)&log,
> +        .data_len =3D sizeof(log),
> +        .cdw10 =3D NVME_LOG_SMART_INFO | (1 << 15) /* RAE bit */
> +                 | (((sizeof(log) >> 2) - 1) << 16)
> +    };
> +
> +    fd =3D qemu_open_old(disk->name, O_RDONLY);
> +    if (fd =3D=3D -1) {
> +        g_debug("Failed to open device: %s: %s", disk->name,
> g_strerror(errno));
> +        return;
> +    }
> +
> +    if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &cmd)) {
> +        g_debug("Failed to get smart: %s: %s", disk->name,
> g_strerror(errno));
> +        close(fd);
> +        return;
> +    }
> +
> +    disk->has_smart =3D true;
> +    disk->smart =3D g_new0(GuestDiskSmart, 1);
> +    disk->smart->type =3D GUEST_DISK_BUS_TYPE_NVME;
> +
> +    smart =3D &disk->smart->u.nvme;
> +    smart->critical_warning =3D log.critical_warning;
> +    smart->temperature =3D lduw_le_p(&log.temperature); /* unaligned fie=
ld
> */
> +    smart->available_spare =3D log.available_spare;
> +    smart->available_spare_threshold =3D log.available_spare_threshold;
> +    smart->percentage_used =3D log.percentage_used;
> +    smart->data_units_read_lo =3D le64_to_cpu(log.data_units_read[0]);
> +    smart->data_units_read_hi =3D le64_to_cpu(log.data_units_read[1]);
> +    smart->data_units_written_lo =3D le64_to_cpu(log.data_units_written[=
0]);
> +    smart->data_units_written_hi =3D le64_to_cpu(log.data_units_written[=
1]);
> +    smart->host_read_commands_lo =3D le64_to_cpu(log.host_read_commands[=
0]);
> +    smart->host_read_commands_hi =3D le64_to_cpu(log.host_read_commands[=
1]);
> +    smart->host_write_commands_lo =3D
> le64_to_cpu(log.host_write_commands[0]);
> +    smart->host_write_commands_hi =3D
> le64_to_cpu(log.host_write_commands[1]);
> +    smart->controller_busy_time_lo =3D
> le64_to_cpu(log.controller_busy_time[0]);
> +    smart->controller_busy_time_hi =3D
> le64_to_cpu(log.controller_busy_time[1]);
> +    smart->power_cycles_lo =3D le64_to_cpu(log.power_cycles[0]);
> +    smart->power_cycles_hi =3D le64_to_cpu(log.power_cycles[1]);
> +    smart->power_on_hours_lo =3D le64_to_cpu(log.power_on_hours[0]);
> +    smart->power_on_hours_hi =3D le64_to_cpu(log.power_on_hours[1]);
> +    smart->unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shutdowns[0]);
> +    smart->unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shutdowns[1]);
> +    smart->media_errors_lo =3D le64_to_cpu(log.media_errors[0]);
> +    smart->media_errors_hi =3D le64_to_cpu(log.media_errors[1]);
> +    smart->number_of_error_log_entries_lo =3D
> +        le64_to_cpu(log.number_of_error_log_entries[0]);
> +    smart->number_of_error_log_entries_hi =3D
> +        le64_to_cpu(log.number_of_error_log_entries[1]);
> +
> +    close(fd);
> +}
> +
> +static void get_disk_smart(GuestDiskInfo *disk)
> +{
> +    if (disk->has_address
> +        && (disk->address->bus_type =3D=3D GUEST_DISK_BUS_TYPE_NVME)) {
> +        get_nvme_smart(disk);
> +    }
> +}
> +
>  GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>  {
>      GuestDiskInfoList *ret =3D NULL;
> @@ -1463,6 +1535,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp=
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
> index 8f73770210..bbfb817347 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -888,6 +888,55 @@
>             '*serial': 'str', '*dev': 'str',
>             '*ccw-address': 'GuestCCWAddress'} }
>
> +##
> +# @GuestNVMeSmart:
> +#
> +# NVMe smart informations, based on NVMe specification,
> +# section <SMART / Health Information (Log Identifier 02h)>
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
> +# Disk type related smart information.
> +#
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
> @@ -899,12 +948,14 @@
>  # @address: disk address information (only for non-virtual devices)
>  # @alias: optional alias assigned to the disk, on Linux this is a name
> assigned
>  #         by device mapper
> +# @smart: disk smart information (Since 7.0)
>  #
>  # Since 5.2
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

--=20
Marc-Andr=C3=A9 Lureau

--00000000000070922d05d99d0153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 12:46 PM zhenw=
ei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>After assigning a NVMe/SCSI controller to guest by VFIO, we lose<br>
everything on the host side. A guest uses these devices exclusively,<br>
we usually don&#39;t care the actions on these devices. But there is a<br>
low probability that hitting physical hardware warning, we need a<br>
chance to get the basic smart log info.<br>
<br>
Introduce disk smart, and implement NVMe smart on linux.<br>
<br>
Thanks to Keith and Marc-Andr=C3=A9.<br>
<br>
CC: Keith Busch &lt;<a href=3D"mailto:kbusch@kernel.org" target=3D"_blank">=
kbusch@kernel.org</a>&gt;<br>
Signed-off-by: zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" ta=
rget=3D"_blank">pizhenwei@bytedance.com</a>&gt;<br></blockquote><div><br></=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-posix.c | 73 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/qapi-schema.json | 53 +++++++++++++++++++++++++++++++-<br>
=C2=A02 files changed, 125 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 4ec83bbfbc..383bbebe42 100644<br>
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
@@ -1390,6 +1392,76 @@ static GuestDiskInfoList *get_disk_partitions(<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+static void get_nvme_smart(GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 GuestNVMeSmart *smart;<br>
+=C2=A0 =C2=A0 NvmeSmartLog log =3D {0};<br>
+=C2=A0 =C2=A0 struct nvme_admin_cmd cmd =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .opcode =3D NVME_ADM_CMD_GET_LOG_PAGE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .nsid =3D NVME_NSID_BROADCAST,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .addr =3D (uint64_t)&amp;log,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data_len =3D sizeof(log),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cdw10 =3D NVME_LOG_SMART_INFO | (1 &lt;&lt; 1=
5) /* RAE bit */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| (((sizeof(=
log) &gt;&gt; 2) - 1) &lt;&lt; 16)<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 fd =3D qemu_open_old(disk-&gt;name, O_RDONLY);<br>
+=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to open device: %s: %s&qu=
ot;, disk-&gt;name, g_strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (ioctl(fd, NVME_IOCTL_ADMIN_CMD, &amp;cmd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;Failed to get smart: %s: %s&quot=
;, disk-&gt;name, g_strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 disk-&gt;has_smart =3D true;<br>
+=C2=A0 =C2=A0 disk-&gt;smart =3D g_new0(GuestDiskSmart, 1);<br>
+=C2=A0 =C2=A0 disk-&gt;smart-&gt;type =3D GUEST_DISK_BUS_TYPE_NVME;<br>
+<br>
+=C2=A0 =C2=A0 smart =3D &amp;disk-&gt;smart-&gt;u.nvme;<br>
+=C2=A0 =C2=A0 smart-&gt;critical_warning =3D log.critical_warning;<br>
+=C2=A0 =C2=A0 smart-&gt;temperature =3D lduw_le_p(&amp;log.temperature); /=
* unaligned field */<br>
+=C2=A0 =C2=A0 smart-&gt;available_spare =3D log.available_spare;<br>
+=C2=A0 =C2=A0 smart-&gt;available_spare_threshold =3D log.available_spare_=
threshold;<br>
+=C2=A0 =C2=A0 smart-&gt;percentage_used =3D log.percentage_used;<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_read_lo =3D le64_to_cpu(log.data_units_=
read[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_read_hi =3D le64_to_cpu(log.data_units_=
read[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_written_lo =3D le64_to_cpu(log.data_uni=
ts_written[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;data_units_written_hi =3D le64_to_cpu(log.data_uni=
ts_written[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_read_commands_lo =3D le64_to_cpu(log.host_rea=
d_commands[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_read_commands_hi =3D le64_to_cpu(log.host_rea=
d_commands[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_write_commands_lo =3D le64_to_cpu(log.host_wr=
ite_commands[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;host_write_commands_hi =3D le64_to_cpu(log.host_wr=
ite_commands[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;controller_busy_time_lo =3D le64_to_cpu(log.contro=
ller_busy_time[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;controller_busy_time_hi =3D le64_to_cpu(log.contro=
ller_busy_time[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_cycles_lo =3D le64_to_cpu(log.power_cycles[0=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_cycles_hi =3D le64_to_cpu(log.power_cycles[1=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_on_hours_lo =3D le64_to_cpu(log.power_on_hou=
rs[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;power_on_hours_hi =3D le64_to_cpu(log.power_on_hou=
rs[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_lo =3D le64_to_cpu(log.unsafe_shu=
tdowns[0]);<br>
+=C2=A0 =C2=A0 smart-&gt;unsafe_shutdowns_hi =3D le64_to_cpu(log.unsafe_shu=
tdowns[1]);<br>
+=C2=A0 =C2=A0 smart-&gt;media_errors_lo =3D le64_to_cpu(log.media_errors[0=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;media_errors_hi =3D le64_to_cpu(log.media_errors[1=
]);<br>
+=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_lo =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[0]=
);<br>
+=C2=A0 =C2=A0 smart-&gt;number_of_error_log_entries_hi =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64_to_cpu(log.number_of_error_log_entries[1]=
);<br>
+<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
+static void get_disk_smart(GuestDiskInfo *disk)<br>
+{<br>
+=C2=A0 =C2=A0 if (disk-&gt;has_address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (disk-&gt;address-&gt;bus_type =3D=
=3D GUEST_DISK_BUS_TYPE_NVME)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_nvme_smart(disk);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GuestDiskInfoList *ret =3D NULL;<br>
@@ -1463,6 +1535,7 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)<=
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
index 8f73770210..bbfb817347 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -888,6 +888,55 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*serial&#39;: &#39;str&#39;,=
 &#39;*dev&#39;: &#39;str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*ccw-address&#39;: &#39;Gues=
tCCWAddress&#39;} }<br>
<br>
+##<br>
+# @GuestNVMeSmart:<br>
+#<br>
+# NVMe smart informations, based on NVMe specification,<br>
+# section &lt;SMART / Health Information (Log Identifier 02h)&gt;<br>
+#<br>
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
+# Disk type related smart information.<br>
+#<br>
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
=C2=A0#<br>
@@ -899,12 +948,14 @@<br>
=C2=A0# @address: disk address information (only for non-virtual devices)<b=
r>
=C2=A0# @alias: optional alias assigned to the disk, on Linux this is a nam=
e assigned<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by device mapper<br>
+# @smart: disk smart information (Since 7.0)<br>
=C2=A0#<br>
=C2=A0# Since 5.2<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000070922d05d99d0153--

