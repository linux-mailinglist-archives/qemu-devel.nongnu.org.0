Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE95DC1B2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 11:49:53 +0200 (CEST)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLOtM-00084b-2P
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 05:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOre-0006hZ-GK
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOrd-0005Z6-I1
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:42966)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOra-0005Wa-TL; Fri, 18 Oct 2019 05:48:03 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOrX-0004Ah-94; Fri, 18 Oct 2019 12:47:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 0/3] qcow2: add zstd cluster compression
Date: Fri, 18 Oct 2019 12:47:55 +0300
Message-Id: <20191018094758.7124-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, dplotnikov@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is my proposal, about how to correctly update qcow2 specification
to introduce new field, keeping in mind currently existing images and
downstream Qemu instances.

v8: Add padding, and clarify "zero equals absence" concept.
    Move some points to commit message from the spec itself.
    Fix s/108/105 in 02

Vladimij Sementsov-Ogievskiy (3):
  docs: improve qcow2 spec about extending image header
  docs: define padding for qcow2 header
  docs: qcow2: introduce compression type feature

 docs/interop/qcow2.txt | 48 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

-- 
2.21.0


