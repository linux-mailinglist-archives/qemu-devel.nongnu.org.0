Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED305F635C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:15:05 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMy6-0001GY-W6
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ogMWY-0003ef-Am
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ogMWW-0007kg-E8
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+K5oIKiRkuX35MrLNkGrEEJ2m9Z7fa4knnki1oFo6A=;
 b=gsHgNvmJWpbgahnoMLpzS68ZH0+h6SMDg71E6Z+xvjIQ/T0Q6MiNAJg0gLgHhuc5J9zuX7
 BvZHYp5qVD2KWRMQqcq5U+LOyZmwvcEV0DqitzySxoas9SqCFITpv2KjBCkkSHkLXAMA2b
 Xd8AP7LTXvM506QNEME0fVNvc4KItMA=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-UwwAheZEM0WuM_yz3nTWvQ-1; Thu, 06 Oct 2022 04:46:30 -0400
X-MC-Unique: UwwAheZEM0WuM_yz3nTWvQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13234741239so697937fac.7
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 01:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+K5oIKiRkuX35MrLNkGrEEJ2m9Z7fa4knnki1oFo6A=;
 b=fGXSwMQuVFfpY5UX5CbZu98x6SMAv4uPetXCqJfvDi7eHSH1+RSHxgFtH2GgiIBFDc
 mA2aFmbkCr7k2PCR7xsbYH3K2VRCnbzhLWES/MeyO2zldcNQl0OhDc+ZS78EuysH8SSD
 liULvO1P6TKN+42IcTrPHpLGMWyA6O4PgbLJuEce3ClBMQJFP4WAl45GOhXokBQnSvyD
 GX1Ud3haf7tmuqIT3bAAdyel1lwVUdIYonCqfBlvIMt7YF8jSSRhTvMXC6JHpIn42WeP
 6EGt9ZphrKTRIw97yW65PnmxJWaW/8JCgQg2bbd9XyCQdffANYbdzvsEl5+Hxt894Cwq
 GuSQ==
X-Gm-Message-State: ACrzQf3ORIxIFaTuAMkv3tjkOe7boO7HlTCefPh4BAgRc7hdtoO7LU1N
 H+5o7NWPBTepo2ouKEPpyL7Aiat3TyOiDuc19xRaDAPNO2iPt8db0Y6xVn7DHzRYOl97pEz27gd
 SfzUSxXU9n7uPqE9PBCzsy9zl6qfoGrM=
X-Received: by 2002:a05:6830:b8d:b0:65f:22fb:be09 with SMTP id
 a13-20020a0568300b8d00b0065f22fbbe09mr1418727otv.38.1665045989491; 
 Thu, 06 Oct 2022 01:46:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Lc0dmHtPhPqFf9R8GgYRr+7xYG3s4+cYJuvLSJZMU70vSFv647sse94vyJbzj/Mk/qzhm86mvJ2kUXyumAYI=
X-Received: by 2002:a05:6830:b8d:b0:65f:22fb:be09 with SMTP id
 a13-20020a0568300b8d00b0065f22fbbe09mr1418721otv.38.1665045989202; Thu, 06
 Oct 2022 01:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-6-marcandre.lureau@redhat.com>
 <Yz6U7GXKg+Ctb3t0@redhat.com>
In-Reply-To: <Yz6U7GXKg+Ctb3t0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 6 Oct 2022 12:46:17 +0400
Message-ID: <CAMxuvawpOSiGYFnGgmh4mb7jKbbKvd5UD_QP6FMZZh8gUAzVBQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/unit: make test-io-channel-command work on
 win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Oct 6, 2022 at 12:42 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Oct 06, 2022 at 12:12:22PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This has been tested under msys2 & windows 11. I haven't tried to make
