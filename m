Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B0349CE5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 00:30:06 +0100 (CET)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPZQS-0003Mc-JO
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 19:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPZPX-0002vU-4W
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:29:07 -0400
Received: from mout.web.de ([212.227.17.12]:58749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPZPP-000260-Ve
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616714934;
 bh=DfhlTTAyz2I1Le+8svBFOg2eLSnrIZ8VLfOGWhNPhK4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KlnRm9vplnvgwsuSoqOIYdaYpbyXxlx0/+OAXYVRgybVyT1vXK7wuJNEiz8h4U8Uh
 G9Jitxnvw9SaqQ+iYPx92eQh84I6vHPYTG1tYxbJ7g1TZv9GeniQwlphzkOWoK3+NZ
 gn0KBPIrRx0bn1QQUP3xVNM/8E3mlW/GUgol6T9U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7elj-1lHZBj0Hin-007zth; Fri, 26
 Mar 2021 00:28:54 +0100
Date: Fri, 26 Mar 2021 00:28:37 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 1/4] tests: Add tests for yank with the
 chardev-change case
Message-ID: <20210326002837.595d3283@gecko.fritz.box>
In-Reply-To: <CAJ+F1C+cGuXXcKbJQMzpvRKROUptymryNGoS009M31Fq_pOB2g@mail.gmail.com>
References: <cover.1616521487.git.lukasstraub2@web.de>
 <ba184a9b5c1c8c7c454a8eb6959fcbca4c2115d2.1616521487.git.lukasstraub2@web.de>
 <CAJ+F1C+cGuXXcKbJQMzpvRKROUptymryNGoS009M31Fq_pOB2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EmcE5nRjuHbxVDhJ9Q/zKL/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:+fmHhLzQ4Leje8d6AMLytiGKPgumeZqJnoS3qBljn8/LMjDuhsO
 yr97MjGWy46FdrptLay0c2h08hg240IqMZVnibaoSNRe0HgsAt9IKgJZ824FfTM2R5R8bES
 w3yE+q7qlBX+cS5nuSCvYdxQpjaAudygReSuMW6OXnxjFhkaX9YvMay4XGjqlPxMEWrTCNS
 LSayzjIVhWR3LuDm2o+FQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XE67RJfUx0A=:8pWIV6m9CMqZMcAOV49ksU
 xc+xWPGRJltIs06x4O442CoAZ9Hm1xdF0biyeWoL1r17iKkQxTVCDKRObIJEPfe1juvX67u4P
 JY2KQ6WuQExYYBtZ5B+w3c+3UIahk1wvEFh4pjz6+uNnnir8ZXnHV4/YAn1qwDDoISiX/CxaG
 gaGmLRYOn/MGmLizo+BVWdeRjJPrautRZC5SVJGTLu6bD2c8rJJ7jwWAHq3TNTLIozRLa3CDw
 aa5aBgyZOleL8IegIM1DnMhyE7EMZg32qqwsrTjDXJQZpTR0Hl3GAnGsRcgJ/YKlfDgj6KqhA
 HFVQfiGdIYThsMh4XLdZbuFYNPHLAVEHEGkNUU29ig0MvWeo1S9t6lOuUkZpHvQx6DuTA8oe1
 GrtNXpML8cvhJaocZ0yGH8ImIANNMYy1IjQDjV1QfhoE5wDpskAkTve4xOgViIzCiLE1MDZTQ
 6+2OO+TTsb9BAHcq5aQ98/WcMByyezoJcGv5GpcQ77hYiFlVchx6saJtsTdBdf5BdaShz5Fju
 /d0MUO7eh+HMBEIiW9H2lamP52brt2gy5c6n8KL1lGd6CxCQ1kj1ZtB37rkj/tDt4tLcQ1IMz
 dmsnVOgsPXaj/2c5GC+vKbHza1CKrQvfo4ekuC4nUv3V5M0gSLyBxu4YAmy913WBLdpV/pcxd
 MtLRcaa/eTgMdw4OHRgNgeA4GVeTA9dZ8jJOqJ+IVsQ6PJz1E8x5WJhno/iejVvI4PEsX8upy
 k4mFlKVJdi99/vGYHfbY3Zu/ZpHTP8hNdU5TJYM1Gqp2IIAJBKt7m7N4I3lrUDrfbzqi24lhr
 /9MXYheoKJlufeg7ejPMfokLeCTjjEnOTZmgbGpjNjHzVT/CbBt7VwAut8iiCxkRkYMdzLktx
 ziUdRnwPRkZwzHGgeGu3873Fl8auDZn0GhVLoJVamymXGWqz/k7wnZtkTvsYyMcOfpl3YDf7h
 MFJoOiiEOirb6qOM4K8ioCn0Hj4ckQZgFtDbQW77C/auV0d/XPY6Sy5si9v/t5ay5UdKZojzC
 4Y7j5i1lseYjkzg1PrGDvyErUgvY97lXDOu6RpP92TUJTIg+4z8OH1NEkBeTBra+msWKOb8V2
 w9IWgY4CjLGyAfDKhSleMtMMkXdOoUsHrC57nG1QLuRk9vzmFmj2tV81sIh55/K25WVrQyD5r
 0YhZIUCYLWmutyQMN2L+EEAWm24PMU3xuD8hBI5cKwFYbdUhSZZ4HL0rUywukE4dr8zWfCkDh
 uIUWIarHt1aMCP2k7
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/EmcE5nRjuHbxVDhJ9Q/zKL/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2021 00:36:45 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
>=20
> On Tue, Mar 23, 2021 at 9:57 PM Lukas Straub <lukasstraub2@web.de> wrote:
>=20
> > Add tests for yank with the chardev-change case.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >  MAINTAINERS            |   1 +
> >  tests/unit/meson.build |   3 +-
> >  tests/unit/test-yank.c | 201 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 204 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/unit/test-yank.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 77259c031d..accb683a55 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2821,6 +2821,7 @@ M: Lukas Straub <lukasstraub2@web.de>
> >  S: Odd fixes
> >  F: util/yank.c
> >  F: migration/yank_functions*
> > +F: tests/unit/test-yank.c
> >  F: include/qemu/yank.h
> >  F: qapi/yank.json
> >
> > diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> > index 4bfe4627ba..b3bc2109da 100644
> > --- a/tests/unit/meson.build
> > +++ b/tests/unit/meson.build
> > @@ -123,7 +123,8 @@ if have_system
> >      'test-util-sockets': ['socket-helpers.c'],
> >      'test-base64': [],
> >      'test-bufferiszero': [],
> > -    'test-vmstate': [migration, io]
> > +    'test-vmstate': [migration, io],
> > +    'test-yank': ['socket-helpers.c', qom, io, chardev]
> >    }
> >    if 'CONFIG_INOTIFY1' in config_host
> >      tests +=3D {'test-util-filemonitor': []}
> > diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
> > new file mode 100644
> > index 0000000000..5cb94c2fe4
> > --- /dev/null
> > +++ b/tests/unit/test-yank.c
> > @@ -0,0 +1,201 @@
> > +/*
> > + * Tests for QEMU yank feature
> > + *
> > + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include <glib/gstdio.h>
> > +
> > +#include "qemu/config-file.h"
> > +#include "qemu/module.h"
> > +#include "qemu/option.h"
> > +#include "chardev/char-fe.h"
> > +#include "sysemu/sysemu.h"
> > +#include "qapi/error.h"
> > +#include "qapi/qapi-commands-char.h"
> > +#include "qapi/qapi-types-char.h"
> > +#include "qapi/qapi-commands-yank.h"
> > +#include "qapi/qapi-types-yank.h"
> > +#include "io/channel-socket.h"
> > +#include "socket-helpers.h"
> > +
> > +typedef struct {
> > +    SocketAddress *addr;
> > +    bool old_yank;
> > +    bool new_yank;
> > +    bool fail;
> > +} CharChangeTestConfig;
> > +
> > +static int chardev_change(void *opaque)
> > +{
> > +    return 0;
> > +}
> > +
> > +static bool is_yank_instance_registered(void)
> > +{
> > +    YankInstanceList *list;
> > +    bool ret;
> > +
> > +    list =3D qmp_query_yank(&error_abort);
> > +
> > +    ret =3D !!list;
> > +
> > +    qapi_free_YankInstanceList(list);
> > +
> > +    return ret;
> > +}
> > +
> > +static void char_change_test(gconstpointer opaque)
> > +{
> > +    CharChangeTestConfig *conf =3D (gpointer) opaque;
> > +    SocketAddress *addr;
> > +    Chardev *chr;
> > +    CharBackend be;
> > +    ChardevReturn *ret;
> > +    QIOChannelSocket *ioc;
> > +
> > +    /*
> > +     * Setup a listener socket and determine its address
> > +     * so we know the TCP port for the client later
> > +     */
> > +    ioc =3D qio_channel_socket_new();
> > +    g_assert_nonnull(ioc);
> > +    qio_channel_socket_listen_sync(ioc, conf->addr, 1, &error_abort);
> > +    addr =3D qio_channel_socket_get_local_address(ioc, &error_abort);
> > +    g_assert_nonnull(addr);
> > +
> > +    ChardevBackend backend[2] =3D {
> > +        /* doesn't support yank */
> > +        { .type =3D CHARDEV_BACKEND_KIND_NULL },
> > +        /* supports yank */
> > +        {
> > +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> > +            .u.socket.data =3D &(ChardevSocket) {
> > +                .addr =3D &(SocketAddressLegacy) {
> > +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> > +                    .u.inet.data =3D &addr->u.inet
> > +                },
> > +                .has_server =3D true,
> > +                .server =3D false
> > +            }
> > +        } };
> > +
> > +    ChardevBackend fail_backend[2] =3D {
> > +        /* doesn't support yank */
> > +        {
> > +            .type =3D CHARDEV_BACKEND_KIND_UDP,
> > +            .u.udp.data =3D &(ChardevUdp) {
> > +                .remote =3D &(SocketAddressLegacy) {
> > +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_UNIX,
> > +                    .u.q_unix.data =3D &(UnixSocketAddress) {
> > +                        .path =3D (char *)""
> > +                    }
> > +                }
> > +            }
> > +        },
> > +        /* supports yank */
> > +        {
> > +            .type =3D CHARDEV_BACKEND_KIND_SOCKET,
> > +            .u.socket.data =3D &(ChardevSocket) {
> > +                .addr =3D &(SocketAddressLegacy) {
> > +                    .type =3D SOCKET_ADDRESS_LEGACY_KIND_INET,
> > +                    .u.inet.data =3D &(InetSocketAddress) {
> > +                        .host =3D (char *)"127.0.0.1",
> > +                        .port =3D (char *)"0"
> > +                    }
> > +                },
> > +                .has_server =3D true,
> > +                .server =3D false
> > +            }
> > +        } };
> > +
> > +    g_assert(!is_yank_instance_registered());
> > +
> > +    ret =3D qmp_chardev_add("chardev", &backend[conf->old_yank],
> > &error_abort);
> > +    qapi_free_ChardevReturn(ret);
> > +    chr =3D qemu_chr_find("chardev");
> > +    g_assert_nonnull(chr);
> > +
> > +    g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
> > +
> > +    qemu_chr_wait_connected(chr, &error_abort);
> > +    qemu_chr_fe_init(&be, chr, &error_abort);
> > +    /* allow chardev-change */
> > +    qemu_chr_fe_set_handlers(&be, NULL, NULL,
> > +                             NULL, chardev_change, NULL, NULL, true);
> > +
> > +    if (conf->fail) {
> > +        g_setenv("QTEST_SILENT_ERRORS", "1", 1);
> > +        ret =3D qmp_chardev_change("chardev", &fail_backend[conf->new_=
yank],
> > +                                 NULL);
> > +        g_assert_null(ret);
> > +        g_assert(be.chr =3D=3D chr);
> > +        g_assert(is_yank_instance_registered() =3D=3D conf->old_yank);
> > +        g_unsetenv("QTEST_SILENT_ERRORS");
> > +    } else {
> > +        ret =3D qmp_chardev_change("chardev", &backend[conf->new_yank],
> > +                                 &error_abort);
> > +        g_assert_nonnull(ret);
> > +        g_assert(be.chr !=3D chr);
> > +        g_assert(is_yank_instance_registered() =3D=3D conf->new_yank);
> > +    }
> > +
> > +    object_unparent(OBJECT(be.chr));
> > +    object_unref(OBJECT(ioc));
> > +    qapi_free_ChardevReturn(ret);
> > +}
> > +
> > +static SocketAddress tcpaddr =3D {
> > +    .type =3D SOCKET_ADDRESS_TYPE_INET,
> > +    .u.inet.host =3D (char *)"127.0.0.1",
> > +    .u.inet.port =3D (char *)"0",
> > +};
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    bool has_ipv4, has_ipv6;
> > +
> > +    qemu_init_main_loop(&error_abort);
> > +    socket_init();
> > +
> > +    g_test_init(&argc, &argv, NULL);
> > +
> > +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
> > +        g_printerr("socket_check_protocol_support() failed\n");
> > +        goto end;
> > +    }
> > +
> > +    if (!has_ipv4) {
> > +        goto end;
> > +    }
> > +
> > +    module_call_init(MODULE_INIT_QOM);
> > +    qemu_add_opts(&qemu_chardev_opts);
> > +
> > +#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)
> >      \
> > +    do {
> >      \
> > +        g_test_add_data_func("/yank/char_change/success/" # name,
> >       \
> > +                             &(CharChangeTestConfig) { .addr =3D &tcpa=
ddr,
> >      \
> > +                                                       .old_yank =3D
> > (_old_yank),\
> > +                                                       .new_yank =3D
> > (_new_yank),\
> > +                                                       .fail =3D false=
 },
> >       \
> > +                             char_change_test);
> >       \
> > +        g_test_add_data_func("/yank/char_change/fail/" # name,
> >      \
> > +                             &(CharChangeTestConfig) { .addr =3D &tcpa=
ddr,
> >      \
> > +                                                       .old_yank =3D
> > (_old_yank),\
> > +                                                       .new_yank =3D
> > (_new_yank),\
> > +                                                       .fail =3D true =
},
> >      \
> > +                             char_change_test);
> >       \
> > +    } while (0)
> > +
> >
>=20
> If you run the test under ASAN, you get an error. Config is
> stack-use-after-scope.

