Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413383BF407
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:38:52 +0200 (CEST)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1JwB-0002A2-24
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m1JvQ-0001U3-Uv
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:38:04 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m1JvO-0003qc-Ov
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 22:38:04 -0400
Received: by mail-vs1-xe29.google.com with SMTP id az11so2781746vsb.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 19:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HEDmwXTlbEWDVctpo8nJZe2NKmcbkTqG0xlASZxuyec=;
 b=pUOMYWQFkK7W/4UoOzsHML5BRNN0NXP54g1kDIWvsgW+ymuH3IHmRakRkK52W6c038
 gJkARFeGnH/HiD5wB1++SZRsOBGEESG77IQ7TCIztvDV4kTNhp3YX7vQFbQ2z2dGAQx1
 Hc5h5WL6WyMUSmfT2mn2L4kt+KUvThty4NNEb6E0iCSNQK53mopbwGS+uDaiqNVXH1+j
 womtQ5PLJjhtaJsppxYYHrW/3WzMjD8uTanwLhVYLSUphLzqdcXgp7VyJYY8IYnpWOLb
 WLJ9zV9y+j3EhXuq4nYc/f+nNR+pShAl3NPHGdJ7K1wFZczQl8s1PmAzHxXP5JGhgae5
 abAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HEDmwXTlbEWDVctpo8nJZe2NKmcbkTqG0xlASZxuyec=;
 b=X6RdtEuDFkj3W+DTuwDl1KObEPwmcJEHebUWWJzsYtz5Sc5f85d7P49u73tbLFWzT2
 5Uz4WNePpkmP2q8J/sVAggj+FqlYDxTgTy8Nzq/5QJcIfMJFa5iN0YIEvGarWQVdM880
 GM22a20O/mhq+FllZ9Vxy2dT+qnXQAt53403zgQGMp6FZ6SZjRd4o3VJg4Q6iIiZxArg
 8zJIiB6B4TLVJtffYYf3OzC5oyZYFY0h1lNFPCmSTerwWu3SBKSGSaNlfzlgu/jur66V
 gpxvxEJxTZQvHXW76UpKuw5nh75NN60UUObkxa/i6QpkQeJdQ50MnXzCqtDSi2k94Rtk
 eJ8A==
X-Gm-Message-State: AOAM532rLKikWex4JBVinLyOAdP1LWSNdv+0C3gabsbdagR0gqqNN0hP
 ai/nyLkAstFVe75/6aM36D6Wv1meynV8+IQNZ2I=
X-Google-Smtp-Source: ABdhPJym6LFZ/FjAwhGCl1WE1eXgNaumBPLDQpa0vLBfPcbUtGFL/AZAR3UJVgYNQyyLGN5I5sqVlqd0j2OYrsuE34k=
X-Received: by 2002:a67:eec3:: with SMTP id o3mr24866660vsp.33.1625711881729; 
 Wed, 07 Jul 2021 19:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
 <1317d8b6-4233-d239-9b51-3a525e23a8a8@redhat.com>
In-Reply-To: <1317d8b6-4233-d239-9b51-3a525e23a8a8@redhat.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Wed, 7 Jul 2021 22:37:50 -0400
Message-ID: <CAOakUfMr7-p=rGZ_DHsuRt7wPWtjGDzELJMso6T0gyDRPBYcjA@mail.gmail.com>
Subject: Re: pipe2 & configure script
To: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000037bd9805c6938b8b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000037bd9805c6938b8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=8En mie., 7 iul. 2021 la 10:32, Paolo Bonzini <pbonzini@redhat.com> a s=
cris:

