Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121C3CFED2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 18:11:18 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5sKy-0001I3-LO
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 12:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5sK0-0000dj-Tk
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5sJu-0007Cd-2j
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626797408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i2h5LCeuwYq7qyTLc1ssmtWirtaDTxDr4YDLnGV4mjs=;
 b=JPyTl/JdCZzxN1her8XYe4MmZVthgR0ETwJMQfky6RlmSVVl/EbgIxbXQ5SejyTOIHIUx1
 cRYBBmUDYSjystNqcDFMU7tXvTH9YhV0uG29Af7X48Wmc3AaYgL+zEQirO4ih8Q4wy26Gf
 B4O1tAtznOWcLCpOUxGCVT2hHML3FLw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-gTfsdlhBMgGGhP-KNwpgIw-1; Tue, 20 Jul 2021 12:10:06 -0400
X-MC-Unique: gTfsdlhBMgGGhP-KNwpgIw-1
Received: by mail-oi1-f198.google.com with SMTP id
 n134-20020acad68c0000b029025a4350857eso15778345oig.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 09:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2h5LCeuwYq7qyTLc1ssmtWirtaDTxDr4YDLnGV4mjs=;
 b=UBASnMXVPS3FQtw/Pp1vISaRf9YnDfUa7AdC0VvYdk7SsYHx35xRVgKg3SEJv0xpFl
 cg43BnwYc3JJIxbDGTfrvzfpj1kZlwWkQuVgk13FqeYAD9o55hzqAuDApgoAGfqyBoj4
 iBE/S0WLk+UZ8/vZQP16bBrdUuLiyfZ+EcSSNXmXj3Rc6B56SEdgOB69q9y2yKmnYaF1
 XacGTAlE8htcyFcpSLviL9kq6dbXgk2T0RrNrPpqtxfs03Fld+nfRUToxQLj4j8P0Wn0
 9rNtsOZWIUeFWLpMo/+/vada2oIame+O5bmSjQK7uIiqWV3cCiCh74I15nHencr2acuU
 z/Rg==
X-Gm-Message-State: AOAM533zpENGoeJywO0nqeNG3DZkvv+1AdDQefkJUVVNJmxeNqp5xGAX
 ifZu0NYkWw8XToTCmqrThCh8bNNblqO3G0xiqSQmOdVEM0zbZp2MxCrDsxBAAwo/df+pG5E4H53
 EWU23cX1Jrsce5xz6u/XFkRnQ5Nm7org=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr21450401ota.263.1626797405315; 
 Tue, 20 Jul 2021 09:10:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGtHV5QiHo+Mm5NgWk62aznv/yy2Kzws8ZvFfKlRukx+JJhWuS82FyTyGz2p/kEg5la3lhsrnPLBfk2h0AclE=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr21450385ota.263.1626797405115; 
 Tue, 20 Jul 2021 09:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210712150214.624281-1-armbru@redhat.com>
In-Reply-To: <20210712150214.624281-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 12:09:54 -0400
Message-ID: <CAFn=p-av0A_fE-38TjhBv8WvHXaVmUG4GZxGY2A9ouFO2bgZKg@mail.gmail.com>
Subject: Re: [PATCH] docs/devel/qapi-code-gen: Update examples to match
 current code
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000742a8a05c7904913"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000742a8a05c7904913
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 11:02 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

I assume this is about making the examples match the current output
exactly, so we're doing some updates for spacing and so on.

I'll trust it.

Acked-by: John Snow <jsnow@redhat.com>


> ---
>  docs/devel/qapi-code-gen.txt | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index c1cb6f987d..233022184b 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -1496,8 +1496,12 @@ Example:
>
>
>      bool visit_type_UserDefOne_members(Visitor *v, UserDefOne *obj, Error
> **errp);
> -    bool visit_type_UserDefOne(Visitor *v, const char *name, UserDefOne
> **obj, Error **errp);
> -    bool visit_type_UserDefOneList(Visitor *v, const char *name,
> UserDefOneList **obj, Error **errp);
> +
> +    bool visit_type_UserDefOne(Visitor *v, const char *name,
> +                     UserDefOne **obj, Error **errp);
> +
> +    bool visit_type_UserDefOneList(Visitor *v, const char *name,
> +                     UserDefOneList **obj, Error **errp);
>
>      bool visit_type_q_obj_my_command_arg_members(Visitor *v,
> q_obj_my_command_arg *obj, Error **errp);
>
> @@ -1518,7 +1522,8 @@ Example:
>          return true;
>      }
>
> -    bool visit_type_UserDefOne(Visitor *v, const char *name, UserDefOne
> **obj, Error **errp)
> +    bool visit_type_UserDefOne(Visitor *v, const char *name,
> +                     UserDefOne **obj, Error **errp)
>      {
>          bool ok = false;
>
> @@ -1528,6 +1533,7 @@ Example:
>          if (!*obj) {
>              /* incomplete */
>              assert(visit_is_dealloc(v));
> +            ok = true;
>              goto out_obj;
>          }
>          if (!visit_type_UserDefOne_members(v, *obj, errp)) {
> @@ -1543,7 +1549,8 @@ Example:
>          return ok;
>      }
>
> -    bool visit_type_UserDefOneList(Visitor *v, const char *name,
> UserDefOneList **obj, Error **errp)
> +    bool visit_type_UserDefOneList(Visitor *v, const char *name,
> +                     UserDefOneList **obj, Error **errp)
>      {
>          bool ok = false;
>          UserDefOneList *tail;
> @@ -1628,11 +1635,13 @@ Example:
>      $ cat qapi-generated/example-qapi-commands.c
>  [Uninteresting stuff omitted...]
>
> -    static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in, QObject
> **ret_out, Error **errp)
> +
> +    static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in,
> +                                    QObject **ret_out, Error **errp)
>      {
>          Visitor *v;
>
> -        v = qobject_output_visitor_new(ret_out);
> +        v = qobject_output_visitor_new_qmp(ret_out);
>          if (visit_type_UserDefOne(v, "unused", &ret_in, errp)) {
>              visit_complete(v, ret_out);
>          }
> @@ -1650,7 +1659,7 @@ Example:
>          UserDefOne *retval;
>          q_obj_my_command_arg arg = {0};
>
> -        v = qobject_input_visitor_new(QOBJECT(args));
> +        v = qobject_input_visitor_new_qmp(QOBJECT(args));
>          if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
>              goto out;
>          }
> --
> 2.31.1
>
>

