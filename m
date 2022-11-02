Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E7616DFD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 20:49:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqJiV-0004fe-9z; Wed, 02 Nov 2022 15:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqJiS-0004fB-NK
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 15:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqJiQ-0004R8-DN
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 15:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667418477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qYSrevbGcMvj2U0d4sShHjNYJuem2j2pMCA0ETIMaQ=;
 b=TJCsBUrHgvkSv0zL2//9LyqeCuIqhkUz5Tiv+07yADPAJtnQHX8gX3cQ4zmJAOKAQ37z53
 bOy6biVxNMkCmROFJuWNHiP092U2Xb2CrwX/RRJ4EZwFRJqnxcVCWEpLqceiXyFBjh4hh8
 1P2+a2Glp5MlMz4q9VjRLsqcCvSDIz0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-LpJcW3VGNtqMqEcbYvyrdg-1; Wed, 02 Nov 2022 15:47:53 -0400
X-MC-Unique: LpJcW3VGNtqMqEcbYvyrdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 412C53C0DDC7;
 Wed,  2 Nov 2022 19:47:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F28CC2C8D6;
 Wed,  2 Nov 2022 19:47:45 +0000 (UTC)
Date: Wed, 2 Nov 2022 15:47:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y2LJX2HHiHpiKzKd@fedora>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="96vmdBOg3I3CxL6Y"
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--96vmdBOg3I3CxL6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2022 at 12:02:14PM -0400, Michael S. Tsirkin wrote:
> Changes from v1:
>=20
> Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
> bugs that tripped up the pipeline.
> Updated expected files for core-count test.

Several "make check" CI failures have occurred. They look like they are
related. Here is one (see the URLs at the bottom of this email for more
details):

17/106 ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child p=
rocess (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virti=
o-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedl=
y ERROR
 17/106 qemu:qtest+qtest-arm / qtest-arm/qos-test                     ERROR=
          31.44s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemo=
n.sh MALLOC_PERTURB_=3D49 QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_BINARY=3D.=
/qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-s=
torage-daemon /builds/qemu-project/qemu/build/tests/qtest/qos-test --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=3Dchr-reconnect,path=3D/tmp/vhost-test-=
6PT2U1/reconnect.sock,server=3Don: info: QEMU waiting for connection on: di=
sconnected:unix:/tmp/vhost-test-6PT2U1/reconnect.sock,server=3Don
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=3Dchr-connect-fail,path=3D/tmp/vhost-te=
st-H8G7U1/connect-fail.sock,server=3Don: info: QEMU waiting for connection =
on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=3Don
qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vho=
stforce=3Don: Failed to read msg header. Read 0 instead of 12. Original req=
uest 1.
qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vho=
stforce=3Don: vhost_backend_init failed: Protocol error
qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vho=
stforce=3Don: failed to init vhost_net for queue 0
qemu-system-arm: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vho=
stforce=3Don: info: QEMU waiting for connection on: disconnected:unix:/tmp/=
vhost-test-H8G7U1/connect-fail.sock,server=3Don
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=3Dchr-flags-mismatch,path=3D/tmp/vhost-=
test-94UYU1/flags-mismatch.sock,server=3Don: info: QEMU waiting for connect=
ion on: disconnected:unix:/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=
=3Don
qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
UndefinedBehaviorSanitizer:DEADLYSIGNAL
=3D=3D8618=3D=3DERROR: UndefinedBehaviorSanitizer: SEGV on unknown address =
0x000000000000 (pc 0x55e34deccab0 bp 0x000000000000 sp 0x7ffc94894710 T8618)
=3D=3D8618=3D=3DThe signal is caused by a READ memory access.
=3D=3D8618=3D=3DHint: address points to the zero page.
    #0 0x55e34deccab0 in ldl_he_p /builds/qemu-project/qemu/include/qemu/bs=
wap.h:301:5
    #1 0x55e34deccab0 in ldn_he_p /builds/qemu-project/qemu/include/qemu/bs=
wap.h:440:1
    #2 0x55e34deccab0 in flatview_write_continue /builds/qemu-project/qemu/=
build/../softmmu/physmem.c:2824:19
    #3 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../=
softmmu/physmem.c:2867:12
    #4 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/buil=
d/../softmmu/physmem.c:2963:18
    #5 0x55e34decace7 in address_space_unmap /builds/qemu-project/qemu/buil=
d/../softmmu/physmem.c:3306:9
    #6 0x55e34de6d4ec in vhost_memory_unmap /builds/qemu-project/qemu/build=
/../hw/virtio/vhost.c:342:9
    #7 0x55e34de6d4ec in vhost_virtqueue_stop /builds/qemu-project/qemu/bui=
ld/../hw/virtio/vhost.c:1242:5
    #8 0x55e34de72904 in vhost_dev_stop /builds/qemu-project/qemu/build/../=
hw/virtio/vhost.c:1882:9
    #9 0x55e34d890514 in vhost_net_stop_one /builds/qemu-project/qemu/build=
/../hw/net/vhost_net.c:331:5
    #10 0x55e34d88fef6 in vhost_net_start /builds/qemu-project/qemu/build/.=
=2E/hw/net/vhost_net.c:404:13
    #11 0x55e34de0bec6 in virtio_net_vhost_status /builds/qemu-project/qemu=
/build/../hw/net/virtio-net.c:307:13
    #12 0x55e34de0bec6 in virtio_net_set_status /builds/qemu-project/qemu/b=
uild/../hw/net/virtio-net.c:388:5
    #13 0x55e34de5e409 in virtio_set_status /builds/qemu-project/qemu/build=
/../hw/virtio/virtio.c:2442:9
    #14 0x55e34da22a50 in virtio_mmio_write /builds/qemu-project/qemu/build=
/../hw/virtio/virtio-mmio.c:428:9
    #15 0x55e34deb44a6 in memory_region_write_accessor /builds/qemu-project=
/qemu/build/../softmmu/memory.c:493:5
    #16 0x55e34deb428a in access_with_adjusted_size /builds/qemu-project/qe=
mu/build/../softmmu/memory.c:555:18
    #17 0x55e34deb402d in memory_region_dispatch_write /builds/qemu-project=
/qemu/build/../softmmu/memory.c
    #18 0x55e34deccaf1 in flatview_write_continue /builds/qemu-project/qemu=
/build/../softmmu/physmem.c:2825:23
    #19 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/..=
/softmmu/physmem.c:2867:12
    #20 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/bui=
ld/../softmmu/physmem.c:2963:18
    #21 0x55e34ded0bf6 in qtest_process_command /builds/qemu-project/qemu/b=
uild/../softmmu/qtest.c
    #22 0x55e34ded008d in qtest_process_inbuf /builds/qemu-project/qemu/bui=
ld/../softmmu/qtest.c:796:9
    #23 0x55e34e109b02 in tcp_chr_read /builds/qemu-project/qemu/build/../c=
hardev/char-socket.c:508:13
    #24 0x7fc6c665d0ae in g_main_context_dispatch (/lib64/libglib-2.0.so.0+=
0x550ae)
    #25 0x55e34e1fc1bc in glib_pollfds_poll /builds/qemu-project/qemu/build=
