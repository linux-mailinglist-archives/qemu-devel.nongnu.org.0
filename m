Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED5603159
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:08:21 +0200 (CEST)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okq4i-0004VP-1P
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okpkl-0004Zt-Ei
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:47:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okpkh-00048O-Kn
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:47:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so12682923wmq.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fFIiTcKFgV8KEeQwXWIyLnc6ubdmfZ1bn90vp/AepY=;
 b=grCDHsnnbQhlhYHYDM/evwfDtCbjvonNgFZcoFIMyVJnTTPGqAYiacXeC2NzfK0MQP
 CZNYsHsT+eAnQ6OfYQnRshZBcbRM++YO6dk0+KCRCR+VnCwY6njnYLE+pREUlWsoYGAs
 F8Q8ZCZMapnayw98viNDcv6jW8ntSj6FSH9n95Rm9hkv9ckYUjyvRRSzwnGtXy9gard4
 J5i+l1mUgo3tQy2JK7D8DZl//4k3upE6zl67c0bZnKH/N45vGAFAky80Epz15xuZbr27
 mdu2fmoJgscYhkLeiXlW+FuXZlpyxE1Y45LGxn+/+urx/tYE/zSxaokjIX5auNi7KJfZ
 IxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8fFIiTcKFgV8KEeQwXWIyLnc6ubdmfZ1bn90vp/AepY=;
 b=h7WyNT3yiSHA1n1ONK1muH4uf4+q/xODg9vnc5GfjRCiJ1rigZOeLPyvpRirduceZ6
 HEISMA1hVqG64/UwOThuW7eJ/P5lsZ6mMIwd7EwqUT7yyRj50/9OqgRVIjPWcMWl5GgS
 2kAaAvi/SkAEw3aZt8y9hePuODU213G8fXNHK29y0JOqd7p1qzqRBk3pSp1tQpKQXv9y
 oeFRpqjcXO38Ej1iNfIaCBuU0HzBpF5kMdwU/6tY6w+q+kwzYIHULtDMrGxTl91KWYeS
 xgG9pkSZDA+BdYPzTtjeBIAihVBcrgkExDfapmnWf48EguSZoJ24ps8JFBZ+7+fZie+3
 4ExA==
X-Gm-Message-State: ACrzQf10lUNavqGmrqDQn3BumwPkJrf2v9qWIuwndP/jstOaMnuyT8p6
 wffR9GH7sXLFN4Xzr5GK6EMidA==
X-Google-Smtp-Source: AMsMyM4S+96H0y5W5i2sqplCAdTyIVcDbqtBsgbhl6ktwPJTJYbtA6y5k1i770UVPQxO5QHF0E0erg==
X-Received: by 2002:a05:600c:510e:b0:3b4:fed8:e65c with SMTP id
 o14-20020a05600c510e00b003b4fed8e65cmr2647978wms.93.1666111657920; 
 Tue, 18 Oct 2022 09:47:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j30-20020adfa55e000000b0021e51c039c5sm12067116wrb.80.2022.10.18.09.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:47:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9294D1FFB7;
 Tue, 18 Oct 2022 17:47:36 +0100 (BST)
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-10-bmeng.cn@gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Xuzhou
 Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/18] tests/qtest: Use send/recv for socket
 communication
Date: Tue, 18 Oct 2022 17:47:20 +0100
In-reply-to: <20221006151927.2079583-10-bmeng.cn@gmail.com>
Message-ID: <87o7u9axjr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Socket communication in the libqtest and libqmp codes uses read()
> and write() which work on any file descriptor on *nix, and sockets
> in *nix are an example of a file descriptor.
>
> However sockets on Windows do not use *nix-style file descriptors,
> so read() and write() cannot be used on sockets on Windows.
> Switch over to use send() and recv() instead which work on both
> Windows and *nix.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Introduce qemu_send_full() and use it
>
>  include/qemu/sockets.h |  2 ++
>  tests/qtest/libqmp.c   |  5 +++--
>  tests/qtest/libqtest.c |  4 ++--
>  util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 036745e586..adf2b21bd9 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -33,6 +33,8 @@ int qemu_socketpair(int domain, int type, int protocol,=
 int sv[2]);
