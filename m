Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD602415025
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:49:57 +0200 (CEST)
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Jc-0006yI-Ig
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT6iW-0000Bf-0w
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT6iT-0000E7-3k
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632334291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hreoTlOpvGeDs9ZxE6u81avzhM+jNn6GPDjU4arsshM=;
 b=RPoxavRkvjLagSvNtioPclcFFccYZlAIGwV+a3N8d0eaWjLLt4JRZYtMkYNwHBXVrCPMYD
 OAdnE8d9A4OuzooOINxEMGJj9UvXSdsYomtL74XNvwmP6HsTV2yyOBDOgJzzcW18ZSDTVd
 y9k2rjTekiQgcHmrQk/DqWHUxQcFOKk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-MPbh6lfbNk2A3BYJ5VZe5Q-1; Wed, 22 Sep 2021 14:11:24 -0400
X-MC-Unique: MPbh6lfbNk2A3BYJ5VZe5Q-1
Received: by mail-oi1-f197.google.com with SMTP id
 m3-20020aca1e03000000b00268ff33ea91so2246725oic.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hreoTlOpvGeDs9ZxE6u81avzhM+jNn6GPDjU4arsshM=;
 b=lxC5hfxHT7+dcJX8DVAyUM+LSYvzDU8Sh3m7WNgwtIBrehPeKxuQco1RqyvH6gPQNe
 Yvvvy7FpDj5Yvbio9fMU5kdOUYlQYzSW6Mi1RkzAkncNNeeqlNtygE5aHCNckpjzxlUb
 /upFUVK5RH48BHKAOLjTqldYX0pc6xivVuwA9qg9gAqSnlk3lDt6xYL52xXAtjgnZWHD
 +7q+uBvS3up4Y8xKHDGiSvKOmixdWeLu+88r9yhF5j1ljNrkqU2HXOq4S7BK2FUUzyAe
 8mM51gIbjHZrA2x5suUgB2usBviEBlB46ci8tb1KF1GRQzUnQpWbnMRavT7IyI8Dmc6u
 eKjw==
X-Gm-Message-State: AOAM531oaE+STzcvJrQibaotJoCYUr9b3bq+n6oOrsEwJHCkWzZO8HR6
 s4b08a6JtBkUnCJejExmCb204DUnslEzcwsmYeAyvarBZq+lENAgiXR4gESFkasZoxOqSQSIbx1
 RhjN5WwQw1Qb59+S+0f3Gn4sM+evmfB8=
X-Received: by 2002:a4a:da05:: with SMTP id e5mr242889oou.52.1632334284021;
 Wed, 22 Sep 2021 11:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9vmMFmIonYcegBR54XJSaGdPSQo+W+qoqlogK81mpjTlN3jSwfcQazoMxqcN/XPJqSsWTPbWTSR3sRMnC+TY=
X-Received: by 2002:a4a:da05:: with SMTP id e5mr242876oou.52.1632334283845;
 Wed, 22 Sep 2021 11:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125619.670673-1-armbru@redhat.com>
 <20210922125619.670673-3-armbru@redhat.com>
In-Reply-To: <20210922125619.670673-3-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 14:11:13 -0400
Message-ID: <CAFn=p-Z3AbFgZT8T0ig2tuA8PEaEKr-553+_5wX8D2a0BXUh5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qapi-schema: Make test-qapi.py -u work when
 files are absent
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024c4fb05cc99712e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: marcandre.lureau@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024c4fb05cc99712e
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster <armbru@redhat.com> wrote:

> test-qapi.py -u updates the expected files.  Since it fails when they
> are absent, users have to create them manually before they can use
> test-qapi.py to fill in the contents, say for a new test.  Silly.
> Improve -u to create them.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qapi-schema/test-qapi.py | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> index 2e384f5efd..c717a7a90b 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -132,6 +132,17 @@ def test_frontend(fname):
>              print('    section=%s\n%s' % (section.name, section.text))
>
>
> +def open_test_result(dir_name, file_name, update):
> +    mode = 'r+' if update else 'r'
> +    try:
> +        fp = open(os.path.join(dir_name, file_name), mode)
> +    except FileNotFoundError:
> +        if not update:
> +            raise
> +        fp = open(os.path.join(dir_name, file_name), 'w+')
> +    return fp
> +
> +
>  def test_and_diff(test_name, dir_name, update):
>      sys.stdout = StringIO()
>      try:
> @@ -148,10 +159,9 @@ def test_and_diff(test_name, dir_name, update):
>          sys.stdout.close()
>          sys.stdout = sys.__stdout__
>
> -    mode = 'r+' if update else 'r'
>      try:
> -        outfp = open(os.path.join(dir_name, test_name + '.out'), mode)
> -        errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
> +        outfp = open_test_result(dir_name, test_name + '.out', update)
> +        errfp = open_test_result(dir_name, test_name + '.err', update)
>          expected_out = outfp.readlines()
>          expected_err = errfp.readlines()
>      except OSError as err:
> --
> 2.31.1
>
>
Sure boss, why not?

Reviewed-by: John Snow <jsnow@redhat.com>

--00000000000024c4fb05cc99712e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 8:56 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">test=
-qapi.py -u updates the expected files.=C2=A0 Since it fails when they<br>
are absent, users have to create them manually before they can use<br>
test-qapi.py to fill in the contents, say for a new test.=C2=A0 Silly.<br>
Improve -u to create them.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qapi-schema/test-qapi.py | 16 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.p=
y<br>
index 2e384f5efd..c717a7a90b 100755<br>
--- a/tests/qapi-schema/test-qapi.py<br>
+++ b/tests/qapi-schema/test-qapi.py<br>
@@ -132,6 +132,17 @@ def test_frontend(fname):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=C2=A0 =C2=A0 se=
ction=3D%s\n%s&#39; % (<a href=3D"http://section.name" rel=3D"noreferrer" t=
arget=3D"_blank">section.name</a>, section.text))<br>
<br>
<br>
+def open_test_result(dir_name, file_name, update):<br>
+=C2=A0 =C2=A0 mode =3D &#39;r+&#39; if update else &#39;r&#39;<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D open(os.path.join(dir_name, file_name),=
 mode)<br>
+=C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not update:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D open(os.path.join(dir_name, file_name),=
 &#39;w+&#39;)<br>
+=C2=A0 =C2=A0 return fp<br>
+<br>
+<br>
=C2=A0def test_and_diff(test_name, dir_name, update):<br>
=C2=A0 =C2=A0 =C2=A0sys.stdout =3D StringIO()<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -148,10 +159,9 @@ def test_and_diff(test_name, dir_name, update):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.close()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout =3D sys.__stdout__<br>
<br>
-=C2=A0 =C2=A0 mode =3D &#39;r+&#39; if update else &#39;r&#39;<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfp =3D open(os.path.join(dir_name, test_nam=
e + &#39;.out&#39;), mode)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp =3D open(os.path.join(dir_name, test_nam=
e + &#39;.err&#39;), mode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfp =3D open_test_result(dir_name, test_name=
 + &#39;.out&#39;, update)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 errfp =3D open_test_result(dir_name, test_name=
 + &#39;.err&#39;, update)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_out =3D outfp.readlines()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_err =3D errfp.readlines()<br>
=C2=A0 =C2=A0 =C2=A0except OSError as err:<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Sure boss, why not?<br></div><br><div>=
Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat=
.com</a>&gt;</div><div><br></div></div></div>

--00000000000024c4fb05cc99712e--


