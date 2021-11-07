Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4E447548
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 20:35:50 +0100 (CET)
Received: from [::1] (port=48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjnxE-0002mK-Nj
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 14:35:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@reitermark.us>) id 1mjnv3-00025h-Ea
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 14:33:33 -0500
Received: from [2a00:1450:4864:20::42a] (port=37886
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <me@reitermark.us>) id 1mjnv0-0006Kk-6i
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 14:33:32 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b12so23161774wrh.4
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 11:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reitermark-us.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:subject:message-id:date:to;
 bh=+5d7U79+v3Zlm6MgrBlyYmy2MwPjgzRu/SmCXQZsGbo=;
 b=OmyfkU5bbkdSCDHgSpLTSiiDbWgACUDMwbe+bTVfVDs4EDNWrLRSvsSFSP2QEUs6zv
 9N+epiDcP+7t3dLHyb/1BsladR8mWdSePf/4X3M9imcCKt8RP2oWfIhGOVJoLuriIYsJ
 e2pOOZ2UeeUiSXjpgDJmYoG3YfoPvOFytN3sK2YC+ya+9GgMun7BZjnUrtS4wrYhOKjX
 zz6IT8+XnuT1uLoQfWpEp2XPGQ8kvjJ1Rck+obZPr6HNttxuaOm6cq3X5lKClH2Aahd2
 QckDreoJnL+X/M0esowmGAefmM6I02nBBzqW8VXz4CAwnkfcKLClnSf0WB1vXV/R7uPK
 KGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=+5d7U79+v3Zlm6MgrBlyYmy2MwPjgzRu/SmCXQZsGbo=;
 b=AWVh0Hw1PbtLiAdyIa69SJ/VYcS79ePWp7IerHXEEoN3iNMfKkbA3+c6s5ejVVaMn5
 cFmR+Wd07tlv6J9XggYd9cGG/1TtMpFcCQIdGbjFEfS0Bk4tQgkVeQ+nKX5x3WYh/OJJ
 flMgnA8TIcWYmuPeYwmbgV7HfZuCJ04xgBi9MlH6AwMYMrM+qB/3IikJug1F1B/oIDY8
 hURgkxo7IS9XheHtCwwUnyw8Wt08F/bIathoW8i6uj58/rzK0oavnLjNGWa/4Muu0zw+
 DXF0eCiOGe5td3ibzpaR7BBvIYwTkxSIedjzo52XHA/BkW8jyXQx//s6tP3tJj9fKKwH
 3ydA==
X-Gm-Message-State: AOAM531BALN9jvwju/gJGU0VAswyQBcpO3jbbd9/rgjKwUOosQFX1TC4
 dGLbxZFnbwBzWu6MsgltdXy2i+0u0Zi67VNn
X-Google-Smtp-Source: ABdhPJyZa//LgGbQUQoAodfQVxHIXlGhv+/kw+3WpCxbV88cZVtSEx7YG6Tk9YEMfp8gdtmDwrKcHQ==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr72587775wri.381.1636313269078; 
 Sun, 07 Nov 2021 11:27:49 -0800 (PST)
Received: from smtpclient.apple (212-186-127-212.static.upcbusiness.at.
 [212.186.127.212])
 by smtp.gmail.com with ESMTPSA id n8sm14151283wrp.95.2021.11.07.11.27.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Nov 2021 11:27:48 -0800 (PST)
From: Markus Reiter <me@reitermark.us>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Patch: Support QEMU Guest Agent on macOS
Message-Id: <9C477409-D59B-4C9E-A809-AA25FE61A476@reitermark.us>
Date: Sun, 7 Nov 2021 20:27:47 +0100
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=me@reitermark.us; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Add support for the `guest-shutdown` and `guest-network-get-interfaces` =
commands on macOS.

Markus


--Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD
Content-Disposition: attachment;
	filename=0001-Fix-default-QGA-device-path-on-macOS.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-Fix-default-QGA-device-path-on-macOS.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=20e7836b387b3d9d1750308790546b3b687b8c8218=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Markus=20Reiter=20<me@reitermark.us>=0ADate:=20=
Sun,=207=20Nov=202021=2009:25:56=20+0100=0ASubject:=20[PATCH=201/3]=20=
Fix=20default=20QGA=20device=20path=20on=20macOS.=0A=0ASigned-off-by:=20=
Markus=20Reiter=20<me@reitermark.us>=0A---=0A=20qga/main.c=20|=207=20=
++++++-=0A=201=20file=20changed,=206=20insertions(+),=201=20deletion(-)=0A=
=0Adiff=20--git=20a/qga/main.c=20b/qga/main.c=0Aindex=20=
15fd3a4149..d9e138be9c=20100644=0A---=20a/qga/main.c=0A+++=20=
b/qga/main.c=0A@@=20-46,9=20+46,14=20@@=0A=20#endif=0A=20=0A=20#ifndef=20=
_WIN32=0A+#ifdef=20__APPLE__=0A+#define=20QGA_VIRTIO_PATH_DEFAULT=20=
"/dev/tty.org.qemu.guest_agent.0"=0A+#define=20QGA_SERIAL_PATH_DEFAULT=20=
"/dev/tty.serial1"=0A+#else=0A=20#define=20QGA_VIRTIO_PATH_DEFAULT=20=
"/dev/virtio-ports/org.qemu.guest_agent.0"=0A-#define=20=
QGA_STATE_RELATIVE_DIR=20=20"run"=0A=20#define=20QGA_SERIAL_PATH_DEFAULT=20=
"/dev/ttyS0"=0A+#endif=0A+#define=20QGA_STATE_RELATIVE_DIR=20=20"run"=0A=20=
#else=0A=20#define=20QGA_VIRTIO_PATH_DEFAULT=20=
"\\\\.\\Global\\org.qemu.guest_agent.0"=0A=20#define=20=
QGA_STATE_RELATIVE_DIR=20=20"qemu-ga"=0A--=20=0A2.33.0=0A=0A=

--Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD
Content-Disposition: attachment;
	filename=0002-Fix-shutdown-args-on-macOS.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0002-Fix-shutdown-args-on-macOS.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=20c49707cfe49aaba1275d4fbc764561e9c2d06cd3=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Markus=20Reiter=20<me@reitermark.us>=0ADate:=20=
Sun,=207=20Nov=202021=2009:26:13=20+0100=0ASubject:=20[PATCH=202/3]=20=
Fix=20`shutdown`=20args=20on=20macOS.=0A=0ASigned-off-by:=20Markus=20=
Reiter=20<me@reitermark.us>=0A---=0A=20qga/commands-posix.c=20|=2014=20=
+++++++++++++-=0A=201=20file=20changed,=2013=20insertions(+),=201=20=
deletion(-)=0A=0Adiff=20--git=20a/qga/commands-posix.c=20=
b/qga/commands-posix.c=0Aindex=2075dbaab68e..8451f2f530=20100644=0A---=20=
a/qga/commands-posix.c=0A+++=20b/qga/commands-posix.c=0A@@=20-90,9=20=
+90,17=20@@=20void=20qmp_guest_shutdown(bool=20has_mode,=20const=20char=20=
*mode,=20Error=20**errp)=0A=20=0A=20=20=20=20=20slog("guest-shutdown=20=
called,=20mode:=20%s",=20mode);=0A=20=20=20=20=20if=20(!has_mode=20||=20=
strcmp(mode,=20"powerdown")=20=3D=3D=200)=20{=0A+=20=20=20=20=20=20=20=20=
#ifdef=20__APPLE__=0A+=20=20=20=20=20=20=20=20shutdown_flag=20=3D=20=
"-h";=0A+=20=20=20=20=20=20=20=20#else=0A=20=20=20=20=20=20=20=20=20=
shutdown_flag=20=3D=20"-P";=0A+=20=20=20=20=20=20=20=20#endif=0A=20=20=20=
=20=20}=20else=20if=20(strcmp(mode,=20"halt")=20=3D=3D=200)=20{=0A+=20=20=
=20=20=20=20=20=20#ifdef=20__APPLE__=0A+=20=20=20=20=20=20=20=20=
shutdown_flag=20=3D=20"-u";=0A+=20=20=20=20=20=20=20=20#else=0A=20=20=20=20=
=20=20=20=20=20shutdown_flag=20=3D=20"-H";=0A+=20=20=20=20=20=20=20=20=
#endif=0A=20=20=20=20=20}=20else=20if=20(strcmp(mode,=20"reboot")=20=3D=3D=
=200)=20{=0A=20=20=20=20=20=20=20=20=20shutdown_flag=20=3D=20"-r";=0A=20=20=
=20=20=20}=20else=20{=0A@@=20-109,7=20+117,11=20@@=20void=20=
qmp_guest_shutdown(bool=20has_mode,=20const=20char=20*mode,=20Error=20=
**errp)=0A=20=20=20=20=20=20=20=20=20reopen_fd_to_null(1);=0A=20=20=20=20=
=20=20=20=20=20reopen_fd_to_null(2);=0A=20=0A-=20=20=20=20=20=20=20=20=
execle("/sbin/shutdown",=20"shutdown",=20"-h",=20shutdown_flag,=20"+0",=0A=
+=20=20=20=20=20=20=20=20execle("/sbin/shutdown",=20"shutdown",=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20#ifndef=20__APPLE__=0A+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20"-h",=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20#endif=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
shutdown_flag,=20"+0",=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
"hypervisor=20initiated=20shutdown",=20(char=20*)NULL,=20environ);=0A=20=20=
=20=20=20=20=20=20=20_exit(EXIT_FAILURE);=0A=20=20=20=20=20}=20else=20if=20=
(pid=20<=200)=20{=0A--=20=0A2.33.0=0A=0A=

--Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD
Content-Disposition: attachment;
	filename=0003-Enable-guest-network-get-interfaces-command-on-macOS.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0003-Enable-guest-network-get-interfaces-command-on-macOS.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=2003cc252ef7a9244b28693cadd22e4e7db6831ee4=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Markus=20Reiter=20<me@reitermark.us>=0ADate:=20=
Sun,=207=20Nov=202021=2009:26:33=20+0100=0ASubject:=20[PATCH=203/3]=20=
Enable=20`guest-network-get-interfaces`=20command=20on=20macOS.=0A=0A=
Signed-off-by:=20Markus=20Reiter=20<me@reitermark.us>=0A---=0A=20=
qga/commands-posix.c=20|=20480=20=
+++++++++++++++++++++++--------------------=0A=201=20file=20changed,=20=
252=20insertions(+),=20228=20deletions(-)=0A=0Adiff=20--git=20=
a/qga/commands-posix.c=20b/qga/commands-posix.c=0Aindex=20=
8451f2f530..1e2040e171=20100644=0A---=20a/qga/commands-posix.c=0A+++=20=
b/qga/commands-posix.c=0A@@=20-41,13=20+41,21=20@@=20extern=20char=20=
**environ;=0A=20#endif=0A=20#endif=0A=20=0A+#if=20defined(__linux__)=20=
||=20defined(__APPLE__)=0A+#include=20<ifaddrs.h>=0A+#include=20=
<sys/socket.h>=0A+#include=20<net/if.h>=0A+#endif=0A+=0A+#if=20=
defined(__APPLE__)=0A+#include=20<sys/types.h>=0A+#include=20=
<net/if_dl.h>=0A+#endif=0A+=0A=20#if=20defined(__linux__)=0A=20#include=20=
<mntent.h>=0A=20#include=20<linux/fs.h>=0A-#include=20<ifaddrs.h>=0A=20=
#include=20<arpa/inet.h>=0A-#include=20<sys/socket.h>=0A-#include=20=
<net/if.h>=0A=20#include=20<sys/statvfs.h>=0A=20=0A=20#ifdef=20=
CONFIG_LIBUDEV=0A@@=20-2166,223=20+2174,6=20@@=20void=20=
qmp_guest_suspend_hybrid(Error=20**errp)=0A=20=20=20=20=20=
guest_suspend(SUSPEND_MODE_HYBRID,=20errp);=0A=20}=0A=20=0A-static=20=
GuestNetworkInterface=20*=0A=
-guest_find_interface(GuestNetworkInterfaceList=20*head,=0A-=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20char=20*name)=0A=
-{=0A-=20=20=20=20for=20(;=20head;=20head=20=3D=20head->next)=20{=0A-=20=20=
=20=20=20=20=20=20if=20(strcmp(head->value->name,=20name)=20=3D=3D=200)=20=
{=0A-=20=20=20=20=20=20=20=20=20=20=20=20return=20head->value;=0A-=20=20=20=
=20=20=20=20=20}=0A-=20=20=20=20}=0A-=0A-=20=20=20=20return=20NULL;=0A-}=0A=
-=0A-static=20int=20guest_get_network_stats(const=20char=20*name,=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
GuestNetworkInterfaceStat=20*stats)=0A-{=0A-=20=20=20=20int=20name_len;=0A=
-=20=20=20=20char=20const=20*devinfo=20=3D=20"/proc/net/dev";=0A-=20=20=20=
=20FILE=20*fp;=0A-=20=20=20=20char=20*line=20=3D=20NULL,=20*colon;=0A-=20=
=20=20=20size_t=20n=20=3D=200;=0A-=20=20=20=20fp=20=3D=20fopen(devinfo,=20=
"r");=0A-=20=20=20=20if=20(!fp)=20{=0A-=20=20=20=20=20=20=20=20return=20=
-1;=0A-=20=20=20=20}=0A-=20=20=20=20name_len=20=3D=20strlen(name);=0A-=20=
=20=20=20while=20(getline(&line,=20&n,=20fp)=20!=3D=20-1)=20{=0A-=20=20=20=
=20=20=20=20=20long=20long=20dummy;=0A-=20=20=20=20=20=20=20=20long=20=
long=20rx_bytes;=0A-=20=20=20=20=20=20=20=20long=20long=20rx_packets;=0A=
-=20=20=20=20=20=20=20=20long=20long=20rx_errs;=0A-=20=20=20=20=20=20=20=20=
long=20long=20rx_dropped;=0A-=20=20=20=20=20=20=20=20long=20long=20=
tx_bytes;=0A-=20=20=20=20=20=20=20=20long=20long=20tx_packets;=0A-=20=20=20=
=20=20=20=20=20long=20long=20tx_errs;=0A-=20=20=20=20=20=20=20=20long=20=
long=20tx_dropped;=0A-=20=20=20=20=20=20=20=20char=20*trim_line;=0A-=20=20=
=20=20=20=20=20=20trim_line=20=3D=20g_strchug(line);=0A-=20=20=20=20=20=20=
=20=20if=20(trim_line[0]=20=3D=3D=20'\0')=20{=0A-=20=20=20=20=20=20=20=20=
=20=20=20=20continue;=0A-=20=20=20=20=20=20=20=20}=0A-=20=20=20=20=20=20=20=
=20colon=20=3D=20strchr(trim_line,=20':');=0A-=20=20=20=20=20=20=20=20if=20=
(!colon)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20continue;=0A-=20=20=20=
=20=20=20=20=20}=0A-=20=20=20=20=20=20=20=20if=20(colon=20-=20name_len=20=
=20=3D=3D=20trim_line=20&&=0A-=20=20=20=20=20=20=20=20=20=20=20=
strncmp(trim_line,=20name,=20name_len)=20=3D=3D=200)=20{=0A-=20=20=20=20=20=
=20=20=20=20=20=20=20if=20(sscanf(colon=20+=201,=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20"%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20=
%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld",=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&rx_bytes,=20=
&rx_packets,=20&rx_errs,=20&rx_dropped,=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20&dummy,=20&dummy,=20&dummy,=20&dummy,=0A-=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&tx_bytes,=20&tx_packets,=20=
&tx_errs,=20&tx_dropped,=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20&dummy,=20&dummy,=20&dummy,=20&dummy)=20!=3D=2016)=20{=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20continue;=0A-=20=20=20=20=20=20=
=20=20=20=20=20=20}=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_bytes=20=3D=20rx_bytes;=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_packets=20=3D=20rx_packets;=0A-=20=20=20=20=20=20=20=20=20=20=20=
=20stats->rx_errs=20=3D=20rx_errs;=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_dropped=20=3D=20rx_dropped;=0A-=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_bytes=20=3D=20tx_bytes;=0A-=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_packets=20=3D=20tx_packets;=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20stats->tx_errs=20=3D=20tx_errs;=0A-=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_dropped=20=3D=20tx_dropped;=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20fclose(fp);=0A-=20=20=20=20=20=20=20=20=20=20=20=20g_free(line);=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20return=200;=0A-=20=20=20=20=20=20=20=
=20}=0A-=20=20=20=20}=0A-=20=20=20=20fclose(fp);=0A-=20=20=20=20=
g_free(line);=0A-=20=20=20=20g_debug("/proc/net/dev:=20Interface=20'%s'=20=
not=20found",=20name);=0A-=20=20=20=20return=20-1;=0A-}=0A-=0A-/*=0A-=20=
*=20Build=20information=20about=20guest=20interfaces=0A-=20*/=0A=
-GuestNetworkInterfaceList=20*qmp_guest_network_get_interfaces(Error=20=
**errp)=0A-{=0A-=20=20=20=20GuestNetworkInterfaceList=20*head=20=3D=20=
NULL,=20**tail=20=3D=20&head;=0A-=20=20=20=20struct=20ifaddrs=20*ifap,=20=
*ifa;=0A-=0A-=20=20=20=20if=20(getifaddrs(&ifap)=20<=200)=20{=0A-=20=20=20=
=20=20=20=20=20error_setg_errno(errp,=20errno,=20"getifaddrs=20failed");=0A=
-=20=20=20=20=20=20=20=20goto=20error;=0A-=20=20=20=20}=0A-=0A-=20=20=20=20=
for=20(ifa=20=3D=20ifap;=20ifa;=20ifa=20=3D=20ifa->ifa_next)=20{=0A-=20=20=
=20=20=20=20=20=20GuestNetworkInterface=20*info;=0A-=20=20=20=20=20=20=20=
=20GuestIpAddressList=20**address_tail;=0A-=20=20=20=20=20=20=20=20=
GuestIpAddress=20*address_item=20=3D=20NULL;=0A-=20=20=20=20=20=20=20=20=
GuestNetworkInterfaceStat=20*interface_stat=20=3D=20NULL;=0A-=20=20=20=20=
=20=20=20=20char=20addr4[INET_ADDRSTRLEN];=0A-=20=20=20=20=20=20=20=20=
char=20addr6[INET6_ADDRSTRLEN];=0A-=20=20=20=20=20=20=20=20int=20sock;=0A=
-=20=20=20=20=20=20=20=20struct=20ifreq=20ifr;=0A-=20=20=20=20=20=20=20=20=
unsigned=20char=20*mac_addr;=0A-=20=20=20=20=20=20=20=20void=20*p;=0A-=0A=
-=20=20=20=20=20=20=20=20g_debug("Processing=20%s=20interface",=20=
ifa->ifa_name);=0A-=0A-=20=20=20=20=20=20=20=20info=20=3D=20=
guest_find_interface(head,=20ifa->ifa_name);=0A-=0A-=20=20=20=20=20=20=20=
=20if=20(!info)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20info=20=3D=20=
g_malloc0(sizeof(*info));=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
info->name=20=3D=20g_strdup(ifa->ifa_name);=0A-=0A-=20=20=20=20=20=20=20=20=
=20=20=20=20QAPI_LIST_APPEND(tail,=20info);=0A-=20=20=20=20=20=20=20=20}=0A=
-=0A-=20=20=20=20=20=20=20=20if=20(!info->has_hardware_address=20&&=20=
ifa->ifa_flags=20&=20SIOCGIFHWADDR)=20{=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20/*=20we=20haven't=20obtained=20HW=20address=20yet=20*/=0A-=20=20=20=
=20=20=20=20=20=20=20=20=20sock=20=3D=20socket(PF_INET,=20SOCK_STREAM,=20=
0);=0A-=20=20=20=20=20=20=20=20=20=20=20=20if=20(sock=20=3D=3D=20-1)=20{=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20error_setg_errno(errp,=20=
errno,=20"failed=20to=20create=20socket");=0A-=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20goto=20error;=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
}=0A-=0A-=20=20=20=20=20=20=20=20=20=20=20=20memset(&ifr,=200,=20=
sizeof(ifr));=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
pstrcpy(ifr.ifr_name,=20IF_NAMESIZE,=20info->name);=0A-=20=20=20=20=20=20=
=20=20=20=20=20=20if=20(ioctl(sock,=20SIOCGIFHWADDR,=20&ifr)=20=3D=3D=20=
-1)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
error_setg_errno(errp,=20errno,=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20"failed=20to=20=
get=20MAC=20address=20of=20%s",=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
ifa->ifa_name);=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
close(sock);=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20goto=20=
error;=0A-=20=20=20=20=20=20=20=20=20=20=20=20}=0A-=0A-=20=20=20=20=20=20=
=20=20=20=20=20=20close(sock);=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
mac_addr=20=3D=20(unsigned=20char=20*)=20&ifr.ifr_hwaddr.sa_data;=0A-=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20info->hardware_address=20=3D=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
(int)=20mac_addr[0],=20(int)=20mac_addr[1],=0A-=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
(int)=20mac_addr[2],=20(int)=20mac_addr[3],=0A-=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
(int)=20mac_addr[4],=20(int)=20mac_addr[5]);=0A-=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20info->has_hardware_address=20=3D=20true;=0A-=20=20=20=20=20=
=20=20=20}=0A-=0A-=20=20=20=20=20=20=20=20if=20(ifa->ifa_addr=20&&=0A-=20=
=20=20=20=20=20=20=20=20=20=20=20ifa->ifa_addr->sa_family=20=3D=3D=20=
AF_INET)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20/*=20interface=20=
with=20IPv4=20address=20*/=0A-=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20=
&((struct=20sockaddr_in=20*)ifa->ifa_addr)->sin_addr;=0A-=20=20=20=20=20=20=
=20=20=20=20=20=20if=20(!inet_ntop(AF_INET,=20p,=20addr4,=20=
sizeof(addr4)))=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
error_setg_errno(errp,=20errno,=20"inet_ntop=20failed");=0A-=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20goto=20error;=0A-=20=20=20=20=20=20=20=20=
=20=20=20=20}=0A-=0A-=20=20=20=20=20=20=20=20=20=20=20=20address_item=20=
=3D=20g_malloc0(sizeof(*address_item));=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20address_item->ip_address=20=3D=20g_strdup(addr4);=0A-=20=20=20=20=20=
=20=20=20=20=20=20=20address_item->ip_address_type=20=3D=20=
GUEST_IP_ADDRESS_TYPE_IPV4;=0A-=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(ifa->ifa_netmask)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20/*=20Count=20the=20number=20of=20set=20bits=20in=20netmask.=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20This=20is=20safe=20as=20=
'1'=20and=20'0'=20cannot=20be=20shuffled=20in=20netmask.=20*/=0A-=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20sockaddr_in=20=
*)ifa->ifa_netmask)->sin_addr;=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20address_item->prefix=20=3D=20ctpop32(((uint32_t=20*)=20p)[0]);=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20}=0A-=20=20=20=20=20=20=20=20}=20=
else=20if=20(ifa->ifa_addr=20&&=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20ifa->ifa_addr->sa_family=20=3D=3D=20AF_INET6)=20{=0A-=20=
=20=20=20=20=20=20=20=20=20=20=20/*=20interface=20with=20IPv6=20address=20=
*/=0A-=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20=
sockaddr_in6=20*)ifa->ifa_addr)->sin6_addr;=0A-=20=20=20=20=20=20=20=20=20=
=20=20=20if=20(!inet_ntop(AF_INET6,=20p,=20addr6,=20sizeof(addr6)))=20{=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20error_setg_errno(errp,=20=
errno,=20"inet_ntop=20failed");=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20goto=20error;=0A-=20=20=20=20=20=20=20=20=20=20=20=20}=0A-=0A-=20=
=20=20=20=20=20=20=20=20=20=20=20address_item=20=3D=20=
g_malloc0(sizeof(*address_item));=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
address_item->ip_address=20=3D=20g_strdup(addr6);=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20address_item->ip_address_type=20=3D=20=
GUEST_IP_ADDRESS_TYPE_IPV6;=0A-=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(ifa->ifa_netmask)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20/*=20Count=20the=20number=20of=20set=20bits=20in=20netmask.=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20This=20is=20safe=20as=20=
'1'=20and=20'0'=20cannot=20be=20shuffled=20in=20netmask.=20*/=0A-=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20=
sockaddr_in6=20*)ifa->ifa_netmask)->sin6_addr;=0A-=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20address_item->prefix=20=3D=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20*)=20p)[0])=20=
+=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
ctpop32(((uint32_t=20*)=20p)[1])=20+=0A-=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20*)=20p)[2])=20+=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20=
*)=20p)[3]);=0A-=20=20=20=20=20=20=20=20=20=20=20=20}=0A-=20=20=20=20=20=20=
=20=20}=0A-=0A-=20=20=20=20=20=20=20=20if=20(!address_item)=20{=0A-=20=20=
=20=20=20=20=20=20=20=20=20=20continue;=0A-=20=20=20=20=20=20=20=20}=0A-=0A=
-=20=20=20=20=20=20=20=20address_tail=20=3D=20&info->ip_addresses;=0A-=20=
=20=20=20=20=20=20=20while=20(*address_tail)=20{=0A-=20=20=20=20=20=20=20=
=20=20=20=20=20address_tail=20=3D=20&(*address_tail)->next;=0A-=20=20=20=20=
=20=20=20=20}=0A-=20=20=20=20=20=20=20=20QAPI_LIST_APPEND(address_tail,=20=
address_item);=0A-=0A-=20=20=20=20=20=20=20=20info->has_ip_addresses=20=3D=
=20true;=0A-=0A-=20=20=20=20=20=20=20=20if=20(!info->has_statistics)=20{=0A=
-=20=20=20=20=20=20=20=20=20=20=20=20interface_stat=20=3D=20=
g_malloc0(sizeof(*interface_stat));=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(guest_get_network_stats(info->name,=20interface_stat)=20=3D=3D=20=
-1)=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
info->has_statistics=20=3D=20false;=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20g_free(interface_stat);=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
}=20else=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
info->statistics=20=3D=20interface_stat;=0A-=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20info->has_statistics=20=3D=20true;=0A-=20=20=20=20=20=20=
=20=20=20=20=20=20}=0A-=20=20=20=20=20=20=20=20}=0A-=20=20=20=20}=0A-=0A=
-=20=20=20=20freeifaddrs(ifap);=0A-=20=20=20=20return=20head;=0A-=0A=
-error:=0A-=20=20=20=20freeifaddrs(ifap);=0A-=20=20=20=20=
qapi_free_GuestNetworkInterfaceList(head);=0A-=20=20=20=20return=20NULL;=0A=
-}=0A-=0A=20/*=20Transfer=20online/offline=20status=20between=20@vcpu=20=
and=20the=20guest=20system.=0A=20=20*=0A=20=20*=20On=20input=20either=20=
@errp=20or=20*@errp=20must=20be=20NULL.=0A@@=20-2952,12=20+2743,6=20@@=20=
void=20qmp_guest_suspend_hybrid(Error=20**errp)=0A=20=20=20=20=20=
error_setg(errp,=20QERR_UNSUPPORTED);=0A=20}=0A=20=0A=
-GuestNetworkInterfaceList=20*qmp_guest_network_get_interfaces(Error=20=
**errp)=0A-{=0A-=20=20=20=20error_setg(errp,=20QERR_UNSUPPORTED);=0A-=20=20=
=20=20return=20NULL;=0A-}=0A-=0A=20GuestLogicalProcessorList=20=
*qmp_guest_get_vcpus(Error=20**errp)=0A=20{=0A=20=20=20=20=20=
error_setg(errp,=20QERR_UNSUPPORTED);=0A@@=20-2999,6=20+2784,241=20@@=20=
GuestMemoryBlockInfo=20*qmp_guest_get_memory_block_info(Error=20**errp)=0A=
=20=0A=20#endif=0A=20=0A+#if=20defined(__linux__)=20||=20=
defined(__APPLE__)=0A+static=20GuestNetworkInterface=20*=0A=
+guest_find_interface(GuestNetworkInterfaceList=20*head,=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20const=20char=20*name)=0A=
+{=0A+=20=20=20=20for=20(;=20head;=20head=20=3D=20head->next)=20{=0A+=20=20=
=20=20=20=20=20=20if=20(strcmp(head->value->name,=20name)=20=3D=3D=200)=20=
{=0A+=20=20=20=20=20=20=20=20=20=20=20=20return=20head->value;=0A+=20=20=20=
=20=20=20=20=20}=0A+=20=20=20=20}=0A+=0A+=20=20=20=20return=20NULL;=0A+}=0A=
+=0A+static=20int=20guest_get_network_stats(const=20char=20*name,=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
GuestNetworkInterfaceStat=20*stats)=0A+{=0A+=20=20=20=20int=20name_len;=0A=
+=20=20=20=20char=20const=20*devinfo=20=3D=20"/proc/net/dev";=0A+=20=20=20=
=20FILE=20*fp;=0A+=20=20=20=20char=20*line=20=3D=20NULL,=20*colon;=0A+=20=
=20=20=20size_t=20n=20=3D=200;=0A+=20=20=20=20fp=20=3D=20fopen(devinfo,=20=
"r");=0A+=20=20=20=20if=20(!fp)=20{=0A+=20=20=20=20=20=20=20=20return=20=
-1;=0A+=20=20=20=20}=0A+=20=20=20=20name_len=20=3D=20strlen(name);=0A+=20=
=20=20=20while=20(getline(&line,=20&n,=20fp)=20!=3D=20-1)=20{=0A+=20=20=20=
=20=20=20=20=20long=20long=20dummy;=0A+=20=20=20=20=20=20=20=20long=20=
long=20rx_bytes;=0A+=20=20=20=20=20=20=20=20long=20long=20rx_packets;=0A=
+=20=20=20=20=20=20=20=20long=20long=20rx_errs;=0A+=20=20=20=20=20=20=20=20=
long=20long=20rx_dropped;=0A+=20=20=20=20=20=20=20=20long=20long=20=
tx_bytes;=0A+=20=20=20=20=20=20=20=20long=20long=20tx_packets;=0A+=20=20=20=
=20=20=20=20=20long=20long=20tx_errs;=0A+=20=20=20=20=20=20=20=20long=20=
long=20tx_dropped;=0A+=20=20=20=20=20=20=20=20char=20*trim_line;=0A+=20=20=
=20=20=20=20=20=20trim_line=20=3D=20g_strchug(line);=0A+=20=20=20=20=20=20=
=20=20if=20(trim_line[0]=20=3D=3D=20'\0')=20{=0A+=20=20=20=20=20=20=20=20=
=20=20=20=20continue;=0A+=20=20=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=
=20colon=20=3D=20strchr(trim_line,=20':');=0A+=20=20=20=20=20=20=20=20if=20=
(!colon)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20continue;=0A+=20=20=20=
=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20if=20(colon=20-=20name_len=20=
=20=3D=3D=20trim_line=20&&=0A+=20=20=20=20=20=20=20=20=20=20=20=
strncmp(trim_line,=20name,=20name_len)=20=3D=3D=200)=20{=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20if=20(sscanf(colon=20+=201,=0A+=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20"%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20=
%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld=20%lld",=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&rx_bytes,=20=
&rx_packets,=20&rx_errs,=20&rx_dropped,=0A+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20&dummy,=20&dummy,=20&dummy,=20&dummy,=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20&tx_bytes,=20&tx_packets,=20=
&tx_errs,=20&tx_dropped,=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20&dummy,=20&dummy,=20&dummy,=20&dummy)=20!=3D=2016)=20{=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20continue;=0A+=20=20=20=20=20=20=
=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_bytes=20=3D=20rx_bytes;=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_packets=20=3D=20rx_packets;=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20stats->rx_errs=20=3D=20rx_errs;=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
stats->rx_dropped=20=3D=20rx_dropped;=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_bytes=20=3D=20tx_bytes;=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_packets=20=3D=20tx_packets;=0A+=20=20=20=20=20=20=20=20=20=20=
=20=20stats->tx_errs=20=3D=20tx_errs;=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20stats->tx_dropped=20=3D=20tx_dropped;=0A+=20=20=20=20=20=20=20=20=20=20=
=20=20fclose(fp);=0A+=20=20=20=20=20=20=20=20=20=20=20=20g_free(line);=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20return=200;=0A+=20=20=20=20=20=20=20=
=20}=0A+=20=20=20=20}=0A+=20=20=20=20fclose(fp);=0A+=20=20=20=20=
g_free(line);=0A+=20=20=20=20g_debug("%s:=20Interface=20'%s'=20not=20=
found",=20devinfo,=20name);=0A+=20=20=20=20return=20-1;=0A+}=0A+=0A+/*=0A=
+=20*=20Build=20information=20about=20guest=20interfaces=0A+=20*/=0A=
+GuestNetworkInterfaceList=20*qmp_guest_network_get_interfaces(Error=20=
**errp)=0A+{=0A+=20=20=20=20GuestNetworkInterfaceList=20*head=20=3D=20=
NULL,=20**tail=20=3D=20&head;=0A+=20=20=20=20struct=20ifaddrs=20*ifap,=20=
*ifa;=0A+=0A+=20=20=20=20if=20(getifaddrs(&ifap)=20<=200)=20{=0A+=20=20=20=
=20=20=20=20=20error_setg_errno(errp,=20errno,=20"getifaddrs=20failed");=0A=
+=20=20=20=20=20=20=20=20goto=20error;=0A+=20=20=20=20}=0A+=0A+=20=20=20=20=
for=20(ifa=20=3D=20ifap;=20ifa;=20ifa=20=3D=20ifa->ifa_next)=20{=0A+=20=20=
=20=20=20=20=20=20GuestNetworkInterface=20*info;=0A+=20=20=20=20=20=20=20=
=20GuestIpAddressList=20**address_tail;=0A+=20=20=20=20=20=20=20=20=
GuestIpAddress=20*address_item=20=3D=20NULL;=0A+=20=20=20=20=20=20=20=20=
GuestNetworkInterfaceStat=20*interface_stat=20=3D=20NULL;=0A+=20=20=20=20=
=20=20=20=20char=20addr4[INET_ADDRSTRLEN];=0A+=20=20=20=20=20=20=20=20=
char=20addr6[INET6_ADDRSTRLEN];=0A+=20=20=20=20=20=20=20=20int=20sock;=0A=
+=20=20=20=20=20=20=20=20struct=20ifreq=20ifr;=0A+=20=20=20=20=20=20=20=20=
unsigned=20char=20*mac_addr;=0A+=20=20=20=20=20=20=20=20void=20*p;=0A+=0A=
+=20=20=20=20=20=20=20=20g_debug("Processing=20%s=20interface",=20=
ifa->ifa_name);=0A+=0A+=20=20=20=20=20=20=20=20info=20=3D=20=
guest_find_interface(head,=20ifa->ifa_name);=0A+=0A+=20=20=20=20=20=20=20=
=20if=20(!info)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20info=20=3D=20=
g_malloc0(sizeof(*info));=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
info->name=20=3D=20g_strdup(ifa->ifa_name);=0A+=0A+=20=20=20=20=20=20=20=20=
=20=20=20=20QAPI_LIST_APPEND(tail,=20info);=0A+=20=20=20=20=20=20=20=20}=0A=
+=0A+=0A+=20=20=20=20=20=20=20=20if=20(!info->has_hardware_address)=20{=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20#if=20defined(__linux__)=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20if=20(ifa->ifa_flags=20&=20SIOCGIFHWADDR)=20{=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20/*=20we=20haven't=20=
obtained=20HW=20address=20yet=20*/=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20sock=20=3D=20socket(PF_INET,=20SOCK_STREAM,=200);=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(sock=20=3D=3D=20-1)=20{=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
error_setg_errno(errp,=20errno,=20"failed=20to=20create=20socket");=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20goto=20error;=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20}=0A+=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20memset(&ifr,=200,=20sizeof(ifr));=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20pstrcpy(ifr.ifr_name,=20=
IF_NAMESIZE,=20info->name);=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20if=20(ioctl(sock,=20SIOCGIFHWADDR,=20&ifr)=20=3D=3D=20-1)=20{=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
error_setg_errno(errp,=20errno,=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
"failed=20to=20get=20MAC=20address=20of=20%s",=0A+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20ifa->ifa_name);=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20close(sock);=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20goto=20error;=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20}=0A+=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
close(sock);=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20mac_addr=20=
=3D=20(unsigned=20char=20*)=20&ifr.ifr_hwaddr.sa_data;=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20=20=20=20=20#else=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20struct=20sockaddr_dl*=20sdl=20=3D=20=
(struct=20sockaddr_dl=20*)=20ifa->ifa_addr;=0A+=20=20=20=20=20=20=20=20=20=
=20=20=20mac_addr=20=3D=20(unsigned=20char=20*)=20LLADDR(sdl);=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20#endif=0A+=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20if=20(mac_addr)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
info->hardware_address=20=3D=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20(int)=20mac_addr[0],=20(int)=20=
mac_addr[1],=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(int)=20mac_addr[2],=20=
(int)=20mac_addr[3],=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20(int)=20=
mac_addr[4],=20(int)=20mac_addr[5]);=0A+=0A+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20info->has_hardware_address=20=3D=20true;=0A+=20=20=20=20=
=20=20=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20}=0A+=0A+=20=20=20=20=
=20=20=20=20if=20(ifa->ifa_addr=20&&=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20ifa->ifa_addr->sa_family=20=3D=3D=20AF_INET)=20{=0A+=20=20=20=20=20=20=
=20=20=20=20=20=20/*=20interface=20with=20IPv4=20address=20*/=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20sockaddr_in=20=
*)ifa->ifa_addr)->sin_addr;=0A+=20=20=20=20=20=20=20=20=20=20=20=20if=20=
(!inet_ntop(AF_INET,=20p,=20addr4,=20sizeof(addr4)))=20{=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20error_setg_errno(errp,=20errno,=20=
"inet_ntop=20failed");=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
goto=20error;=0A+=20=20=20=20=20=20=20=20=20=20=20=20}=0A+=0A+=20=20=20=20=
=20=20=20=20=20=20=20=20address_item=20=3D=20=
g_malloc0(sizeof(*address_item));=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
address_item->ip_address=20=3D=20g_strdup(addr4);=0A+=20=20=20=20=20=20=20=
=20=20=20=20=20address_item->ip_address_type=20=3D=20=
GUEST_IP_ADDRESS_TYPE_IPV4;=0A+=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(ifa->ifa_netmask)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20/*=20Count=20the=20number=20of=20set=20bits=20in=20netmask.=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20This=20is=20safe=20as=20=
'1'=20and=20'0'=20cannot=20be=20shuffled=20in=20netmask.=20*/=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20sockaddr_in=20=
*)ifa->ifa_netmask)->sin_addr;=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20address_item->prefix=20=3D=20ctpop32(((uint32_t=20*)=20p)[0]);=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20}=20=
else=20if=20(ifa->ifa_addr=20&&=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20ifa->ifa_addr->sa_family=20=3D=3D=20AF_INET6)=20{=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20/*=20interface=20with=20IPv6=20address=20=
*/=0A+=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20=
sockaddr_in6=20*)ifa->ifa_addr)->sin6_addr;=0A+=20=20=20=20=20=20=20=20=20=
=20=20=20if=20(!inet_ntop(AF_INET6,=20p,=20addr6,=20sizeof(addr6)))=20{=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20error_setg_errno(errp,=20=
errno,=20"inet_ntop=20failed");=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20goto=20error;=0A+=20=20=20=20=20=20=20=20=20=20=20=20}=0A+=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20address_item=20=3D=20=
g_malloc0(sizeof(*address_item));=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
address_item->ip_address=20=3D=20g_strdup(addr6);=0A+=20=20=20=20=20=20=20=
=20=20=20=20=20address_item->ip_address_type=20=3D=20=
GUEST_IP_ADDRESS_TYPE_IPV6;=0A+=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(ifa->ifa_netmask)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20/*=20Count=20the=20number=20of=20set=20bits=20in=20netmask.=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20This=20is=20safe=20as=20=
'1'=20and=20'0'=20cannot=20be=20shuffled=20in=20netmask.=20*/=0A+=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20p=20=3D=20&((struct=20=
sockaddr_in6=20*)ifa->ifa_netmask)->sin6_addr;=0A+=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20address_item->prefix=20=3D=0A+=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20*)=20p)[0])=20=
+=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
ctpop32(((uint32_t=20*)=20p)[1])=20+=0A+=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20*)=20p)[2])=20+=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20ctpop32(((uint32_t=20=
*)=20p)[3]);=0A+=20=20=20=20=20=20=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=
=20=20}=0A+=0A+=20=20=20=20=20=20=20=20if=20(!address_item)=20{=0A+=20=20=
=20=20=20=20=20=20=20=20=20=20continue;=0A+=20=20=20=20=20=20=20=20}=0A+=0A=
+=20=20=20=20=20=20=20=20address_tail=20=3D=20&info->ip_addresses;=0A+=20=
=20=20=20=20=20=20=20while=20(*address_tail)=20{=0A+=20=20=20=20=20=20=20=
=20=20=20=20=20address_tail=20=3D=20&(*address_tail)->next;=0A+=20=20=20=20=
=20=20=20=20}=0A+=20=20=20=20=20=20=20=20QAPI_LIST_APPEND(address_tail,=20=
address_item);=0A+=0A+=20=20=20=20=20=20=20=20info->has_ip_addresses=20=3D=
=20true;=0A+=0A+=20=20=20=20=20=20=20=20if=20(!info->has_statistics)=20{=0A=
+=20=20=20=20=20=20=20=20=20=20=20=20interface_stat=20=3D=20=
g_malloc0(sizeof(*interface_stat));=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
if=20(guest_get_network_stats(info->name,=20interface_stat)=20=3D=3D=20=
-1)=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
info->has_statistics=20=3D=20false;=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20g_free(interface_stat);=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
}=20else=20{=0A+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
info->statistics=20=3D=20interface_stat;=0A+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20info->has_statistics=20=3D=20true;=0A+=20=20=20=20=20=20=
=20=20=20=20=20=20}=0A+=20=20=20=20=20=20=20=20}=0A+=20=20=20=20}=0A+=0A=
+=20=20=20=20freeifaddrs(ifap);=0A+=20=20=20=20return=20head;=0A+=0A=
+error:=0A+=20=20=20=20freeifaddrs(ifap);=0A+=20=20=20=20=
qapi_free_GuestNetworkInterfaceList(head);=0A+=20=20=20=20return=20NULL;=0A=
+}=0A+#else=0A+GuestNetworkInterfaceList=20=
*qmp_guest_network_get_interfaces(Error=20**errp)=0A+{=0A+=20=20=20=20=
error_setg(errp,=20QERR_UNSUPPORTED);=0A+=20=20=20=20return=20NULL;=0A+}=0A=
+#endif=0A+=0A=20#if=20!defined(CONFIG_FSFREEZE)=0A=20=0A=20=
GuestFilesystemInfoList=20*qmp_guest_get_fsinfo(Error=20**errp)=0A@@=20=
-3057,11=20+3077,15=20@@=20qmp_guest_fstrim(bool=20has_minimum,=20=
int64_t=20minimum,=20Error=20**errp)=0A=20/*=20add=20unsupported=20=
commands=20to=20the=20blacklist=20*/=0A=20GList=20=
*ga_command_blacklist_init(GList=20*blacklist)=0A=20{=0A+=0A=20#if=20=
!defined(__linux__)=0A+=0A=20=20=20=20=20{=0A=20=20=20=20=20=20=20=20=20=
const=20char=20*list[]=20=3D=20{=0A-=20=20=20=20=20=20=20=20=20=20=20=20=
"guest-suspend-disk",=20"guest-suspend-ram",=0A-=20=20=20=20=20=20=20=20=20=
=20=20=20"guest-suspend-hybrid",=20"guest-network-get-interfaces",=0A+=20=
=20=20=20=20=20=20=20=20=20=20=20#if=20!defined(__APPLE__)=0A+=20=20=20=20=
=20=20=20=20=20=20=20=20"guest-network-get-interfaces",=0A+=20=20=20=20=20=
=20=20=20=20=20=20=20#endif=0A+=20=20=20=20=20=20=20=20=20=20=20=20=
"guest-suspend-disk",=20"guest-suspend-ram",=20"guest-suspend-hybrid",=0A=
=20=20=20=20=20=20=20=20=20=20=20=20=20"guest-get-vcpus",=20=
"guest-set-vcpus",=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=
"guest-get-memory-blocks",=20"guest-set-memory-blocks",=0A=20=20=20=20=20=
=20=20=20=20=20=20=20=20"guest-get-memory-block-size",=20=
"guest-get-memory-block-info",=0A--=20=0A2.33.0=0A=0A=

--Apple-Mail=_9E0DAD67-E579-4065-B817-A1B6EFDDD4DD--

