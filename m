Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095102B17C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 11:43:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVC9r-0000wT-Oi
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 05:43:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hVC8n-0000Wb-D8
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hVC8l-0004y5-IU
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:42:01 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:45982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
	id 1hVC8l-0004tL-81
	for qemu-devel@nongnu.org; Mon, 27 May 2019 05:41:59 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8DCB12E0497;
	Mon, 27 May 2019 12:41:52 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	KVO7B5mn8z-fqp8oQXf; Mon, 27 May 2019 12:41:52 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1558950112; bh=ZrFtj4vAzq3R3o2xZzznhzxyn1nSlfjkZUx/7fR8uHg=;
	h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
	b=GayLsZhChFvVm0TQONaadKgrdqwBMrc9vm7J5Stg7A3eHo2ondCvLeTm9y7d46v9K
	Sj6n1E5Ac7tdLXh/DXgq2ChCU3luplO8UpyWvWPnAqGSQYPUUs7o3t54eHOi1u74jd
	ptaYCpZYO5hrmmFr5g+TBEod5B8KgKs9UqO2/un8=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
	[2a02:6b8:0:1619::119])
	by dlvcorp1p.mail.yandex.net with LMTP id GDukQTULGx-n42fEk8S
	for <yury-kotov@yandex-team.ru>; Mon, 27 May 2019 12:41:42 +0300
Received: by myt4-a988562a11ab.qloud-c.yandex.net with HTTP;
	Mon, 27 May 2019 12:41:42 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Juan Quintela <quintela@redhat.com>,
	Dr. David Alan Gilbert <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20190527093350.28567-3-yury-kotov@yandex-team.ru>
References: <20190527093350.28567-1-yury-kotov@yandex-team.ru>
	<20190527093350.28567-3-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 27 May 2019 12:41:52 +0300
Message-Id: <1774561558950102@myt4-a988562a11ab.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.45.199.163
Subject: Re: [Qemu-devel] [PATCH 2/2] migration-test: Add a test for fd
 protocol
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



