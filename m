Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABD3739A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:46:02 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFyb-0003Rl-4O
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFuF-0001k4-5L
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:54608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFu3-0002JS-R8
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:41:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFu2-0003X0-Bs
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:41:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5893E2E8186
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:41:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:28:00 -0000
From: Thomas Huth <1828207@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange pmaydell rawlik th-huth
X-Launchpad-Bug-Reporter: Druta Pavel (rawlik)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155731026034.22594.3160504765111033354.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021408098.14396.12347986485485265070.malone@soybean.canonical.com>
Subject: [Bug 1828207] Re: Request to add something like "Auth failed from IP"
 log report for built-in VNC server
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 5b69a48075b7364cd52132c87fddd4a00fd4b816
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
Reply-To: Bug 1828207 <1828207@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/170


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #170
   https://gitlab.com/qemu-project/qemu/-/issues/170

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828207

Title:
  Request to add something like "Auth failed from IP" log report for
  built-in VNC server

Status in QEMU:
  Expired

Bug description:
  In environment with needs of public accessible VNC ports there is no logs=
 or other registered events about authentication failures to analyze and/or=
 integrate it to automated services like fail2ban ans so on.
  Thus the built-in VNC service is vulnerable to brutforce attacks and in c=
ombination with weak built-in VNC-auth scheme can be a security vulnerabili=
ty.

  Adding a simple log record like "QEMU VNC Authentication failed
  192.168.0.5:5902 - 123.45.67.89:7898" will permit to quickly integrate
  it to fail2ban system.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828207/+subscriptions

