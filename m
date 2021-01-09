Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0892EFDB0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:28:56 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5rz-0001dZ-0a
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pm-0008JP-4j
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pj-0006xq-JQ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:37 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pf-0007QW-Qg
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 23BCB2E817C
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:51 -0000
From: Launchpad Bug Tracker <1712027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: h14522 janitor th-huth
X-Launchpad-Bug-Reporter: Huang Yong (h14522)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150330672268.8725.17665790368733773133.malonedeb@soybean.canonical.com>
Message-Id: <161016587168.8490.12377279554741922945.malone@loganberry.canonical.com>
Subject: [Bug 1712027] Re: qemu: Cryptography adding encrypted disk with luks
 format failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: fb3dd785e0596b56ccff8493b1223b03559be47f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1712027 <1712027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1712027

Title:
  qemu: Cryptography adding encrypted disk with luks format failed

Status in QEMU:
  Expired

Bug description:
  I'm using libvirt to attach luks encrypted disk to a running VM. The
  qemu-monitor-command like the

  following:

  {"execute":"object-add","arguments":{"qom-type":"secret","id":"virtio-
  disk11-luks-
  secret0","props":{"data":"El7jOYLCZwrij2Mue0q2tA=3D=3D","keyid":"masterKe=
y0","iv":"J2je0WJjCa89L3iKc1lceg=3D=3D","format":"base64"}}

  the masterKey0 specify the secret which has been created before.

  command above return with error message "Incorrect number of padding
  bytes XXX found on decrypted

  data". This is triggered by the following code snippets in qemu/crypto/se=
cret.c:
           =

  if (plaintext[ciphertextlen - 1] > 16 ||
               plaintext[ciphertextlen - 1] > ciphertextlen) {
               error_setg(errp, "Incorrect number of padding bytes (%d) "
                       "found on decrypted data",
                       (int)plaintext[ciphertextlen - 1]); =

                     =E2=80=A6
           }

  The bug is: There is on padding in plaintext if the actual length of
  the plaintext  decrypted is

  equal to ciphertext.

  In this case, the last element in plaintext array may be one of the
  character in base64 code table

  or other.

  I would like to know why length of padding bytes cannot exceed 16 and
  whether i can remove

  judement: =E2=80=9Cplaintext[ciphertextlen - 1] > 16=E2=80=9D so that I c=
an eliminate
  the error above.

  Much appreciate it if doubts above is cleared up.

  libvirt/qemu version:

  # virsh version
  Compiled against library: libvirt 3.0.0
  Using library: libvirt 3.0.0
  Using API: QEMU 3.0.0
  Running hypervisor: QEMU 2.7.1

  OS: Ubuntu 12.04 LTS

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1712027/+subscriptions

