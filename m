Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F91430B0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 18:17:14 +0100 (CET)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itafo-0007VE-Jn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 12:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1itacs-0005In-2G
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:14:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1itacr-0004QD-4o
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 12:14:09 -0500
Received: from relay.sw.ru ([185.231.240.75]:37426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1itaco-0004OQ-Nj; Mon, 20 Jan 2020 12:14:06 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1itaci-0002hc-47; Mon, 20 Jan 2020 20:14:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v10 0/2] qcow2: add zstd cluster compression
Date: Mon, 20 Jan 2020 20:13:43 +0300
Message-Id: <20200120171345.24345-1-vsementsov@virtuozzo.com>
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
 qemu-devel@nongnu.org, dplotnikov@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is my proposal, about how to correctly update qcow2 specification
to introduce new field, keeping in mind currently existing images and
downstream Qemu instances.

v10: Spelling/structure improvements by Max

v9: Merge 01 and 02
    Change wordings
    Require header alignment

Vladimir Sementsov-Ogievskiy (2):
  docs: improve qcow2 spec about extending image header
  docs: qcow2: introduce compression type feature

 docs/interop/qcow2.txt | 58 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.21.0


