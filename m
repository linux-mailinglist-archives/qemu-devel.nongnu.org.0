Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11B37776E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:52:01 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfliq-0008Iv-7b
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhV-0006RR-20
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:58082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflhT-00014I-I9
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:50:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflhR-0003nY-IQ
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:50:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8343E2E8136
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:50:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:43:43 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1925449@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161908205011.22595.14403926604204873586.malonedeb@gac.canonical.com>
Message-Id: <162057502388.2775.17368306774255340344.malone@wampee.canonical.com>
Subject: [Bug 1925449] Re: Failure building with clang-10 and libssh 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 86c74350a25b8b9793554a7765734e63f346e7fc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1925449 <1925449@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/234


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #234
   https://gitlab.com/qemu-project/qemu/-/issues/234

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925449

Title:
  Failure building with clang-10 and libssh

Status in QEMU:
  Invalid

Bug description:
  On Fedora 32, configuring with --enable-libssh and building with
  clang:

  qemu 5.2.94

    Compilation
      host CPU                     : x86_64
      host endianness              : little
      C compiler                   : clang-10
      Host C compiler              : clang-10

    Dependencies
      libssh support               : YES

  triggers:

  FAILED: libblock.fa.p/block_ssh.c.o =

  block/ssh.c:349:13: error: 'ssh_is_server_known' is deprecated [-Werror,-=
Wdeprecated-declarations]
      state =3D ssh_is_server_known(s->session);
              ^
  /usr/include/libssh/libssh.h:546:1: note: 'ssh_is_server_known' has been =
explicitly marked deprecated here
  SSH_DEPRECATED LIBSSH_API int ssh_is_server_known(ssh_session session);
  ^
  /usr/include/libssh/libssh.h:84:40: note: expanded from macro 'SSH_DEPREC=
ATED'
  #define SSH_DEPRECATED __attribute__ ((deprecated))
                                         ^
  block/ssh.c:444:9: error: 'ssh_get_publickey' is deprecated [-Werror,-Wde=
precated-declarations]
      r =3D ssh_get_publickey(s->session, &pubkey);
          ^
  /usr/include/libssh/libssh.h:543:1: note: 'ssh_get_publickey' has been ex=
plicitly marked deprecated here
  SSH_DEPRECATED LIBSSH_API int ssh_get_publickey(ssh_session session, ssh_=
key *key);
  ^
  /usr/include/libssh/libssh.h:84:40: note: expanded from macro 'SSH_DEPREC=
ATED'
  #define SSH_DEPRECATED __attribute__ ((deprecated))
                                         ^
  2 errors generated.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925449/+subscriptions

