Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32985565A10
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:42:36 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ODb-0001sf-4u
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o8OAG-0000Mu-LC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:39:08 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o8OAB-00053H-V5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:39:08 -0400
Received: by mail-vs1-xe30.google.com with SMTP id q28so9358223vsp.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s61VQ+y1usbSQ+tiyFah+6o3bV/U6BVRDw94J4Cu88s=;
 b=CCLSJio1RcR4pB5527Hv9vGDn4N/CbZZOKjaCVLPmVqDCO2aWJa2VyF6Z5UgQDFUKs
 SnwDnvSzhcZhC7GBcjPqJrE/Lal5JNLG/uF4eU52t7t03D0oAVZQ7pvyMX5rR4noV3/F
 fGMvD8kTnv9UCAy1Rb+orrSu24Beb/iBjPO1a4qIEIA/33c7R+B5CvXm+48G/zo15VAg
 HTLh7kPPqfTy4lZn9kTUyIhFej/4/llfT3AV+TTn8jEmu/17myR2nLb1y/r0ekRYY1rA
 syxuSe47UbWYbVU0OJ/E2ZqYetFJZJVb2OBzPitPXYHflNZZE1SIVSiKf7iys1hvI8vB
 ciKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s61VQ+y1usbSQ+tiyFah+6o3bV/U6BVRDw94J4Cu88s=;
 b=XKp+yMZwWEgZPBZPgE16djy7t3azUoSCAgNlUwdmdO0/xyHVlrqUW5h6LmcboCuI7I
 DJ7Ord+5B1FOQCZxM+Np/8h+3dgL64z0fk63+0nKlXDTQpoYqyqVXQ5R5j5ymCCq6NHt
 RPVrsLPToBxbMSWN5/yvTifmMoYDo8KwoyXhvRuRVIUKVlujZ/bBkECfdeNVsQC7jHN5
 YLyfbxfARUUaE0KVFl3OmBKQF3PDcnq9dnf2nRIi9SDAxbPC2k5tlaRawoqGpzcsCh6J
 iKtkN+XIEkgizUqxPBf65oftMdyIE7AAWUzTqpxtoLSAzdWt6gh0p+EZ662irhvf4D4W
 dSmQ==
X-Gm-Message-State: AJIora/3vcATpE3gBaOiFkSlVOMMOWiEBjuCCgCXrqn8KTjFZA16HyXm
 vLL7p28aUUFddB+LvmaDSYAQxEs5iYPGhxLUifjhkw==
X-Google-Smtp-Source: AGRyM1s/N5RZqqsmWkkKTkIusju6sZP4NwXtg47krf8mQZqXAKitM6Vbz6dyPifqpNBgGn8F9m2ykdjwIM92z/X4Mhk=
X-Received: by 2002:a67:ef84:0:b0:354:3ae9:e6f7 with SMTP id
 r4-20020a67ef84000000b003543ae9e6f7mr16325365vsp.41.1656949137595; Mon, 04
 Jul 2022 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-7-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-7-berrange@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 4 Jul 2022 09:38:46 -0600
Message-ID: <CANCZdfqrdocFr9N3e2dvWq7=HDD=Va9d4dq4miB5Ss6Wvf26ig@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] misc: ensure qemu/osdep.h is included in all .c
 files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000c202d405e2fc8829"
Received-SPF: none client-ip=2607:f8b0:4864:20::e30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe30.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c202d405e2fc8829
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 9:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> A few files relied on qemu/osdep.h being included via a common
> header. Another file didn't need it because it was actually an
> included file, so ought to have been named .c.inc
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  bsd-user/arm/signal.c                 | 2 ++
>  bsd-user/arm/target_arch_cpu.c        | 3 +++
>  bsd-user/{elfcore.c =3D> elfcore.c.inc} | 0
>  bsd-user/elfload.c                    | 2 +-
>  bsd-user/freebsd/os-sys.c             | 2 ++
>  bsd-user/i386/signal.c                | 2 ++
>  bsd-user/qemu.h                       | 1 -
>  bsd-user/x86_64/signal.c              | 2 ++
>  crypto/rsakey.c                       | 1 +
>  qga/cutils.c                          | 2 ++
>  10 files changed, 15 insertions(+), 2 deletions(-)
>  rename bsd-user/{elfcore.c =3D> elfcore.c.inc} (100%)
>

