Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA62D3133
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:16:23 +0200 (CEST)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIdvB-0001Cl-QK
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1iIdtd-0000hF-S6
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1iIdtc-00014P-B9
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1iIdtc-00014G-5e
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:14:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4601B3090FDD
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 19:14:42 +0000 (UTC)
Received: from gimli.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0264A5DD7A;
 Thu, 10 Oct 2019 19:14:39 +0000 (UTC)
Subject: [PULL 0/1] vfio update 2019-10-10
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Oct 2019 13:14:39 -0600
Message-ID: <157073476983.23153.13333563650903948665.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 10 Oct 2019 19:14:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e72d:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into
staging (2019-10-08 16:08:35 +0100)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20191010.0

for you to fetch changes up to d964d3b5abb5242591a088dacb1dc01e608b5158:

  hw/vfio/pci: fix double free in vfio_msi_disable (2019-10-10 11:07:28 -0600)

----------------------------------------------------------------
VFIO update 2019-10-10

 - Fix MSI error path double free (Evgeny Yakovlev)

----------------------------------------------------------------
Evgeny Yakovlev (1):
      hw/vfio/pci: fix double free in vfio_msi_disable

 hw/vfio/pci.c | 1 +
 1 file changed, 1 insertion(+)

