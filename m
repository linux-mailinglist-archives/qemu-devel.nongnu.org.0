Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AD571E7A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:11:38 +0200 (CEST)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHY1-0002N1-F7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHVc-0000DZ-In
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:09:08 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:40580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHVa-0001fG-NI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:09:08 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id u204so3887639vkb.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1sJGfUSMx4pE+6cQe+TBcBQaHB3mgJcCgnR28Hct30=;
 b=1PspVX8CsTcxY/O7P71MpPcwpCqWT4oS4HwmfI/8R7gg6CvkoHrfeAjAK8HyFmUyHd
 IGhHjJIedLCA+bKfffmeDHk0boFL4EpjWI983PiodZK2NnXq8dEGnWgg33bsVFjMB4hK
 LYcZFBrzysq8zvWCQZR41KtBoU95vNymO2PcF2vnMqwGjJyo3EaikcyXPDbNVD1mPZyL
 dEnjPVWnOsxrjKeNIB2KCFfw7CTE8P0FR0U54Y2wM3h/mHvFsY7n9GmwSoghjK9Gj0oS
 RsCGELMgm6yR8IZQv4GHf0+To4hUEERrvFeggZrKVGlcGYXxdqV3KkroWDVrfc2jBcFi
 fNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1sJGfUSMx4pE+6cQe+TBcBQaHB3mgJcCgnR28Hct30=;
 b=xoMAHxEMYZQ+FKiaXd/aU75Xp5QDwI1J2IvHznmXpSjmnRgc+t5n84MdxmyEsDclVa
 YyXK0TlkelxUGGCiNP0ooSrrf4tadgX/Vszk+7o7ZLrsGg5FH8KhYmbGccc/Stw09qzZ
 zTD1JE0CasUP5mBJ/iiCTp1QDw/oh6dg8+Xt1/mVSvzKediIEcxHEAsHKNWMGDNsNwgt
 h6JqS/BVWb3fc/KJhmTi8FAFnXJGhPi2VmB4DWZIwzBmOsTaw0WeqZK8r0OY72H9A2dm
 zk0euk9mjeFfVmDdYdCWywBe61TCJaj7W5HxtYTvGM+A32DaLXgX78lr7Ao23yBkQ5+8
 Z+ow==
X-Gm-Message-State: AJIora/m95lVaq+9MMY2PndAsf9EbycQOsC811nTt01f4E576Krjwuge
 OVHdA51Q8tTQzANcDUYPwUj6a5e6b6L/MLH7YxG1Ow==
X-Google-Smtp-Source: AGRyM1th4K49/ZPvA7EKmOHcUhQpogB4eUOWxdUhuEBqBtOJKg8afE2PyoW5bam10fE3xNzO9PS+IqnqOmfU/j0iycM=
X-Received: by 2002:a1f:2144:0:b0:374:a271:6313 with SMTP id
 h65-20020a1f2144000000b00374a2716313mr5012970vkh.23.1657638545246; Tue, 12
 Jul 2022 08:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-9-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 09:08:54 -0600
Message-ID: <CANCZdfqwDKLT6T31xa_u6RjJLXsktYVGeLSqsPJD07oPKAb0nQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] scripts/qapi: add required system includes to
 visitor
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a7de6705e39d0cd4"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000a7de6705e39d0cd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 3:36 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The generated visitor code includes abort() & assert(), we shouldn't
> rely on the global "-i" headers to include the necessary system headers.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/visit.py | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 1ff464c0360f..4aba5ddd8af4 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -342,6 +342,8 @@ def _begin_user_module(self, name: str) -> None:
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.preamble_add(mcgen('''
>  %(include)s
> +#include <assert.h>
> +#include <stdlib.h>
>
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
> --
> 2.37.0.rc0
>
>

--000000000000a7de6705e39d0cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 3:36 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The generated visitor code includes abort() &amp; assert(), we shouldn&#39;=
t<br>
rely on the global &quot;-i&quot; headers to include the necessary system h=
eaders.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/qapi/visit.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br></blockquote><div><br></div><div>R=
eviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.co=
m</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
index 1ff464c0360f..4aba5ddd8af4 100644<br>
--- a/scripts/qapi/visit.py<br>
+++ b/scripts/qapi/visit.py<br>
@@ -342,6 +342,8 @@ def _begin_user_module(self, name: str) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0visit =3D self._module_basename(&#39;qapi=
-visit&#39;, name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._genc.preamble_add(mcgen(&#39;&#39;&=
#39;<br>
=C2=A0%(include)s<br>
+#include &lt;assert.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
-- <br>
2.37.0.rc0<br>
<br>
</blockquote></div></div>

--000000000000a7de6705e39d0cd4--

