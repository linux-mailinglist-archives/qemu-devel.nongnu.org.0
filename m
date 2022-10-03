Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D388C5F2F23
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:54:33 +0200 (CEST)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJ5k-0005fs-WD
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIy9-0001dy-Rc
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIy5-0003pl-IG
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664793996;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+4QCTSZRkDQrlKIzoliT+2f3h9E4LZ3dpOdUt4CrUQ=;
 b=LgvMSIBHHRO7TCECD7oI00NEHBxmuF8A1mS1+BsTFD93Z0r5qPpPmMsu+jZp07N50GnXYD
 0DZ425l/T1Gw9RCtxUKT0cT8obOMYYjbEBT2YezLAFoJGT5/r7mnnCR8zqcrbSkgyKAkGL
 OIrxUqgL1fVfe2GmQqzStF2AsJaMMF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-9_5oNKjSON6FVCP_yUd10Q-1; Mon, 03 Oct 2022 06:46:33 -0400
X-MC-Unique: 9_5oNKjSON6FVCP_yUd10Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673888027ED
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 10:46:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC744492B04;
 Mon,  3 Oct 2022 10:46:32 +0000 (UTC)
Date: Mon, 3 Oct 2022 11:46:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] tests/unit: make test-io-channel-command work on
 win32
Message-ID: <Yzq9hgzlwKxNlGRL@redhat.com>
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
 <20220902111900.3029260-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902111900.3029260-4-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Sep 02, 2022 at 03:19:00PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This has been tested under msys2 & windows 11. I haven't tried to make
> it work with other environments yet, but that should be enough to
> validate the channel-command implementation anyway.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/unit/test-io-channel-command.c | 31 +++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 99056e07c0..56dcc0be19 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -24,28 +24,38 @@
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  
> -#ifndef WIN32
> +#define TEST_FIFO "tests/test-io-channel-command.fifo"
> +
> +#ifdef WIN32
> +#define SOCAT "/bin/socat.exe"
> +#define SOCAT_SRC "PIPE:" TEST_FIFO ",wronly"
> +#define SOCAT_DST "PIPE:" TEST_FIFO ",rdonly"
> +#else
> +#define SOCAT "/bin/socat"
> +#define SOCAT_SRC "UNIX-LISTEN:" TEST_FIFO
> +#define SOCAT_DST "UNIX-CONNECT:" TEST_FIFO
> +#endif

This is changing the UNIX side to use UNIX sockets, while
the Windows side uses PIPEs...

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
> +        SOCAT, "-", SOCAT_SRC, NULL,
>      };
>      const char *dstargv[] = {
> -        "/bin/socat", dstfifo, "-", NULL,
> +        SOCAT, SOCAT_DST, "-", NULL,
>      };

..but this original code uses FIFOs. Why flip the UNIX
side from PIPEs to UNIX sockets. Was this a mistake and
you intended to use UNIX sockets on Windows ?  If so,
how about we just use use UNIX sockets on every platform
and rename the test case.

>  
>      unlink(TEST_FIFO);
> -    if (access("/bin/socat", X_OK) < 0) {
> +    if (access(SOCAT, X_OK) < 0) {
>          return; /* Pretend success if socat is not present */
>      }
> +#ifndef WIN32
>      if (mkfifo(TEST_FIFO, 0600) < 0) {
>          abort();
>      }
> +#endif
>      src = QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
>                                                      O_WRONLY,
>                                                      &error_abort));
> @@ -80,10 +90,10 @@ static void test_io_channel_command_echo(bool async)
>      QIOChannel *ioc;
>      QIOChannelTest *test;
>      const char *socatargv[] = {
> -        "/bin/socat", "-", "-", NULL,
> +        SOCAT, "-", "-", NULL,
>      };
>  
> -    if (access("/bin/socat", X_OK) < 0) {
> +    if (access(SOCAT, X_OK) < 0) {
>          return; /* Pretend success if socat is not present */
>      }
>  
> @@ -107,7 +117,6 @@ static void test_io_channel_command_echo_sync(void)
>  {
>      test_io_channel_command_echo(false);
>  }
> -#endif
>  
>  int main(int argc, char **argv)
>  {
> @@ -115,7 +124,6 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -#ifndef WIN32
>      g_test_add_func("/io/channel/command/fifo/sync",
>                      test_io_channel_command_fifo_sync);
>      g_test_add_func("/io/channel/command/fifo/async",
> @@ -124,7 +132,6 @@ int main(int argc, char **argv)
>                      test_io_channel_command_echo_sync);
>      g_test_add_func("/io/channel/command/echo/async",
>                      test_io_channel_command_echo_async);
> -#endif
>  
>      return g_test_run();
>  }
> -- 
> 2.37.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