The change to bsd-user is fine, though will cause many ripples in the
upstream
branch when I merge it. The ripples likely are worth it in the long run,
and knowing
they are coming and helps me prepare the tree for the merge.

It also reminds me that once I'm done upstreaming, there's likely benefit
from having
a common elf loader / core generator as much of this code is copied from
linux-user
with the qemu style layered on top....

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> index 2b1dd745d1..eca20ac4d7 100644
> --- a/bsd-user/arm/signal.c
> +++ b/bsd-user/arm/signal.c
> @@ -17,6 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
> +
>  #include "qemu.h"
>
>  /*
> diff --git a/bsd-user/arm/target_arch_cpu.c
> b/bsd-user/arm/target_arch_cpu.c
> index 02bf9149d5..186cf43fb9 100644
> --- a/bsd-user/arm/target_arch_cpu.c
> +++ b/bsd-user/arm/target_arch_cpu.c
> @@ -16,6 +16,9 @@
>   *  You should have received a copy of the GNU General Public License
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> +
> +#include "qemu/osdep.h"
> +
>  #include "target_arch.h"
>
>  void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
> diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c.inc
> similarity index 100%
> rename from bsd-user/elfcore.c
> rename to bsd-user/elfcore.c.inc
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index f8edb22f2a..1717a454dc 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -121,7 +121,7 @@ static void bswap_note(struct elf_note *en) { }
>
>  #endif /* ! BSWAP_NEEDED */
>
> -#include "elfcore.c"
> +#include "elfcore.c.inc"
>
>  /*
>   * 'copy_elf_strings()' copies argument/envelope strings from user
> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> index 309e27b9d6..1eab1be6f6 100644
> --- a/bsd-user/freebsd/os-sys.c
> +++ b/bsd-user/freebsd/os-sys.c
> @@ -17,6 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
> +
>  #include "qemu.h"
>  #include "target_arch_sysarch.h"
>
> diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
> index 5dd975ce56..db5b774213 100644
> --- a/bsd-user/i386/signal.c
> +++ b/bsd-user/i386/signal.c
> @@ -17,6 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
> +
>  #include "qemu.h"
>
>  /*
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..0ceecfb6df 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
>
> -#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/units.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
> index c3875bc4c6..217f9ceb66 100644
> --- a/bsd-user/x86_64/signal.c
> +++ b/bsd-user/x86_64/signal.c
> @@ -16,6 +16,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
> +
>  #include "qemu.h"
>
>  /*
> diff --git a/crypto/rsakey.c b/crypto/rsakey.c
> index cc40e072f0..dcdbd9ec57 100644
> --- a/crypto/rsakey.c
> +++ b/crypto/rsakey.c
> @@ -19,6 +19,7 @@
>   *
>   */
>
> +#include "qemu/osdep.h"
>  #include "rsakey.h"
>
>  void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
> diff --git a/qga/cutils.c b/qga/cutils.c
> index b8e142ef64..c53dd418c7 100644
> --- a/qga/cutils.c
> +++ b/qga/cutils.c
> @@ -2,6 +2,8 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
>   * See the COPYING file in the top-level directory.
>   */
> +
> +#include "qemu/osdep.h"
>  #include "cutils.h"
>
>  #include "qapi/error.h"
> --
> 2.36.1
>
>
>

