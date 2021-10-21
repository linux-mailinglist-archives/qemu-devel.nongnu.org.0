Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A365435C9B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:07:12 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdT6V-0000nA-NV
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdT59-0008Ru-Lb
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:05:51 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:52130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mdT53-00029j-17
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:05:46 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 7E2163F70F
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1634803536;
 bh=ijCa7ZJzAt0MXeMqftUXIFhMx5WpDI1dnsKi0PnReNE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=drLzYc+ODKQE3SSTDAD12XP9TNjqKWSAfRBBZVShAAW4FgQ2tKmCH8k0KDCBzuLhi
 FQ5PVimUfTj9eWGS+564qIWYyJMcG4FKNNqfk+vv3spj3sXcrgu3D0AQZhPed4mqG1
 0othwIxugImJPfSFLlbH+tBxkgQcFpnxYxfGOTq5qihig4qowwwISebqFwbiPBfOW3
 aKGqgQwjeHhZS6lPj5bhnxS5XUEpeL14OHhX41K3SpOIdbtkS/yonf8BWJE5axktt6
 5NPLI4HEwmFj6R68F49GMOpPwZMZanY6uYOhcR6vjW/dqQJ8Z8gtVubnGsokh2PUqs
 GF6V1McTItOMQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D5EE72E8186
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Oct 2021 08:00:20 -0000
From: Thomas Huth <1947933@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fysnet th-huth
X-Launchpad-Bug-Reporter: Benjamin David Lunt (fysnet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <163478174635.4762.7000104834501032351.malonedeb@wampee.canonical.com>
Message-Id: <163480322041.23599.10756211159107611552.malone@chaenomeles.canonical.com>
Subject: [Bug 1947933] Re: xHCI Port Status Change Event at port powered
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: c432885420f0c40c1b6c824f07623f392fbd66ea
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1947933 <1947933@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug tracker is not used anymore. Please open new tickets here:

https://gitlab.com/qemu-project/qemu/-/issues

** Changed in: qemu
       Status: New =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1947933

Title:
  xHCI Port Status Change Event at port powered

Status in QEMU:
  Invalid

Bug description:
  Per section 4.19.3 of the xHCI version 1.0 specification, when the
  Port Power bit transitions from 0 to 1, if there is a connection on
  that port, a Port Status Change Event should be issued.

  Currently, when the port is powered, this event is not being issued.

  I don't know the QEMU code base well enough to submit a patch, but I
  believe that when the port is powered, check to see if there is a
  connection (hence, setting the CCS and CSC bits), and then a call to:

  xhci_port_notify(port, PORTSC_PLC);

  will suffice.

  Thank you,
  Ben

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1947933/+subscriptions


