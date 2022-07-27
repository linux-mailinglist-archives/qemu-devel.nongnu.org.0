Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A10582348
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:38:22 +0200 (CEST)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdUi-0002Cc-Dr
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdOD-0005Gd-Il
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdOB-0003qc-Pu
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dst2Plvd4t7zB6RJSDJwAGsKZgrt7gGwzPqCUQMj+fk=;
 b=Cv7p5KfYxHcLQcrvbTAZqbZwtG35JoWQQd4y6YXVWIJddyAV7d/zXE71y2RippDdtmHp/E
 Bq3KCufPKpO2A3kwLHLg6s/5vLDkqg6V4VZIEDzUvo7hWeQh8H1CSY4L6UpdI9qIk8qzSV
 wX+nVnSc1EsZ3+QcQm6MWJ4WPItW+Lk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-zbrvAfO5OqWGYNKnL4T-Yw-1; Wed, 27 Jul 2022 05:31:26 -0400
X-MC-Unique: zbrvAfO5OqWGYNKnL4T-Yw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-31dfe25bd47so133408227b3.18
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dst2Plvd4t7zB6RJSDJwAGsKZgrt7gGwzPqCUQMj+fk=;
 b=0QBrjENCUQjjLKk5jWy95aWe1YMBYJkMZ+b2Vmjbx0MGLStoly2Y9i1vP6SNvnSLuv
 MTYrVYLqsdtvzogfJUVzqZMD0etZIk/VxRXRdY6sQ7JuKE+UuXz1i/hz8X0GuG4bmKzU
 3GFEN5FKzQLIH6IrDtIx8RYrz6xrkBJ5Ypnl2mu9TRzrgTGJjT39sn5Xj4Jd8JoKveAD
 Vx+fCXbdZMVbHd+RqGNYpAgdqUIKG3tb42X7EVZyc6iLxJkSx5elQwLI1FnJfqV10YYy
 anf5ExzmnJCe8+aiSMpV1y4RZAgOItpoHb7Zg92Htq1Ge1q1fux3uLlStk/Tu6JPaQhc
 aA5A==
X-Gm-Message-State: AJIora81DqSTcHi3tYudVAjWWVcutCS4d0ayvuIE0KVYMku72Uwwvldp
 fsJHHN/VpiSXHjZTQTQpk7Dx1HN5/JLXK2dq2jTF+byk5rEFv1F6SJaOyR+LwfICvYNMEqc5TPY
 lnCOSCIPkgF2j6+NzopJx8R9oGXmvU9o=
X-Received: by 2002:a25:bacf:0:b0:66f:4c39:5c34 with SMTP id
 a15-20020a25bacf000000b0066f4c395c34mr17080306ybk.74.1658914285739; 
 Wed, 27 Jul 2022 02:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t63Hl3klWgMxpANhIWk86MnRBu4hksZXazMECIygBATRH80vgxbFsXV+mz4FjQbHm/vDPuStLAHn0mcgYxxpU=
X-Received: by 2002:a25:bacf:0:b0:66f:4c39:5c34 with SMTP id
 a15-20020a25bacf000000b0066f4c395c34mr17080287ybk.74.1658914285526; Wed, 27
 Jul 2022 02:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220727092135.302915-1-thuth@redhat.com>
 <20220727092135.302915-4-thuth@redhat.com>
In-Reply-To: <20220727092135.302915-4-thuth@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 12:31:14 +0300
Message-ID: <CAPMcbCoqA6sYLNNNwUgOis3FVdGdt7pe2y70Tbi5g2vvyw8U5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/unit/test-qga: Replace the word 'blacklist' in
 the guest agent unit test
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b3b0bc05e4c614e7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--000000000000b3b0bc05e4c614e7
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Jul 27, 2022 at 12:21 PM Thomas Huth <thuth@redhat.com> wrote:

> Let's use better, more inclusive wording here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/unit/test-qga.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index c398866f46..80bb6b0866 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -629,7 +629,7 @@ static void test_qga_get_time(gconstpointer fix)
>      g_assert_cmpint(time, >, 0);
>  }
>
> -static void test_qga_blacklist(gconstpointer data)
> +static void test_qga_blockedrpcs(gconstpointer data)
>  {
>      TestFixture fix;
>      QDict *ret, *error;
> @@ -637,7 +637,7 @@ static void test_qga_blacklist(gconstpointer data)
>
>      fixture_setup(&fix, "-b guest-ping,guest-get-time", NULL);
>
> -    /* check blacklist */
> +    /* check blocked RPCs */
>      ret = qmp_fd(fix.fd, "{'execute': 'guest-ping'}");
>      g_assert_nonnull(ret);
>      error = qdict_get_qdict(ret, "error");
> @@ -968,7 +968,7 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/qga/fsfreeze-status", &fix,
>                           test_qga_fsfreeze_status);
>
> -    g_test_add_data_func("/qga/blacklist", NULL, test_qga_blacklist);
> +    g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs);
>      g_test_add_data_func("/qga/config", NULL, test_qga_config);
>      g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
>      g_test_add_data_func("/qga/guest-exec-invalid", &fix,
> --
> 2.31.1
>
>

--000000000000b3b0bc05e4c614e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 2=
7, 2022 at 12:21 PM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thu=
th@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Let&#39;s use better, more inclusive wording here.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-qga.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index c398866f46..80bb6b0866 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -629,7 +629,7 @@ static void test_qga_get_time(gconstpointer fix)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(time, &gt;, 0);<br>
=C2=A0}<br>
<br>
-static void test_qga_blacklist(gconstpointer data)<br>
+static void test_qga_blockedrpcs(gconstpointer data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestFixture fix;<br>
=C2=A0 =C2=A0 =C2=A0QDict *ret, *error;<br>
@@ -637,7 +637,7 @@ static void test_qga_blacklist(gconstpointer data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0fixture_setup(&amp;fix, &quot;-b guest-ping,guest-get-t=
ime&quot;, NULL);<br>
<br>
-=C2=A0 =C2=A0 /* check blacklist */<br>
+=C2=A0 =C2=A0 /* check blocked RPCs */<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qmp_fd(fix.fd, &quot;{&#39;execute&#39;: &#39;g=
uest-ping&#39;}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_nonnull(ret);<br>
=C2=A0 =C2=A0 =C2=A0error =3D qdict_get_qdict(ret, &quot;error&quot;);<br>
@@ -968,7 +968,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/fsfreeze-status&quot;, =
&amp;fix,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 test_qga_fsfreeze_status);<br>
<br>
-=C2=A0 =C2=A0 g_test_add_data_func(&quot;/qga/blacklist&quot;, NULL, test_=
qga_blacklist);<br>
+=C2=A0 =C2=A0 g_test_add_data_func(&quot;/qga/blockedrpcs&quot;, NULL, tes=
t_qga_blockedrpcs);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/config&quot;, NULL, tes=
t_qga_config);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/guest-exec&quot;, &amp;=
fix, test_qga_guest_exec);<br>
=C2=A0 =C2=A0 =C2=A0g_test_add_data_func(&quot;/qga/guest-exec-invalid&quot=
;, &amp;fix,<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000b3b0bc05e4c614e7--


