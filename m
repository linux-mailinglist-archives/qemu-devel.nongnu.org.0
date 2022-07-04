Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883C4564EB3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:32:43 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GZW-0007DO-MN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o8GWr-0004kj-Ch
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:29:57 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o8GWn-0003LE-VC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:29:56 -0400
Received: by mail-lj1-x22d.google.com with SMTP id b23so9995108ljh.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZX8GUvQixot1Q5+4xkY1MVCBe4/15y6OVEiFC4cSbE=;
 b=npcfomJdH3eiKh27wjO+ieIuveMM76krL9t4V+aIJy1dqDD4wTs8QOlqAY8aTsOEnN
 bb/5K72kN0xbdZvOVaF9eZBYm8zP5lbV3kVWA5PYM+mYf9ZVK06BXWHKq7q1apgwaKHl
 dntVh+N/b+A0goi2BSAxKdiUerz3tz/VAePstNC1vPeRYfqrkDMnsDbnkk/32FhCWIRp
 UuhdTt7DUmt+/HzWMkiFnF7SJJicuiSJDwfbvmlph2Nvx70kQtlwE9/fOkLfiAFht2Zf
 b0H4yeLDAXH6AajNwg4A6NMTntF0YURv82eJNXWwXHEsIIY7tJzD13PblIcWu1wMlnkq
 nliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZX8GUvQixot1Q5+4xkY1MVCBe4/15y6OVEiFC4cSbE=;
 b=Nqe/E+iOYovwISlPBOpRzUCRLnngtiPkEzFgiw3HFKH4KFKt3LqKP9zm7U/fh36nmD
 +zQqSKpvnD2Yofqk0nn3iT5rBDvr1MzjgGdM6Rslw2j+9Su6eTuWQqakd4NbJ8BapVya
 5gBFbaoMdQCUgy1gYGQBp4wpyhf+rDejZ/DlBius+eK/WAKm477ZtRfxOBzMX8eaHDWS
 oR29N9EwoCcgpko7siOXBbBAX6n6LzdSvMVORjQt+XmKkRexipxTy4Sg5n8DeCpcRQyi
 kEqb5JaPQtd+0nRQnvh5PawBToxqJVNDlG+CJTWdwnx8ZLg0YPok/B5RXq6qvFItRjnr
 B92Q==
X-Gm-Message-State: AJIora89qI8ADhp4MQLer1DmOt3DnE4604LjZb0Y94taUeb5wIeETVgo
 yvUdMHR3tgHRqhsKicMpwnUQBrUx7b0pvStPE3E=
X-Google-Smtp-Source: AGRyM1sAhL2QhnEFUWxVydXzK/M1RvnWBvpARo/Yu/Pg3a8JVSWUeM9FwZ8fuj1z0Ju1ZPu2xZoGw0Qw1xQrUHRHOxs=
X-Received: by 2002:a2e:8748:0:b0:25a:7f54:206a with SMTP id
 q8-20020a2e8748000000b0025a7f54206amr14812759ljj.14.1656919791981; Mon, 04
 Jul 2022 00:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 4 Jul 2022 11:29:36 +0400
