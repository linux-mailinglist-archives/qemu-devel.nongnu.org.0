Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C92F0B64
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:12:15 +0100 (CET)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyncr-0000xb-T9
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kynbi-0000VF-Fe
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:11:02 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kynbg-0004zo-FH
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:11:02 -0500
Received: by mail-lj1-x229.google.com with SMTP id n11so1949294lji.5
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 19:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=+GD9W1+Z492fxlBiKfi82jm3xIjWEQ7HCqV0DqCDeBA=;
 b=Ze5l5ODCFjJAAluy59SsmDx5KAyoqiTlrU7cpIwMsH2aZqOaY+etEn4OiHnwxVod/S
 X6heHGThCSUQuSyiN4kz3ID4yq+ZDQYFlvzU3ko7mszpiGUTzp4Tq8LQGgOK/yRoE/Mv
 1n5qxwLgRL/1lwp0a0PohqxmJJFzTy0gLL8BzrksZup1yKtNj+5kIwwq588z/Xeo751T
 czCe/MYAhcrFk3E7YX3louvY5+t7EpfbiR4oRSsJktMPKeDXWnRmwndUJxWKbG7H3pUx
 oGMamrKIr1daNEqNBCI4RXxCL7YM9rzG3EjB4Tqc5cNi5BwwY26B+2NTh+V+tb1u2QB0
 Qcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=+GD9W1+Z492fxlBiKfi82jm3xIjWEQ7HCqV0DqCDeBA=;
 b=m4uIQcRKB3Ly8RtP6O+X7qPbVsF7RxRP90vqsg0nDOV3Fiwf/CCuFMCLconpr8tbMi
 CPN+m6xHHYcRjlP3LUc/iDotehtw3t/MT80NU5K2N6C7AmEZdmMmCNHUyoxkjuWIvYoQ
 iMmv2UHdcNFdhBXl4n7vzTsLNykstl7rocXl2WtVYxwbG7awVQX4872Wo7QKD6DRoQM9
 1t2ClgVBAvGemcN5yfg9WzNXSg8Rdm9yMrjHEJzTWPXTI7XXVfO0dDjS8QOA1Fel9tV7
 q+FpbeVH4Rni54YuXoFskkQrvBGs0TJY4hulTO5NgdcpmJGJP/S45nWwMp1zSJ1oIknz
 vilA==
X-Gm-Message-State: AOAM532m/met/Pnif7Mt1upK+piNwh2TJyoo1O5kWzhLTQE4gyj0tZRL
 Cm1wILimLiobWlDzdLpRG0n5ylnafSs4uD17a2c=
X-Google-Smtp-Source: ABdhPJyqKq66BJCwgZpYAT6HE4vUr9AoM7+cSonl7augh3lNefq0RG1c4FxVqEECoqusEEKbPxWfQ0YtQUU36bfzhrc=
X-Received: by 2002:a2e:7119:: with SMTP id m25mr6288254ljc.229.1610334658479; 
 Sun, 10 Jan 2021 19:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
 <20210107201448.1152301-5-richard.henderson@linaro.org>
 <167e3961-f402-a551-b6b5-e75335208346@t-online.de>
In-Reply-To: <167e3961-f402-a551-b6b5-e75335208346@t-online.de>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 10 Jan 2021 19:10:46 -0800
Message-ID: <CAE2XoE-YUzoC3gH487Tmx6bn7h=A+91xCnEi7eco-rPA8BCD=Q@mail.gmail.com>
Subject: Re: [PULL 04/47] util/oslib-win32: Use _aligned_malloc for
 qemu_try_memalign
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="00000000000049cb7c05b89741ba"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x229.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049cb7c05b89741ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2021 at 3:19 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> > We do not need or want to be allocating page sized quanta.
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Reviewed-by: Stefan Weil <sw@weilnetz.de>
> > Message-Id: <20201018164836.1149452-1-richard.henderson@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  util/oslib-win32.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 01787df74c..8adc651259 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -39,6 +39,7 @@
> >  #include "trace.h"
> >  #include "qemu/sockets.h"
> >  #include "qemu/cutils.h"
> > +#include <malloc.h>
> >
> >  /* this must come after including "trace.h" */
> >  #include <shlobj.h>
> > @@ -56,10 +57,8 @@ void *qemu_try_memalign(size_t alignment, size_t
size)
> >  {
> >      void *ptr;
> >
> > -    if (!size) {
> > -        abort();
> > -    }
> > -    ptr =3D VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
> > +    g_assert(size !=3D 0);
> > +    ptr =3D _aligned_malloc(alignment, size);
>
> Hi Richard,
>
> this doesn't work really well. The _aligned_malloc parameters are
swapped. ptr =3D _aligned_malloc(size, alignment) is correct.
>
> With best regards,
> Volker
>
> >      trace_qemu_memalign(alignment, size, ptr);
> >      return ptr;
> >  }
> > @@ -93,9 +92,7 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t
*align, bool shared)
> >  void qemu_vfree(void *ptr)
> >  {
> >      trace_qemu_vfree(ptr);
> > -    if (ptr) {
> > -        VirtualFree(ptr, 0, MEM_RELEASE);
> > -    }
> > +    _aligned_free(ptr);
> >  }
> >
> >  void qemu_anon_ram_free(void *ptr, size_t size)
>
>

