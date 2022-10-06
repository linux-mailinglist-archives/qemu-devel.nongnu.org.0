Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A3A5F63CC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:47:57 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNTv-0007zI-NM
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMSd-0001WK-2t
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:42:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMSa-0007C6-Nw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UATs+OPDsK+a6vqkWr97EVZVS74wneGl7DgDlNpgCAU=;
 b=DmQxQKZniwqxOe0vcZVPRcRfECchXS024Nr34aJ2INghOJDLZiAmEp4QzRgsEUY470dfSB
 1qDGJik5zNNjkFXuiXl2F8MZJrmxRdAOXSqetJxXhUKachvjJgq8FrdR9aF8hxdNEv/pCX
 5s3sAJS9GdbpmcWr8Kt5O1AzK3Ph0jg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-lOH_z0IUM-ybJufBpz_XQw-1; Thu, 06 Oct 2022 04:42:27 -0400
X-MC-Unique: lOH_z0IUM-ybJufBpz_XQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50B03817965
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:42:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E5749BB67;
 Thu,  6 Oct 2022 08:42:25 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:42:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 5/5] tests/unit: make test-io-channel-command work on
 win32
Message-ID: <Yz6U7GXKg+Ctb3t0@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006081222.2606746-6-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 12:12:22PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This has been tested under msys2 & windows 11. I haven't tried to make
> it work with other environments yet, but that should be enough to
> validate the channel-command implementation anyway.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-io-channel-command.c | 32 ++++++++++++----------------
>  tests/unit/meson.build               |  2 +-
>  2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index aa09c559cd..be98c3452a 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -24,29 +24,27 @@
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  
> -#ifndef WIN32
> +#define TEST_PATH "test-io-channel-command.fifo"
> +
> +#define SOCAT_SRC "PIPE:" TEST_PATH ",wronly"
> +#define SOCAT_DST "PIPE:" TEST_PATH ",rdonly"
> +
>  static void test_io_channel_command_fifo(bool async)
>  {
> -#define TEST_FIFO "tests/test-io-channel-command.fifo"
>      QIOChannel *src, *dst;
>      QIOChannelTest *test;
> -    const char *srcfifo = "PIPE:" TEST_FIFO ",wronly";
> -    const char *dstfifo = "PIPE:" TEST_FIFO ",rdonly";
>      const char *srcargv[] = {
> -        "/bin/socat", "-", srcfifo, NULL,
> +        g_getenv("SOCAT"), "-", SOCAT_SRC, NULL,

Please don't rely on env variables, as it complicates the ability to
invoke the test directly, without the meson harness. Either pass the
path from meson at compile time in config-host.h, or make this code
use an unqualified path, so it honours $PATH at runtime.

>      };
>      const char *dstargv[] = {
> -        "/bin/socat", dstfifo, "-", NULL,
> +        g_getenv("SOCAT"), SOCAT_DST, "-", NULL,
>      };
>  
> -    unlink(TEST_FIFO);
> -    if (access("/bin/socat", X_OK) < 0) {
> +    unlink(TEST_PATH);
> +    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
>          g_test_skip("socat is missing");
>          return;
>      }
> -    if (mkfifo(TEST_FIFO, 0600) < 0) {
> -        abort();
> -    }
>      src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
>                                                      O_WRONLY,
>                                                      &error_abort));
> @@ -61,7 +59,7 @@ static void test_io_channel_command_fifo(bool async)
>      object_unref(OBJECT(src));
>      object_unref(OBJECT(dst));
>  
> -    unlink(TEST_FIFO);
> +    unlink(TEST_PATH);
>  }
>  
>  
> @@ -81,11 +79,12 @@ static void test_io_channel_command_echo(bool async)
>      QIOChannel *ioc;
>      QIOChannelTest *test;
>      const char *socatargv[] = {
> -        "/bin/socat", "-", "-", NULL,
> +        g_getenv("SOCAT"), "-", "-", NULL,
>      };
>  
> -    if (access("/bin/socat", X_OK) < 0) {
> -        return; /* Pretend success if socat is not present */
> +    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
> +        g_test_skip("socat is missing");
> +        return;
>      }
>  
>      ioc = QIO_CHANNEL(qio_channel_command_new_spawn(socatargv,
> @@ -108,7 +107,6 @@ static void test_io_channel_command_echo_sync(void)
>  {
>      test_io_channel_command_echo(false);
>  }
> -#endif
>  
>  int main(int argc, char **argv)
>  {
> @@ -116,7 +114,6 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -#ifndef WIN32
>      g_test_add_func("/io/channel/command/fifo/sync",
>                      test_io_channel_command_fifo_sync);
>      g_test_add_func("/io/channel/command/fifo/async",
> @@ -125,7 +122,6 @@ int main(int argc, char **argv)
>                      test_io_channel_command_echo_sync);
>      g_test_add_func("/io/channel/command/echo/async",
>                      test_io_channel_command_echo_async);
> -#endif
>  
>      return g_test_run();
>  }
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index b497a41378..42e8218ac2 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -1,4 +1,3 @@
> -
>  testblock = declare_dependency(dependencies: [block], sources: 'iothread.c')
>  
>  tests = {

Spurious line deletion.


> @@ -164,6 +163,7 @@ endif
>  test_env = environment()
>  test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
>  test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
> +test_env.set('SOCAT', find_program('socat').full_path())
>  
>  slow_tests = {
>    'test-crypto-tlscredsx509': 45,
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


