Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D5425E33
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:52:53 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaNo-0005ak-Dc
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDH-0005ED-4J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDE-0005wu-KP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:41:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id t8so23024210wri.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRLoPh/Xbstgr2dVENWUhURrCQrnaxnHz/xSyxqHSHE=;
 b=H+LgYc5jYke5TS9dp/F6jumz9oasghGouTAT6sFJFZ7czosYr3JNja43vyC+k+VByA
 czr0rcrTBkeqF5PZGqYsHecJ7IjhHzpnaY0Sf+pwxmxqlgFmYFbTNwR+gKj7gUHxNsd0
 kwFQunABgKiKZVmWJKCdA69SQaFOF6n57yLaV7UvjcGHPUs2orqKMVxKv4H44e8nRld+
 Rl/7J9XSbgxv0AxTz5amovUNnpdx9swPZgyTzmFsBuwyVlQ4G0oAFuCH0sCLyXY+mYER
 BPbmKgq5dbyVxJ5OMnFepd/R0etT2McsZYY9qbgSX5U32DXDCfc07erLTKgFY9rwlCVX
 RCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRLoPh/Xbstgr2dVENWUhURrCQrnaxnHz/xSyxqHSHE=;
 b=oPWYgzhWFyXKl7KbVYkLjdXA6gHKZBi0Q8OyCGtOlUiWX3ynpbmcPk6EYpvu6WnynF
 V/V3jGpnNylhlipvHih2erxEDAMqDnOWsjwl9En+qlyVpkvEacbHt1h4p3v/tAIbKfME
 pSrmU5jM60zVCjDg2+x7zKw+v7qwR9zjJocGio3pJYLpx0LuIU5zswthI1L1WJoJ5qGJ
 LAEFtJ79yBbuNA/IlaqRpixtbcY06sHf9VMaCmVNGuQ3WrJmZJXjsMH4NgUVVxkGVQE+
 nglOYbd3VbukBKKKqXjQRP/xLUiz+VVexjC7shFLu6tfbowN4+r0+qEftEEypl1y0qBi
 g5gQ==
X-Gm-Message-State: AOAM533b8BY3DAvmto+uZap+MVW7Lsj19JbxYbArON7wxX7dYjAxDzcV
 oYrtDLgSHhwenxhyPtO5wNhG8jezK+tLVDmaBsw=
X-Google-Smtp-Source: ABdhPJzUPjdef5GFfqfTU5+L0YxxBU45UdYKatP6dZ76dRbN4ZEIoZYJyE3gcHQUyPOfgDh/XLBGKt7J3STIwgNusmU=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr8437238wrb.374.1633639315312;
 Thu, 07 Oct 2021 13:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-9-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-9-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:40 +0400
Message-ID: <CAJ+F1C+-LwszmYcz8fsSddLfc5Sj6Ar-nHDOCu_+yX9EdZZ2LA@mail.gmail.com>
Subject: Re: [PATCH 14/24] configure,
 meson: move pthread_setname_np checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000014932d05cdc94bea"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
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

--00000000000014932d05cdc94bea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:19 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This makes the pthreads check dead in configure, so remove it
> as well.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(a shame that g_system_thread_set_name() is not exported imho)