Dos this the cause of this failure?
https://cirrus-ci.com/task/6055645751279616?command=3Dtest#L593


MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-c=
i-build/tests
G_TEST_BUILDDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus=
-ci-build/build/tests
tests/test-qht.exe --tap -k
ERROR test-qht - too few tests run (expected 2, got 0)
make: *** [Makefile.mtest:256: run-test-30] Error 1
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000049cb7c05b89741ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sun, Jan 10, 2021 at 3:19 PM Volker R=C3=BCmeli=
n &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online.de</a>&gt; wr=
ote:<br>&gt;<br>&gt; &gt; We do not need or want to be allocating page size=
d quanta.<br>&gt; &gt;<br>&gt; &gt; Reviewed-by: Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>&gt; =
&gt; Reviewed-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weil=
netz.de</a>&gt;<br>&gt; &gt; Message-Id: &lt;<a href=3D"mailto:202010181648=
36.1149452-1-richard.henderson@linaro.org">20201018164836.1149452-1-richard=
.henderson@linaro.org</a>&gt;<br>&gt; &gt; Signed-off-by: Philippe Mathieu-=
Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&g=
t;<br>&gt; &gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;<br>&gt; &gt;=
 ---<br>&gt; &gt; =C2=A0util/oslib-win32.c | 11 ++++-------<br>&gt; &gt; =
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>&gt; &gt;<br>&gt; =
&gt; diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>&gt; &gt; inde=
x 01787df74c..8adc651259 100644<br>&gt; &gt; --- a/util/oslib-win32.c<br>&g=
t; &gt; +++ b/util/oslib-win32.c<br>&gt; &gt; @@ -39,6 +39,7 @@<br>&gt; &gt=
; =C2=A0#include &quot;trace.h&quot;<br>&gt; &gt; =C2=A0#include &quot;qemu=
/sockets.h&quot;<br>&gt; &gt; =C2=A0#include &quot;qemu/cutils.h&quot;<br>&=
gt; &gt; +#include &lt;malloc.h&gt;<br>&gt; &gt; <br>&gt; &gt; =C2=A0/* thi=
s must come after including &quot;trace.h&quot; */<br>&gt; &gt; =C2=A0#incl=
ude &lt;shlobj.h&gt;<br>&gt; &gt; @@ -56,10 +57,8 @@ void *qemu_try_memalig=
n(size_t alignment, size_t size)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0void *ptr;<br>&gt; &gt; <br>&gt; &gt; - =C2=A0 =C2=A0if (!size=
) {<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>&gt; &gt; - =C2=
=A0 =C2=A0}<br>&gt; &gt; - =C2=A0 =C2=A0ptr =3D VirtualAlloc(NULL, size, ME=
M_COMMIT, PAGE_READWRITE);<br>&gt; &gt; + =C2=A0 =C2=A0g_assert(size !=3D 0=
);<br>&gt; &gt; + =C2=A0 =C2=A0ptr =3D _aligned_malloc(alignment, size);<br=
>&gt;<br>&gt; Hi Richard,<br>&gt;<br>&gt; this doesn&#39;t work really well=
. The _aligned_malloc parameters are swapped. ptr =3D _aligned_malloc(size,=
 alignment) is correct.<br>&gt;<br>&gt; With best regards,<br>&gt; Volker<b=
r>&gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0trace_qemu_memalign(alignment, size=
, ptr);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0return ptr;<br>&gt; &gt; =C2=A0}<b=
r>&gt; &gt; @@ -93,9 +92,7 @@ void *qemu_anon_ram_alloc(size_t size, uint64=
_t *align, bool shared)<br>&gt; &gt; =C2=A0void qemu_vfree(void *ptr)<br>&g=
t; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0trace_qemu_vfree(ptr);<br>=
&gt; &gt; - =C2=A0 =C2=A0if (ptr) {<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0VirtualFree(ptr, 0, MEM_RELEASE);<br>&gt; &gt; - =C2=A0 =C2=A0}<br>&gt; =
&gt; + =C2=A0 =C2=A0_aligned_free(ptr);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; <=
br>&gt; &gt; =C2=A0void qemu_anon_ram_free(void *ptr, size_t size)<br>&gt;<=
br>&gt;<br><br>Dos this the cause of this failure?<br><a href=3D"https://ci=
rrus-ci.com/task/6055645751279616?command=3Dtest#L593" target=3D"_blank">ht=
tps://cirrus-ci.com/task/6055645751279616?command=3Dtest#L593</a><br><br><b=
r>MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))} G_TEST=
_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-buil=
d/tests G_TEST_BUILDDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Tem=
p/cirrus-ci-build/build/tests tests/test-qht.exe --tap -k<br>ERROR test-qht=
 - too few tests run (expected 2, got 0)<br>make: *** [Makefile.mtest:256: =
run-test-30] Error 1<br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=
=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =
=C2=A0 sincerely,<br>Yonggang Luo<div class=3D"gmail-yj6qo"></div><div clas=
s=3D"gmail-adL"><br></div><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--00000000000049cb7c05b89741ba--

