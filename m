Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A93739BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:57:26 +0200 (CEST)
Received: from localhost ([::1]:45018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leG9d-00054e-Ey
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8E-0003Oq-1N
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:57766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8B-0002F2-KS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leG8A-0005E4-Gt
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:55:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7DCC92E8189
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:55:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:45:58 -0000
From: Thomas Huth <1831486@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marcandre-lureau th-huth
X-Launchpad-Bug-Reporter: elmarco (marcandre-lureau)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155958613349.25037.18347376667379404456.malonedeb@gac.canonical.com>
Message-Id: <162021515849.454.1312869440145558976.malone@chaenomeles.canonical.com>
Subject: [Bug 1831486] Re: qmp monitor deadlock (with spice events for ex)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 6fc0e0260ef81d08b1c16b4722927298e7bcd0e9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1831486 <1831486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/175


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #175
   https://gitlab.com/qemu-project/qemu/-/issues/175

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831486

Title:
  qmp monitor deadlock (with spice events for ex)

Status in QEMU:
  Expired

Bug description:
  If an event is emitted during monitor_flush_locked() it will deadlock.

  Thread 1 (Thread 0x7f14f1854000 (LWP 7245)):
  #0  0x00007f14fc30592d in __lll_lock_wait () at /lib64/libpthread.so.0
  #1  0x00007f14fc2fedc9 in pthread_mutex_lock () at /lib64/libpthread.so.0
  #2  0x000055de60e19327 in qemu_mutex_lock_impl (mutex=3D0x55de61859e58, f=
ile=3D0x55de60f1a640 "/home/elmarco/src/qq/monitor.c", line=3D438) at /home=
/elmarco/src/qq/util/qemu-thread-posix.c:66
  #3  0x000055de6085c5af in monitor_puts (mon=3D0x55de61859d30, str=3D0x55d=
e62a61d30 "{\"timestamp\": {\"seconds\": 1559585795, \"microseconds\": 5087=
20}, \"event\": \"SPICE_DISCONNECTED\", \"data\": {\"server\": {\"port\": \=
"/tmp/.9IW52Z/spice.sock\", \"family\": \"unix\", \"host\": \"localhost\"},=
 \"client\": {"...) at /home/elmarco/src/qq/monitor.c:438
  #4  0x000055de6085c85a in qmp_send_response (mon=3D0x55de61859d30, rsp=3D=
0x55de61ed19a0) at /home/elmarco/src/qq/monitor.c:493
  #5  0x000055de6085c8ee in monitor_qapi_event_emit (event=3DQAPI_EVENT_SPI=
CE_DISCONNECTED, qdict=3D0x55de61ed19a0) at /home/elmarco/src/qq/monitor.c:=
521
  #6  0x000055de6085c9ea in monitor_qapi_event_queue_no_reenter (event=3DQA=
PI_EVENT_SPICE_DISCONNECTED, qdict=3D0x55de61ed19a0) at /home/elmarco/src/q=
q/monitor.c:546
  #7  0x000055de6085cd7a in qapi_event_emit (event=3DQAPI_EVENT_SPICE_DISCO=
NNECTED, qdict=3D0x55de61ed19a0) at /home/elmarco/src/qq/monitor.c:621
  #8  0x000055de60e04bc3 in qapi_event_send_spice_disconnected (server=3D0x=
55de61ee7b30, client=3D0x55de620c9090) at qapi/qapi-events-ui.c:101
  #9  0x000055de60c84381 in channel_event (event=3D3, info=3D0x55de6222f4c0=
) at /home/elmarco/src/qq/ui/spice-core.c:234
  #10 0x00007f14fc70ba3b in reds_handle_channel_event (reds=3D<optimized ou=
t>, event=3D3, info=3D0x55de6222f4c0) at reds.c:318
  #11 0x00007f14fc6f407b in main_dispatcher_self_handle_channel_event (info=
=3D0x55de6222f4c0, event=3D3, self=3D0x55de61a5b0b0) at main-dispatcher.c:1=
91
  #12 0x00007f14fc6f407b in main_dispatcher_channel_event (self=3D0x55de61a=
