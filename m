Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1769F5634F3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:16:08 +0200 (CEST)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7HRG-0006vf-UP
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o7H5A-0000m6-8L
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:53:18 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o7H58-0000yM-3E
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:53:16 -0400
Received: by mail-lf1-x132.google.com with SMTP id a13so3981354lfr.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6KiTomPuujhnSvUCMFxbCkVC1nz/8TN32ca5HOPywBA=;
 b=qqRlEccqfyQ7wohlvt1At3ui3rfMHRyGDHMs6/wy2BiA8mKwRLpNQIBb9R4/uPzWp2
 cAIHqG9wtpLf8MLgEoTL+y4iNBPnExzahHARF5lhSHuXuPFgma+viW4avQUVyiyyXhKf
 UqnYxitAZHDNvarhaXtm44qFa0jFKY55sJIinxOZfBe6CGgZwBwVF4IRlEMe5jzH8lY1
 lPRrR3jJ9sSAXYBGEZ4air8qqjtW7yzV0mgj/rEqFx7BtirQ4srfH/QPXXVOdsXApwr8
 IQRDGp5nj4Iyh0A3Z2VAFaRtgQp2Hj2oKcR2vzfcVG7Gcv3Q0WeCt508P0ewV/1jWHv3
 gcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KiTomPuujhnSvUCMFxbCkVC1nz/8TN32ca5HOPywBA=;
 b=kQDe1/R09TdhSk9I708kZ9kIA2T1FZ8PMlRXtpstnrTIuAL+XlLJyfhkFrHjau+A9M
 oaBaA8Qq0xANE4Nd13wH+be4GtfaOinEu7f9z5wwYXAIxzpH1ceTeANk/A2fxhpFZbgS
 WZRxdtIK4a1Lgd+rTq1x2PuvOZ+VkYhhhHWimbzjtqsRt+YvOXSIC1uc+eWNk7n+D0Z6
 PB1y77RloNl+tjqRZADS6+xnftdCvYjmVaJxbkvjJRINnI39zT4Qrrxs4TYBul6qjTc/
 6TQZlPTKNDQjANfF/Qwl5mXxxnzolxqSdzfUIyDUE69YcPwcoUMYPR43mSVGQRpeGGSr
 JgWQ==
X-Gm-Message-State: AJIora8FqxVdxHUINxcg2EXUgWcaAE/4xR7C1kOpPDAXSjjkQh3CQvYh
 xnLEM+SmdR9qT3CnRs69V7YSPDXnVbZGtyvpSU4=
X-Google-Smtp-Source: AGRyM1sFcWAHg8DjXZ5bcWeKZWCW1hzmn0F0kjYNh4H1hHmFM01/rPJR6eNuqNG2676ooA4tdVJuolBx+CJl4tdHeQE=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr8803701lfb.121.1656683591620; Fri, 01
 Jul 2022 06:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220701030533.575255-1-pizhenwei@bytedance.com>
In-Reply-To: <20220701030533.575255-1-pizhenwei@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 1 Jul 2022 17:52:58 +0400
Message-ID: <CAJ+F1CK6heqsh=RegggoD8x19BsNOtT4y2_CH_OFnChsv7vDwg@mail.gmail.com>
Subject: Re: [PATCH] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, 
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fbdc2105e2beb40c"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

--000000000000fbdc2105e2beb40c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jul 1, 2022 at 7:11 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

> A vCPU thread always reaches 100% utilization when:
> - guest uses idle=3Dpoll
> - disable HLT vm-exit
> - enable MWAIT
>
> Add new guest agent command 'guest-get-cpustats' to get guest CPU
> statistics, we can know the guest workload and how busy the CPU is.
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qga/commands-posix.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |  6 ++++
>  qga/qapi-schema.json | 49 ++++++++++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d..2847023876 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2893,6 +2893,73 @@ GuestDiskStatsInfoList
> *qmp_guest_get_diskstats(Error **errp)
>      return guest_get_diskstats(errp);
>  }
>
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
> +    const char *cpustats =3D "/proc/stat";
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
> +        if (strncmp(name, "cpu", 3) || (name[3] =3D=3D '\0')) {
>

For extra safety, check !name as well


> +            continue;
> +        }
> +
>

if i < 5, I guess you should warn and continue


> +        cpustat =3D g_new0(GuestCpuStats, 1);
> +        cpustat->cpu =3D atoi(&name[3]);
> +        cpustat->has_user =3D true;
> +        cpustat->user =3D user * 10;
>

proc(5) says that the value is given "in units of USER_HZ (1/100ths of a
second on most architectures, use sysconf(_SC_CLK_TCK) to obtain the right
value)", so we should adjust this code if we want to return correctly in ms=
.


> +        cpustat->has_system =3D true;
> +        cpustat->system =3D system * 10;
> +        cpustat->has_idle =3D true;
> +        cpustat->idle =3D idle * 10;
> +
> +        /* Linux version >=3D 2.6 */
>

That's pretty old now (2003), not sure anyone would care about that
comment, but np ;)