Dammit, the do { } while(0) was a last-minute addition because checkpatch.pl
complained about it. I'll fix it.

> Otherwise, the test looks good to me, but please introduce the test after
> the fix in the series, to avoid intermittent breaking when doing git
> rebase. Iow, we make our best to have no regressions introduced in a final
> series, even temporarily in tests.

Regards,
Lukas Straub

> thanks
>=20
>=20
>=20
> > +    CHAR_CHANGE_TEST(to_yank, false, true);
> > +    CHAR_CHANGE_TEST(yank_to_yank, true, true);
> > +    CHAR_CHANGE_TEST(from_yank, true, false);
> > +
> > +end:
> > +    return g_test_run();
> > +}
> > --
> > 2.30.2
> >
> >
>=20



--=20


--Sig_/EmcE5nRjuHbxVDhJ9Q/zKL/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdHKUACgkQNasLKJxd
slhZpw//VzspPrb+PUde69s+CzzUBz9Rr19vOLI5h1W4u+sGZwYEBvQ/0gqTkGRD
alz5Fry0miquPxQmMoAdHjibghuB2WgTnBGpT2ZgOhvWQvdE3o9YILZQZgo0tBs1
47aeFoc41jL4XGEBaRGx43j6ayjmIl6HUulzppo9QSHlaDer6YW3mQ5Dc5XJMRCf
u4fgapK0HU99cOvpa39YJVWyRg7xoZcsEnbVXTYnosm4p+Q81zorVlmXt47VNhmj
HWBhIYv9yt9EHRo2FQaSXqpFjXEHE/q+Ky44ceapfUTdtGxV22KKRUTxXgmMq1el
aHQP5n+1a0rU3nEzOEavSTqlRdoMJsJSPufic4QnOj+x4BTWxAtLb2LR8w+XfKtZ
OC0RFpolYxJeQveWYL7Dge6DdK2A/rsSJQjbUlAPLhb9C62Oh54ow73T1fSf6ewP
9FRdKSH5MqEtPtG9Bv5fxKgkrdDRXT1U2SHhvhboYVGYRnJYgahjv2e26SwuB8Y/
e+B99I3IJuTakRfIsILZCiZBFLIoqF7Pds4dLtibHStvTb0YiiPpZmyI6hp88ap8
wMvNd+BF4Ur1pO00gPb0HG6I6YPDtB8/fZvuhMtk9kcW5UktLmVc+OoYAbCYjVdS
KjIURYMP4izvJcH+PW5ykv7GMZ5cKUtzZK+42VC3mSUr6njcFp0=
=pj3t
-----END PGP SIGNATURE-----

--Sig_/EmcE5nRjuHbxVDhJ9Q/zKL/--

