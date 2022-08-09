Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A058D78F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 12:42:39 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLMh4-0005MN-1F
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 06:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLMfC-0003tT-Lg
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 06:40:42 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLMfA-0003ph-OQ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 06:40:42 -0400
Received: by mail-lf1-x12e.google.com with SMTP id d14so16368799lfl.13
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fxWoOBP+7WkLfHL9PwKj3C0ABFQn6I27zBIgH1mkW/Q=;
 b=aP0ViSsq+gxhjelpFEztnPg3BWU0pZVODMZng1+oUlEXHsNvP5IqHhHxE3Myq2rgJZ
 1agC2hDZO8gvtzPRdZ5YsxptoL0TOUK+qdygMYDSrScPGBsrCfm3hY0WEltLb6srmWkK
 We021gZkt8S7FMh/qQE1Cc22rLEoVVsOLFOOo9hFJr9LzidLqb23yS+6xYrKX51reGui
 CdIoDA+gTjI3LWK9GIINLyVsx1qoAWUf87uOpVLOpqhjLSeOqcOS2V/VL5ep5DUgAp8o
 zD8xfYGo1a4bP2JR84kU7fqaOVqJZXzS/Dlk9Te+bjewqIcr9TY70As4fv+EKQqIW0rm
 bBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fxWoOBP+7WkLfHL9PwKj3C0ABFQn6I27zBIgH1mkW/Q=;
 b=giQQa9JdvPp2qeaA/8o4WbyWkp9LmY2RJ42QxWAuSrsEHfjVBrqZw+cY8eTozn+9jI
 38viNS36DUAXfhIPx/Eu6k22sv/U14L/o+571qvKvQkrDUfOTRlM+3JGpbfCqdlqfPQ4
 Z2nd83MQI3ZA+I3gQjtNrIqp/gkFTNzt4twkLbETWEEY0mom84GHBOzgiTtC9hc7PY1B
 zHGiQlYT/vqDvngzGuEwSgXLjxIp6eFdnIuIbKnd8h4qUlrOQ+3oba7H0LPhi5G+a0xp
 P3o2D3EShagV38NhKpX9D0LoCbgzDanT24nqh6vKadjb3No5+HnjFxLQbK8VPeq+oMdx
 DArA==
X-Gm-Message-State: ACgBeo08jsq/CzCZyr3fkyVS29OvBkeIacO6fwuNGqEMSmRP7dnqY8Nk
 BE4W+BRJBLZFkohRzdxRE/2GawRrYnOK1H3WxQs=
X-Google-Smtp-Source: AA6agR7he+COwwXeduR55FoomGQMgr+xhQ0jSJ6OCS4qyPoR9nJNENanGEj5W/Wp1uyHthdKAjgWmh5Tx0aqvUYe6EU=
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr1464197lfa.375.1660041638643; Tue, 09
 Aug 2022 03:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220809093854.168438-1-berrange@redhat.com>
In-Reply-To: <20220809093854.168438-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Aug 2022 14:40:27 +0400
Message-ID: <CAJ+F1C+yrOQJ8aXtAc=0JURwpofpuFER3==bQNugNjgcbcEXpQ@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: misc tweaks to readconfig
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002f0c2005e5cc9023"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