5b0b0, event=3Devent@entry=3D3, info=3D0x55de6222f4c0) at main-dispatcher.c=
:191
  #13 0x00007f14fc713cf3 in red_stream_push_channel_event (s=3Ds@entry=3D0x=
55de6222f400, event=3Devent@entry=3D3) at red-stream.c:416
  #14 0x00007f14fc713d2b in red_stream_free (s=3D0x55de6222f400) at red-str=
eam.c:390
  #15 0x00007f14fc6fa67c in red_channel_client_finalize (object=3D0x55de625=
11360) at red-channel-client.c:347
  #16 0x00007f14fe4cfcf0 in g_object_unref () at /lib64/libgobject-2.0.so.0
  #17 0x00007f14fc6fca12 in red_channel_client_push (rcc=3D0x55de62511360) =
at red-channel-client.c:1340
  #18 0x00007f14fc6fca12 in red_channel_client_push (rcc=3D0x55de62511360) =
at red-channel-client.c:1303
  #19 0x00007f14fc6cd479 in red_char_device_send_msg_to_client (client=3D<o=
ptimized out>, msg=3D0x55de62512c00, dev=3D0x55de61a5b3b0) at char-device.c=
:307
  #20 0x00007f14fc6cd479 in red_char_device_send_msg_to_clients (msg=3D0x55=
de62512c00, dev=3D0x55de61a5b3b0) at char-device.c:307
  #21 0x00007f14fc6cd479 in red_char_device_read_from_device (dev=3D0x55de6=
1a5b3b0) at char-device.c:355
  #22 0x000055de60a27dba in spice_chr_write (chr=3D0x55de61924c00, buf=3D0x=
55de6236c070 "{\"return\": {}, \"id\": 2}\r\n", len=3D25) at /home/elmarco/=
src/qq/chardev/spice.c:201
  #23 0x000055de60d89e29 in qemu_chr_write_buffer (s=3D0x55de61924c00, buf=
=3D0x55de6236c070 "{\"return\": {}, \"id\": 2}\r\n", len=3D25, offset=3D0x7=
ffcd5e1a860, write_all=3Dfalse) at /home/elmarco/src/qq/chardev/char.c:113
  #24 0x000055de60d89f96 in qemu_chr_write (s=3D0x55de61924c00, buf=3D0x55d=
e6236c070 "{\"return\": {}, \"id\": 2}\r\n", len=3D25, write_all=3Dfalse) a=
t /home/elmarco/src/qq/chardev/char.c:148
  #25 0x000055de60d8cf78 in qemu_chr_fe_write (be=3D0x55de61859d30, buf=3D0=
x55de6236c070 "{\"return\": {}, \"id\": 2}\r\n", len=3D25) at /home/elmarco=
/src/qq/chardev/char-fe.c:42
  #26 0x000055de6085c40f in monitor_flush_locked (mon=3D0x55de61859d30) at =
/home/elmarco/src/qq/monitor.c:404
  #27 0x000055de6085c614 in monitor_puts (mon=3D0x55de61859d30, str=3D0x55d=
e622f6a40 "{\"return\": {}, \"id\": 2}\n") at /home/elmarco/src/qq/monitor.=
c:446
  #28 0x000055de6085c85a in qmp_send_response (mon=3D0x55de61859d30, rsp=3D=
0x55de61ecf960) at /home/elmarco/src/qq/monitor.c:493
  #29 0x000055de60865902 in monitor_qmp_respond (mon=3D0x55de61859d30, rsp=
=3D0x55de61ecf960) at /home/elmarco/src/qq/monitor.c:4128
  #30 0x000055de60865a19 in monitor_qmp_dispatch (mon=3D0x55de61859d30, req=
=3D0x55de622ec000) at /home/elmarco/src/qq/monitor.c:4157
  #31 0x000055de60865ce2 in monitor_qmp_bh_dispatcher (data=3D0x0) at /home=
/elmarco/src/qq/monitor.c:4224

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831486/+subscriptions

