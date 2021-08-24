Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFA3F68C2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 20:05:45 +0200 (CEST)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIanw-0002aX-CJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 14:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mIamu-0001ak-ET
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 14:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mIamp-000404-5i
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 14:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629828273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9DGrcfDBxK7vodQirvwN49q89w0JOideJt03/7alFI=;
 b=fqiJRiGLxBS/aLDAe7up/uMA1sBllho65zTpF7fp5/S7SCZYbDIi18FQxQnE3m1BAuG+My
 O1ZGT320CV2rqYe2rO9blKEVCQYXE+8UasH9xwZwk4tdBtO7axiYv9ZB8Ebz6j6/5Iq0Mx
 navYrbSNniHySMbmj451Cifjnzz7O8w=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-2v7e2eMaNYu5sScpcPWWiQ-1; Tue, 24 Aug 2021 14:04:31 -0400
X-MC-Unique: 2v7e2eMaNYu5sScpcPWWiQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 h10-20020a65404a000000b00253122e62a0so1480365pgp.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 11:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9DGrcfDBxK7vodQirvwN49q89w0JOideJt03/7alFI=;
 b=aaiGDXe5zwkGkd62kDx3n0DrfYquxpnw769PKc6hBouhzbcC1bgNxFca7SYOjOXwKk
 ZFhSLpovycsmJwktGeIO0Z73Bh7JjeMyolxN+px48J/60PJ7CeSARH87zEOX8G/migQm
 CS7KDXNhJC2ax+nmxlScWBdH0Q5HZb33gRPD8bTzHmekpEmMIU6oYKmpvicQAltEIIiD
 Sui9A0bVhaP6+35OODhGolaEVBAF9A2YlCPEeDqBSs5qBHzZJRedmclxpS1xHq50WmNI
 9qdOt4d+lWvZY/G2KjYMO1ideySq200kUP4+aYJ2wqTkd5erQFiqGJ9XjbYNeXk8jUDk
 Z3Zw==
X-Gm-Message-State: AOAM533H1D7mw3I7pwtvyl2895S6qNLMD6ld+KuAGI4o1MFZk4rVbI1z
 +m3fwXl2TJTLH3d1ZH3UfXnpr/tRvAQefSdl51+Gx5VGQrCv52wKZBiW8TrfSoMxD2AHJqVQL6m
 sAK8S6JRD8dAKcrRz9vObdonWivI4Jx8=
X-Received: by 2002:a17:90b:46c3:: with SMTP id
 jx3mr5709308pjb.137.1629828270449; 
 Tue, 24 Aug 2021 11:04:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqhk/LAwLwhuhLtYOgxk+vBkpjiXC7CXzSxVtUahx7ji42dQp3h4X3JaXTvSCSh8fIsDLQEVBPx8X8iqgkiQc=
X-Received: by 2002:a17:90b:46c3:: with SMTP id
 jx3mr5709286pjb.137.1629828270215; 
 Tue, 24 Aug 2021 11:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210824152721.79747-1-peterx@redhat.com>
 <20210824152721.79747-3-peterx@redhat.com>
In-Reply-To: <20210824152721.79747-3-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 Aug 2021 22:04:19 +0400
Message-ID: <CAMxuvawNsaL66nTiWaQa72D_kDzRPj_-AWnof4att6ghcBSZkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dump-guest-memory: Block live migration
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000176bf905ca51f749"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000176bf905ca51f749
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Aug 24, 2021 at 7:27 PM Peter Xu <peterx@redhat.com> wrote:

> Both dump-guest-memory and live migration caches vm state at the beginning.
> Either of them entering the other one will cause race on the vm state, and
> even
> more severe on that (please refer to the crash report in the bug link).
>
> Let's block live migration in dump-guest-memory, and that'll also block
> dump-guest-memory if it detected that we're during a live migration.
>

How does it detect that migration is in progress?

Otherwise, it looks reasonable to me.