--0000000000002f0c2005e5cc9023
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2022 at 1:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> The property name parameter is ignored when visiting a top
> level type, but the obvious typo should be fixed to avoid
> confusion. A few indentation issues were tidied up. We
> can break out of the loop when finding the RNG device.
> Finally, close the temp FD immediately when no longer
> needed.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/qtest/readconfig-test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.=
c
> index 2e604d7c2d..c7a9b0c7dd 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -33,13 +33,12 @@ static QTestState *qtest_init_with_config(const char
> *cfgdata)
>      g_assert_cmpint(cfgfd, >=3D, 0);
>
>      ret =3D qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
> +    close(cfgfd);
>      if (ret < 0) {
>          unlink(cfgpath);
>      }
>      g_assert_cmpint(ret, =3D=3D, strlen(cfgdata));
>
> -    close(cfgfd);
> -
>      args =3D g_strdup_printf("-nodefaults -machine none -readconfig %s",
> cfgpath);
>
>      qts =3D qtest_init(args);
> @@ -79,7 +78,7 @@ static void test_x86_memdev(void)
>          "size =3D \"200\"";
>
>      qts =3D qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>      resp =3D qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
>      test_x86_memdev_resp(qdict_get(resp, "return"));
>      qobject_unref(resp);
> @@ -96,7 +95,7 @@ static void test_spice_resp(QObject *res)
>
>      g_assert(res);
>      v =3D qobject_input_visitor_new(res);
> -    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
> +    visit_type_SpiceInfo(v, "spice", &spice, &error_abort);
>
>      g_assert(spice);
>      g_assert(spice->enabled);
> @@ -114,7 +113,7 @@ static void test_spice(void)
>          "unix =3D \"on\"\n";
>
>      qts =3D qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>      resp =3D qtest_qmp(qts, "{ 'execute': 'query-spice' }");
>      test_spice_resp(qdict_get(resp, "return"));
>      qobject_unref(resp);
> @@ -144,6 +143,7 @@ static void test_object_rng_resp(QObject *res)
>          if (g_str_equal(obj->name, "rng0") &&
>              g_str_equal(obj->type, "child<rng-builtin>")) {
>              seen_rng =3D true;
> +            break;
>          }
>
>          tmp =3D tmp->next;
> @@ -164,7 +164,7 @@ static void test_object_rng(void)
>          "id =3D \"rng0\"\n";
>
>      qts =3D qtest_init_with_config(cfgdata);
> -   /* Test valid command */
> +    /* Test valid command */
>      resp =3D qtest_qmp(qts,
>                       "{ 'execute': 'qom-list',"
>                       "  'arguments': {'path': '/objects' }}");
> --
> 2.37.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002f0c2005e5cc9023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 9, 2022 at 1:39 PM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The property name parameter is ignored when visiting a top<br>
level type, but the obvious typo should be fixed to avoid<br>
confusion. A few indentation issues were tidied up. We<br>
can break out of the loop when finding the RNG device.<br>
Finally, close the temp FD immediately when no longer<br>
needed.<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/readconfig-test.c | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c<=
br>
index 2e604d7c2d..c7a9b0c7dd 100644<br>
--- a/tests/qtest/readconfig-test.c<br>
+++ b/tests/qtest/readconfig-test.c<br>
@@ -33,13 +33,12 @@ static QTestState *qtest_init_with_config(const char *c=
fgdata)<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(cfgfd, &gt;=3D, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D qemu_write_full(cfgfd, cfgdata, strlen(cfgdata)=
);<br>
+=C2=A0 =C2=A0 close(cfgfd);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(cfgpath);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, strlen(cfgdata));<br>
<br>
-=C2=A0 =C2=A0 close(cfgfd);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0args =3D g_strdup_printf(&quot;-nodefaults -machine non=
e -readconfig %s&quot;, cfgpath);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_init(args);<br>
@@ -79,7 +78,7 @@ static void test_x86_memdev(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;size =3D \&quot;200\&quot;&quot;;<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_init_with_config(cfgdata);<br>
-=C2=A0 =C2=A0/* Test valid command */<br>
+=C2=A0 =C2=A0 /* Test valid command */<br>
=C2=A0 =C2=A0 =C2=A0resp =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39=
;query-memdev&#39; }&quot;);<br>
=C2=A0 =C2=A0 =C2=A0test_x86_memdev_resp(qdict_get(resp, &quot;return&quot;=
));<br>
=C2=A0 =C2=A0 =C2=A0qobject_unref(resp);<br>
@@ -96,7 +95,7 @@ static void test_spice_resp(QObject *res)<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(res);<br>
=C2=A0 =C2=A0 =C2=A0v =3D qobject_input_visitor_new(res);<br>
-=C2=A0 =C2=A0 visit_type_SpiceInfo(v, &quot;spcie&quot;, &amp;spice, &amp;=
error_abort);<br>
+=C2=A0 =C2=A0 visit_type_SpiceInfo(v, &quot;spice&quot;, &amp;spice, &amp;=
error_abort);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(spice);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(spice-&gt;enabled);<br>
@@ -114,7 +113,7 @@ static void test_spice(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unix =3D \&quot;on\&quot;\n&quot;;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_init_with_config(cfgdata);<br>
-=C2=A0 =C2=A0/* Test valid command */<br>
+=C2=A0 =C2=A0 /* Test valid command */<br>
=C2=A0 =C2=A0 =C2=A0resp =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39=
;query-spice&#39; }&quot;);<br>
=C2=A0 =C2=A0 =C2=A0test_spice_resp(qdict_get(resp, &quot;return&quot;));<b=
r>
=C2=A0 =C2=A0 =C2=A0qobject_unref(resp);<br>
@@ -144,6 +143,7 @@ static void test_object_rng_resp(QObject *res)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g_str_equal(obj-&gt;name, &quot;rng0&=
quot;) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_str_equal(obj-&gt;type, &=
quot;child&lt;rng-builtin&gt;&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen_rng =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D tmp-&gt;next;<br>
@@ -164,7 +164,7 @@ static void test_object_rng(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;id =3D \&quot;rng0\&quot;\n&quot;;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0qts =3D qtest_init_with_config(cfgdata);<br>
-=C2=A0 =C2=A0/* Test valid command */<br>
+=C2=A0 =C2=A0 /* Test valid command */<br>
=C2=A0 =C2=A0 =C2=A0resp =3D qtest_qmp(qts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;{ &#39;execute&#39;: &#39;qom-list&#39;,&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;=C2=A0 &#39;arguments&#39;: {&#39;path&#39;: &#39;/objects&#39; }=
}&quot;);<br>
-- <br>
2.37.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002f0c2005e5cc9023--

