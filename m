Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB6667CF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 09:36:39 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlq6f-00087v-TB
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 03:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39015)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hlq6N-0007QX-Le
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hlq6L-0000lP-Rr
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33563)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hlq6K-0000ir-96
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2E553003E5F;
 Fri, 12 Jul 2019 07:36:12 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-201.sin2.redhat.com
 [10.67.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F9FD60A9A;
 Fri, 12 Jul 2019 07:36:04 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: mst@redhat.com
Date: Fri, 12 Jul 2019 13:05:51 +0530
Message-Id: <20190712073554.21918-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 12 Jul 2019 07:36:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] virtio pmem: coverity fixes
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
Cc: pagupta@redhat.com, peter.maydell@linaro.org, cohuck@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series two fixes for coverity and a 
transactional info removal patch.

Pankaj Gupta (3):
  virtio pmem: fix wrong mem region condition
  virtio pmem: remove memdev null check
  virtio pmem: remove transational device info

 hw/virtio/virtio-pmem-pci.c | 4 +---
 hw/virtio/virtio-pmem.c     | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.14.5


