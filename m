Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFED425E20
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:49:17 +0200 (CEST)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaKJ-0007J0-UU
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCz-0004MH-I2
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaCw-0005eO-FO
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id m22so22984444wrb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxTMSdYUkIz0F8F1REqTepgEFWUQFT8qIHZ9tZDEILo=;
 b=YhsVAlUBMqC3pYw/KsEae+v0Cgy0HahpoaodfR1jJErEBJ6M1zQoOgCKh1LuO3/ur5
 hMKK1Gk+e4Of8Jot3314gFSrN0uHShWVa7C34uziKgNnNH915kbN2xnLcFzmBrhiXWRI
 8M06tCmzO33tkn1YIi8VN7MHql9E6y1sQg8yTyQfFxCO50lGo7Q0OcWMO2O2Cvpc80Kx
 3BK3Wlyf5wOm1evrsIYxI9NNurFFrIZS4nVzXYS5dVltg1Y1NdifUGMIz+6OuwODQuEW
 lGLK32BeAH7pJ292hwuyvby0Zr2JE4H/iMXDy70XvoMsfW6bgnzKaBfIDUjliHA9mvsb
 V1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxTMSdYUkIz0F8F1REqTepgEFWUQFT8qIHZ9tZDEILo=;
 b=2rQEn5tDDMd0AQvujbZj99NO9gtOLUNlM+SS1zdgA4ayrqvix/MVeki4jv90RHP9TK
 TJhdOF1ih+9m2bvO1Ux6LP7boXoevlTTTlp/6ds3zibuzibNI7R4uz7BvDJj4ihzLxCf
 hg7Ej0EEuzkuUWy0dbPGlV8NI1PL8hMVMEViBzM5PfVoJb5fML+w0a9gdjqiH/Tn8Tf+
 UE8sbCNtceicOhD2J300+97gUfnCHWMhR4noEW4pqDKgZ77saLXRqr743MzHxCJb83jJ
 /YjULN/BixfxXxYMRhhczfP7u0xKyurdrYjJ24Zo/bs9rutpcTEPOn3oLIjIAvEnoxJi
 ingA==
X-Gm-Message-State: AOAM533xzFWb6E4/Ti6gxZzFR/kRizstLniEsUQww7NdstxY7NOMKUjq
 7YE+x2QrrpOacOyyXv5bUu64aDFsj1skT3PvZ52R4dCR
X-Google-Smtp-Source: ABdhPJy7NQbRvMDcEGs6UlF8m2DkZf877G5UMamAH53vyv5+ckH+kNi4CjEmBQm8h1O61CWhQCh8iWLuMQbnzKsAlPM=
X-Received: by 2002:adf:a209:: with SMTP id p9mr8098832wra.70.1633639297121;
 Thu, 07 Oct 2021 13:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-15-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-15-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:23 +0400
