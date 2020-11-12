Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8232B0681
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:33:29 +0100 (CET)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCjA-0003s2-4e
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCgy-0002vo-Hg
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:31:12 -0500
Received: from indium.canonical.com ([91.189.90.7]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCgw-00046r-Cn
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:31:12 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdCgu-00084D-Oj
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:31:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B7F842E80E8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:31:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 13:15:58 -0000
From: Thomas Huth <1668273@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange gkurz nehaljwani th-huth
X-Launchpad-Bug-Reporter: Nehal J Wani (nehaljwani)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20170227140328.20639.14786.malonedeb@soybean.canonical.com>
Message-Id: <160518695903.23616.178069395587835559.malone@wampee.canonical.com>
Subject: [Bug 1668273] Re: DoS possible on - a QEMU process using userspace
 SLIRP?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: d4f2270ad2e28bddd596768cb77af972139fb0c1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1668273 <1668273@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Slirp has been moved to an external project now. If this is still an issue,=
 please report the problem there instead:
https://gitlab.freedesktop.org/slirp/libslirp

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1668273

Title:
  DoS possible on - a QEMU process using userspace SLIRP?

Status in QEMU:
  Won't Fix

Bug description:
  Steps to reproduce:

  - Launch a VM using QEMU (2.8.0):

  $ qemu-system-x86_64 \
  =C2=A0=C2=A0=C2=A0=C2=A0-machine accel=3Dkvm \
  =C2=A0=C2=A0=C2=A0=C2=A0-hda Fedora-Cloud-Base-25-1.3.x86_64.qcow2 \
  =C2=A0=C2=A0=C2=A0=C2=A0-m 2G \
  =C2=A0=C2=A0=C2=A0=C2=A0-smp 2 \
  =C2=A0=C2=A0=C2=A0=C2=A0-vnc :8 \
  =C2=A0=C2=A0=C2=A0=C2=A0-boot dc \
  =C2=A0=C2=A0=C2=A0=C2=A0-vga std \
  =C2=A0=C2=A0=C2=A0=C2=A0-cpu host \
  =C2=A0=C2=A0=C2=A0=C2=A0-net nic,vlan=3D0 \
  =C2=A0=C2=A0=C2=A0=C2=A0-net user,vlan=3D0,hostfwd=3Dtcp::10024-:22,hostf=
wd=3Dtcp::8082-:80

  - SSH into the VM, install httpd, start httpd

  $ ssh -p 10024 root@localhost 'dnf install -y httpd && systemctl start
  httpd'

  - Compile and run the following Java program (on the host):

  $ cat <<EOF > URLConnectionReader.java
  import java.net.*;
  import java.io.*;

  public class URLConnectionReader {
  =C2=A0=C2=A0=C2=A0=C2=A0public static void main(String[] args) throws Exc=
eption {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i =3D 0;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (i < 1024) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0U=
RL this_is_404 =3D new URL("http://localhost:8082/blah");
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0U=
RLConnection yc =3D this_is_404.openConnection();
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0t=
ry {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0BufferedReader in =3D new BufferedReader(new InputS=
treamReader(
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0yc.getInputStream()));
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0String inputLine;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0while ((inputLine =3D in.readLine()) !=3D null)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0System.out.println(inputLin=
e);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0in.close();
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}=
 catch (Exception e) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0//HttpURLConnection urlConnection =3D (HttpURLConne=
ction) yc;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0//urlConnection.disconnect();
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i=
++;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thread.sleep(1000000000);
  =C2=A0=C2=A0=C2=A0=C2=A0}
  }

  $ javac URLConnectionReader.java

  $ java URLConnectionReader &

  The java program tries to open a lot of HTTP connections, but never
  calls disconnect() on any.

  - Take a look at the list of open FDs of the qemu process:

  $ ls -tl /proc/${qemu-pid}/fd

  $ lsof -p ${qemu-pid}
  All of the TCP connections will be stuck at FIN_WAIT2

  The VM becomes unresponsive. Neither SSH or VNC works after this; even
  after tcp_fin_timeout expires.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1668273/+subscriptions

