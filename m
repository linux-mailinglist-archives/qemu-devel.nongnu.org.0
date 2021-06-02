Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0F398108
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 08:20:27 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loKEr-00082c-Uz
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 02:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loKDx-0007MK-3z
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:19:29 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loKDv-0002eJ-C2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:19:28 -0400
Received: by mail-io1-xd36.google.com with SMTP id e17so1316947iol.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 23:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wdjBJlVfK/jE9dssBnwjSGz0ZGHArZvxxVzm4pM/9DQ=;
 b=GlNZjpiWW8wSQ67D1wBfQxe+6Fg+y7mQnk+N9ioiLbBdmg7BC1kbXtj6hZ3eYrGIXE
 JG70yez32+Z9PhpxcT1CS9umpkUVPzft/ck1GXvscEhj24MEQzkLcM6gx7WEDHeurJpi
 mh+qwMNWtuw5uaql/qJAUxwLa+e3lG3AZcwTXB5g79wSenxBSUsItQ22r0RxTQZFXFJ8
 QOZY6KhJP52e9Z0CMOkZMQjH8WHXqwer1zxlNpo/iRtStuCQqv8vDhxPXZvGmY5kxI9m
 49F1aen2Ow4qK8/5oy/3+rj30TxYrKy6kx3bYqY7fqSy3gNcKgWA+uVKTzAovMDwqDQ6
 14ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wdjBJlVfK/jE9dssBnwjSGz0ZGHArZvxxVzm4pM/9DQ=;
 b=cu9znHEyvqIAV51nRsSz6+8kt6+l4UpPnSd7ynPUJSKKTjpnwA7xTAsHHc6XHh9wrA
 yUVNdy/fhHUSXKsdkfJcx8Fxvt1wdrYcA+pZn4toMNgoyXrFfneW9mqkRCTADBVD5O76
 XmNVa3hkfADb+1TZpdaJBD8QpilRJfuM3JFTwItPulyVG6He8cTEhuT7qJeTP+vHjnW9
 Y9AeppNyGOWx0fXvvmSPBF6i2RlZZmkPlvbDqZdqJW+ltQfIvTA8XUWGnO6qyOqWuIci
 mI8+bkxy6af+bcKjopg/mgOrb1zrqAISR1VabSDpBsoyH69lvu9U13+6O/Ur2EdsKke1
 Nt3g==
X-Gm-Message-State: AOAM532b1SlhGTi4VbcMwUT71voV/q1t71vnYPkSWV8NFjQS3gh/URT7
 MDsggwudsGXYiUwfttWJotBLReD9LLGk1Vil8Vo=
X-Google-Smtp-Source: ABdhPJwwlmr13c9vxHQYp6//EU7QGw3I0vHqPIkmwYYcQ9prbeksjkG52EWIGNQOuywYGMTJ9vjDyIXvtFroMEjTQqw=
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr23204575iol.43.1622614766170; 
 Tue, 01 Jun 2021 23:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210601145824.3849-1-alex.bennee@linaro.org>
In-Reply-To: <20210601145824.3849-1-alex.bennee@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 08:19:15 +0200
Message-ID: <CAD-LL6iQMLG8xFMiAJfQL9y_bfSYOEWn+5ARcfO=kAkr7rqg6Q@mail.gmail.com>
Subject: Re: [RFC PATCH] plugins/api: expose symbol lookup to plugins
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000beb33305c3c270a4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyihh@uci.edu, qemu-devel@nongnu.org, robhenry@microsoft.com,
 Mahmoud Abd Al Ghany <mahmoudabdalghany@outlook.com>,
 aaron@os.amperecomputing.com, "Emilio G. Cota" <cota@braap.org>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000beb33305c3c270a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 1, 2021 at 4:58 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> This is a quality of life helper for plugins so they don't need to
> re-implement symbol lookup when dumping an address. The strings are
> constant so don't need to be duplicated. One minor tweak is to return
> NULL instead of a zero length string to show lookup failed.
>
Thank you for implementing this, I found it a really easy addition since yo=
u
already told me how this is done in the kick-off meeting and I implemented
it
but I'm glad you already posted it :D