--000000000000c202d405e2fc8829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 4, 2022 at 9:28 AM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">A few files relied on qemu/osdep.h being included via a common<br>
header. Another file didn&#39;t need it because it was actually an<br>
included file, so ought to have been named .c.inc<br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0bsd-user/arm/target_arch_cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
=C2=A0bsd-user/{elfcore.c =3D&gt; elfcore.c.inc} | 0<br>
=C2=A0bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0bsd-user/freebsd/os-sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++<br>
=C2=A0bsd-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 ++<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0bsd-user/x86_64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 ++<br>
=C2=A0crypto/rsakey.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0qga/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A010 files changed, 15 insertions(+), 2 deletions(-)<br>
=C2=A0rename bsd-user/{elfcore.c =3D&gt; elfcore.c.inc} (100%)<br></blockqu=
ote><div><br></div><div>The change to bsd-user is fine, though will cause m=
any ripples in the upstream</div><div>branch when I merge it. The ripples l=
ikely are worth it in the long run, and knowing</div><div>they are coming a=
nd helps me prepare the tree for the merge.</div><div><br></div><div>It als=
o reminds me that once I&#39;m done upstreaming, there&#39;s likely benefit=
 from having</div><div>a common elf loader / core generator as much of this=
 code is copied from linux-user</div><div>with the qemu style layered on to=
p....</div><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mail=
to:imp@bsdimp.com">imp@bsdimp.com</a>&gt;<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c<br>
index 2b1dd745d1..eca20ac4d7 100644<br>
--- a/bsd-user/arm/signal.c<br>
+++ b/bsd-user/arm/signal.c<br>
@@ -17,6 +17,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.=
c<br>
index 02bf9149d5..186cf43fb9 100644<br>
--- a/bsd-user/arm/target_arch_cpu.c<br>
+++ b/bsd-user/arm/target_arch_cpu.c<br>
@@ -16,6 +16,9 @@<br>
=C2=A0 *=C2=A0 You should have received a copy of the GNU General Public Li=
cense<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;target_arch.h&quot;<br>
<br>
=C2=A0void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)<br>
diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c.inc<br>
similarity index 100%<br>
rename from bsd-user/elfcore.c<br>
rename to bsd-user/elfcore.c.inc<br>
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c<br>
index f8edb22f2a..1717a454dc 100644<br>
--- a/bsd-user/elfload.c<br>
+++ b/bsd-user/elfload.c<br>
@@ -121,7 +121,7 @@ static void bswap_note(struct elf_note *en) { }<br>
<br>
=C2=A0#endif /* ! BSWAP_NEEDED */<br>
<br>
-#include &quot;elfcore.c&quot;<br>
+#include &quot;elfcore.c.inc&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * &#39;copy_elf_strings()&#39; copies argument/envelope strings from=
 user<br>
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c<br>
index 309e27b9d6..1eab1be6f6 100644<br>
--- a/bsd-user/freebsd/os-sys.c<br>
+++ b/bsd-user/freebsd/os-sys.c<br>
@@ -17,6 +17,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;target_arch_sysarch.h&quot;<br>
<br>
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c<br>
index 5dd975ce56..db5b774213 100644<br>
--- a/bsd-user/i386/signal.c<br>
+++ b/bsd-user/i386/signal.c<br>
@@ -17,6 +17,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
index be6105385e..0ceecfb6df 100644<br>
--- a/bsd-user/qemu.h<br>
+++ b/bsd-user/qemu.h<br>
@@ -17,7 +17,6 @@<br>
=C2=A0#ifndef QEMU_H<br>
=C2=A0#define QEMU_H<br>
<br>
-#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c<br>
index c3875bc4c6..217f9ceb66 100644<br>
--- a/bsd-user/x86_64/signal.c<br>
+++ b/bsd-user/x86_64/signal.c<br>
@@ -16,6 +16,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/crypto/rsakey.c b/crypto/rsakey.c<br>
index cc40e072f0..dcdbd9ec57 100644<br>
--- a/crypto/rsakey.c<br>
+++ b/crypto/rsakey.c<br>
@@ -19,6 +19,7 @@<br>
=C2=A0 *<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;rsakey.h&quot;<br>
<br>
=C2=A0void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)<br>
diff --git a/qga/cutils.c b/qga/cutils.c<br>
index b8e142ef64..c53dd418c7 100644<br>
--- a/qga/cutils.c<br>
+++ b/qga/cutils.c<br>
@@ -2,6 +2,8 @@<br>
=C2=A0 * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cutils.h&quot;<br>
<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000c202d405e2fc8829--

