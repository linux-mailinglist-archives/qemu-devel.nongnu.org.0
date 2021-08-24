Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2283F68C3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 20:06:02 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaoD-0003Ma-EX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mIan9-0001vf-6E
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 14:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mIan7-0004CQ-5I
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 14:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629828291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lnl4pErgHUzfQUH9HtNdKjgxOQLnPcC3wkFkQUPTZ9E=;
 b=Dm3s+viRp+qPWd5l1w+NFsCcnlZ6EKp0lUfL50nRQNjZ/WBUj/KGSpPPxQwP4XiBgBOlDn
 IZBP/xws2rLDcjcOKUoQtCWvXiSdjICRl7ylJYo1YuCYkwbwD+1HVDHcDKPcsTuolyybir
 3wuaEFkQHgCwV1gOyxcA9LUZnngMG+8=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-Nj7OwYDmO52ENgsETR6iWg-1; Tue, 24 Aug 2021 14:04:49 -0400
X-MC-Unique: Nj7OwYDmO52ENgsETR6iWg-1
Received: by mail-pj1-f72.google.com with SMTP id
 ob1-20020a17090b390100b001793bdcc41eso10561pjb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 11:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lnl4pErgHUzfQUH9HtNdKjgxOQLnPcC3wkFkQUPTZ9E=;
 b=fD0PUf2k9jsYGsibaJcmbFmQO/TAC4i4o5mUK4VwMwk8E0GyIbwcx4tHuSWqyIYVyt
 v27r7l239lRElfEKYTTfZHJpEREpYauV8AkPzxyVlqv9QMgaCx1yr0Rl2ytVrwwp46Oj
 7P2AxCU/uUpCqG95RKW0Auy7l9zlnoiw365jRjF6merLnlprpABwjW9kzJJqXNqweJLD
 vDL5ntT/gzPe6QMkcCj3sBiqmeBh0dKAIkt8pAZkjqSrbOD/L1Bc5FECfWn1yp+KcywY
 wSL5AbjI6IlKRIud3nr/NL2/4CHlmzfgOVWKz/HMKpfFt5FGD4rjxnJTw5zl1yaNlDa4
 w4Ng==
X-Gm-Message-State: AOAM5337gixwSzbcLV0siqHVssaIDNdDml9H5XuQJSthvuTAqwFkEtnM
 nDj7vbkZ8SaxOVLVSmCPgFNC5YdPnGYKPoEkvTY3qRF8K+oN8lIhvHcPMflIFxrpVj+vZfgupuU
 IdZJ6yx9X3xdxofOFSVTWdlfu/n76jx8=
X-Received: by 2002:a63:1155:: with SMTP id 21mr37975690pgr.346.1629828288964; 
 Tue, 24 Aug 2021 11:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZcMus0KP4RJSGeIApX/KBTN/xebMoloa7bzKcOHgfowEruLB83okNrmSeFG4DntQp86XdNZKwxu1OJSCrOO0=
X-Received: by 2002:a63:1155:: with SMTP id 21mr37975671pgr.346.1629828288774; 
 Tue, 24 Aug 2021 11:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210824152721.79747-1-peterx@redhat.com>
 <20210824152721.79747-2-peterx@redhat.com>
In-Reply-To: <20210824152721.79747-2-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 Aug 2021 22:04:37 +0400
Message-ID: <CAMxuvawYhvO13Ue+_FhO6Qofk8hjuViO3sFHjV_QbMfvi-ASnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration: Add migrate_add_blocker_internal()
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003298a905ca51f826"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
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

--0000000000003298a905ca51f826
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 7:27 PM Peter Xu <peterx@redhat.com> wrote:

> An internal version that removes -only-migratable implications.  It can b=
e
> used
> for temporary migration blockers like dump-guest-memory.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/migration/blocker.h | 16 ++++++++++++++++
>  migration/migration.c       | 21 +++++++++++++--------
>  2 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/include/migration/blocker.h b/include/migration/blocker.h
> index acd27018e9..9cebe2ba06 100644
> --- a/include/migration/blocker.h
> +++ b/include/migration/blocker.h
> @@ -25,6 +25,22 @@
>   */
>  int migrate_add_blocker(Error *reason, Error **errp);
>
> +/**
> + * @migrate_add_blocker_internal - prevent migration from proceeding
> without
> + *                                 only-migrate implications
> + *
> + * @reason - an error to be returned whenever migration is attempted
> + *
> + * @errp - [out] The reason (if any) we cannot block migration right now=
.
> + *
> + * @returns - 0 on success, -EBUSY on failure, with errp set.
> + *
> + * Some of the migration blockers can be temporary (e.g., for a few
> seconds),
> + * so it shouldn't need to conflict with "-only-migratable".  For those
> cases,
> + * we can call this function rather than @migrate_add_blocker().
> + */
> +int migrate_add_blocker_internal(Error *reason, Error **errp);
> +
>  /**
>   * @migrate_del_blocker - remove a blocking error from migration
>   *
> diff --git a/migration/migration.c b/migration/migration.c
> index 041b8451a6..41429680c2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2053,15 +2053,8 @@ void migrate_init(MigrationState *s)
>      s->threshold_size =3D 0;
>  }
>
> -int migrate_add_blocker(Error *reason, Error **errp)
> +int migrate_add_blocker_internal(Error *reason, Error **errp)
>  {
> -    if (only_migratable) {
> -        error_propagate_prepend(errp, error_copy(reason),
> -                                "disallowing migration blocker "
> -                                "(--only-migratable) for: ");
> -        return -EACCES;
> -    }
> -
>      if (migration_is_idle()) {
>          migration_blockers =3D g_slist_prepend(migration_blockers, reaso=
n);
>          return 0;
> @@ -2073,6 +2066,18 @@ int migrate_add_blocker(Error *reason, Error **err=
p)
>      return -EBUSY;
>  }
>
> +int migrate_add_blocker(Error *reason, Error **errp)
> +{
> +    if (only_migratable) {
> +        error_propagate_prepend(errp, error_copy(reason),
> +                                "disallowing migration blocker "
> +                                "(--only-migratable) for: ");
> +        return -EACCES;
> +    }
> +
> +    return migrate_add_blocker_internal(reason, errp);
> +}
> +
>  void migrate_del_blocker(Error *reason)
>  {
>      migration_blockers =3D g_slist_remove(migration_blockers, reason);
> --
> 2.31.1
>
>

--0000000000003298a905ca51f826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Au=
g 24, 2021 at 7:27 PM Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" tar=
get=3D"_blank">peterx@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">An internal version that removes -only-mig=
ratable implications.=C2=A0 It can be used<br>
for temporary migration blockers like dump-guest-memory.<br>
<br>
Signed-off-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"=
_blank">peterx@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/migration/blocker.h | 16 ++++++++++++++++<br>
=C2=A0migration/migration.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 +++++++++++++---=
-----<br>
=C2=A02 files changed, 29 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/include/migration/blocker.h b/include/migration/blocker.h<br>
index acd27018e9..9cebe2ba06 100644<br>
--- a/include/migration/blocker.h<br>
+++ b/include/migration/blocker.h<br>
@@ -25,6 +25,22 @@<br>
=C2=A0 */<br>
=C2=A0int migrate_add_blocker(Error *reason, Error **errp);<br>
<br>
+/**<br>
+ * @migrate_add_blocker_internal - prevent migration from proceeding witho=
ut<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only-migrate implications<b=
r>
+ *<br>
+ * @reason - an error to be returned whenever migration is attempted<br>
+ *<br>
+ * @errp - [out] The reason (if any) we cannot block migration right now.<=
br>
+ *<br>
+ * @returns - 0 on success, -EBUSY on failure, with errp set.<br>
+ *<br>
+ * Some of the migration blockers can be temporary (e.g., for a few second=
s),<br>
+ * so it shouldn&#39;t need to conflict with &quot;-only-migratable&quot;.=
=C2=A0 For those cases,<br>
+ * we can call this function rather than @migrate_add_blocker().<br>
+ */<br>
+int migrate_add_blocker_internal(Error *reason, Error **errp);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * @migrate_del_blocker - remove a blocking error from migration<br>
=C2=A0 *<br>
diff --git a/migration/migration.c b/migration/migration.c<br>
index 041b8451a6..41429680c2 100644<br>
--- a/migration/migration.c<br>
+++ b/migration/migration.c<br>
@@ -2053,15 +2053,8 @@ void migrate_init(MigrationState *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;threshold_size =3D 0;<br>
=C2=A0}<br>
<br>
-int migrate_add_blocker(Error *reason, Error **errp)<br>
+int migrate_add_blocker_internal(Error *reason, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (only_migratable) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate_prepend(errp, error_copy(reaso=
n),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disallowing migration blocker =
&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(--only-migratable) for: &quot=
;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EACCES;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0if (migration_is_idle()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_blockers =3D g_slist_prepend(mi=
gration_blockers, reason);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -2073,6 +2066,18 @@ int migrate_add_blocker(Error *reason, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
=C2=A0}<br>
<br>
+int migrate_add_blocker(Error *reason, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 if (only_migratable) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate_prepend(errp, error_copy(reaso=
n),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disallowing migration blocker =
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(--only-migratable) for: &quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EACCES;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return migrate_add_blocker_internal(reason, errp);<br>
+}<br>
+<br>
=C2=A0void migrate_del_blocker(Error *reason)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0migration_blockers =3D g_slist_remove(migration_blocker=
s, reason);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>
</div>

--0000000000003298a905ca51f826--