> +        if (i > 5) {
> +            cpustat->has_iowait =3D true;
> +            cpustat->iowait =3D iowait * 10;
> +            cpustat->has_irq =3D true;
> +            cpustat->irq =3D irq * 10;
> +            cpustat->has_softirq =3D true;
> +            cpustat->softirq =3D softirq * 10;
> +        }
> +
> +        if (i > 8) {
> +            cpustat->has_steal =3D true;
> +            cpustat->steal =3D steal * 10;
> +        }
> +
> +        if (i > 9) {
> +            cpustat->has_guest =3D true;
> +            cpustat->guest =3D guest * 10;
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
> @@ -3247,6 +3314,11 @@ GuestDiskStatsInfoList
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
> index 9fa20e791b..4859c887b2 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1576,3 +1576,52 @@
>  { 'command': 'guest-get-diskstats',
>    'returns': ['GuestDiskStatsInfo']
>  }
> +
> +##
> +# @GuestCpuStats:
> +#
> +# Get statistics of each CPU in millisecond.
> +#
> +# @cpu: CPU index in guest OS
> +#
> +# @user: CPU time of user mode
>

"Time spent in user mode." is more understandable (from man proc(5))

Same for the other descriptions.

+#
> +# @system: CPU time of system mode
> +#
> +# @idle: CPU time of idle state
> +#
> +# @iowait: CPU time waiting IO
> +#
> +# @irq: CPU time of hardware interrupt
> +#
> +# @softirq: CPU time of soft interrupt
> +#
> +# @steal: CPU time stolen by host
> +#
> +# @guest: CPU time of running guest mode
>

Why not "guest_nice" ?

Do we expect this struct to be equally meaningful for other OSes?
Otherwise, I would suggest to make a "linux" variant, perhaps.

+#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestCpuStats',
> +  'data': {'cpu': 'int',
> +           '*user': 'uint64',
> +           '*system': 'uint64',
> +           '*idle': 'uint64',
> +           '*iowait': 'uint64',
> +           '*irq': 'uint64',
> +           '*softirq': 'uint64',
> +           '*steal': 'uint64',
> +           '*guest': 'uint64'
> +           } }
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
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fbdc2105e2beb40c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 1, 2022 at 7:11 AM zhen=
wei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">A vCPU thread always reaches 100% utilization when:<br>
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
=C2=A0qga/commands-posix.c | 72 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-win32.c |=C2=A0 6 ++++<br>
=C2=A0qga/qapi-schema.json | 49 ++++++++++++++++++++++++++++++<br>
=C2=A03 files changed, 127 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 0469dc409d..2847023876 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2893,6 +2893,73 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Erro=
r **errp)<br>
=C2=A0 =C2=A0 =C2=A0return guest_get_diskstats(errp);<br>
=C2=A0}<br>
<br>
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestCpuStatsList *head =3D NULL, **tail =3D &amp;head;<br>
+=C2=A0 =C2=A0 const char *cpustats =3D &quot;/proc/stat&quot;;<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(name, &quot;cpu&quot;, 3) || (name=
[3] =3D=3D &#39;\0&#39;)) {<br></blockquote><div><br></div><div>For extra s=
afety, check !name as well<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br></blockquote><div><br></div><div>if i &lt; 5, I guess you should warn =
and continue<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat =3D g_new0(GuestCpuStats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;cpu =3D atoi(&amp;name[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_user =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;user =3D user * 10;<br></blockquot=
e><div><br></div><div>proc(5) says that the value is given &quot;in units o=
f USER_HZ (1/100ths of a second on most architectures, use sysconf(_SC_CLK_=
TCK) to obtain the right value)&quot;, so we should adjust this code if we =
want to return correctly in ms.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_system =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;system =3D system * 10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_idle =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;idle =3D idle * 10;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Linux version &gt;=3D 2.6 */<br></blockquot=
e><div><br></div><div>That&#39;s pretty old now (2003), not sure anyone wou=
ld care about that comment, but np ;)</div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_iowait =3D true;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;iowait =3D iowait * =
10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_irq =3D true;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;irq =3D irq * 10;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_softirq =3D true=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;softirq =3D softirq =
* 10;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_steal =3D true;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;steal =3D steal * 10=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 9) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;has_guest =3D true;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpustat-&gt;guest =3D guest * 10=
;<br>
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
@@ -3247,6 +3314,11 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Erro=
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
index 9fa20e791b..4859c887b2 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -1576,3 +1576,52 @@<br>
=C2=A0{ &#39;command&#39;: &#39;guest-get-diskstats&#39;,<br>
=C2=A0 =C2=A0&#39;returns&#39;: [&#39;GuestDiskStatsInfo&#39;]<br>
=C2=A0}<br>
+<br>
+##<br>
+# @GuestCpuStats:<br>
+#<br>
+# Get statistics of each CPU in millisecond.<br>
+#<br>
+# @cpu: CPU index in guest OS<br>
+#<br>
+# @user: CPU time of user mode<br></blockquote><div><br></div><div>&quot;T=
ime spent in user mode.&quot; is more understandable (from man proc(5))</di=
v><div><br></div><div>Same for the other descriptions.<br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+#<br>
+# @system: CPU time of system mode<br>
+#<br>
+# @idle: CPU time of idle state<br>
+#<br>
+# @iowait: CPU time waiting IO<br>
+#<br>
+# @irq: CPU time of hardware interrupt<br>
+#<br>
+# @softirq: CPU time of soft interrupt<br>
+#<br>
+# @steal: CPU time stolen by host<br>
+#<br>
+# @guest: CPU time of running guest mode<br></blockquote><div><br></div><d=
iv>Why not &quot;guest_nice&quot; ?</div><div><br></div><div>Do we expect t=
his struct to be equally meaningful for other OSes? Otherwise, I would sugg=
est to make a &quot;linux&quot; variant, perhaps.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestCpuStats&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;cpu&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*user&#39;: &#39;uint64&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*system&#39;: &#39;uint64&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*idle&#39;: &#39;uint64&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*iowait&#39;: &#39;uint64&#3=
9;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*irq&#39;: &#39;uint64&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*softirq&#39;: &#39;uint64&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*steal&#39;: &#39;uint64&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*guest&#39;: &#39;uint64&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} }<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fbdc2105e2beb40c--

