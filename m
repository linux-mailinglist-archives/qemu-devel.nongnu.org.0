Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D814CC1B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 15:08:32 +0100 (CET)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwo19-0002hn-D1
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 09:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo09-0001Kp-Kt
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iwo08-0001D4-E2
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 09:07:29 -0500
Received: from relay.sw.ru ([185.231.240.75]:53598)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwo08-00013U-78; Wed, 29 Jan 2020 09:07:28 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iwnzt-0003j6-Dl; Wed, 29 Jan 2020 17:07:13 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] tests: rename virtio_seg_max_adjust to
 virtio_check_params
Date: Wed, 29 Jan 2020 17:07:02 +0300
Message-Id: <20200129140702.5411-5-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 stefanha@redhat.com, mreitz@redhat.com, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since, virtio_seg_max_adjust checks not only seg_max, but also
virtqueue_size parameter, let's make the test more general and
add new parameters to be checked there in the future.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 .../{virtio_seg_max_adjust.py => virtio_check_params.py}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tests/acceptance/{virtio_seg_max_adjust.py => virtio_check_params.py} (100%)

diff --git a/tests/acceptance/virtio_seg_max_adjust.py b/tests/acceptance/virtio_check_params.py
similarity index 100%
rename from tests/acceptance/virtio_seg_max_adjust.py
rename to tests/acceptance/virtio_check_params.py
-- 
2.17.0


