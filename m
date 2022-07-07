Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405CA569CB0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:09:40 +0200 (CEST)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MZv-0000tF-Ar
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1o9MQy-00024h-2m
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1o9MQq-0000Hm-61
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NpanJFJEC0/HJdn8dzmZSTZenVnngY8N/K2XUKj08aI=;
 b=XmooMbjeSDsSAAOeXp+WqHB6DUNVlG4cIBnLRRVb4hrKmDjP3B23bCQJN1wAeB0mFBE4xl
 cA60TIxBxbLtW1CvlsoZvu+4hdBI53WOPxcm6/syKIVq6J9JsZaVPib/t0BpqhPSqgy8bD
 Zjinar/AilkqXK6Pqvro6JXv8bAPFcc=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-i_Nv_pgjOaObaWxLWm7UPw-1; Thu, 07 Jul 2022 04:00:12 -0400
X-MC-Unique: i_Nv_pgjOaObaWxLWm7UPw-1
Received: by mail-yb1-f200.google.com with SMTP id
 g17-20020a25ef11000000b0066e49f6c461so7344787ybd.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 01:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpanJFJEC0/HJdn8dzmZSTZenVnngY8N/K2XUKj08aI=;
 b=MZ5xWDHbBbnDw8lci/7ORJh6fw1Dz6OF31FyB5rtsPwuexsrtOyzGGjsjtRJcMo3Ib
 dA9zXyjn22HzsZ1A02BxiZ/2dswkyMyF477k7kCy67QBoFrJLdQz1eoiJRmnYNXzrNqr
 5beMJ45rooi412rr5Mwavfl5qQjIaTkNtU1NCyneUrMzX81vBBPoaG2PhwJGmNWXcJKw
 5b1nmsyMuBFHRoZp2rEVa4Y2NJPoSBcLNp222hE35uxvzUjdNxfSAft3j9VfvV+OuvMz
 gKDl2ddCVw+6cd1AtlcXjpEo+P7jHStZRrpa0J/UDOYfllbHdM2E+Wzc4PCLxjYAStmG
 enGg==
X-Gm-Message-State: AJIora+TsZR1czaspqcWTMkQ9PopBx7Ax0hW1mfDXa9ChyVsGlkPtjbs
 qvEEwKvYKAHjVEzcAyM3eqGNH8CzXMKjeuozXpoo7918vaU0Rz1gniAfOWUbTHgDgOe6/DPDQ2x
 xWDNz9gOTC4yb4OkXY+myKIMMPnppiFw=
X-Received: by 2002:a25:8887:0:b0:669:97f5:d0b8 with SMTP id
 d7-20020a258887000000b0066997f5d0b8mr49506200ybl.432.1657180812216; 
 Thu, 07 Jul 2022 01:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdGAOV9bXv53Z85V/3xYHBJA0NkfJPRjSvK9Q/yV2LlumHV6FT1MkwBZFV50quR0obyjZDlW4P4k/rg+IweZI=
X-Received: by 2002:a25:8887:0:b0:669:97f5:d0b8 with SMTP id
 d7-20020a258887000000b0066997f5d0b8mr49506175ybl.432.1657180811995; Thu, 07
 Jul 2022 01:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220707005602.696557-1-pizhenwei@bytedance.com>
 <20220707005602.696557-3-pizhenwei@bytedance.com>
In-Reply-To: <20220707005602.696557-3-pizhenwei@bytedance.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 7 Jul 2022 11:00:00 +0300
Message-ID: <CAPMcbCrGA8rfUrCnzjB-k0yE0S72zVS=0zAyZdCWa8SvTFu41Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a0c38b05e33279b6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--000000000000a0c38b05e33279b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Jul 7, 2022 at 4:01 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

