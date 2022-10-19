Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873CE603A92
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 09:24:12 +0200 (CEST)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol3Qv-0007kG-GQ
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 03:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol3DR-0006kv-Cg
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 03:10:15 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol3DJ-0006Kq-6l
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 03:10:12 -0400
Received: by mail-qt1-x833.google.com with SMTP id h24so10804287qta.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqgbM9dbgI5AC/pSwHhoIOV5t0faU8eBkQXrc8ltZT4=;
 b=nWLU+37oBhBHEBrUDB/+aoTpC13dacR+QCQc2YeiP1j29B2XTnewN9q9PkyxhEfC71
 ET8sqBlRtsKahCsWVKeBXsFfFmGz4kQYgq6vMzwcLW1fexNm1TEQ8REwUGOUiOMY4q5q
 0NHMdenGDkbyTWP4a+OLzOHIgsMc2gMN38A/fiAIJWjc0wc6qE3zUfSoAM5e6OAmHOId
 2NX6kf2PihYrONvLu23ad1Nohr1AWPjZ0nuWV1Q7q/xY/ko2OSfuVId6aLoHLrzPAPHF
 IY+BOxtupHYMl01+ND/2bM4bR63Yvi18UsevIvQ/fO4rE3OSmpmNIfC9K6PtDGWNATtX
 5Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqgbM9dbgI5AC/pSwHhoIOV5t0faU8eBkQXrc8ltZT4=;
 b=aNIr5lXwil/keeUwVeoKk6SLIJSw6Vfjd0ZHYa6wToPOZ6Jmxk2NmZnZ7VXTxf/f0c
 X0t53Z9zn6WQ47SQ61PR8xHZzDPpL3jkIHxNdtN8IwSF5lHR4hCG2Xo/hixiWya7seuS
 Rjswxvb9ghYghzRZgwOsY9gTklLWupHOwl2TWC+TPYalHOZLBq9dQSqe31y8DgleXOjV
 vAzGZaaFUYBTFFYbJk7w3PZxiceZHPtq8hFHrneOGNpvV+oXT3IYJ13KTuxEVO6OMLE1
 Oda3XNU2ucz/9zsSnBS6hCglr5WuMezsAZWcVMtXKFJTixe5l6vWL5chPjtZEC4sLjOP
 Ci0A==
X-Gm-Message-State: ACrzQf2Y5Cipq4Q0NhBVrBzp6IzODkpm/ZsiSz/wcwBgfgSda5cb2nab
 iHREKFYTw6Png5tO5GsQmuRVTXwppTskhSD8edA=
X-Google-Smtp-Source: AMsMyM4Usnkpgjrx5RdaPmjuY/IxsPplV4b+A/HEFFqbA0Fqn4G9FEjB/iU8tRJk8gJRpiR+O4LRaiRz8HS6hfs7E1w=
X-Received: by 2002:a05:622a:8b:b0:39c:f732:f282 with SMTP id
 o11-20020a05622a008b00b0039cf732f282mr4732974qtw.391.1666163404079; Wed, 19
 Oct 2022 00:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-10-bmeng.cn@gmail.com>
 <87o7u9axjr.fsf@linaro.org>
