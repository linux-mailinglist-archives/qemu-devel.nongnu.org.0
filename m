Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11012131B15
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 23:11:22 +0100 (CET)
Received: from localhost ([::1]:41402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioaam-0003Gx-Pj
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 17:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1ioaZ5-0002Ml-Tm
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 17:09:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1ioaZ4-0001jV-2N
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 17:09:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57494
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1ioaZ3-0001il-Uu
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 17:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578348572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fcSjpcd21qXBW+4apwtw2IUf964xPGzRuPSVWKaCgec=;
 b=L+cvwEvehAF13kyOumsBFmLBYZCqaY4H5c7ys8cgqDfXo0mOOeJRDcmXPsZVK8AJkekTYu
 NhVw9RGZgONjLlYHR7k1ApGIRH8uo5c/IZubEs2vUR0ebAyeFASu0yTSTgQ4ZycYLEIhgC
 AmXj/8EW5obdR/yrKFtbodgvl9HsXDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-3JFRHRLNNxutpc7XqBz7Ag-1; Mon, 06 Jan 2020 17:09:31 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78381800D4E
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 22:09:30 +0000 (UTC)
Received: from gimli.home (ovpn-116-26.phx2.redhat.com [10.3.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E24D19C58;
 Mon,  6 Jan 2020 22:09:27 +0000 (UTC)
Subject: [PULL 0/1] VFIO fixes 2020-01-06
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 06 Jan 2020 15:09:27 -0700
Message-ID: <157834844263.18456.7231217269341794728.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 3JFRHRLNNxutpc7XqBz7Ag-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

The following changes since commit 48008198270e3ebcc9394401d676c54ed5ac139c:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-12-20 11:20:25 +0000)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20200106.0

for you to fetch changes up to 0446f8121723b134ca1d1ed0b73e96d4a0a8689d:

  vfio/pci: Don't remove irqchip notifier if not registered (2020-01-06 14:19:42 -0700)

----------------------------------------------------------------
VFIO fixes 2020-01-06

 - Fix irqchip notifier de-registration if not registered (Peter Xu)

----------------------------------------------------------------
Peter Xu (1):
      vfio/pci: Don't remove irqchip notifier if not registered

 hw/vfio/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