27.05.2019, 12:35, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
> =C2=A0tests/libqtest.c | 83 ++++++++++++++++++++++++++++++--
> =C2=A0tests/libqtest.h | 51 +++++++++++++++++++-
> =C2=A0tests/migration-test.c | 107 ++++++++++++++++++++++++++++++++++++=
+++--
> =C2=A03 files changed, 233 insertions(+), 8 deletions(-)
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 8ac0c02af4..de8468d213 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -32,6 +32,7 @@
>
> =C2=A0#define MAX_IRQ 256
> =C2=A0#define SOCKET_TIMEOUT 50
> +#define SOCKET_MAX_FDS 16
>
> =C2=A0QTestState *global_qtest;
>
> @@ -391,6 +392,43 @@ static void GCC_FMT_ATTR(2, 3) qtest_sendf(QTestSt=
ate *s, const char *fmt, ...)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va_end(ap);
> =C2=A0}
>
> +static void socket_send_fds(int fd, int *fds, size_t fds_num,
> + const char *buf, size_t buf_size)
> +{
> +#ifndef WIN32
> + ssize_t ret;
> + struct msghdr msg =3D { 0 };
> + char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)] =3D { 0 };
> + size_t fdsize =3D sizeof(int) * fds_num;
> + struct cmsghdr *cmsg;
> + struct iovec iov =3D { .iov_base =3D (char *)buf, .iov_len =3D buf_si=
ze };
> +
> + msg.msg_iov =3D &iov;
> + msg.msg_iovlen =3D 1;
> +
> + if (fds && fds_num > 0) {
> + g_assert_cmpuint(fds_num, <, SOCKET_MAX_FDS);
> +
> + msg.msg_control =3D control;
> + msg.msg_controllen =3D CMSG_SPACE(fdsize);
> +
> + cmsg =3D CMSG_FIRSTHDR(&msg);
> + cmsg->cmsg_len =3D CMSG_LEN(fdsize);
> + cmsg->cmsg_level =3D SOL_SOCKET;
> + cmsg->cmsg_type =3D SCM_RIGHTS;
> + memcpy(CMSG_DATA(cmsg), fds, fdsize);
> + }
> +
> + do {
> + ret =3D sendmsg(fd, &msg, 0);
> + } while (ret < 0 && errno =3D=3D EINTR);
> + g_assert_cmpint(ret, >, 0);
> +#else
> + g_test_skip("sendmsg is not supported under Win32");
> + return;
> +#endif
> +}
> +
> =C2=A0static GString *qtest_recv_line(QTestState *s)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GString *line;
> @@ -545,7 +583,8 @@ QDict *qtest_qmp_receive(QTestState *s)
> =C2=A0=C2=A0* in the case that they choose to discard all replies up un=
til
> =C2=A0=C2=A0* a particular EVENT is received.
> =C2=A0=C2=A0*/
> -void qmp_fd_vsend(int fd, const char *fmt, va_list ap)
> +void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
> + const char *fmt, va_list ap)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0QObject *qobj;
>
> @@ -569,25 +608,49 @@ void qmp_fd_vsend(int fd, const char *fmt, va_lis=
t ap)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0fprintf(stderr, "%s", str);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Send QMP reque=
st */
> - socket_send(fd, str, qstring_get_length(qstr));
> + if (fds && fds_num > 0) {
> + socket_send_fds(fd, fds, fds_num, str, qstring_get_length(qstr));
> + } else {
> + socket_send(fd, str, qstring_get_length(qstr));
> + }
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qobject_unref(qst=
r);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qobject_unref(qob=
j);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
>
> +void qmp_fd_vsend(int fd, const char *fmt, va_list ap)
> +{
> + qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
> +}
> +
> +void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, va_list ap)
> +{
> + qmp_fd_vsend_fds(s->qmp_fd, fds, fds_num, fmt, ap);
> +}
> +
> =C2=A0void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
> =C2=A0{
> - qmp_fd_vsend(s->qmp_fd, fmt, ap);
> + qmp_fd_vsend_fds(s->qmp_fd, NULL, 0, fmt, ap);
> =C2=A0}
>
> =C2=A0QDict *qmp_fdv(int fd, const char *fmt, va_list ap)
> =C2=A0{
> - qmp_fd_vsend(fd, fmt, ap);
> + qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return qmp_fd_receive(fd);
> =C2=A0}
>
> +QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, va_list ap)
> +{
> + qtest_qmp_vsend_fds(s, fds, fds_num, fmt, ap);
> +
> + /* Receive reply */
> + return qtest_qmp_receive(s);
> +}
> +
> =C2=A0QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_qmp_vsend(s, fmt, ap);
> @@ -616,6 +679,18 @@ void qmp_fd_send(int fd, const char *fmt, ...)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va_end(ap);
> =C2=A0}
>
> +QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, ...)
> +{
> + va_list ap;
> + QDict *response;
> +
> + va_start(ap, fmt);
> + response =3D qtest_vqmp_fds(s, fds, fds_num, fmt, ap);
> + va_end(ap);
> + return response;
> +}
> +
> =C2=A0QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va_list ap;
> diff --git a/tests/libqtest.h b/tests/libqtest.h
> index a98ea15b7d..e61ebaced1 100644
> --- a/tests/libqtest.h
> +++ b/tests/libqtest.h
> @@ -84,6 +84,21 @@ QTestState *qtest_init_with_serial(const char *extra=
_args, int *sock_fd);
> =C2=A0=C2=A0*/
> =C2=A0void qtest_quit(QTestState *s);
>
> +/**
> + * qtest_qmp_fds:
> + * @s: #QTestState instance to operate on.
> + * @fds: array of file descriptors
> + * @fds_num: number of elements in @fds
> + * @fmt...: QMP message to send to qemu, formatted like
> + * qobject_from_jsonf_nofail(). See parse_escape() for what's
> + * supported after '%'.
> + *
> + * Sends a QMP message to QEMU with fds and returns the response.
> + */
> +QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, ...)
> + GCC_FMT_ATTR(4, 5);
> +
> =C2=A0/**
> =C2=A0=C2=A0* qtest_qmp:
> =C2=A0=C2=A0* @s: #QTestState instance to operate on.
> @@ -120,7 +135,23 @@ void qtest_qmp_send_raw(QTestState *s, const char =
*fmt, ...)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GCC_FMT_ATTR(2, 3);
>
> =C2=A0/**
> - * qtest_qmpv:
> + * qtest_vqmp_fds:
> + * @s: #QTestState instance to operate on.
> + * @fds: array of file descriptors
> + * @fds_num: number of elements in @fds
> + * @fmt: QMP message to send to QEMU, formatted like
> + * qobject_from_jsonf_nofail(). See parse_escape() for what's
> + * supported after '%'.
> + * @ap: QMP message arguments
> + *
> + * Sends a QMP message to QEMU with fds and returns the response.
> + */
> +QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, va_list ap)
> + GCC_FMT_ATTR(4, 0);
> +
> +/**
> + * qtest_vqmp:
> =C2=A0=C2=A0* @s: #QTestState instance to operate on.
> =C2=A0=C2=A0* @fmt: QMP message to send to QEMU, formatted like
> =C2=A0=C2=A0* qobject_from_jsonf_nofail(). See parse_escape() for what'=
s
> @@ -132,6 +163,22 @@ void qtest_qmp_send_raw(QTestState *s, const char =
*fmt, ...)
> =C2=A0QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GCC_FMT_ATTR(2, 0);
>
> +/**
> + * qtest_qmp_vsend_fds:
> + * @s: #QTestState instance to operate on.
> + * @fds: array of file descriptors
> + * @fds_num: number of elements in @fds
> + * @fmt: QMP message to send to QEMU, formatted like
> + * qobject_from_jsonf_nofail(). See parse_escape() for what's
> + * supported after '%'.
> + * @ap: QMP message arguments
> + *
> + * Sends a QMP message to QEMU and leaves the response in the stream.
> + */
> +void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
> + const char *fmt, va_list ap)
> + GCC_FMT_ATTR(4, 0);
> +
> =C2=A0/**
> =C2=A0=C2=A0* qtest_qmp_vsend:
> =C2=A0=C2=A0* @s: #QTestState instance to operate on.
> @@ -877,6 +924,8 @@ static inline int64_t clock_step(int64_t step)
> =C2=A0}
>
> =C2=A0QDict *qmp_fd_receive(int fd);
> +void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
> + const char *fmt, va_list ap) GCC_FMT_ATTR(4, 0);
> =C2=A0void qmp_fd_vsend(int fd, const char *fmt, va_list ap) GCC_FMT_AT=
TR(2, 0);
> =C2=A0void qmp_fd_send(int fd, const char *fmt, ...) GCC_FMT_ATTR(2, 3)=
;
> =C2=A0void qmp_fd_send_raw(int fd, const char *fmt, ...) GCC_FMT_ATTR(2=
, 3);
> diff --git a/tests/migration-test.c b/tests/migration-test.c
> index bd3f5c3125..b0136eb54f 100644
> --- a/tests/migration-test.c
> +++ b/tests/migration-test.c
> @@ -174,6 +174,21 @@ static void stop_cb(void *opaque, const char *name=
, QDict *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
>
> +/*
> + * Events can get in the way of responses we are actually waiting for.
> + */
> +GCC_FMT_ATTR(3, 4)
> +static QDict *wait_command_fd(QTestState *who, int fd, const char *com=
mand, ...)
> +{
> + va_list ap;
> +
> + va_start(ap, command);
> + qtest_qmp_vsend_fds(who, &fd, 1, command, ap);
> + va_end(ap);
> +
> + return qtest_qmp_receive_success(who, stop_cb, NULL);
> +}
> +
> =C2=A0/*
> =C2=A0=C2=A0* Events can get in the way of responses we are actually wa=
iting for.
> =C2=A0=C2=A0*/
> @@ -474,12 +489,12 @@ static void migrate(QTestState *who, const char *=
uri, const char *fmt, ...)
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va_start(ap, fmt);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0args =3D qdict_from_vjsonf_nofail(fmt, ap=
);
> - va_end(ap);
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_assert(!qdict_haskey(args, "uri"));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdict_put_str(args, "uri", uri);
> + va_end(ap);
> +
> + rsp =3D qtest_qmp(who, "{ 'execute': 'migrate', 'arguments': %p}", ar=
gs);
>
> - rsp =3D qmp("{ 'execute': 'migrate', 'arguments': %p}", args);

