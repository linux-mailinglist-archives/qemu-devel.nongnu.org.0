Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CF41AB48
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 10:58:08 +0200 (CEST)
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV8wA-0003kE-TK
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 04:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mV8uA-00030q-03
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 04:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mV8u7-0006qN-0R
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 04:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632819356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SMPqxzIKyWCBdGwsDt3s+iu8AVfJZBaUdGqQN2Levis=;
 b=KEVDT7RluX/q86AY4g2apOm4RE7av0v6yKdPSXE9D0B5Wi5ReBniip+/TdPN4EQ9bDuuts
 W7EQUhnL9IB6H3x4ToTwiEtDy7JnqBXxpWjPmaFElaTZ3o+6mqp+RYuo0SOMW3xhBuLbB/
 o3ET0pLp5sbjN+ZhE/JCOz0tsptmnEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-fxBB3GSvNCWwBA9-gItmFw-1; Tue, 28 Sep 2021 04:55:54 -0400
X-MC-Unique: fxBB3GSvNCWwBA9-gItmFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F94802C8A;
 Tue, 28 Sep 2021 08:55:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 508C860871;
 Tue, 28 Sep 2021 08:55:02 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:55:00 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="17/2dsJJolZnBXyQ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--17/2dsJJolZnBXyQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> In the vhost-user-blk-test, as of now there is nothing stoping
> vhost-user-blk in QEMU writing to the socket right after forking off the
> storage daemon before it has a chance to come up properly, leaving the
> test hanging forever. This intermittently hanging test has caused QEMU
> automation failures reported multiple times on the mailing list [1].
>=20
> This change makes the storage-daemon notify the vhost-user-blk-test
> that it is fully initialized and ready to handle client connections by
> creating a pidfile on initialiation. This ensures that the storage-daemon
> backend won't miss vhost-user messages and thereby resolves the hang.
>=20
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=3Dnv532=
bEdyfynaBeMeohqBp3A@mail.gmail.com/

Hi Raphael,
I would like to understand the issue that is being worked around in the
patch.

QEMU should be okay with listen fd passing. The qemu-storage-daemon
documentation even contains example code for this
(docs/tools/qemu-storage-daemon.rst) and that may need to be updated if
listen fd passing is fundamentally broken.

Can you share more details about the problem?

Does "writing to the socket" mean writing vhost-user protocol messages
or does it mean connect(2)?

Could the problem be that vhost-user-blk-test.c creates the listen fds
and does not close them? This means the host network stack doesn't
consider the socket closed after QEMU terminates and therefore the test
process hangs after QEMU is gone? In that case vhost-user-blk-test needs
to close the fds after spawning qemu-storage-daemon.

Stefan

>=20
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/qtest/vhost-user-blk-test.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-b=
lk-test.c
> index 6f108a1b62..5fed262da1 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -24,6 +24,7 @@
>  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
>  #define PCI_SLOT_HP             0x06
> +#define PIDFILE_RETRIES         5
> =20
>  typedef struct {
>      pid_t pid;
> @@ -885,7 +886,8 @@ static void start_vhost_user_blk(GString *cmd_line, i=
nt vus_instances,
>                                   int num_queues)
>  {
>      const char *vhost_user_blk_bin =3D qtest_qemu_storage_daemon_binary(=
);
> -    int i;
> +    int i, retries;
> +    char *daemon_pidfile_path;
>      gchar *img_path;
>      GString *storage_daemon_command =3D g_string_new(NULL);
>      QemuStorageDaemonState *qsd;
> @@ -898,6 +900,8 @@ static void start_vhost_user_blk(GString *cmd_line, i=
nt vus_instances,
>              " -object memory-backend-memfd,id=3Dmem,size=3D256M,share=3D=
on "
>              " -M memory-backend=3Dmem -m 256M ");
> =20
> +    daemon_pidfile_path =3D g_strdup_printf("/tmp/daemon-%d", getpid());
> +
>      for (i =3D 0; i < vus_instances; i++) {
>          int fd;
>          char *sock_path =3D create_listen_socket(&fd);
> @@ -914,6 +918,9 @@ static void start_vhost_user_blk(GString *cmd_line, i=
nt vus_instances,
>                                 i + 1, sock_path);
>      }
> =20
> +    g_string_append_printf(storage_daemon_command, "--pidfile %s ",
> +                           daemon_pidfile_path);
> +
>      g_test_message("starting vhost-user backend: %s",
>                     storage_daemon_command->str);
>      pid_t pid =3D fork();
> @@ -930,7 +937,24 @@ static void start_vhost_user_blk(GString *cmd_line, =
int vus_instances,
>          execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL)=
;
>          exit(1);
>      }
> +
> +    /*
> +     * Ensure the storage-daemon has come up properly before allowing th=
e
> +     * test to proceed.
> +     */
> +    retries =3D 0;
> +    while (access(daemon_pidfile_path, F_OK) !=3D 0) {
> +        g_assert_cmpint(retries, <, PIDFILE_RETRIES);
> +
> +        retries++;
> +        g_usleep(1000);
> +    }
> +
>      g_string_free(storage_daemon_command, true);
> +    if (access(daemon_pidfile_path, F_OK) =3D=3D 0) {
> +        unlink(daemon_pidfile_path);
> +    }
> +    g_free(daemon_pidfile_path);
> =20
>      qsd =3D g_new(QemuStorageDaemonState, 1);
>      qsd->pid =3D pid;
> --=20
> 2.20.1
>=20

--17/2dsJJolZnBXyQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFS2GQACgkQnKSrs4Gr
c8gzZAf9E5fjdXTnMitV/bzehStD5ZMLwiwTocjhMqX+S0iNE8h+Qan8l35fT5ug
30FfIOLffBGTfwvhNLKdiJZ1dUbUBuit2o0dU4knUKHm2fjl9hnM0phaiOfhxVoO
zUpf8PcYxn1wf9yQXEOiYngDvYGENRzIr9a8wpc6+Ip7iAd9j9aOfQLCQ3UdK1xt
AACL7tfb2YdAEVoUyP8pm3T+MPCu4novBpbvubww1hi2PCigvUHEVxgSZfOu6HAG
/8Kf0iaqBml64RGMc++ExQxt9VRpFjKUjZVzunv0+DERC9hQfNdTR2OWBTt1Wi1h
DTFsRz2tjiqQXULr6jCBJgkxAFxtLQ==
=c9oL
-----END PGP SIGNATURE-----

--17/2dsJJolZnBXyQ--