Message-ID: <CAJ+F1C+kMX2GObwZz_pLzoUNPLQu7GTOJKVfZ_sKhJvaYFvO4A@mail.gmail.com>
Subject: Re: [PATCH 20/24] configure, meson: move more compiler checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ff03c105cdc94995"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff03c105cdc94995
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   | 91 -----------------------------------------------------
>  meson.build | 45 ++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 91 deletions(-)
>
> diff --git a/configure b/configure
> index 2091844ad6..33d330dcc9 100755
> --- a/configure
> +++ b/configure
> @@ -3108,19 +3108,6 @@ elif test "$tpm" =3D "yes"; then
>    fi
>  fi
>
> -##########################################
> -# iovec probe
> -cat > $TMPC <<EOF
> -#include <sys/types.h>
> -#include <sys/uio.h>
> -#include <unistd.h>
> -int main(void) { return sizeof(struct iovec); }
> -EOF
> -iovec=3Dno
> -if compile_prog "" "" ; then
> -  iovec=3Dyes
> -fi
> -
>  ##########################################
>  # fdt probe
>
> @@ -3562,42 +3549,6 @@ EOF
>    fi
>  fi
>
> -#########################################
> -# See if 64-bit atomic operations are supported.
> -# Note that without __atomic builtins, we can only
> -# assume atomic loads/stores max at pointer size.
> -
> -cat > $TMPC << EOF
> -#include <stdint.h>
> -int main(void)
> -{
> -  uint64_t x =3D 0, y =3D 0;
> -  y =3D __atomic_load_n(&x, __ATOMIC_RELAXED);
> -  __atomic_store_n(&x, y, __ATOMIC_RELAXED);
> -  __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED,
> __ATOMIC_RELAXED);
> -  __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
> -  __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -  atomic64=3Dyes
> -fi
> -
> -########################################
> -# check if getauxval is available.
> -
> -getauxval=3Dno
> -cat > $TMPC << EOF
> -#include <sys/auxv.h>
> -int main(void) {
> -  return getauxval(AT_HWCAP) =3D=3D 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    getauxval=3Dyes
> -fi
> -
>  ########################################
>  # check if ccache is interfering with
>  # semantic analysis of macros
> @@ -3671,33 +3622,6 @@ else
>      membarrier=3Dno
>  fi
>
> -##########################################
> -# check for usable AF_VSOCK environment
> -have_af_vsock=3Dno
> -cat > $TMPC << EOF
> -#include <errno.h>
> -#include <sys/types.h>
> -#include <sys/socket.h>
> -#if !defined(AF_VSOCK)
> -# error missing AF_VSOCK flag
> -#endif
> -#include <linux/vm_sockets.h>
> -int main(void) {
> -    int sock, ret;
> -    struct sockaddr_vm svm;
> -    socklen_t len =3D sizeof(svm);
> -    sock =3D socket(AF_VSOCK, SOCK_STREAM, 0);
> -    ret =3D getpeername(sock, (struct sockaddr *)&svm, &len);
> -    if ((ret =3D=3D -1) && (errno =3D=3D ENOTCONN)) {
> -        return 0;
> -    }
> -    return -1;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    have_af_vsock=3Dyes
> -fi
> -
>  ##########################################
>  # check for usable AF_ALG environment
>  have_afalg=3Dno
> @@ -4173,9 +4097,6 @@ fi
>  if test "$vhost_user_fs" =3D "yes" ; then
>    echo "CONFIG_VHOST_USER_FS=3Dy" >> $config_host_mak
>  fi
> -if test "$iovec" =3D "yes" ; then
> -  echo "CONFIG_IOVEC=3Dy" >> $config_host_mak
> -fi
>  if test "$membarrier" =3D "yes" ; then
>    echo "CONFIG_MEMBARRIER=3Dy" >> $config_host_mak
>  fi
> @@ -4245,14 +4166,6 @@ if test "$cmpxchg128" =3D "yes" ; then
>    echo "CONFIG_CMPXCHG128=3Dy" >> $config_host_mak
>  fi
>
> -if test "$atomic64" =3D "yes" ; then
> -  echo "CONFIG_ATOMIC64=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$getauxval" =3D "yes" ; then
> -  echo "CONFIG_GETAUXVAL=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$libssh" =3D "yes" ; then
>    echo "CONFIG_LIBSSH=3Dy" >> $config_host_mak
>    echo "LIBSSH_CFLAGS=3D$libssh_cflags" >> $config_host_mak
> @@ -4280,10 +4193,6 @@ if test "$replication" =3D "yes" ; then
>    echo "CONFIG_REPLICATION=3Dy" >> $config_host_mak
>  fi
>
> -if test "$have_af_vsock" =3D "yes" ; then
> -  echo "CONFIG_AF_VSOCK=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$debug_mutex" =3D "yes" ; then
>    echo "CONFIG_DEBUG_MUTEX=3Dy" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 0721309ed1..f08f364c90 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1552,6 +1552,8 @@ config_host_data.set('CONFIG_INOTIFY',
>                       cc.has_header_symbol('sys/inotify.h',
> 'inotify_init'))
>  config_host_data.set('CONFIG_INOTIFY1',
>                       cc.has_header_symbol('sys/inotify.h',
> 'inotify_init1'))
> +config_host_data.set('CONFIG_IOVEC',
> +                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
>  config_host_data.set('CONFIG_MACHINE_BSWAP_H',
>                       cc.has_header_symbol('machine/bswap.h', 'bswap32',
>                                            prefix: '''#include
> <sys/endian.h>
> @@ -1700,6 +1702,49 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>          return printf("%zu", SIZE_MAX);
>      }''', args: ['-Werror']))
>
> +# See if 64-bit atomic operations are supported.
> +# Note that without __atomic builtins, we can only
> +# assume atomic loads/stores max at pointer size.
> +config_host_data.set('CONFIG_ATOMIC64', cc.links('''
> +  cat > $TMPC << EOF
> +  #include <stdint.h>
> +  int main(void)
> +  {
> +    uint64_t x =3D 0, y =3D 0;
> +    y =3D __atomic_load_n(&x, __ATOMIC_RELAXED);
> +    __atomic_store_n(&x, y, __ATOMIC_RELAXED);
> +    __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED,
> __ATOMIC_RELAXED);
> +    __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
> +    __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
> +    return 0;
> +  }'''))
> +
> +config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + ''=
'
> +  #include <sys/auxv.h>
> +  int main(void) {
> +    return getauxval(AT_HWCAP) =3D=3D 0;
> +  }'''))
> +
> +config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix +
> '''
> +  #include <errno.h>
> +  #include <sys/types.h>
> +  #include <sys/socket.h>
> +  #if !defined(AF_VSOCK)
> +  # error missing AF_VSOCK flag
> +  #endif
> +  #include <linux/vm_sockets.h>
> +  int main(void) {
> +    int sock, ret;
> +    struct sockaddr_vm svm;
> +    socklen_t len =3D sizeof(svm);
> +    sock =3D socket(AF_VSOCK, SOCK_STREAM, 0);
> +    ret =3D getpeername(sock, (struct sockaddr *)&svm, &len);
> +    if ((ret =3D=3D -1) && (errno =3D=3D ENOTCONN)) {
> +        return 0;
> +    }
> +    return -1;
> +  }'''))
> +
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>      'HAVE_GDB_BIN']
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ff03c105cdc94995
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:24 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div>lgtm<br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lurea=
u &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marc=
andre.lureau@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0| 91 ------------------------------------------=
-----------<br>
=C2=A0meson.build | 45 ++++++++++++++++++++++++++<br>
=C2=A02 files changed, 45 insertions(+), 91 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 2091844ad6..33d330dcc9 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -3108,19 +3108,6 @@ elif test &quot;$tpm&quot; =3D &quot;yes&quot;; then=
<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# iovec probe<br>
-cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;sys/types.h&gt;<br>
-#include &lt;sys/uio.h&gt;<br>
-#include &lt;unistd.h&gt;<br>
-int main(void) { return sizeof(struct iovec); }<br>
-EOF<br>
-iovec=3Dno<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 iovec=3Dyes<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# fdt probe<br>
<br>
@@ -3562,42 +3549,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-#########################################<br>
-# See if 64-bit atomic operations are supported.<br>
-# Note that without __atomic builtins, we can only<br>
-# assume atomic loads/stores max at pointer size.<br>
-<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;stdint.h&gt;<br>
-int main(void)<br>
-{<br>
-=C2=A0 uint64_t x =3D 0, y =3D 0;<br>
-=C2=A0 y =3D __atomic_load_n(&amp;x, __ATOMIC_RELAXED);<br>
-=C2=A0 __atomic_store_n(&amp;x, y, __ATOMIC_RELAXED);<br>
-=C2=A0 __atomic_compare_exchange_n(&amp;x, &amp;y, x, 0, __ATOMIC_RELAXED,=
 __ATOMIC_RELAXED);<br>
-=C2=A0 __atomic_exchange_n(&amp;x, y, __ATOMIC_RELAXED);<br>
-=C2=A0 __atomic_fetch_add(&amp;x, y, __ATOMIC_RELAXED);<br>
-=C2=A0 return 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 atomic64=3Dyes<br>
-fi<br>
-<br>
-########################################<br>
-# check if getauxval is available.<br>
-<br>
-getauxval=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;sys/auxv.h&gt;<br>
-int main(void) {<br>
-=C2=A0 return getauxval(AT_HWCAP) =3D=3D 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 getauxval=3Dyes<br>
-fi<br>
-<br>
=C2=A0########################################<br>
=C2=A0# check if ccache is interfering with<br>
=C2=A0# semantic analysis of macros<br>
@@ -3671,33 +3622,6 @@ else<br>
=C2=A0 =C2=A0 =C2=A0membarrier=3Dno<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# check for usable AF_VSOCK environment<br>
-have_af_vsock=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;errno.h&gt;<br>
-#include &lt;sys/types.h&gt;<br>
-#include &lt;sys/socket.h&gt;<br>
-#if !defined(AF_VSOCK)<br>
-# error missing AF_VSOCK flag<br>
-#endif<br>
-#include &lt;linux/vm_sockets.h&gt;<br>
-int main(void) {<br>
-=C2=A0 =C2=A0 int sock, ret;<br>
-=C2=A0 =C2=A0 struct sockaddr_vm svm;<br>
-=C2=A0 =C2=A0 socklen_t len =3D sizeof(svm);<br>
-=C2=A0 =C2=A0 sock =3D socket(AF_VSOCK, SOCK_STREAM, 0);<br>
-=C2=A0 =C2=A0 ret =3D getpeername(sock, (struct sockaddr *)&amp;svm, &amp;=
len);<br>
-=C2=A0 =C2=A0 if ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D ENOTCONN)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return -1;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 have_af_vsock=3Dyes<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# check for usable AF_ALG environment<br>
=C2=A0have_afalg=3Dno<br>
@@ -4173,9 +4097,6 @@ fi<br>
=C2=A0if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_USER_FS=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
=C2=A0fi<br>
-if test &quot;$iovec&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_IOVEC=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
=C2=A0if test &quot;$membarrier&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MEMBARRIER=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0fi<br>
@@ -4245,14 +4166,6 @@ if test &quot;$cmpxchg128&quot; =3D &quot;yes&quot; =
; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_CMPXCHG128=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0fi<br>
<br>
-if test &quot;$atomic64&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_ATOMIC64=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
-if test &quot;$getauxval&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_GETAUXVAL=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$libssh&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_LIBSSH=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0 =C2=A0echo &quot;LIBSSH_CFLAGS=3D$libssh_cflags&quot; &gt;&gt; $conf=
ig_host_mak<br>
@@ -4280,10 +4193,6 @@ if test &quot;$replication&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_REPLICATION=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$have_af_vsock&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_AF_VSOCK=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$debug_mutex&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DEBUG_MUTEX=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
diff --git a/meson.build b/meson.build<br>
index 0721309ed1..f08f364c90 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1552,6 +1552,8 @@ config_host_data.set(&#39;CONFIG_INOTIFY&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cc.has_header_symbol(&#39;sys/inotify.h&#39;, &#39;inotify_init&#39;))<=
br>
=C2=A0config_host_data.set(&#39;CONFIG_INOTIFY1&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cc.has_header_symbol(&#39;sys/inotify.h&#39;, &#39;inotify_init1&#39;))=
<br>
+config_host_data.set(&#39;CONFIG_IOVEC&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cc.has_header_symbol(&#39;sys/uio.h&#39;, &#39;struct iovec&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_MACHINE_BSWAP_H&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cc.has_header_symbol(&#39;machine/bswap.h&#39;, &#39;bswap32&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0prefix: &#39;&#39;&#39;#include &lt;sys/endian.h&gt;<br>
@@ -1700,6 +1702,49 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;,=
 not cc.compiles(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return printf(&quot;%zu&quot;, SIZE_MAX);=
<br>
=C2=A0 =C2=A0 =C2=A0}&#39;&#39;&#39;, args: [&#39;-Werror&#39;]))<br>
<br>
+# See if 64-bit atomic operations are supported.<br>
+# Note that without __atomic builtins, we can only<br>
+# assume atomic loads/stores max at pointer size.<br>
+config_host_data.set(&#39;CONFIG_ATOMIC64&#39;, cc.links(&#39;&#39;&#39;<b=
r>
+=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
+=C2=A0 #include &lt;stdint.h&gt;<br>
+=C2=A0 int main(void)<br>
+=C2=A0 {<br>
+=C2=A0 =C2=A0 uint64_t x =3D 0, y =3D 0;<br>
+=C2=A0 =C2=A0 y =3D __atomic_load_n(&amp;x, __ATOMIC_RELAXED);<br>
+=C2=A0 =C2=A0 __atomic_store_n(&amp;x, y, __ATOMIC_RELAXED);<br>
+=C2=A0 =C2=A0 __atomic_compare_exchange_n(&amp;x, &amp;y, x, 0, __ATOMIC_R=
ELAXED, __ATOMIC_RELAXED);<br>
+=C2=A0 =C2=A0 __atomic_exchange_n(&amp;x, y, __ATOMIC_RELAXED);<br>
+=C2=A0 =C2=A0 __atomic_fetch_add(&amp;x, y, __ATOMIC_RELAXED);<br>
+=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 }&#39;&#39;&#39;))<br>
+<br>
+config_host_data.set(&#39;CONFIG_GETAUXVAL&#39;, cc.links(gnu_source_prefi=
x + &#39;&#39;&#39;<br>
+=C2=A0 #include &lt;sys/auxv.h&gt;<br>
+=C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 return getauxval(AT_HWCAP) =3D=3D 0;<br>
+=C2=A0 }&#39;&#39;&#39;))<br>
+<br>
+config_host_data.set(&#39;CONFIG_AF_VSOCK&#39;, cc.compiles(gnu_source_pre=
fix + &#39;&#39;&#39;<br>
+=C2=A0 #include &lt;errno.h&gt;<br>
+=C2=A0 #include &lt;sys/types.h&gt;<br>
+=C2=A0 #include &lt;sys/socket.h&gt;<br>
+=C2=A0 #if !defined(AF_VSOCK)<br>
+=C2=A0 # error missing AF_VSOCK flag<br>
+=C2=A0 #endif<br>
+=C2=A0 #include &lt;linux/vm_sockets.h&gt;<br>
+=C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 int sock, ret;<br>
+=C2=A0 =C2=A0 struct sockaddr_vm svm;<br>
+=C2=A0 =C2=A0 socklen_t len =3D sizeof(svm);<br>
+=C2=A0 =C2=A0 sock =3D socket(AF_VSOCK, SOCK_STREAM, 0);<br>
+=C2=A0 =C2=A0 ret =3D getpeername(sock, (struct sockaddr *)&amp;svm, &amp;=
len);<br>
+=C2=A0 =C2=A0 if ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D ENOTCONN)) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return -1;<br>
+=C2=A0 }&#39;&#39;&#39;))<br>
+<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-targ=
et<br>
=C2=A0 =C2=A0 =C2=A0&#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000ff03c105cdc94995--