> > it work with other environments yet, but that should be enough to
> > validate the channel-command implementation anyway.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/unit/test-io-channel-command.c | 32 ++++++++++++----------------
> >  tests/unit/meson.build               |  2 +-
> >  2 files changed, 15 insertions(+), 19 deletions(-)
> >
> > diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-=
channel-command.c
> > index aa09c559cd..be98c3452a 100644
> > --- a/tests/unit/test-io-channel-command.c
> > +++ b/tests/unit/test-io-channel-command.c
> > @@ -24,29 +24,27 @@
> >  #include "qapi/error.h"
> >  #include "qemu/module.h"
> >
> > -#ifndef WIN32
> > +#define TEST_PATH "test-io-channel-command.fifo"
> > +
> > +#define SOCAT_SRC "PIPE:" TEST_PATH ",wronly"
> > +#define SOCAT_DST "PIPE:" TEST_PATH ",rdonly"
> > +
> >  static void test_io_channel_command_fifo(bool async)
> >  {
> > -#define TEST_FIFO "tests/test-io-channel-command.fifo"
> >      QIOChannel *src, *dst;
> >      QIOChannelTest *test;
> > -    const char *srcfifo =3D "PIPE:" TEST_FIFO ",wronly";
> > -    const char *dstfifo =3D "PIPE:" TEST_FIFO ",rdonly";
> >      const char *srcargv[] =3D {
> > -        "/bin/socat", "-", srcfifo, NULL,
> > +        g_getenv("SOCAT"), "-", SOCAT_SRC, NULL,
>
> Please don't rely on env variables, as it complicates the ability to
> invoke the test directly, without the meson harness. Either pass the
> path from meson at compile time in config-host.h, or make this code
> use an unqualified path, so it honours $PATH at runtime.

I tried to pass it through config-host.h, but I dont see a way to
escape the \ is the paths.

Unqualified path doesn't work under msys2.

>
> >      };
> >      const char *dstargv[] =3D {
> > -        "/bin/socat", dstfifo, "-", NULL,
> > +        g_getenv("SOCAT"), SOCAT_DST, "-", NULL,
> >      };
> >
> > -    unlink(TEST_FIFO);
> > -    if (access("/bin/socat", X_OK) < 0) {
> > +    unlink(TEST_PATH);
> > +    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
> >          g_test_skip("socat is missing");
> >          return;
> >      }
> > -    if (mkfifo(TEST_FIFO, 0600) < 0) {
> > -        abort();
> > -    }
> >      src =3D QIO_CHANNEL(qio_channel_command_new_spawn(srcargv,
> >                                                      O_WRONLY,
> >                                                      &error_abort));
> > @@ -61,7 +59,7 @@ static void test_io_channel_command_fifo(bool async)
> >      object_unref(OBJECT(src));
> >      object_unref(OBJECT(dst));
> >
> > -    unlink(TEST_FIFO);
> > +    unlink(TEST_PATH);
> >  }
> >
> >
> > @@ -81,11 +79,12 @@ static void test_io_channel_command_echo(bool async=
)
> >      QIOChannel *ioc;
> >      QIOChannelTest *test;
> >      const char *socatargv[] =3D {
> > -        "/bin/socat", "-", "-", NULL,
> > +        g_getenv("SOCAT"), "-", "-", NULL,
> >      };
> >
> > -    if (access("/bin/socat", X_OK) < 0) {
> > -        return; /* Pretend success if socat is not present */
> > +    if (!g_file_test(g_getenv("SOCAT"), G_FILE_TEST_IS_EXECUTABLE)) {
> > +        g_test_skip("socat is missing");
> > +        return;
> >      }
> >
> >      ioc =3D QIO_CHANNEL(qio_channel_command_new_spawn(socatargv,
> > @@ -108,7 +107,6 @@ static void test_io_channel_command_echo_sync(void)
> >  {
> >      test_io_channel_command_echo(false);
> >  }
> > -#endif
> >
> >  int main(int argc, char **argv)
> >  {
> > @@ -116,7 +114,6 @@ int main(int argc, char **argv)
> >
> >      g_test_init(&argc, &argv, NULL);
> >
> > -#ifndef WIN32
> >      g_test_add_func("/io/channel/command/fifo/sync",
> >                      test_io_channel_command_fifo_sync);
> >      g_test_add_func("/io/channel/command/fifo/async",
> > @@ -125,7 +122,6 @@ int main(int argc, char **argv)
> >                      test_io_channel_command_echo_sync);
> >      g_test_add_func("/io/channel/command/echo/async",
> >                      test_io_channel_command_echo_async);
> > -#endif
> >
> >      return g_test_run();
> >  }
> > diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> > index b497a41378..42e8218ac2 100644
> > --- a/tests/unit/meson.build
> > +++ b/tests/unit/meson.build
> > @@ -1,4 +1,3 @@
> > -
> >  testblock =3D declare_dependency(dependencies: [block], sources: 'ioth=
read.c')
> >
> >  tests =3D {
>
> Spurious line deletion.
>
>
> > @@ -164,6 +163,7 @@ endif
> >  test_env =3D environment()
> >  test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
> >  test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
> > +test_env.set('SOCAT', find_program('socat').full_path())
> >
> >  slow_tests =3D {
> >    'test-crypto-tlscredsx509': 45,
> > --
> > 2.37.3
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


