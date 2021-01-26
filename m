Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9E30417A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:06:41 +0100 (CET)
Received: from localhost ([::1]:48552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PvU-0004Qb-2Y
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l4N75-0006FJ-Sh
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:06:27 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l4N73-0000MC-TV
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:06:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d4so9670318plh.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 04:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZecuQGGrv/35cfZhqPc6gqC+UlYhEy3TRo+d31ke0es=;
 b=DJavknpg9DEv3reHVMFgnyQMyBP6z9rW8IPP3AfCWt4joS6SsaF7v3kEBmFyIJnIwR
 1emv3vJ8oL2qODgg3S5zIfCqT80Z6m24x4N9YW6fD7uk4gcqg3CgDmyizdAWcF7d6NVS
 LoMrtSUEKQ4NMytQiCAeI/NELNDlI/Gj0R3MGrqOaT3k+lxfcJ0mVZilftbTgVhbjvy6
 5MN4ti2Et+jK82Zm9YnZZFXwSuW5m3av8e6JGsjjYya5kB0QWDQKg6+6vmNUi0dzGg87
 gKqHdo2FsRmzpiAB/JaS6yC/DQN2kWPkGV7uZP9Hfi4XjieyVqa6WiCMw/26rjvXDCJS
 2aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZecuQGGrv/35cfZhqPc6gqC+UlYhEy3TRo+d31ke0es=;
 b=E2OEtW2+naKZ3VSf0BUtyXGG9YQEr1ZU+Q+rmz4Bxa80BtjEqznLIoWirHtidDxMZI
 MpuLEiHBY2rvYSDCBNz8Qwth/iFLWpMF4WDkdfysuuJZFXVTB+gR+PC+8MOeei8bPGL2
 ZXe4E8YoC1MQNqpGzWTkfdT9sJTaKOhzo1dWawHK32qUFM9+5lqkFcPy0mdq3ndCwmIF
 YTcg2vLbM7Pu4niFS4L4nH9lBDJt8v6/9z8AjwQUIZAnAbwJNSfXgRVZnSX8p6gfK/c9
 GnUrPqxwqkw/xuY+RBV/j193XOVYCMExsBdtkX3GoDvz/JcuKQukASqtmcERSrfXIFJU
 sp6g==
X-Gm-Message-State: AOAM530lCNhwowA06nbX1xrNNxaMFe5v0704+SZ9mqaq2+OKqe3HfqZA
 6xFgqyI8/Mwwo6sPKKWFXDxDjybflM3JlceEEtFCNWJChMrvfw==
X-Google-Smtp-Source: ABdhPJzlxpjA8h9sQE5MMS6il+Jx5VNFg19vHJeQ6KUOfe9LUGjLZHD9qZt7IzW/cSehnINuEsdEYhjacYpX8hv+nIA=
X-Received: by 2002:a17:90a:bd8c:: with SMTP id
 z12mr5895052pjr.204.1611662783320; 
 Tue, 26 Jan 2021 04:06:23 -0800 (PST)
MIME-Version: 1.0
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Tue, 26 Jan 2021 13:06:11 +0100
Message-ID: <CAAi_9z6dci=RLCQdFV0RFbWVbMFksuvdbGLAw8HRt9=P_EQxMA@mail.gmail.com>
Subject: QEMU does not read from TAP device on macOS
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b2951805b9cc7b71"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:43:12 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b2951805b9cc7b71
Content-Type: text/plain; charset="UTF-8"

Hello!

I apologize in advance for any lacking info, or if this is the wrong place
entirely -- I am new to QEMU's source, having dug into it solely for this
issue.

I am a hobby-OS developer wanting to configure QEMU with a TAP device to
communicate packets to/from my host's network. However, even when data is
available on the TAP device, QEMU does not read from its file descriptor.

To dig into this further, I wrote a few test programs that open() a tap
device, and select() until data is available. My test programs unblock as
expected when packets are received on the TAP interface.

QEMU, however, never appears to read from the file descriptor. I've hacked
up a local copy of QEMU with gratuitous logs around
`aio-posix.c:aio-dispatch`, `main-loop.c:os_host_main_loop_wait`,
`async.c:aio_notify`, etc.

I can see that QEMU uses glib for its event loop, and can see that the
TAP's file descriptor is certainly being provided to glib to poll on, but
QEMU does not seem to react when new data appears on the tap. There are
lots of internal systems even just in the small bit I'm touching, and I've
yet to isolate exactly where the read happens after being awoken by glib.

My environment is as follows:
macOS Big Sur 11.0.1 and 11.1
QEMU 5.2.0
TAP kernel extension from
https://github.com/Tunnelblick/Tunnelblick/tree/master/third_party

I will continue hacking up my local QEMU, but am hopeful that someone may
have some insight into what might be going on. Thanks very much for your
time!

Phillip Tennen

--000000000000b2951805b9cc7b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello!<div><br></div><di=
v>I apologize in advance for any lacking info, or if this is the wrong plac=
e entirely -- I am new to QEMU&#39;s=C2=A0source, having=C2=A0dug into it s=
olely for this issue.=C2=A0</div><div><br></div><div>I am a hobby-OS develo=
per wanting to configure QEMU with a TAP device to communicate packets to/f=
rom my host&#39;s network. However, even when data is available on the TAP =
device, QEMU does not read from its file descriptor.</div><div><br></div><d=
iv>To dig into this further, I wrote a few test programs that open() a tap =
device, and select() until data is available. My test programs unblock as e=
xpected when packets are received on the TAP interface.</div><div><br></div=
><div>QEMU, however, never appears to read from the file descriptor. I&#39;=
ve hacked up a local copy of QEMU with=C2=A0gratuitous logs around `aio-pos=
ix.c:aio-dispatch`, `main-loop.c:os_host_main_loop_wait`, `async.c:aio_noti=
fy`, etc.=C2=A0</div><div><br></div><div>I can see that QEMU uses glib for =
its event loop, and can see that the TAP&#39;s file descriptor is certainly=
 being provided to glib to poll on, but QEMU does not seem to react when ne=
w data appears on the tap. There are lots of internal systems even just in =
the small bit I&#39;m touching, and I&#39;ve yet to isolate exactly where t=
he read happens after being awoken by glib.</div><div><br></div><div>My env=
ironment is as follows:</div><div>macOS Big Sur 11.0.1 and 11.1</div><div>Q=
EMU 5.2.0</div><div>TAP kernel extension from=C2=A0<a href=3D"https://githu=
b.com/Tunnelblick/Tunnelblick/tree/master/third_party">https://github.com/T=
unnelblick/Tunnelblick/tree/master/third_party</a></div><div><br></div><div=
>I will continue hacking up my local QEMU, but am hopeful that someone may =
have some insight into what might be going on. Thanks very much for your ti=
me!</div><div><br></div><div>Phillip Tennen</div></div></div></div>

--000000000000b2951805b9cc7b71--

