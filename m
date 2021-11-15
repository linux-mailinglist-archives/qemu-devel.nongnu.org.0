Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37335450B3D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 18:18:07 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfcM-0007D6-3J
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 12:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmfah-0006Tb-BD
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmfad-0002Vb-N8
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 12:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636996579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBR1N5M0OjLxZa2Q+/durivHM0N30JRJJhEB3I7q5Ps=;
 b=afnU0BeFbqg0OHTToNun8Irfoyt2zeipP4kLilY6T7+Dd/0jYJvvgY7pqAqe/C/N6vSfkc
 j7muDTVuhw/MN+Xq+BkB30+X34eFq4B5NQVWi6gwGa4LGjG9LxEU0OGBUKDa8iczu93TJz
 QJ7zfdPil1yS7ZvZHz96yBEOrNfixG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-hvGU4cYrN3SPHH_xHtzogA-1; Mon, 15 Nov 2021 12:16:12 -0500
X-MC-Unique: hvGU4cYrN3SPHH_xHtzogA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A6287D544;
 Mon, 15 Nov 2021 17:16:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D11019724;
 Mon, 15 Nov 2021 17:15:43 +0000 (UTC)
Date: Mon, 15 Nov 2021 17:15:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 15/26] configure, meson: move pthread_setname_np checks to
 Meson
Message-ID: <YZKVuz5VJN6e9zjo@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-16-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014162938.430211-16-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 06:29:27PM +0200, Paolo Bonzini wrote:
> This makes the pthreads check dead in configure, so remove it
> as well.

This change appears broken

On v6.1.0

$ grep SETNAME_NP build/config-host.h
#define CONFIG_PTHREAD_SETNAME_NP_W_TID 1

While on git master

$ grep SETNAME_NP build/config-host.h
#define CONFIG_PTHREAD_SETNAME_NP_WO_TID
#define CONFIG_PTHREAD_SETNAME_NP_W_TID


it shoudn't be possible to have both these configs
satisfied as they're 2 completely different impls.

In the meson-log.txt we can see both tests passing, but with
warnings

  /home/berrange/src/virt/qemu/build/meson-private/tmpt191k3q1/testfile.c:9:5: warning: implicit declaration of function 'pthread_setname_np'; did you mean 'pthread_setcanceltype'? [-Wimplicit-function-declaration]

So it isn't actually validating the function parameter
signature, and then link is succeeding because the linker
doesn't care about the incompatible function signatures.

Peter meanwhile reports that he gets no pthread_Setname_np
at all, and his meson-build.log shows -Werror set. This
causes the missing fnuction signature to cause tests to
fail in both cases.

The original config.log shows _GNU_SOURCE being defined
for these tests, which would get the function signture
defined.

> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-9-pbonzini@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                | 78 ----------------------------------------
>  meson.build              | 23 ++++++++++++
>  util/qemu-thread-posix.c |  5 ++-
>  3 files changed, 25 insertions(+), 81 deletions(-)
> 
> diff --git a/configure b/configure
> index e78f58978f..c7e95e59cc 100755
> --- a/configure
> +++ b/configure
> @@ -3148,71 +3148,6 @@ if test "$modules" = yes; then
>      fi
>  fi
>  
> -##########################################
> -# pthread probe
> -PTHREADLIBS_LIST="-pthread -lpthread -lpthreadGC2"
> -
> -pthread=no
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
> -  pthread=yes
> -else
> -  for pthread_lib in $PTHREADLIBS_LIST; do
> -    if compile_prog "" "$pthread_lib" ; then
> -      pthread=yes
> -      break
> -    fi
> -  done
> -fi
> -
> -if test "$mingw32" != yes && test "$pthread" = no; then
> -  error_exit "pthread check failed" \
> -      "Make sure to have the pthread libs and headers installed."
> -fi
> -
> -# check for pthread_setname_np with thread id
> -pthread_setname_np_w_tid=no
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
> -  pthread_setname_np_w_tid=yes
> -fi
> -
> -# check for pthread_setname_np without thread id
> -pthread_setname_np_wo_tid=no
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
> -  pthread_setname_np_wo_tid=yes
> -fi
> -
>  ##########################################
>  # libssh probe
>  if test "$libssh" != "no" ; then
> @@ -4498,19 +4433,6 @@ if test "$debug_mutex" = "yes" ; then
>    echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
>  fi
>  
> -# Hold two types of flag:
> -#   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
> -#                                     a thread we have a handle to
> -#   CONFIG_PTHREAD_SETNAME_NP_W_TID - A way of doing it on a particular
> -#                                     platform
> -if test "$pthread_setname_np_w_tid" = "yes" ; then
> -  echo "CONFIG_THREAD_SETNAME_BYTHREAD=y" >> $config_host_mak
> -  echo "CONFIG_PTHREAD_SETNAME_NP_W_TID=y" >> $config_host_mak
> -elif test "$pthread_setname_np_wo_tid" = "yes" ; then
> -  echo "CONFIG_THREAD_SETNAME_BYTHREAD=y" >> $config_host_mak
> -  echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=y" >> $config_host_mak
> -fi
> -
>  if test "$bochs" = "yes" ; then
>    echo "CONFIG_BOCHS=y" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index e8e728bf72..26fc4e5792 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1584,6 +1584,29 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
>    #include <sys/mman.h>
>    #include <stddef.h>
>    int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
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
>    #include <sys/signalfd.h>
>    #include <stddef.h>
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index 6c5004220d..e1225b63bd 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -23,7 +23,8 @@ void qemu_thread_naming(bool enable)
>  {
>      name_threads = enable;
>  
> -#ifndef CONFIG_THREAD_SETNAME_BYTHREAD
> +#if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
> +    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
>      /* This is a debugging option, not fatal */
>      if (enable) {
>          fprintf(stderr, "qemu: thread naming not supported on this host\n");
> @@ -522,7 +523,6 @@ static void *qemu_thread_start(void *args)
>      void *arg = qemu_thread_args->arg;
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

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