/../util/main-loop.c:297:9
    #26 0x55e34e1fc1bc in os_host_main_loop_wait /builds/qemu-project/qemu/=
build/../util/main-loop.c:320:5
    #27 0x55e34e1fc1bc in main_loop_wait /builds/qemu-project/qemu/build/..=
/util/main-loop.c:596:11
    #28 0x55e34da52de6 in qemu_main_loop /builds/qemu-project/qemu/build/..=
/softmmu/runstate.c:739:9
    #29 0x55e34d60a4f5 in qemu_default_main /builds/qemu-project/qemu/build=
/../softmmu/main.c:37:14
    #30 0x7fc6c43a5eaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
    #31 0x7fc6c43a5f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0=
x3ff5f)
    #32 0x55e34d5e1094 in _start (/builds/qemu-project/qemu/build/qemu-syst=
em-arm+0xc17094)
UndefinedBehaviorSanitizer can not provide additional info.
SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/qemu-project/qemu/include=
/qemu/bswap.h:301:5 in ldl_he_p
=3D=3D8618=3D=3DABORTING
Broken pipe
=2E./tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU proces=
s but encountered exit status 1 (expected 0)
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process =
(/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-t=
ests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly
(test program exited with status code -6)

https://gitlab.com/qemu-project/qemu/-/jobs/3265209698
https://gitlab.com/qemu-project/qemu/-/pipelines/683909108

Stefan

--96vmdBOg3I3CxL6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNiyV8ACgkQnKSrs4Gr
c8joiAgAtge/QBMeB6k46Io89S/C/1OjLocfNPFx7F/lJlFCWmtXF34B1+DLTw7g
WSzt+Ti4+Jo5qM1rrcjaRsY9hlIb0+E/a970gJF9NJhQP4xmZO87iq5ffrb2TJ3T
XzMDcN9iC9HcQUhNLFk+6z7eo7QpoGeTOTwmxitCa4z52KonCp3/i0TvM/+9IABS
FzPyopBC1qkEvdmM3/wIePv7nO7xeiN8D7ji9eeJXpnM4pcMbDlsxAKHt/Byrw9e
A037hN2UNH2m/tKtmmy2Wid5hRm4c477K8duX1NfLwR0PJ5vfBjseHsAym9YOVT/
VAUeRWaFdOJxr7Ed7smo8G0OyFm4rg==
=OdfJ
-----END PGP SIGNATURE-----

--96vmdBOg3I3CxL6Y--