> A vCPU thread always reaches 100% utilization when:
> - guest uses idle=3Dpoll
> - disable HLT vm-exit
> - enable MWAIT
>
> Add new guest agent command 'guest-get-cpustats' to get guest CPU
> statistics, we can know the guest workload and how busy the CPU is.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qga/commands-posix.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |  6 +++
>  qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d..f18530d85f 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList
> *qmp_guest_get_diskstats(Error **errp)
>      return guest_get_diskstats(errp);
>  }
>
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
> +    const char *cpustats =3D "/proc/stat";
> +    int clk_tck =3D sysconf(_SC_CLK_TCK);
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(cpustats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        GuestCpuStats *cpustat =3D NULL;
> +        GuestLinuxCpuStats *linuxcpustat;
> +        int i;
> +        unsigned long user, system, idle, iowait, irq, softirq, steal,
> guest;
> +        unsigned long nice, guest_nice;
> +        char name[64];
> +
> +        i =3D sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
> +                   name, &user, &nice, &system, &idle, &iowait, &irq,
> &softirq,
> +                   &steal, &guest, &guest_nice);
> +
> +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
> +        if ((i =3D=3D EOF) || strncmp(name, "cpu", 3) || (name[3] =3D=3D=
 '\0')) {
> +            continue;
> +        }
> +
> +        if (i < 5) {
> +            slog("Parsing cpu stat from %s failed, see \"man proc\"",
> cpustats);
> +            break;
> +        }
> +
> +        cpustat =3D g_new0(GuestCpuStats, 1);
> +        cpustat->type =3D GUEST_CPU_STATS_TYPE_LINUX;
> +
> +        linuxcpustat =3D &cpustat->u.q_linux;
> +        linuxcpustat->cpu =3D atoi(&name[3]);
> +        linuxcpustat->user =3D user * 1000 / clk_tck;
> +        linuxcpustat->nice =3D nice * 1000 / clk_tck;
> +        linuxcpustat->system =3D system * 1000 / clk_tck;
> +        linuxcpustat->idle =3D idle * 1000 / clk_tck;
> +
> +        if (i > 5) {
> +            linuxcpustat->has_iowait =3D true;
> +            linuxcpustat->iowait =3D iowait * 1000 / clk_tck;
> +        }
> +
> +        if (i > 6) {
> +            linuxcpustat->has_irq =3D true;
> +            linuxcpustat->irq =3D irq * 1000 / clk_tck;
> +            linuxcpustat->has_softirq =3D true;
> +            linuxcpustat->softirq =3D softirq * 1000 / clk_tck;
> +        }
> +
> +        if (i > 8) {
> +            linuxcpustat->has_steal =3D true;
> +            linuxcpustat->steal =3D steal * 1000 / clk_tck;
> +        }
> +
> +        if (i > 9) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +        }
> +
> +        if (i > 10) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +            linuxcpustat->has_guestnice =3D true;
> +            linuxcpustat->guestnice =3D guest_nice * 1000 / clk_tck;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, cpustat);
> +    }
> +
> +    free(line);
> +    fclose(fp);
> +    return head;
> +}
> +
>  #else /* defined(__linux__) */
>
>  void qmp_guest_suspend_disk(Error **errp)
> @@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList
> *qmp_guest_get_diskstats(Error **errp)
>      return NULL;
>  }
>
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
>
>  #endif /* CONFIG_FSFREEZE */
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 36f94c0f9c..7ed7664715 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList
> *qmp_guest_get_diskstats(Error **errp)
>      error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
> +
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 9fa20e791b..869399ea1a 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1576,3 +1576,84 @@
>  { 'command': 'guest-get-diskstats',
>    'returns': ['GuestDiskStatsInfo']
>  }
> +
> +##
> +# @GuestCpuStatsType:
> +#
> +# An enumeration of OS type
> +#
> +# Since: 7.1
> +##
> +{ 'enum': 'GuestCpuStatsType',
> +  'data': [ 'linux' ] }
> +
> +
> +##
> +# @GuestLinuxCpuStats:
> +#
> +# CPU statistics of Linux
> +#
> +# @cpu: CPU index in guest OS
> +#
> +# @user: Time spent in user mode
> +#
> +# @nice: Time spent in user mode with low priority (nice)
> +#
> +# @system: Time spent in system mode
> +#
> +# @idle: Time spent in the idle task
> +#
> +# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)
> +#
> +# @irq: Time servicing interrupts (since Linux 2.6.0-test4)
> +#
> +# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)
> +#
> +# @steal: Stolen time by host (since Linux 2.6.11)
> +#
> +# @guest: ime spent running a virtual CPU for guest operating systems
> under
> +#         the  control of the Linux kernel (since Linux 2.6.24)
> +#
> +# @guestnice: Time spent running a niced guest (since Linux 2.6.33)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestLinuxCpuStats',
> +  'data': {'cpu': 'int',
> +           'user': 'uint64',
> +           'nice': 'uint64',
> +           'system': 'uint64',
> +           'idle': 'uint64',
> +           '*iowait': 'uint64',
> +           '*irq': 'uint64',
> +           '*softirq': 'uint64',
> +           '*steal': 'uint64',
> +           '*guest': 'uint64',
> +           '*guestnice': 'uint64'
> +           } }
> +
> +##
> +# @GuestCpuStats:
> +#
> +# Get statistics of each CPU in millisecond.
> +#
> +# - @linux: Linux style CPU statistics
> +#
> +# Since: 7.1
> +##
> +{ 'union': 'GuestCpuStats',
> +  'base': { 'type': 'GuestCpuStatsType' },
> +  'discriminator': 'type',
> +  'data': { 'linux': 'GuestLinuxCpuStats' } }
> +
> +##
> +# @guest-get-cpustats:
> +#
> +# Retrieve information about CPU stats.
> +# Returns: List of CPU stats of guest.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'guest-get-cpustats',
> +  'returns': ['GuestCpuStats']
> +}
> --
> 2.20.1
>
>

--000000000000a0c38b05e33279b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a hr=
ef=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>=
&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Jul 7, 2022 at 4:01 AM zhenwei pi &lt;<a href=3D"mailto:pizhenw=
ei@bytedance.com">pizhenwei@bytedance.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">A vCPU thread always reaches 100% =
utilization when:<br>
- guest uses idle=3Dpoll<br>
- disable HLT vm-exit<br>
- enable MWAIT<br>
<br>
Add new guest agent command &#39;guest-get-cpustats&#39; to get guest CPU<b=
r>
statistics, we can know the guest workload and how busy the CPU is.<br>
<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
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
index 0469dc409d..f18530d85f 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;type =3D GUEST_CPU_STATS_TYPE_LINU=
X;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxcpustat =3D &amp;cpustat-&gt;u.q_linux;<b=
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
index 9fa20e791b..869399ea1a 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -1576,3 +1576,84 @@<br>
=C2=A0{ &#39;command&#39;: &#39;guest-get-diskstats&#39;,<br>
=C2=A0 =C2=A0&#39;returns&#39;: [&#39;GuestDiskStatsInfo&#39;]<br>
=C2=A0}<br>
+<br>
+##<br>
+# @GuestCpuStatsType:<br>
+#<br>
+# An enumeration of OS type<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;enum&#39;: &#39;GuestCpuStatsType&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;linux&#39; ] }<br>
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
+=C2=A0 &#39;base&#39;: { &#39;type&#39;: &#39;GuestCpuStatsType&#39; },<br=
>
+=C2=A0 &#39;discriminator&#39;: &#39;type&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;linux&#39;: &#39;GuestLinuxCpuStats&#39; } }=
<br>
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
</blockquote></div></div>

--000000000000a0c38b05e33279b6--