> On 07/07/21 05:24, Richard Zak wrote:
> > What conditions are required for "#define CONFIG_PIPE2" to be set in
> > build/config-host.h? It prevents building for Haiku as pipe2() doesn't
> > exist. I didn't see anything in the configure script regarding pipe2. I
> > also updated my code to the latest in the repository and this issue jus=
t
> > popped up.
>
> Does this help?
>
> diff --git a/meson.build b/meson.build
> index 660e294b7e..32d5bd3685 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1339,7 +1339,7 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
>   config_host_data.set('CONFIG_EVENTFD', cc.compiles('''
>     #include <sys/eventfd.h>
>     int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }''')=
)
> -config_host_data.set('CONFIG_FDATASYNC', cc.compiles(gnu_source_prefix +
> '''
> +config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + ''=
'
>     #include <unistd.h>
>     int main(void) {
>     #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
> @@ -1356,14 +1356,14 @@ config_host_data.set('CONFIG_MADVISE',
> cc.compiles(gnu_source_prefix + '''
>   config_host_data.set('CONFIG_MEMFD', cc.compiles(gnu_source_prefix + ''=
'
>     #include <sys/mman.h>
>     int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }''')=
)
> -config_host_data.set('CONFIG_OPEN_BY_HANDLE',
> cc.compiles(gnu_source_prefix + '''
> +config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix
> + '''
>     #include <fcntl.h>
>     #if !defined(AT_EMPTY_PATH)
>     # error missing definition
>     #else
>     int main(void) { struct file_handle fh; return open_by_handle_at(0,
> &fh, 0); }
>     #endif'''))
> -config_host_data.set('CONFIG_PIPE2', cc.compiles(gnu_source_prefix + '''
> +config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
>     #include <unistd.h>
>     #include <fcntl.h>
>
> ?
>
> Paolo
>
>
That did it! build/config-host.h now has "#undef CONFIG_PIPE2" and the code
compiles.

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--00000000000037bd9805c6938b8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">=C3=8En mie., 7 iul. 2021 la 10:32, Paolo Bonzini &lt;<a href=3D=
"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; a scris:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 07/07/21 05:24, Richar=
d Zak wrote:<br>
&gt; What conditions are required for &quot;#define CONFIG_PIPE2&quot; to b=
e set in <br>
&gt; build/config-host.h? It prevents building for Haiku as pipe2() doesn&#=
39;t <br>
&gt; exist. I didn&#39;t see anything in the configure script regarding pip=
e2. I <br>
&gt; also updated my code to the latest in the repository and this issue ju=
st <br>
&gt; popped up.<br>
<br>
Does this help?<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 660e294b7e..32d5bd3685 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1339,7 +1339,7 @@ config_host_data.set(&#39;HAVE_STRUCT_STAT_ST_ATIM&#3=
9;,<br>
=C2=A0 config_host_data.set(&#39;CONFIG_EVENTFD&#39;, cc.compiles(&#39;&#39=
;&#39;<br>
=C2=A0 =C2=A0 #include &lt;sys/eventfd.h&gt;<br>
=C2=A0 =C2=A0 int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC=
); }&#39;&#39;&#39;))<br>
-config_host_data.set(&#39;CONFIG_FDATASYNC&#39;, cc.compiles(gnu_source_pr=
efix + &#39;&#39;&#39;<br>
+config_host_data.set(&#39;CONFIG_FDATASYNC&#39;, cc.links(gnu_source_prefi=
x + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
=C2=A0 =C2=A0 int main(void) {<br>
=C2=A0 =C2=A0 #if defined(_POSIX_SYNCHRONIZED_IO) &amp;&amp; _POSIX_SYNCHRO=
NIZED_IO &gt; 0<br>
@@ -1356,14 +1356,14 @@ config_host_data.set(&#39;CONFIG_MADVISE&#39;, cc.c=
ompiles(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 config_host_data.set(&#39;CONFIG_MEMFD&#39;, cc.compiles(gnu_source_=
prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 #include &lt;sys/mman.h&gt;<br>
=C2=A0 =C2=A0 int main(void) { return memfd_create(&quot;foo&quot;, MFD_ALL=
OW_SEALING); }&#39;&#39;&#39;))<br>
-config_host_data.set(&#39;CONFIG_OPEN_BY_HANDLE&#39;, cc.compiles(gnu_sour=
ce_prefix + &#39;&#39;&#39;<br>
+config_host_data.set(&#39;CONFIG_OPEN_BY_HANDLE&#39;, cc.links(gnu_source_=
prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
=C2=A0 =C2=A0 #if !defined(AT_EMPTY_PATH)<br>
=C2=A0 =C2=A0 # error missing definition<br>
=C2=A0 =C2=A0 #else<br>
=C2=A0 =C2=A0 int main(void) { struct file_handle fh; return open_by_handle=
_at(0, &amp;fh, 0); }<br>
=C2=A0 =C2=A0 #endif&#39;&#39;&#39;))<br>
-config_host_data.set(&#39;CONFIG_PIPE2&#39;, cc.compiles(gnu_source_prefix=
 + &#39;&#39;&#39;<br>
+config_host_data.set(&#39;CONFIG_PIPE2&#39;, cc.links(gnu_source_prefix + =
&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
<br>
?<br>
<br>
Paolo<br>
<br>
</blockquote></div><br clear=3D"all"><div>That did it! build/config-host.h =
now has &quot;#undef CONFIG_PIPE2&quot; and the code compiles. <br></div><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>Richa=
rd J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"https:/=
/keybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/key.a=
sc</a></div></div></div></div></div></div></div></div>

--00000000000037bd9805c6938b8b--

