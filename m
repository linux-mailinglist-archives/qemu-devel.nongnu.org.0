Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A42FB21C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:54:56 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kul-0007pM-SP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1kRi-0002dw-EW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 01:24:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:37940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1kRg-0000wf-7S
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 01:24:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1kRd-0002zh-Sz
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:24:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CCACE2E8138
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:24:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 06:11:15 -0000
From: Christ Schlacta <1269628@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Tags: feature request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aarcane-s janitor th-huth
X-Launchpad-Bug-Reporter: Christ Schlacta (aarcane-s)
X-Launchpad-Bug-Modifier: Christ Schlacta (aarcane-s)
References: <20140115225230.25222.33088.malonedeb@wampee.canonical.com>
Message-Id: <161103667631.11395.18187554150167751303.launchpad@gac.canonical.com>
Subject: [Bug 1269628] Re: Feature Request: Please add TCG OPAL 2 emulation
 support to the virtio disk emulation
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: cd7ab96ce0b5e7e06f28c1372e0eac7b0c974239
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
Reply-To: Bug 1269628 <1269628@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Expired =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1269628

Title:
  Feature Request:  Please add TCG OPAL 2 emulation support to the
  virtio disk emulation

Status in QEMU:
  New

Bug description:
  In order to allow windows guests (and soon, linux guests) which are
  TCG OPAL 2 aware to perform disk encryption in a native fashion with
  hardware acceleration, please add TCG OPAL 2 emulation to the VIRTIO
  driver.

  Encryption should occur at the host level using any cryptographic
  facilities available to the host, for example AES-NI, Cryptography
  Hardware, underlying block device cryptography support where available
  or any other cryptography facility that may be developed and
  implemented in the future.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1269628/+subscriptions