>  #endif
>=20=20
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> +    G_GNUC_WARN_UNUSED_RESULT;
>  int socket_set_cork(int fd, int v);
>  int socket_set_nodelay(int fd);
>  void qemu_socket_set_block(int fd);
> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> index ade26c15f0..2b08382e5d 100644
> --- a/tests/qtest/libqmp.c
> +++ b/tests/qtest/libqmp.c
> @@ -23,6 +23,7 @@
>  #endif
>=20=20
>  #include "qemu/cutils.h"
> +#include "qemu/sockets.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/qjson.h"
> @@ -36,7 +37,7 @@ typedef struct {
>=20=20
>  static void socket_send(int fd, const char *buf, size_t size)
>  {
> -    size_t res =3D qemu_write_full(fd, buf, size);
> +    ssize_t res =3D qemu_send_full(fd, buf, size);
>=20=20
>      assert(res =3D=3D size);
>  }
> @@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)
>          ssize_t len;
>          char c;
>=20=20
> -        len =3D read(fd, &c, 1);
> +        len =3D recv(fd, &c, 1, 0);
>          if (len =3D=3D -1 && errno =3D=3D EINTR) {
>              continue;
>          }
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 4f4b2d6477..8228262938 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -436,7 +436,7 @@ void qtest_quit(QTestState *s)
>=20=20
>  static void socket_send(int fd, const char *buf, size_t size)
>  {
> -    size_t res =3D qemu_write_full(fd, buf, size);
> +    ssize_t res =3D qemu_send_full(fd, buf, size);
>=20=20
>      assert(res =3D=3D size);
>  }
> @@ -468,7 +468,7 @@ static GString *qtest_client_socket_recv_line(QTestSt=
ate *s)
>          ssize_t len;
>          char buffer[1024];
>=20=20
> -        len =3D read(s->fd, buffer, sizeof(buffer));
> +        len =3D recv(s->fd, buffer, sizeof(buffer), 0);
>          if (len =3D=3D -1 && errno =3D=3D EINTR) {
>              continue;
>          }
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..0342e754e1 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -502,6 +502,39 @@ int qemu_accept(int s, struct sockaddr *addr, sockle=
n_t *addrlen)
>      return ret;
>  }
>=20=20
> +/*
> + * A variant of send(2) which handles partial send.
> + *
> + * Return the number of bytes transferred over the socket.
> + * Set errno if fewer than `count' bytes are sent.
> + *
> + * This function don't work with non-blocking socket's.
> + * Any of the possibilities with non-blocking socket's is bad:
> + *   - return a short write (then name is wrong)
> + *   - busy wait adding (errno =3D=3D EAGAIN) to the loop
> + */
> +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> +{
> +    ssize_t ret =3D 0;
> +    ssize_t total =3D 0;
> +
> +    while (count) {
> +        ret =3D send(s, buf, count, 0);
> +        if (ret < 0) {
> +            if (errno =3D=3D EINTR) {
> +                continue;
> +            }
> +            break;
> +        }
> +
> +        count -=3D ret;
> +        buf +=3D ret;
> +        total +=3D ret;
> +    }
> +
> +    return total;
> +}
> +
>  void qemu_set_hw_version(const char *version)
>  {
>      hw_version =3D version;

Hmm something goes wrong here:

FAILED: tests/qtest/libqos/libqos.fa.p/.._libqtest.c.o=20
cc -m64 -mcx16 -Itests/qtest/libqos/libqos.fa.p -Itests/qtest/libqos -I../.=
./tests/qtest/libqos -I. -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/gli=
b-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=3Dau=
to -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/alex/lsrc=
/qemu.git/linux-headers -isystem linux-headers -iquote . -iquote /home/alex=
/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/include -iquote /home/alex/=
lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_=
GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes=
 -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict=
-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definitio=
n -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualif=
iers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -W=
implicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-valu=
e -Wno-psabi -fstack-protector-strong -fPIE -MD -MQ tests/qtest/libqos/libq=
os.fa.p/.._libqtest.c.o -MF tests/qtest/libqos/libqos.fa.p/.._libqtest.c.o.=
d -o tests/qtest/libqos/libqos.fa.p/.._libqtest.c.o -c ../../tests/qtest/li=
bqtest.c
../../tests/qtest/libqtest.c: In function =E2=80=98socket_send=E2=80=99:
../../tests/qtest/libqtest.c:431:19: error: implicit declaration of functio=
n =E2=80=98qemu_send_full=E2=80=99; did you mean =E2=80=98qemu_write_full=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  431 |     ssize_t res =3D qemu_send_full(fd, buf, size);
      |                   ^~~~~~~~~~~~~~
      |                   qemu_write_full
../../tests/qtest/libqtest.c:431:19: error: nested extern declaration of =
=E2=80=98qemu_send_full=E2=80=99 [-Werror=3Dnested-externs]
cc1: all warnings being treated as errors


dropping this patch.


--=20
Alex Benn=C3=A9e