In-Reply-To: <87o7u9axjr.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Oct 2022 15:09:54 +0800
Message-ID: <CAEUhbmVEXtQNQgC9Cuz05ChiwrK0a0FuWCDfKEkL_E9wpapvbA@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] tests/qtest: Use send/recv for socket
 communication
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Oct 19, 2022 at 12:47 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Socket communication in the libqtest and libqmp codes uses read()
> > and write() which work on any file descriptor on *nix, and sockets
> > in *nix are an example of a file descriptor.
> >
> > However sockets on Windows do not use *nix-style file descriptors,
> > so read() and write() cannot be used on sockets on Windows.
> > Switch over to use send() and recv() instead which work on both
> > Windows and *nix.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Introduce qemu_send_full() and use it
> >
> >  include/qemu/sockets.h |  2 ++
> >  tests/qtest/libqmp.c   |  5 +++--
> >  tests/qtest/libqtest.c |  4 ++--
> >  util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
> >  4 files changed, 40 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > index 036745e586..adf2b21bd9 100644
> > --- a/include/qemu/sockets.h
> > +++ b/include/qemu/sockets.h
> > @@ -33,6 +33,8 @@ int qemu_socketpair(int domain, int type, int protoco=
l, int sv[2]);
> >  #endif
> >
> >  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> > +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> > +    G_GNUC_WARN_UNUSED_RESULT;
> >  int socket_set_cork(int fd, int v);
> >  int socket_set_nodelay(int fd);
> >  void qemu_socket_set_block(int fd);
> > diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> > index ade26c15f0..2b08382e5d 100644
> > --- a/tests/qtest/libqmp.c
> > +++ b/tests/qtest/libqmp.c
> > @@ -23,6 +23,7 @@
> >  #endif
> >
> >  #include "qemu/cutils.h"
> > +#include "qemu/sockets.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qmp/json-parser.h"
> >  #include "qapi/qmp/qjson.h"
> > @@ -36,7 +37,7 @@ typedef struct {
> >
> >  static void socket_send(int fd, const char *buf, size_t size)
> >  {
> > -    size_t res =3D qemu_write_full(fd, buf, size);
> > +    ssize_t res =3D qemu_send_full(fd, buf, size);
> >
> >      assert(res =3D=3D size);
> >  }
> > @@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)
> >          ssize_t len;
> >          char c;
> >
> > -        len =3D read(fd, &c, 1);
> > +        len =3D recv(fd, &c, 1, 0);
> >          if (len =3D=3D -1 && errno =3D=3D EINTR) {
> >              continue;
> >          }
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index 4f4b2d6477..8228262938 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -436,7 +436,7 @@ void qtest_quit(QTestState *s)
> >
> >  static void socket_send(int fd, const char *buf, size_t size)
> >  {
> > -    size_t res =3D qemu_write_full(fd, buf, size);
> > +    ssize_t res =3D qemu_send_full(fd, buf, size);
> >
> >      assert(res =3D=3D size);
> >  }
> > @@ -468,7 +468,7 @@ static GString *qtest_client_socket_recv_line(QTest=
State *s)
> >          ssize_t len;
> >          char buffer[1024];
> >
> > -        len =3D read(s->fd, buffer, sizeof(buffer));
> > +        len =3D recv(s->fd, buffer, sizeof(buffer), 0);
> >          if (len =3D=3D -1 && errno =3D=3D EINTR) {
> >              continue;
> >          }
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 60fcbbaebe..0342e754e1 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -502,6 +502,39 @@ int qemu_accept(int s, struct sockaddr *addr, sock=
len_t *addrlen)
> >      return ret;
> >  }
> >
> > +/*
> > + * A variant of send(2) which handles partial send.
> > + *
> > + * Return the number of bytes transferred over the socket.
> > + * Set errno if fewer than `count' bytes are sent.
> > + *
> > + * This function don't work with non-blocking socket's.
> > + * Any of the possibilities with non-blocking socket's is bad:
> > + *   - return a short write (then name is wrong)
> > + *   - busy wait adding (errno =3D=3D EAGAIN) to the loop
> > + */
> > +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> > +{
> > +    ssize_t ret =3D 0;
> > +    ssize_t total =3D 0;
> > +
> > +    while (count) {
> > +        ret =3D send(s, buf, count, 0);
> > +        if (ret < 0) {
> > +            if (errno =3D=3D EINTR) {
> > +                continue;
> > +            }
> > +            break;
> > +        }
> > +
> > +        count -=3D ret;
> > +        buf +=3D ret;
> > +        total +=3D ret;
> > +    }
> > +
> > +    return total;
> > +}
> > +
> >  void qemu_set_hw_version(const char *version)
> >  {
> >      hw_version =3D version;
>
> Hmm something goes wrong here:
>
> FAILED: tests/qtest/libqos/libqos.fa.p/.._libqtest.c.o
> cc -m64 -mcx16 -Itests/qtest/libqos/libqos.fa.p -Itests/qtest/libqos -I..=
/../tests/qtest/libqos -I. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/g=
lib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=3D=
auto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/alex/ls=
rc/qemu.git/linux-headers -isystem linux-headers -iquote . -iquote /home/al=
ex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/include -iquote /home/ale=
x/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -=
D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototyp=
es -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-stri=
ct-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definit=
ion -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qual=
ifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined =
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-va=
lue -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ tests/qtest/libqos/li=
bqos.fa.p/.._libqtest.c.o -MF tests/qtest/libqos/libqos.fa.p/.._libqtest.c.=
o.d -o tests/qtest/libqos/libqos.fa.p/.._libqtest.c.o -c ../../tests/qtest/=
libqtest.c
> ../../tests/qtest/libqtest.c: In function =E2=80=98socket_send=E2=80=99:
> ../../tests/qtest/libqtest.c:431:19: error: implicit declaration of funct=
ion =E2=80=98qemu_send_full=E2=80=99; did you mean =E2=80=98qemu_write_full=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   431 |     ssize_t res =3D qemu_send_full(fd, buf, size);
>       |                   ^~~~~~~~~~~~~~
>       |                   qemu_write_full
> ../../tests/qtest/libqtest.c:431:19: error: nested extern declaration of =
=E2=80=98qemu_send_full=E2=80=99 [-Werror=3Dnested-externs]
> cc1: all warnings being treated as errors
>
>
> dropping this patch.
>

This is weird. It does not reproduce on my side, neither did the QEMU CI.

Regards,
Bin