>
> Based-on: 20210530063712.6832-4-ma.mandourr@gmail.com
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/qemu/qemu-plugin.h |  9 +++++++++
>  contrib/plugins/cache.c    | 10 ++++++++--
>  plugins/api.c              |  6 ++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 97cdfd7761..dc3496f36c 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -525,6 +525,15 @@
> qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
>
>  char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
>
> +/**
> + * qemu_plugin_insn_symbol() - best effort symbol lookup
> + * @insn: instruction reference
> + *
> + * Return a static string referring to the symbol. This is dependent
> + * on the binary QEMU is running having provided a symbol table.
> + */
> +const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)=
;
> +
>  /**
>   * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
>   * @id: plugin ID
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 1e323494bf..afaa3d9db5 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -46,6 +46,7 @@ enum AccessResult {
>
>  struct InsnData {
>      char *disas_str;
> +    const char *symbol;
>      uint64_t addr;
>      uint64_t misses;
>  };
> @@ -377,10 +378,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id,
> struct qemu_plugin_tb *tb)
>          struct InsnData *idata =3D g_new(struct InsnData, 1);
>
>          ddata->disas_str =3D qemu_plugin_insn_disas(insn);
> +        ddata->symbol =3D qemu_plugin_insn_symbol(insn);
>          ddata->misses =3D 0;
>          ddata->addr =3D effective_addr;
>
>          idata->disas_str =3D g_strdup(ddata->disas_str);
> +        idata->symbol =3D qemu_plugin_insn_symbol(insn);
>          idata->misses =3D 0;
>          idata->addr =3D effective_addr;
>
> @@ -397,8 +400,11 @@ static void print_entry(gpointer data)
>  {
>      struct InsnData *insn =3D (struct InsnData *) data;
>      g_autoptr(GString) xx =3D g_string_new("");
> -    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
> -            insn->addr, insn->disas_str, insn->misses);
> +    g_string_append_printf(xx, "0x%" PRIx64, insn->addr);
> +    if (insn->symbol) {
> +        g_string_append_printf(xx, " (%s)", insn->symbol);
> +    }
> +    g_string_append_printf(xx, ", %lu, %s\n", insn->misses,
> insn->disas_str);
>      qemu_plugin_outs(xx->str);
>  }


> diff --git a/plugins/api.c b/plugins/api.c
> index 817c9b6b69..332e2c60e2 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct
> qemu_plugin_insn *insn)
>      return plugin_disas(cpu, insn->vaddr, insn->data->len);
>  }
>
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
> +{
> +    const char *sym =3D lookup_symbol(insn->vaddr);
> +    return sym[0] !=3D 0 ? sym : NULL;
> +}
> +
>  /*
>   * The memory queries allow the plugin to query information about a
>   * memory access.
> --
> 2.20.1
>
>
How can I address such an addition? Should I add it to my next RFC series
under your name using your Signed-off-by line? Also, I think that something=
s
in my series that you're basing your patch on will be changed, such as
having
two duplicated entries of InsnData and the stupid name "xx" of the report
string
How can I base your patch after my edits?

Thanks,
Mahmoud

--000000000000beb33305c3c270a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 4:58 PM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">This is a quality of life helper for plugins so they don&#39;t need to<=
br>
re-implement symbol lookup when dumping an address. The strings are<br>
constant so don&#39;t need to be duplicated. One minor tweak is to return<b=
r>
NULL instead of a zero length string to show lookup failed.<br></blockquote=
><div>Thank you for implementing this, I found it a really easy addition si=
nce you<br></div><div>already told me how this is done in the kick-off meet=
ing and I implemented it</div><div>but I&#39;m glad you already posted it :=
D</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Based-on: <a href=3D"mailto:20210530063712.6832-4-ma.mandourr@gmail.com" ta=
rget=3D"_blank">20210530063712.6832-4-ma.mandourr@gmail.com</a><br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/qemu/qemu-plugin.h |=C2=A0 9 +++++++++<br>
=C2=A0contrib/plugins/cache.c=C2=A0 =C2=A0 | 10 ++++++++--<br>
=C2=A0plugins/api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 6 ++++++<br>
=C2=A03 files changed, 23 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h<br>
index 97cdfd7761..dc3496f36c 100644<br>
--- a/include/qemu/qemu-plugin.h<br>
+++ b/include/qemu/qemu-plugin.h<br>
@@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_i=
d_t id,<br>
<br>
=C2=A0char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);<br=
>
<br>
+/**<br>
+ * qemu_plugin_insn_symbol() - best effort symbol lookup<br>
+ * @insn: instruction reference<br>
+ *<br>
+ * Return a static string referring to the symbol. This is dependent<br>
+ * on the binary QEMU is running having provided a symbol table.<br>
+ */<br>
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);<=
br>
+<br>
=C2=A0/**<br>
=C2=A0 * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU<br>
=C2=A0 * @id: plugin ID<br>
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
index 1e323494bf..afaa3d9db5 100644<br>
--- a/contrib/plugins/cache.c<br>
+++ b/contrib/plugins/cache.c<br>
@@ -46,6 +46,7 @@ enum AccessResult {<br>
<br>
=C2=A0struct InsnData {<br>
=C2=A0 =C2=A0 =C2=A0char *disas_str;<br>
+=C2=A0 =C2=A0 const char *symbol;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t addr;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t misses;<br>
=C2=A0};<br>
@@ -377,10 +378,12 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct=
 qemu_plugin_tb *tb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct InsnData *idata =3D g_new(struct I=
nsnData, 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ddata-&gt;disas_str =3D qemu_plugin_insn_=
disas(insn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;symbol =3D qemu_plugin_insn_symbol(i=
nsn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ddata-&gt;misses =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ddata-&gt;addr =3D effective_addr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idata-&gt;disas_str =3D g_strdup(ddata-&g=
t;disas_str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;symbol =3D qemu_plugin_insn_symbol(i=
nsn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idata-&gt;misses =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idata-&gt;addr =3D effective_addr;<br>
<br>
@@ -397,8 +400,11 @@ static void print_entry(gpointer data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct InsnData *insn =3D (struct InsnData *) data;<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) xx =3D g_string_new(&quot;&quot;);<b=
r>
-=C2=A0 =C2=A0 g_string_append_printf(xx, &quot;0x%&quot; PRIx64 &quot;: %s=
 - misses: %lu\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;addr, insn-&gt;disas_st=
r, insn-&gt;misses);<br>
+=C2=A0 =C2=A0 g_string_append_printf(xx, &quot;0x%&quot; PRIx64, insn-&gt;=
addr);<br>
+=C2=A0 =C2=A0 if (insn-&gt;symbol) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(xx, &quot; (%s)&quot;, =
insn-&gt;symbol);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_string_append_printf(xx, &quot;, %lu, %s\n&quot;, insn-&gt=
;misses, insn-&gt;disas_str);<br>
=C2=A0 =C2=A0 =C2=A0qemu_plugin_outs(xx-&gt;str);<br>
=C2=A0}</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
diff --git a/plugins/api.c b/plugins/api.c<br>
index 817c9b6b69..332e2c60e2 100644<br>
--- a/plugins/api.c<br>
+++ b/plugins/api.c<br>
@@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_=
insn *insn)<br>
=C2=A0 =C2=A0 =C2=A0return plugin_disas(cpu, insn-&gt;vaddr, insn-&gt;data-=
&gt;len);<br>
=C2=A0}=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)<b=
r>
+{<br>
+=C2=A0 =C2=A0 const char *sym =3D lookup_symbol(insn-&gt;vaddr);<br>
+=C2=A0 =C2=A0 return sym[0] !=3D 0 ? sym : NULL;<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * The memory queries allow the plugin to query information about a<b=
r>
=C2=A0 * memory access.<br>
-- <br>
2.20.1<br>
<br></blockquote><div><br></div><div>How can I address such an addition? Sh=
ould I add it to my next RFC series</div><div>under your name using your Si=
gned-off-by line? Also, I think that somethings</div><div>in my series that=
 you&#39;re basing your patch on will be changed, such as having</div><div>=
two duplicated entries of InsnData=C2=A0and the stupid name &quot;xx&quot; =
of the report string</div><div>How can I base your patch after my edits?</d=
iv><div><br></div><div>Thanks,</div><div>Mahmoud</div></div></div>

--000000000000beb33305c3c270a4--

