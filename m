Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFC414CE1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:20:13 +0200 (CEST)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT42e-0005Ob-Hf
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mT411-0003yf-LB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:18:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mT40y-00084H-UO
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:18:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d21so7799628wra.12
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qk9U05FComn+y5lqHXPjGVD+SFDL4uxSOKhdyz8hUlY=;
 b=LLRbgexUYm35nqoy6+zwUuqg8FNS26KF3jc0qtitB98AUO/BQ6tM4BKwuk6ad0AcNw
 rflUjTAeJDfnf8kR93OUUnAAcAbQHqcNI3YsETdw0VcUZADpk2kVSJb79l3E2WAn+RIP
 6sxLMn7zBpOvxKyoT2GWcl8zxj9XcxI7g2+Gf56wQ9QnLoNUIjHh9hNwU/MSwsmgEijv
 bQCuiBYYpPLNpuh3/KiKHHgUSQRHcRf2LD5YEYtdy+pNsITHtpgycxsT/waKBfDkqBJ9
 SO+DHr4CWbnXwg5Y9loD2/C2a55ShClPHGmve7CIocXeBpactpqaApXSTM6qQFozY/Vx
 ISug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qk9U05FComn+y5lqHXPjGVD+SFDL4uxSOKhdyz8hUlY=;
 b=2DZgD41t8Ej5GgyLLhY8hvBZv3PZP6MOkPzp88qDP5YECsywNEkHCzLwY1pJadIign
 n2ZRY1jl8RoX3jTyiBv3tDl8XTbwcGyIi1JQZX6IBSXyyFObrbHCDCdqGoRHY/luGqP9
 6w7y0NSSCB90NNwlXgOOZXb+GMhlPt419jwGz9dNU95+uRKFyWjTdG5pGmpSP8sNjE0U
 HTmyZgm2F5jTEqpK/f6iTcNzUwZETiE+E5WX63dvsvH4wnvSsky6jQtksNXh+hSmRZIR
 SlVJtfpJ/WYtxsMgt3EkkVj9uDn2EOwwsxxOPkIS4R4RNtZLa5Ig/3zY92N5NH0kyU3k
 S3bQ==
X-Gm-Message-State: AOAM532nky91IwTs7svDUHGy5azrUsZs+tTxB5N094OsS3gWzCdPYrh1
 f8c5+A9VPsKeij0/BT0hLclPU+8j8VlABRmK0NHfd1e+SY4=
X-Google-Smtp-Source: ABdhPJwy8tCnlJBnwsGddl5hnPcFCYMMJOlKyaCAZK2p1c9BfqYkX6ytTRjWBXevfJD1Kz9zQ8gN2owiUWlN9fTkUoE=
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr11060150wms.15.1632323907450; 
 Wed, 22 Sep 2021 08:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210826185813.248441-1-peterx@redhat.com>
 <20210826185813.248441-4-peterx@redhat.com>
In-Reply-To: <20210826185813.248441-4-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Sep 2021 19:18:15 +0400
Message-ID: <CAJ+F1C+52DJb4c8Qx66xA1QS6dNGRhkgJYM883bAqcsez6gZAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dump-guest-memory: Block live migration
To: Peter Xu <peterx@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a9805305cc9706e8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a9805305cc9706e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 26, 2021 at 11:01 PM Peter Xu <peterx@redhat.com> wrote:

> Both dump-guest-memory and live migration caches vm state at the beginnin=
g.
> Either of them entering the other one will cause race on the vm state, an=
d
> even
> more severe on that (please refer to the crash report in the bug link).
>
> Let's block live migration in dump-guest-memory, and that'll also block
> dump-guest-memory if it detected that we're during a live migration.
>
> Side note: migrate_del_blocker() can be called even if the blocker is not
> inserted yet, so it's safe to unconditionally delete that blocker in
> dump_cleanup (g_slist_remove allows no-entry-found case).
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1996609
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  dump/dump.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index ab625909f3..9c1c1fb738 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -29,6 +29,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "hw/misc/vmcoreinfo.h"
> +#include "migration/blocker.h"
>
>  #ifdef TARGET_X86_64
>  #include "win_dump.h"
> @@ -47,6 +48,8 @@
>
>  #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
>
> +static Error *dump_migration_blocker;
> +
>  #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
>      ((DIV_ROUND_UP((hdr_size), 4) +                     \
>        DIV_ROUND_UP((name_size), 4) +                    \
> @@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
>              qemu_mutex_unlock_iothread();
>          }
>      }
> +    migrate_del_blocker(dump_migration_blocker);
>
>      return 0;
>  }
> @@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>      Error *local_err =3D NULL;
>      bool detach_p =3D false;
>
> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
>

