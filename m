Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA496EB522
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:44:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzU2-0004Ug-Vk; Fri, 21 Apr 2023 18:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppzTz-0004Sh-Sw
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:44:00 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ppzTx-0001Vp-18
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:43:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50506111a6eso3869030a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1682117035; x=1684709035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lKB4PnojH0boWhDjuaXzWwxeS0sB44C8uXIXPr8TX/M=;
 b=YjWdEVGvvecFyMsNAUoyJnD5xLCtoASadMkOziFMKz0/c/0Is4jnq9HpxT/Li3tpV1
 MWvplYS/Aw1POEevpdmXaLfdKtZcdhwXmUTg7QhxdIgenQIduLq0HNI3AQQXk1y59vbM
 AO00V4XkjEvP6FBTTWc3/6gw4/fWBpJVTbBcHp2/Cuh+GtoErAxhwEgTADPjMjoyNjcY
 j9wIsrjWkMdVuHJlN6CBzsPCIvmtDsLkb+xE+CsG0aBl2nsrOWYfdVwqXhSyslFvyxiJ
 I6KfhFCmzmTqa37y4DCv0YYpFh7TO7omTjU8uqqz++yFCWGPKJEgxOAHr/JEG/yeKxzr
 KkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117035; x=1684709035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lKB4PnojH0boWhDjuaXzWwxeS0sB44C8uXIXPr8TX/M=;
 b=VrM+hTMfhyTF7vc1WP0YT+3EesBEzGi/jWIaCW8kJGpBC/agzKgZ6xjDxu9NTCnybD
 v5qkfChJeuBvqOKeBv7d5g+ZGT3HytOSgFFoBomeu4a3wqLQXzG+Wxb5Bf2DQlsSU7vy
 jlgj+QSPHjVoK5FL7gQvxdYbpGMFS0+YqZAdn98ecxe1TYSnx/U+kvePJ1wr4SARMb6a
 7yXlSVXzzWx+Xy76zO6s6f1la/nNIhunxDOkJpN4W2nzEbdpZ3T0Qfv/q5II5ZnwGu8B
 yCvv1DTcRKrroXUftok660y+DGHz2mLS90BiiOzAnghbYdPIfR/5V2EL/W0FfsZZl3gn
 jlPA==
X-Gm-Message-State: AAQBX9c33vGE+GGil32mZm6wiPUfnXSjo0zVsUg0GxGD3nsTOaehnDam
 bJI02Qaa1nxJtsu9ySjSPUmjBHZVyDSdk4K6ellG1Q==
X-Google-Smtp-Source: AKy350Ysif2XY1+jfUB2C+EKBA+9Rv3LhW+DMFOjNRMvhazYQMOqT0rFv0StbaJdP5Wx+f4laz6HSsEnAh+jzsHIbU4=
X-Received: by 2002:aa7:d709:0:b0:506:72fc:8dd7 with SMTP id
 t9-20020aa7d709000000b0050672fc8dd7mr5723781edq.24.1682117034919; Fri, 21 Apr
 2023 15:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
 <20230421164200.2913-2-kariem.taha2.7@gmail.com>
In-Reply-To: <20230421164200.2913-2-kariem.taha2.7@gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 21 Apr 2023 16:43:43 -0600
Message-ID: <CANCZdfomSyN78SkH4cWonmJk1X8Q1TPEtYH+2=_=TwJ+wy2UTA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] Signed-off-by: Karim Taha
 <kariem.taha2.7@gmail.com>
To: Karim Taha <kariem.taha2.7@gmail.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000056600905f9e064d2"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000056600905f9e064d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 10:42=E2=80=AFAM Karim Taha <kariem.taha2.7@gmail.c=
om>
wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> Intialize guest_base in bsd-user/main.c.
>
> Allow guest_base to be initialized on 64-bit hosts, the initial value is
> used by g2h_untagged function defined in include/exec/cpu_ldst.h
>
> Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
>

This is missing the 'Signed-off-by' line of the author (me in this case).
All the others suffer from this as well.

I'll see about downloading these patches and testing them locally. The
changes themselves look good
to me as far as breaking them up, at least initially. I'll take a closer
look when I queue them for upstreaming
to see what else I can recommend.

Warner

---
>  bsd-user/main.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index babc3b009b..afdc1b5f3c 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -50,8 +50,22 @@
>  #include "target_arch_cpu.h"
>
>  int singlestep;
> -uintptr_t guest_base;
> +
> +/*
> + * Going hand in hand with the va space needed (see below), we need
> + * to find a host address to map the guest to. Assume that qemu
> + * itself doesn't need memory above 32GB (or that we don't collide
> + * with anything interesting). This is selected rather arbitrarily,
> + * but seems to produce good results in tests to date.
> + */
> +# if HOST_LONG_BITS >=3D 64
> +uintptr_t guest_base =3D 0x800000000ul;    /* at 32GB */
> +bool have_guest_base =3D true;
> +#else
> +uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole */
>  bool have_guest_base;
> +#endif
> +
>  /*
>   * When running 32-on-64 we should make sure we can fit all of the
> possible
>   * guest address space into a contiguous chunk of virtual host memory.
> --
> 2.40.0
>
>

--00000000000056600905f9e064d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 21, 2023 at 10:42=E2=80=
=AFAM Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com">kariem.tah=
a2.7@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
Intialize guest_base in bsd-user/main.c.<br>
<br>
Allow guest_base to be initialized on 64-bit hosts, the initial value is us=
ed by g2h_untagged function defined in include/exec/cpu_ldst.h<br>
<br>
Signed-off-by: Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com" t=
arget=3D"_blank">kariem.taha2.7@gmail.com</a>&gt;<br></blockquote><div><br>=
</div><div>This is missing the &#39;Signed-off-by&#39; line of the author (=
me in this case). All the others suffer from this as well.<br></div><div><b=
r></div><div>I&#39;ll see about downloading these patches and testing them =
locally. The changes themselves look good</div><div>to me as far as breakin=
g them up, at least initially. I&#39;ll take a closer look when I queue the=
m for upstreaming</div><div>to see what else I can recommend.</div><div><br=
></div><div>Warner</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0bsd-user/main.c | 16 +++++++++++++++-<br>
=C2=A01 file changed, 15 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index babc3b009b..afdc1b5f3c 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -50,8 +50,22 @@<br>
=C2=A0#include &quot;target_arch_cpu.h&quot;<br>
<br>
=C2=A0int singlestep;<br>
-uintptr_t guest_base;<br>
+<br>
+/*<br>
+ * Going hand in hand with the va space needed (see below), we need<br>
+ * to find a host address to map the guest to. Assume that qemu<br>
+ * itself doesn&#39;t need memory above 32GB (or that we don&#39;t collide=
<br>
+ * with anything interesting). This is selected rather arbitrarily,<br>
+ * but seems to produce good results in tests to date.<br>
+ */<br>
+# if HOST_LONG_BITS &gt;=3D 64<br>
+uintptr_t guest_base =3D 0x800000000ul;=C2=A0 =C2=A0 /* at 32GB */<br>
+bool have_guest_base =3D true;<br>
+#else<br>
+uintptr_t guest_base;=C2=A0 =C2=A0 /* TODO: use sysctl to find big enough =
hole */<br>
=C2=A0bool have_guest_base;<br>
+#endif<br>
+<br>
=C2=A0/*<br>
=C2=A0 * When running 32-on-64 we should make sure we can fit all of the po=
ssible<br>
=C2=A0 * guest address space into a contiguous chunk of virtual host memory=
.<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div></div>

--00000000000056600905f9e064d2--