---
>  configure                | 78 ----------------------------------------
>  meson.build              | 23 ++++++++++++
>  util/qemu-thread-posix.c |  5 ++-
>  3 files changed, 25 insertions(+), 81 deletions(-)
>
> diff --git a/configure b/configure
> index 52f89b05d6..a1e142d5f8 100755
> --- a/configure
> +++ b/configure
> @@ -3146,71 +3146,6 @@ if test "$modules" =3D yes; then
>      fi
>  fi
>
> -##########################################
> -# pthread probe
> -PTHREADLIBS_LIST=3D"-pthread -lpthread -lpthreadGC2"
> -
> -pthread=3Dno
> -cat > $TMPC << EOF
> -#include <pthread.h>
> -static void *f(void *p) { return NULL; }
> -int main(void) {
> -  pthread_t thread;
> -  pthread_create(&thread, 0, f, 0);
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -  pthread=3Dyes
> -else
> -  for pthread_lib in $PTHREADLIBS_LIST; do
> -    if compile_prog "" "$pthread_lib" ; then
> -      pthread=3Dyes
> -      break
> -    fi
> -  done
> -fi
> -
> -if test "$mingw32" !=3D yes && test "$pthread" =3D no; then
> -  error_exit "pthread check failed" \
> -      "Make sure to have the pthread libs and headers installed."
> -fi
> -
> -# check for pthread_setname_np with thread id
> -pthread_setname_np_w_tid=3Dno
> -cat > $TMPC << EOF
> -#include <pthread.h>
> -
> -static void *f(void *p) { return NULL; }
> -int main(void)
> -{
> -    pthread_t thread;
> -    pthread_create(&thread, 0, f, 0);
> -    pthread_setname_np(thread, "QEMU");
> -    return 0;
> -}
> -EOF
> -if compile_prog "" "$pthread_lib" ; then
> -  pthread_setname_np_w_tid=3Dyes
> -fi
> -
> -# check for pthread_setname_np without thread id
> -pthread_setname_np_wo_tid=3Dno
> -cat > $TMPC << EOF
> -#include <pthread.h>
> -
> -static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
> -int main(void)
> -{
> -    pthread_t thread;
> -    pthread_create(&thread, 0, f, 0);
> -    return 0;
> -}
> -EOF
> -if compile_prog "" "$pthread_lib" ; then
> -  pthread_setname_np_wo_tid=3Dyes
> -fi
> -
>  ##########################################
>  # libssh probe
>  if test "$libssh" !=3D "no" ; then
> @@ -4496,19 +4431,6 @@ if test "$debug_mutex" =3D "yes" ; then
>    echo "CONFIG_DEBUG_MUTEX=3Dy" >> $config_host_mak
>  fi
>
> -# Hold two types of flag:
> -#   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the nam=
e
> on
> -#                                     a thread we have a handle to
> -#   CONFIG_PTHREAD_SETNAME_NP_W_TID - A way of doing it on a particular
> -#                                     platform
> -if test "$pthread_setname_np_w_tid" =3D "yes" ; then
> -  echo "CONFIG_THREAD_SETNAME_BYTHREAD=3Dy" >> $config_host_mak
> -  echo "CONFIG_PTHREAD_SETNAME_NP_W_TID=3Dy" >> $config_host_mak
> -elif test "$pthread_setname_np_wo_tid" =3D "yes" ; then
> -  echo "CONFIG_THREAD_SETNAME_BYTHREAD=3Dy" >> $config_host_mak
> -  echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$bochs" =3D "yes" ; then
>    echo "CONFIG_BOCHS=3Dy" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 935a20c198..54b2afdb96 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1586,6 +1586,29 @@ config_host_data.set('CONFIG_POSIX_MADVISE',
> cc.links(gnu_source_prefix + '''
>    #include <sys/mman.h>
>    #include <stddef.h>
>    int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED);
> }'''))
> +
> +config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
> +  #include <pthread.h>
> +
> +  static void *f(void *p) { return NULL; }
> +  int main(void)
> +  {
> +    pthread_t thread;
> +    pthread_create(&thread, 0, f, 0);
> +    pthread_setname_np(thread, "QEMU");
> +    return 0;
> +  }''', dependencies: threads))
> +config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links('''
> +  #include <pthread.h>
> +
> +  static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
> +  int main(void)
> +  {
> +    pthread_t thread;
> +    pthread_create(&thread, 0, f, 0);
> +    return 0;
> +  }''', dependencies: threads))
> +
>  config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
>    #include <unistd.h>
>    #include <sys/syscall.h>
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index 6c5004220d..e1225b63bd 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -23,7 +23,8 @@ void qemu_thread_naming(bool enable)
>  {
>      name_threads =3D enable;
>
> -#ifndef CONFIG_THREAD_SETNAME_BYTHREAD
> +#if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
> +    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
>      /* This is a debugging option, not fatal */
>      if (enable) {
>          fprintf(stderr, "qemu: thread naming not supported on this
> host\n");
> @@ -522,7 +523,6 @@ static void *qemu_thread_start(void *args)
>      void *arg =3D qemu_thread_args->arg;
>      void *r;
>
> -#ifdef CONFIG_THREAD_SETNAME_BYTHREAD
>      /* Attempt to set the threads name; note that this is for debug, so
>       * we're not going to fail if we can't set it.
>       */
> @@ -533,7 +533,6 @@ static void *qemu_thread_start(void *args)
>          pthread_setname_np(qemu_thread_args->name);
>  # endif
>      }
> -#endif
>      QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
>      g_free(qemu_thread_args->name);
>      g_free(qemu_thread_args);
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000014932d05cdc94bea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:19 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This makes the pthreads check dead in configure, so remove it<=
br>
as well.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<=
/div><div><br></div><div>(a shame that g_system_thread_set_name() is not ex=
ported imho)</div><div><br></div></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 78=
 ----------------------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++=
++++++++<br>
=C2=A0util/qemu-thread-posix.c |=C2=A0 5 ++-<br>
=C2=A03 files changed, 25 insertions(+), 81 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 52f89b05d6..a1e142d5f8 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -3146,71 +3146,6 @@ if test &quot;$modules&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# pthread probe<br>
-PTHREADLIBS_LIST=3D&quot;-pthread -lpthread -lpthreadGC2&quot;<br>
-<br>
-pthread=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;pthread.h&gt;<br>
-static void *f(void *p) { return NULL; }<br>
-int main(void) {<br>
-=C2=A0 pthread_t thread;<br>
-=C2=A0 pthread_create(&amp;thread, 0, f, 0);<br>
-=C2=A0 return 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 pthread=3Dyes<br>
-else<br>
-=C2=A0 for pthread_lib in $PTHREADLIBS_LIST; do<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;$pthread_lib&quot; ; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 pthread=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 break<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 done<br>
-fi<br>
-<br>
-if test &quot;$mingw32&quot; !=3D yes &amp;&amp; test &quot;$pthread&quot;=
 =3D no; then<br>
-=C2=A0 error_exit &quot;pthread check failed&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 &quot;Make sure to have the pthread libs and headers =
installed.&quot;<br>
-fi<br>
-<br>
-# check for pthread_setname_np with thread id<br>
-pthread_setname_np_w_tid=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;pthread.h&gt;<br>
-<br>
-static void *f(void *p) { return NULL; }<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 pthread_t thread;<br>
-=C2=A0 =C2=A0 pthread_create(&amp;thread, 0, f, 0);<br>
-=C2=A0 =C2=A0 pthread_setname_np(thread, &quot;QEMU&quot;);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;$pthread_lib&quot; ; then<br>
-=C2=A0 pthread_setname_np_w_tid=3Dyes<br>
-fi<br>
-<br>
-# check for pthread_setname_np without thread id<br>
-pthread_setname_np_wo_tid=3Dno<br>
-cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;pthread.h&gt;<br>
-<br>
-static void *f(void *p) { pthread_setname_np(&quot;QEMU&quot;); return NUL=
L; }<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 pthread_t thread;<br>
-=C2=A0 =C2=A0 pthread_create(&amp;thread, 0, f, 0);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-if compile_prog &quot;&quot; &quot;$pthread_lib&quot; ; then<br>
-=C2=A0 pthread_setname_np_wo_tid=3Dyes<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# libssh probe<br>
=C2=A0if test &quot;$libssh&quot; !=3D &quot;no&quot; ; then<br>
@@ -4496,19 +4431,6 @@ if test &quot;$debug_mutex&quot; =3D &quot;yes&quot;=
 ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DEBUG_MUTEX=3Dy&quot; &gt;&gt; $config_host_=
mak<br>
=C2=A0fi<br>
<br>
-# Hold two types of flag:<br>
-#=C2=A0 =C2=A0CONFIG_THREAD_SETNAME_BYTHREAD=C2=A0 - we&#39;ve got a way o=
f setting the name on<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a thread we have=
 a handle to<br>
-#=C2=A0 =C2=A0CONFIG_PTHREAD_SETNAME_NP_W_TID - A way of doing it on a par=
ticular<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform<br>
-if test &quot;$pthread_setname_np_w_tid&quot; =3D &quot;yes&quot; ; then<b=
r>
-=C2=A0 echo &quot;CONFIG_THREAD_SETNAME_BYTHREAD=3Dy&quot; &gt;&gt; $confi=
g_host_mak<br>
-=C2=A0 echo &quot;CONFIG_PTHREAD_SETNAME_NP_W_TID=3Dy&quot; &gt;&gt; $conf=
ig_host_mak<br>
-elif test &quot;$pthread_setname_np_wo_tid&quot; =3D &quot;yes&quot; ; the=
n<br>
-=C2=A0 echo &quot;CONFIG_THREAD_SETNAME_BYTHREAD=3Dy&quot; &gt;&gt; $confi=
g_host_mak<br>
-=C2=A0 echo &quot;CONFIG_PTHREAD_SETNAME_NP_WO_TID=3Dy&quot; &gt;&gt; $con=
fig_host_mak<br>
-fi<br>
-<br>
=C2=A0if test &quot;$bochs&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_BOCHS=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0fi<br>
diff --git a/meson.build b/meson.build<br>
index 935a20c198..54b2afdb96 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1586,6 +1586,29 @@ config_host_data.set(&#39;CONFIG_POSIX_MADVISE&#39;,=
 cc.links(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0#include &lt;sys/mman.h&gt;<br>
=C2=A0 =C2=A0#include &lt;stddef.h&gt;<br>
=C2=A0 =C2=A0int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONT=
NEED); }&#39;&#39;&#39;))<br>
+<br>
+config_host_data.set(&#39;CONFIG_PTHREAD_SETNAME_NP_W_TID&#39;, cc.links(&=
#39;&#39;&#39;<br>
+=C2=A0 #include &lt;pthread.h&gt;<br>
+<br>
+=C2=A0 static void *f(void *p) { return NULL; }<br>
+=C2=A0 int main(void)<br>
+=C2=A0 {<br>
+=C2=A0 =C2=A0 pthread_t thread;<br>
+=C2=A0 =C2=A0 pthread_create(&amp;thread, 0, f, 0);<br>
+=C2=A0 =C2=A0 pthread_setname_np(thread, &quot;QEMU&quot;);<br>
+=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 }&#39;&#39;&#39;, dependencies: threads))<br>
+config_host_data.set(&#39;CONFIG_PTHREAD_SETNAME_NP_WO_TID&#39;, cc.links(=
&#39;&#39;&#39;<br>
+=C2=A0 #include &lt;pthread.h&gt;<br>
+<br>
+=C2=A0 static void *f(void *p) { pthread_setname_np(&quot;QEMU&quot;); ret=
urn NULL; }<br>
+=C2=A0 int main(void)<br>
+=C2=A0 {<br>
+=C2=A0 =C2=A0 pthread_t thread;<br>
+=C2=A0 =C2=A0 pthread_create(&amp;thread, 0, f, 0);<br>
+=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 }&#39;&#39;&#39;, dependencies: threads))<br>
+<br>
=C2=A0config_host_data.set(&#39;CONFIG_SIGNALFD&#39;, cc.links(gnu_source_p=
refix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0 =C2=A0#include &lt;sys/syscall.h&gt;<br>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c<br>
index 6c5004220d..e1225b63bd 100644<br>
--- a/util/qemu-thread-posix.c<br>
+++ b/util/qemu-thread-posix.c<br>
@@ -23,7 +23,8 @@ void qemu_thread_naming(bool enable)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0name_threads =3D enable;<br>
<br>
-#ifndef CONFIG_THREAD_SETNAME_BYTHREAD<br>
+#if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID &amp;&amp; \<br>
+=C2=A0 =C2=A0 !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID<br>
=C2=A0 =C2=A0 =C2=A0/* This is a debugging option, not fatal */<br>
=C2=A0 =C2=A0 =C2=A0if (enable) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;qemu: thread naming=
 not supported on this host\n&quot;);<br>
@@ -522,7 +523,6 @@ static void *qemu_thread_start(void *args)<br>
=C2=A0 =C2=A0 =C2=A0void *arg =3D qemu_thread_args-&gt;arg;<br>
=C2=A0 =C2=A0 =C2=A0void *r;<br>
<br>
-#ifdef CONFIG_THREAD_SETNAME_BYTHREAD<br>
=C2=A0 =C2=A0 =C2=A0/* Attempt to set the threads name; note that this is f=
or debug, so<br>
=C2=A0 =C2=A0 =C2=A0 * we&#39;re not going to fail if we can&#39;t set it.<=
br>
=C2=A0 =C2=A0 =C2=A0 */<br>
@@ -533,7 +533,6 @@ static void *qemu_thread_start(void *args)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_setname_np(qemu_thread_args-&gt;n=
ame);<br>
=C2=A0# endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args-&gt;nam=
e);<br>
=C2=A0 =C2=A0 =C2=A0g_free(qemu_thread_args-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0g_free(qemu_thread_args);<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000014932d05cdc94bea--

