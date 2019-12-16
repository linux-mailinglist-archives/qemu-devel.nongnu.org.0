Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9511FC20
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 01:23:22 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igeAT-0007cX-OA
	for lists+qemu-devel@lfdr.de; Sun, 15 Dec 2019 19:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ige90-0006Ie-E2
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 19:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ige8z-000665-GK
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 19:21:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45349
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ige8z-00061k-DC
 for qemu-devel@nongnu.org; Sun, 15 Dec 2019 19:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576455708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7IR6ewlBcwV4md0cSOov7RyetLSLGaIi1xQGhpC/i/s=;
 b=CWciwdVL8RnzoxfUcSowt7XQ9j6/bg2auueZTnDYMdm8dWp3tzFes+A+BB+f658LFulEsj
 NZ4gdYsyI34Ge3plI4IBMeOv7UC9ITVkgwlBFWq4xq9wQCCvw8oYzkDHDXSgibrKswBubX
 TE6aSoDZHzk4V8/lSfucZ1K1gF+xv2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ROBRgtlGOMazK0_j3QOjYQ-1; Sun, 15 Dec 2019 19:21:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88BD01005502;
 Mon, 16 Dec 2019 00:21:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC861001901;
 Mon, 16 Dec 2019 00:21:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/pci/pci_host: Small cleanups
Date: Mon, 16 Dec 2019 01:21:32 +0100
Message-Id: <20191216002134.18279-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ROBRgtlGOMazK0_j3QOjYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Use unsigned 'size' argument
- Remove unuseful DPRINTF()

Philippe Mathieu-Daud=C3=A9 (2):
  hw/pci/pci_host: Remove redundant PCI_DPRINTF()
  hw/pci/pci_host: Let pci_data_[read/write] use unsigned 'size'
    argument

 include/hw/pci/pci_host.h |  4 ++--
 hw/pci/pci_host.c         | 25 +++++++------------------
 2 files changed, 9 insertions(+), 20 deletions(-)

--=20
2.21.0


