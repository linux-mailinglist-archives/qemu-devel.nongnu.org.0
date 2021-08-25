Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CA3F73C2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:54:23 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqXs-0003yV-4c
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIqN2-0007Ta-PU
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:00 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIqN1-0001iA-03
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:00 -0400
Received: by mail-ed1-x52f.google.com with SMTP id n11so7072870edv.11
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1QNCoZZ+JjKsLFNTuScSEkInMFGF3/4bgLFm9jv+fw=;
 b=jKTYJkXycfDAKnVwv1YsPPNVTcG6N+2tohOzLBBycCJ3gBgIbCNi36ZYVW0MT+vOwT
 h0uhVW4j/e2RvqLgGgojxdr4gYK1v6fd7WWUdoIfU2NPa7gjURMxy50o5WzSZndbZQ1B
 xOjf7QwDB7XtIMVR3FUAqF2a1Owj+dDSjrEtd5/XRaMGXIWmTQ0zEiR8eNRIiLXc5lUC
 oUmosF7onAx4xshCMogwq1Fts4Xr9RPjCHkGnMz3b9TMH0uaOD21qeuXq/Aesg5lC7Gu
 xMxzLdo9IHQ0ZoHeOZX8S3Ilm5ni5C8svW+zO5XIwqLDqMUKOqBD9jH8JOM2X621zd7g
 QElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1QNCoZZ+JjKsLFNTuScSEkInMFGF3/4bgLFm9jv+fw=;
 b=POfPbvgXNr2FLdSsWYTxSX7rARzPxd1gDuCG+2PPMTox1B/XsDwOA4lnpwuJOz6ILs
 YkrpHIL68GHGU4vTHnFpOzJ01BcinZaEbibmnf1bmiQsKCiKrqpHKcnsa3tpXPbhskws
 C9gctuXodmBfdM7lwFHBHJYPQXmKbGEK2v1xJc1Bef45HNzxZ1qUX8qnQ1XUKmTDmD4m
 pc7pp2v/kO10d6IBQYxOk2mGRIbqN/kU0GQjmMlsk99Ve49wfI6SHED0mA3/Id5oE503
 lqq1U8TmxI1K1f42xIVWqofrW7ig+62yGKS230t6ibMfFoO6TAMzw05vN3FVSuH2ScCJ
 Cd7A==
X-Gm-Message-State: AOAM5315zKYyJRcPHJ3LUdnv2pnGtNN6a4cE5G0TckMWBcymK28szhaH
 DEa0QayU/9VF26pzz4otevdmST6yFAxSEoSwyAE=
X-Google-Smtp-Source: ABdhPJx0/xT+1CmddDEo+3T1JU7wphojFtL+bjagCdaa1PWvSQocF1hicKdmGysd/nJ7M/eWFZ3b/GMzouFkCJKqRrQ=
X-Received: by 2002:aa7:d9d3:: with SMTP id v19mr12460094eds.257.1629888176917; 
 Wed, 25 Aug 2021 03:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210825093701.668122-1-s.reiter@proxmox.com>
 <20210825093701.668122-2-s.reiter@proxmox.com>
In-Reply-To: <20210825093701.668122-2-s.reiter@proxmox.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Aug 2021 14:42:45 +0400
Message-ID: <CAJ+F1CJd5jHV9YLEchiPkQmKkp-pu9AaR_hgDgKpYUjFAK7N3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] monitor/hmp: correctly invert password argument
 detection again
To: Stefan Reiter <s.reiter@proxmox.com>
Content-Type: multipart/alternative; boundary="000000000000cf0f8005ca5fe943"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cf0f8005ca5fe943
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 25, 2021 at 1:38 PM Stefan Reiter <s.reiter@proxmox.com> wrote:

> Commit cfb5387a1d 'hmp: remove "change vnc TARGET" command' claims to
> remove the HMP "change vnc" command, but doesn't actually do that.
> Instead if rewires it to use 'qmp_change_vnc_password', and in the
> process inverts the argument detection - ignoring the first issue, this
> inversion is wrong, as this will now ask the user for a password if one
> is already provided, and simply fail if none is given.
>
> Fixes: cfb5387a1d ("hmp: remove "change vnc TARGET" command")
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>

Oh.. hmp, hear me please!

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  monitor/hmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index f7a211e5a4..31366e6331 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1591,7 +1591,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>          }
>          if (strcmp(target, "passwd") =3D=3D 0 ||
>              strcmp(target, "password") =3D=3D 0) {
> -            if (arg) {
> +            if (!arg) {
>                  MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP,
> common);
>                  monitor_read_password(hmp_mon, hmp_change_read_arg, NULL=
);
>                  return;
> --
> 2.30.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cf0f8005ca5fe943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 25, 2021 at 1:38 PM Ste=
fan Reiter &lt;<a href=3D"mailto:s.reiter@proxmox.com">s.reiter@proxmox.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Commit cfb5387a1d &#39;hmp: remove &quot;change vnc TARGET&quot; command&#3=
9; claims to<br>
remove the HMP &quot;change vnc&quot; command, but doesn&#39;t actually do =
that.<br>
Instead if rewires it to use &#39;qmp_change_vnc_password&#39;, and in the<=
br>
process inverts the argument detection - ignoring the first issue, this<br>
inversion is wrong, as this will now ask the user for a password if one<br>
is already provided, and simply fail if none is given.<br>
<br>
Fixes: cfb5387a1d (&quot;hmp: remove &quot;change vnc TARGET&quot; command&=
quot;)<br>
Signed-off-by: Stefan Reiter &lt;<a href=3D"mailto:s.reiter@proxmox.com" ta=
rget=3D"_blank">s.reiter@proxmox.com</a>&gt;<br></blockquote><div><br></div=
><div>Oh.. hmp, hear me please!<br></div><div><br></div><div>Reviewed-by: M=
arc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">ma=
rcandre.lureau@redhat.com</a>&gt;<br></div><div> <br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0monitor/hmp-cmds.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index f7a211e5a4..31366e6331 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -1591,7 +1591,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(target, &quot;passwd&quot;) =
=3D=3D 0 ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcmp(target, &quot;passwo=
rd&quot;) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!arg) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MonitorHMP *h=
mp_mon =3D container_of(mon, MonitorHMP, common);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_read_=
password(hmp_mon, hmp_change_read_arg, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cf0f8005ca5fe943--