--000000000000742a8a05c7904913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 11:02 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sig=
ned-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" targ=
et=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>I assume this is about making the examples match the current output exactl=
y, so we&#39;re doing some updates for spacing and so on.</div><div><br></d=
iv><div>I&#39;ll trust it.<br></div><br><div>Acked-by: John Snow &lt;<a hre=
f=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/devel/qapi-code-gen.txt | 23 ++++++++++++++++-------<br>
=C2=A01 file changed, 16 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt<br=
>
index c1cb6f987d..233022184b 100644<br>
--- a/docs/devel/qapi-code-gen.txt<br>
+++ b/docs/devel/qapi-code-gen.txt<br>
@@ -1496,8 +1496,12 @@ Example:<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool visit_type_UserDefOne_members(Visitor *v, UserDefO=
ne *obj, Error **errp);<br>
-=C2=A0 =C2=A0 bool visit_type_UserDefOne(Visitor *v, const char *name, Use=
rDefOne **obj, Error **errp);<br>
-=C2=A0 =C2=A0 bool visit_type_UserDefOneList(Visitor *v, const char *name,=
 UserDefOneList **obj, Error **errp);<br>
+<br>
+=C2=A0 =C2=A0 bool visit_type_UserDefOne(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0UserDefOne **obj, Error **errp);<br>
+<br>
+=C2=A0 =C2=A0 bool visit_type_UserDefOneList(Visitor *v, const char *name,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0UserDefOneList **obj, Error **errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool visit_type_q_obj_my_command_arg_members(Visitor *v=
, q_obj_my_command_arg *obj, Error **errp);<br>
<br>
@@ -1518,7 +1522,8 @@ Example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 bool visit_type_UserDefOne(Visitor *v, const char *name, Use=
rDefOne **obj, Error **errp)<br>
+=C2=A0 =C2=A0 bool visit_type_UserDefOne(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0UserDefOne **obj, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ok =3D false;<br>
<br>
@@ -1528,6 +1533,7 @@ Example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*obj) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* incomplete */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(visit_is_dealloc(v))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_obj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!visit_type_UserDefOne_members(v, *ob=
j, errp)) {<br>
@@ -1543,7 +1549,8 @@ Example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ok;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 bool visit_type_UserDefOneList(Visitor *v, const char *name,=
 UserDefOneList **obj, Error **errp)<br>
+=C2=A0 =C2=A0 bool visit_type_UserDefOneList(Visitor *v, const char *name,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0UserDefOneList **obj, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ok =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UserDefOneList *tail;<br>
@@ -1628,11 +1635,13 @@ Example:<br>
=C2=A0 =C2=A0 =C2=A0$ cat qapi-generated/example-qapi-commands.c<br>
=C2=A0[Uninteresting stuff omitted...]<br>
<br>
-=C2=A0 =C2=A0 static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in=
, QObject **ret_out, Error **errp)<br>
+<br>
+=C2=A0 =C2=A0 static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QObject **ret_out, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Visitor *v;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D qobject_output_visitor_new(ret_out);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D qobject_output_visitor_new_qmp(ret_out);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (visit_type_UserDefOne(v, &quot;unused=
&quot;, &amp;ret_in, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0visit_complete(v, ret_out);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1650,7 +1659,7 @@ Example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UserDefOne *retval;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q_obj_my_command_arg arg =3D {0};<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D qobject_input_visitor_new(QOBJECT(args))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D qobject_input_visitor_new_qmp(QOBJECT(ar=
gs));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!visit_start_struct(v, NULL, NULL, 0,=
 errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000742a8a05c7904913--