These changes in migrate are not needed. I forgot to revert them before s=
ending
the series... I'll revert them in v2.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_assert(qdict_haskey(rsp, "return"));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qobject_unref(rsp);
> =C2=A0}
> @@ -1027,6 +1042,91 @@ static void test_precopy_tcp(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0g_free(uri);
> =C2=A0}
>
> +static void test_migrate_fd_proto(void)
> +{
> + QTestState *from, *to;
> + int ret;
> + int pair[2];
> + QDict *rsp;
> + const char *error_desc;
> +
> + if (test_migrate_start(&from, &to, "defer", false, false)) {
> + return;
> + }
> +
> + /*
> + * We want to pick a speed slow enough that the test completes
> + * quickly, but that it doesn't complete precopy even on a slow
> + * machine, so also set the downtime.
> + */
> + /* 1 ms should make it not converge */
> + migrate_set_parameter(from, "downtime-limit", 1);
> + /* 1GB/s */
> + migrate_set_parameter(from, "max-bandwidth", 1000000000);
> +
> + /* Wait for the first serial output from the source */
> + wait_for_serial("src_serial");
> +
> + /* Create two connected sockets for migration */
> + ret =3D socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
> + g_assert_cmpint(ret, =3D=3D, 0);
> +
> + /* Send the 1st socket to the target */
> + rsp =3D wait_command_fd(to, pair[0],
> + "{ 'execute': 'getfd',"
> + " 'arguments': { 'fdname': 'fd-mig' }}");
> + qobject_unref(rsp);
> + close(pair[0]);
> +
> + /* Start incoming migration from the 1st socket */
> + rsp =3D wait_command(to, "{ 'execute': 'migrate-incoming',"
> + " 'arguments': { 'uri': 'fd:fd-mig' }}");
> + qobject_unref(rsp);
> +
> + /* Send the 2nd socket to the target */
> + rsp =3D wait_command_fd(from, pair[1],
> + "{ 'execute': 'getfd',"
> + " 'arguments': { 'fdname': 'fd-mig' }}");
> + qobject_unref(rsp);
> + close(pair[1]);
> +
> + /* Start migration to the 2nd socket*/
> + migrate(from, "fd:fd-mig", "{}");
> +
> + wait_for_migration_pass(from);
> +
> + /* 300ms should converge */
> + migrate_set_parameter(from, "downtime-limit", 300);
> +
> + if (!got_stop) {
> + qtest_qmp_eventwait(from, "STOP");
> + }
> + qtest_qmp_eventwait(to, "RESUME");
> +
> + /* Test closing fds */
> + /* We assume, that QEMU removes named fd from its list,
> + * so this should fail */
> + rsp =3D qtest_qmp(from, "{ 'execute': 'closefd',"
> + " 'arguments': { 'fdname': 'fd-mig' }}");
> + g_assert_true(qdict_haskey(rsp, "error"));
> + error_desc =3D qdict_get_str(qdict_get_qdict(rsp, "error"), "desc");
> + g_assert_cmpstr(error_desc, =3D=3D, "File descriptor named 'fd-mig' n=
ot found");
> + qobject_unref(rsp);
> +
> + rsp =3D qtest_qmp(to, "{ 'execute': 'closefd',"
> + " 'arguments': { 'fdname': 'fd-mig' }}");
> + g_assert_true(qdict_haskey(rsp, "error"));
> + error_desc =3D qdict_get_str(qdict_get_qdict(rsp, "error"), "desc");
> + g_assert_cmpstr(error_desc, =3D=3D, "File descriptor named 'fd-mig' n=
ot found");
> + qobject_unref(rsp);
> +
> +
> + /* Complete migration */
> + wait_for_serial("dest_serial");
> + wait_for_migration_complete(from);
> + test_migrate_end(from, to, true);
> +}
> +
> =C2=A0int main(int argc, char **argv)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char template[] =3D "/tmp/migration-test-=
XXXXXX";
> @@ -1081,6 +1181,7 @@ int main(int argc, char **argv)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/migration/precopy/tcp", =
test_precopy_tcp);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* qtest_add_func("/migration/ignore_shar=
ed", test_ignore_shared); */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qtest_add_func("/migration/xbzrle/unix", =
test_xbzrle_unix);
> + qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D g_test_run();
>
> --
> 2.21.0

Regards,
Yury