Message-ID: <CAJ+F1C+rkiiJBi0L6EOh5XmG-GnXtpF3f9bX186TpEyDp6PDSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>, Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009f5ac305e2f5b344"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009f5ac305e2f5b344
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 11:28 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Mon, Jul 4, 2022 at 6:42 AM zhenwei pi <pizhenwei@bytedance.com> wrote=
:
>
>> A vCPU thread always reaches 100% utilization when:
>> - guest uses idle=3Dpoll
>> - disable HLT vm-exit
>> - enable MWAIT
>>
>> Add new guest agent command 'guest-get-cpustats' to get guest CPU
>> statistics, we can know the guest workload and how busy the CPU is.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>  qga/commands-posix.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>>  qga/commands-win32.c |  6 +++
>>  qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 176 insertions(+)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 0469dc409d..e51f4c8f03 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList
>> *qmp_guest_get_diskstats(Error **errp)
>>      return guest_get_diskstats(errp);
>>  }
>>
>> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>> +{
>> +    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
>> +    const char *cpustats =3D "/proc/stat";
>> +    int clk_tck =3D sysconf(_SC_CLK_TCK);
>> +    FILE *fp;
>> +    size_t n;
>> +    char *line =3D NULL;
>> +
>> +    fp =3D fopen(cpustats, "r");
>> +    if (fp  =3D=3D NULL) {
>> +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
>> +        return NULL;
>> +    }
>> +
>> +    while (getline(&line, &n, fp) !=3D -1) {
>> +        GuestCpuStats *cpustat =3D NULL;
>> +        GuestLinuxCpuStats *linuxcpustat;
>> +        int i;
>> +        unsigned long user, system, idle, iowait, irq, softirq, steal,
>> guest;
>> +        unsigned long nice, guest_nice;
>> +        char name[64];
>> +
>> +        i =3D sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu"=
,
>> +                   name, &user, &nice, &system, &idle, &iowait, &irq,
>> &softirq,
>> +                   &steal, &guest, &guest_nice);
>> +
>> +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
>> +        if ((i =3D=3D EOF) || strncmp(name, "cpu", 3) || (name[3] =3D=
=3D '\0')) {
>> +            continue;
>> +        }
>> +
>> +        if (i < 5) {
>> +            slog("Parsing cpu stat from %s failed, see \"man proc\"",
>> cpustats);
>> +            break;
>> +        }
>> +
>> +        cpustat =3D g_new0(GuestCpuStats, 1);
>> +        cpustat->type =3D GUEST_OS_TYPE_LINUXOS;
>> +
>> +        linuxcpustat =3D &cpustat->u.linuxos;
>> +        linuxcpustat->cpu =3D atoi(&name[3]);
>> +        linuxcpustat->user =3D user * 1000 / clk_tck;
>> +        linuxcpustat->nice =3D nice * 1000 / clk_tck;
>> +        linuxcpustat->system =3D system * 1000 / clk_tck;
>> +        linuxcpustat->idle =3D idle * 1000 / clk_tck;
>> +
>> +        if (i > 5) {
>> +            linuxcpustat->has_iowait =3D true;
>> +            linuxcpustat->iowait =3D iowait * 1000 / clk_tck;
>> +        }
>> +
>> +        if (i > 6) {
>> +            linuxcpustat->has_irq =3D true;
>> +            linuxcpustat->irq =3D irq * 1000 / clk_tck;
>> +            linuxcpustat->has_softirq =3D true;
>> +            linuxcpustat->softirq =3D softirq * 1000 / clk_tck;
>> +        }
>> +
>> +        if (i > 8) {
>> +            linuxcpustat->has_steal =3D true;
>> +            linuxcpustat->steal =3D steal * 1000 / clk_tck;
>> +        }
>> +
>> +        if (i > 9) {
>> +            linuxcpustat->has_guest =3D true;
>> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
>> +        }
>> +
>> +        if (i > 10) {
>> +            linuxcpustat->has_guest =3D true;
>> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
>> +            linuxcpustat->has_guestnice =3D true;
>> +            linuxcpustat->guestnice =3D guest_nice * 1000 / clk_tck;
>> +        }
>> +
>> +        QAPI_LIST_APPEND(tail, cpustat);
>> +    }
>> +
>> +    free(line);
>> +    fclose(fp);
>> +    return head;
>> +}
>> +
>>  #else /* defined(__linux__) */
>>
>>  void qmp_guest_suspend_disk(Error **errp)
>> @@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList
>> *qmp_guest_get_diskstats(Error **errp)
>>      return NULL;
>>  }
>>
>> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>> +{
>> +    error_setg(errp, QERR_UNSUPPORTED);
>> +    return NULL;
>> +}
>>
>>  #endif /* CONFIG_FSFREEZE */
>>
>> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>> index 36f94c0f9c..7ed7664715 100644
>> --- a/qga/commands-win32.c
>> +++ b/qga/commands-win32.c
>> @@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList
>> *qmp_guest_get_diskstats(Error **errp)
>>      error_setg(errp, QERR_UNSUPPORTED);
>>      return NULL;
>>  }
>> +
>> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>> +{
>> +    error_setg(errp, QERR_UNSUPPORTED);
>> +    return NULL;
>> +}
>> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>> index 9fa20e791b..3b795222e9 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -1576,3 +1576,84 @@
>>  { 'command': 'guest-get-diskstats',
>>    'returns': ['GuestDiskStatsInfo']
>>  }
>> +
>> +##
>> +# @GuestOsType:
>> +#
>> +# An enumeration of OS type
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum': 'GuestOsType',
>> +  'data': [ 'linuxos', 'windowsos' ] }
>>
>
> I would rather keep this enum specific to GuestCpuStats,
> "GuestLinuxCpuStatsType"?
>

Oops, I meant "GuestCpuStatsType"