> Side note: migrate_del_blocker() can be called even if the blocker is not
> inserted yet, so it's safe to unconditionally delete that blocker in
> dump_cleanup (g_slist_remove allows no-entry-found case).
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  dump/dump.c           | 20 +++++++++++++++-----
>  include/sysemu/dump.h |  1 +
>  2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index ab625909f3..7996d7a6c5 100644
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
> @@ -101,6 +102,7 @@ static int dump_cleanup(DumpState *s)
>              qemu_mutex_unlock_iothread();
>          }
>      }
> +    migrate_del_blocker(s->dump_migration_blocker);
>
>      return 0;
>  }
> @@ -1857,6 +1859,19 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          }
>      }
>
> +    if (!s->dump_migration_blocker) {
> +        error_setg(&s->dump_migration_blocker,
> +                   "Live migration disabled: dump-guest-memory in
> progress");
> +    }
> +
> +    /*
> +     * Allows even for -only-migratable, but forbid migration during the
> +     * process of dump guest memory.
> +     */
> +    if (migrate_add_blocker_internal(s->dump_migration_blocker, errp)) {
> +        goto cleanup;
> +    }
> +
>      return;
>
>  cleanup:
> @@ -1927,11 +1942,6 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>      Error *local_err = NULL;
>      bool detach_p = false;
>
> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> -        error_setg(errp, "Dump not allowed during incoming migration.");
> -        return;
> -    }
> -
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
>      if (dump_in_progress()) {
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 250143cb5a..7b619c2a43 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -195,6 +195,7 @@ typedef struct DumpState {
>                                    * finished. */
>      uint8_t *guest_note;         /* ELF note content */
>      size_t guest_note_size;
> +    Error *dump_migration_blocker; /* Blocker for live migration */
>  } DumpState;
>
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
> --
> 2.31.1
>
>

--000000000000176bf905ca51f749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 24, 2021 at 7:27 PM Pet=
er Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Both dump-g=
uest-memory and live migration caches vm state at the beginning.<br>
Either of them entering the other one will cause race on the vm state, and =
even<br>
more severe on that (please refer to the crash report in the bug link).<br>
<br>
Let&#39;s block live migration in dump-guest-memory, and that&#39;ll also b=
lock<br>
dump-guest-memory if it detected that we&#39;re during a live migration.<br=
></blockquote><div><br></div><div>How does it detect that migration is in p=
rogress? <br></div><div><br></div><div>Otherwise, it looks reasonable to me=
.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
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
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++++=
+++-----<br>
=C2=A0include/sysemu/dump.h |=C2=A0 1 +<br>
=C2=A02 files changed, 16 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index ab625909f3..7996d7a6c5 100644<br>
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
@@ -101,6 +102,7 @@ static int dump_cleanup(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_iothread(=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 migrate_del_blocker(s-&gt;dump_migration_blocker);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -1857,6 +1859,19 @@ static void dump_init(DumpState *s, int fd, bool has=
_format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!s-&gt;dump_migration_blocker) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;s-&gt;dump_migration_blocker,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Live migration disabled: dump-guest-memory in progress&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Allows even for -only-migratable, but forbid migrati=
on during the<br>
+=C2=A0 =C2=A0 =C2=A0* process of dump guest memory.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (migrate_add_blocker_internal(s-&gt;dump_migration_blocke=
r, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
=C2=A0cleanup:<br>
@@ -1927,11 +1942,6 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
<br>
-=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_INMIGRATE)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Dump not allowed during=
 incoming migration.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* if there is a dump in background, we should wait unt=
il the dump<br>
=C2=A0 =C2=A0 =C2=A0 * finished */<br>
=C2=A0 =C2=A0 =C2=A0if (dump_in_progress()) {<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index 250143cb5a..7b619c2a43 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -195,6 +195,7 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* finished. */<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *guest_note;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* ELF note content */<br>
=C2=A0 =C2=A0 =C2=A0size_t guest_note_size;<br>
+=C2=A0 =C2=A0 Error *dump_migration_blocker; /* Blocker for live migration=
 */<br>
=C2=A0} DumpState;<br>
<br>
=C2=A0uint16_t cpu_to_dump16(DumpState *s, uint16_t val);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000176bf905ca51f749--