This INMIGRATE check,

-        error_setg(errp, "Dump not allowed during incoming migration.");
> -        return;
> -    }
> -
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
>      if (dump_in_progress()) {
> @@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>          return;
>      }
>
> +    if (!dump_migration_blocker) {
> +        error_setg(&dump_migration_blocker,
> +                   "Live migration disabled: dump-guest-memory in
> progress");
> +    }
> +
> +    /*
> +     * Allows even for -only-migratable, but forbid migration during the
> +     * process of dump guest memory.
> +     */
> +    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
>

is now handled here with migration_is_idle() ?

I am not familiar enough with the run & migration states intricacies here

+        /* Remember to release the fd before passing it over to dump state
> */
> +        close(fd);
> +        return;
> +    }
> +
>      s =3D &dump_state_global;
>      dump_state_prepare(s);
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a9805305cc9706e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 11:01 PM Pe=
ter Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Both dump-=
guest-memory and live migration caches vm state at the beginning.<br>
Either of them entering the other one will cause race on the vm state, and =
even<br>
more severe on that (please refer to the crash report in the bug link).<br>
<br>
Let&#39;s block live migration in dump-guest-memory, and that&#39;ll also b=
lock<br>
dump-guest-memory if it detected that we&#39;re during a live migration.<br=
>
<br>
Side note: migrate_del_blocker() can be called even if the blocker is not<b=
r>
inserted yet, so it&#39;s safe to unconditionally delete that blocker in<br=
>
dump_cleanup (g_slist_remove allows no-entry-found case).<br>
<br>
Suggested-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.=
com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
Bugzilla: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1996609"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D1996609</a><br>
Signed-off-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"=
_blank">peterx@redhat.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c | 24 +++++++++++++++++++-----<br>
=C2=A01 file changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index ab625909f3..9c1c1fb738 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;hw/misc/vmcoreinfo.h&quot;<br>
+#include &quot;migration/blocker.h&quot;<br>
<br>
=C2=A0#ifdef TARGET_X86_64<br>
=C2=A0#include &quot;win_dump.h&quot;<br>
@@ -47,6 +48,8 @@<br>
<br>
=C2=A0#define MAX_GUEST_NOTE_SIZE (1 &lt;&lt; 20) /* 1MB should be enough *=
/<br>
<br>
+static Error *dump_migration_blocker;<br>
+<br>
=C2=A0#define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)=C2=A0 =C2=A0\<b=
r>
=C2=A0 =C2=A0 =C2=A0((DIV_ROUND_UP((hdr_size), 4) +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((name_size), 4) +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_iothread(=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 migrate_del_blocker(dump_migration_blocker);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
<br>
-=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_INMIGRATE)) {<br></blockquote><=
div><br></div><div>This INMIGRATE check,</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Dump not allowed during=
 incoming migration.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* if there is a dump in background, we should wait unt=
il the dump<br>
=C2=A0 =C2=A0 =C2=A0 * finished */<br>
=C2=A0 =C2=A0 =C2=A0if (dump_in_progress()) {<br>
@@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!dump_migration_blocker) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;dump_migration_blocker,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Live migration disabled: dump-guest-memory in progress&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Allows even for -only-migratable, but forbid migrati=
on during the<br>
+=C2=A0 =C2=A0 =C2=A0* process of dump guest memory.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (migrate_add_blocker_internal(dump_migration_blocker, err=
p)) {<br></blockquote><div><br></div><div>is now handled here with migratio=
n_is_idle() ?</div><div><br></div><div>I am not familiar enough with the ru=
n &amp; migration states intricacies here<br></div><div> <br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember to release the fd before passing i=
t over to dump state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0s =3D &amp;dump_state_global;<br>
=C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a9805305cc9706e8--