> I would also drop the "os" suffix
>
> +
>> +
>> +##
>> +# @GuestLinuxCpuStats:
>> +#
>> +# CPU statistics of Linux
>> +#
>> +# @cpu: CPU index in guest OS
>> +#
>> +# @user: Time spent in user mode
>> +#
>> +# @nice: Time spent in user mode with low priority (nice)
>> +#
>> +# @system: Time spent in system mode
>> +#
>> +# @idle: Time spent in the idle task
>> +#
>> +# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)
>> +#
>> +# @irq: Time servicing interrupts (since Linux 2.6.0-test4)
>> +#
>> +# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)
>> +#
>> +# @steal: Stolen time by host (since Linux 2.6.11)
>> +#
>> +# @guest: ime spent running a virtual CPU for guest operating systems
>> under
>> +#         the  control of the Linux kernel (since Linux 2.6.24)
>> +#
>> +# @guestnice: Time spent running a niced guest (since Linux 2.6.33)
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'struct': 'GuestLinuxCpuStats',
>> +  'data': {'cpu': 'int',
>> +           'user': 'uint64',
>> +           'nice': 'uint64',
>> +           'system': 'uint64',
>> +           'idle': 'uint64',
>> +           '*iowait': 'uint64',
>> +           '*irq': 'uint64',
>> +           '*softirq': 'uint64',
>> +           '*steal': 'uint64',
>> +           '*guest': 'uint64',
>> +           '*guestnice': 'uint64'
>> +           } }
>> +
>> +##
>> +# @GuestCpuStats:
>> +#
>> +# Get statistics of each CPU in millisecond.
>> +#
>> +# - @linux: Linux style CPU statistics
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'union': 'GuestCpuStats',
>> +  'base': { 'type': 'GuestOsType' },
>> +  'discriminator': 'type',
>> +  'data': { 'linuxos': 'GuestLinuxCpuStats' } }
>> +
>> +##
>> +# @guest-get-cpustats:
>> +#
>> +# Retrieve information about CPU stats.
>> +# Returns: List of CPU stats of guest.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'command': 'guest-get-cpustats',
>> +  'returns': ['GuestCpuStats']
>> +}
>> --
>> 2.20.1
>>
>>
>>
> Looks good to me otherwise.
> thanks
>
> --
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009f5ac305e2f5b344
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 4, 2022 at 11:28 AM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 4, 2=
022 at 6:42 AM zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" ta=
rget=3D"_blank">pizhenwei@bytedance.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">A vCPU thread always reaches 100% ut=
ilization when:<br>
- guest uses idle=3Dpoll<br>
- disable HLT vm-exit<br>
- enable MWAIT<br>
<br>
Add new guest agent command &#39;guest-get-cpustats&#39; to get guest CPU<b=
r>
statistics, we can know the guest workload and how busy the CPU is.<br>
<br>
Signed-off-by: zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" ta=
rget=3D"_blank">pizhenwei@bytedance.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 89 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-win32.c |=C2=A0 6 +++<br>
=C2=A0qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++<br=
>
=C2=A03 files changed, 176 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0469dc409d..e51f4c8f03 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0return guest_get_diskstats(errp);<br>
=C2=A0}<br>
<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestCpuStatsList *head =3D NULL, **tail =3D &amp;head;<br>
+=C2=A0 =C2=A0 const char *cpustats =3D &quot;/proc/stat&quot;;<br>
+=C2=A0 =C2=A0 int clk_tck =3D sysconf(_SC_CLK_TCK);<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 size_t n;<br>
+=C2=A0 =C2=A0 char *line =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(cpustats, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestCpuStats *cpustat =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLinuxCpuStats *linuxcpustat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long user, system, idle, iowait, irq,=
 softirq, steal, guest;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long nice, guest_nice;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[64];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%s %lu %lu %lu %lu %l=
u %lu %lu %lu %lu %lu&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name,=
 &amp;user, &amp;nice, &amp;system, &amp;idle, &amp;iowait, &amp;irq, &amp;=
softirq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
steal, &amp;guest, &amp;guest_nice);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* drop &quot;cpu 1 2 3 ...&quot;, get &quot;c=
puX 1 2 3 ...&quot; only */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((i =3D=3D EOF) || strncmp(name, &quot;cpu&=
quot;, 3) || (name[3] =3D=3D &#39;\0&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slog(&quot;Parsing cpu stat from=
 %s failed, see \&quot;man proc\&quot;&quot;, cpustats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat =3D g_new0(GuestCpuStats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;type =3D GUEST_OS_TYPE_LINUXOS;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat =3D &amp;cpustat-&gt;u.linuxos;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;cpu =3D atoi(&amp;name[3]);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;user =3D user * 1000 / clk_tc=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;nice =3D nice * 1000 / clk_tc=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;system =3D system * 1000 / cl=
k_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;idle =3D idle * 1000 / clk_tc=
k;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_iowait =3D =
true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;iowait =3D iowa=
it * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 6) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_irq =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;irq =3D irq * 1=
000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_softirq =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;softirq =3D sof=
tirq * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_steal =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;steal =3D steal=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 9) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guest =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guest =3D guest=
 * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;has_guestnice =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat-&gt;guestnice =3D g=
uest_nice * 1000 / clk_tck;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, cpustat);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free(line);<br>
+=C2=A0 =C2=A0 fclose(fp);<br>
+=C2=A0 =C2=A0 return head;<br>
+}<br>
+<br>
=C2=A0#else /* defined(__linux__) */<br>
<br>
=C2=A0void qmp_guest_suspend_disk(Error **errp)<br>
@@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 36f94c0f9c..7ed7664715 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_UNSUPPORTED);<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
+<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 9fa20e791b..3b795222e9 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -1576,3 +1576,84 @@<br>
=C2=A0{ &#39;command&#39;: &#39;guest-get-diskstats&#39;,<br>
=C2=A0 =C2=A0&#39;returns&#39;: [&#39;GuestDiskStatsInfo&#39;]<br>
=C2=A0}<br>
+<br>
+##<br>
+# @GuestOsType:<br>
+#<br>
+# An enumeration of OS type<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;enum&#39;: &#39;GuestOsType&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;linuxos&#39;, &#39;windowsos&#39; ] }<br></b=
lockquote><div><br></div><div>I would rather keep this enum specific to Gue=
stCpuStats, &quot;GuestLinuxCpuStatsType&quot;?</div></div></div></blockquo=
te><div><br></div><div>Oops, I meant &quot;GuestCpuStatsType&quot;</div><di=
v> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div><br></div><div>I would also drop the &=
quot;os&quot; suffix<br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+<br>
+<br>
+##<br>
+# @GuestLinuxCpuStats:<br>
+#<br>
+# CPU statistics of Linux<br>
+#<br>
+# @cpu: CPU index in guest OS<br>
+#<br>
+# @user: Time spent in user mode<br>
+#<br>
+# @nice: Time spent in user mode with low priority (nice)<br>
+#<br>
+# @system: Time spent in system mode<br>
+#<br>
+# @idle: Time spent in the idle task<br>
+#<br>
+# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)<br>
+#<br>
+# @irq: Time servicing interrupts (since Linux 2.6.0-test4)<br>
+#<br>
+# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)<br>
+#<br>
+# @steal: Stolen time by host (since Linux 2.6.11)<br>
+#<br>
+# @guest: ime spent running a virtual CPU for guest operating systems unde=
r<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the=C2=A0 control of the Linux kernel (=
since Linux 2.6.24)<br>
+#<br>
+# @guestnice: Time spent running a niced guest (since Linux 2.6.33)<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestLinuxCpuStats&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;cpu&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;user&#39;: &#39;uint64&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;nice&#39;: &#39;uint64&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;system&#39;: &#39;uint64&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;idle&#39;: &#39;uint64&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*iowait&#39;: &#39;uint64&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*irq&#39;: &#39;uint64&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*softirq&#39;: &#39;uint64&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*steal&#39;: &#39;uint64&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*guest&#39;: &#39;uint64&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*guestnice&#39;: &#39;uint64=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} }<br>
+<br>
+##<br>
+# @GuestCpuStats:<br>
+#<br>
+# Get statistics of each CPU in millisecond.<br>
+#<br>
+# - @linux: Linux style CPU statistics<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;union&#39;: &#39;GuestCpuStats&#39;,<br>
+=C2=A0 &#39;base&#39;: { &#39;type&#39;: &#39;GuestOsType&#39; },<br>
+=C2=A0 &#39;discriminator&#39;: &#39;type&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;linuxos&#39;: &#39;GuestLinuxCpuStats&#39; }=
 }<br>
+<br>
+##<br>
+# @guest-get-cpustats:<br>
+#<br>
+# Retrieve information about CPU stats.<br>
+# Returns: List of CPU stats of guest.<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;command&#39;: &#39;guest-get-cpustats&#39;,<br>
+=C2=A0 &#39;returns&#39;: [&#39;GuestCpuStats&#39;]<br>
+}<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>Looks good to me otherwise.<br></div=
><div>thanks<br></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br=
></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009f5ac305e2f5b344--

