Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E33CE8E2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 18:16:22 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHVgK-0004PR-Hf
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 12:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iHVVQ-0001g8-7c
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iHVVP-0006Zx-3S
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:05:04 -0400
Received: from relay.sw.ru ([185.231.240.75]:56608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iHVVH-0006SF-3m; Mon, 07 Oct 2019 12:04:55 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iHVVD-0003oB-Jq; Mon, 07 Oct 2019 19:04:51 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 0/2] qcow2: add zstd cluster compression
Date: Mon,  7 Oct 2019 19:04:49 +0300
Message-Id: <20191007160451.27334-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, dplotnikov@virtuozzo.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is my proposal, about how to correctly update qcow2 specification
to introduce new field, keeping in mind currently existing images and
downstream Qemu instances.

Let's consider discussing from this.

I called it v7, as it's a continuation of
"[PATCH v6 0/3] qcow2: add zstd cluster compression". Still there are
actually only two preparing patches, so, if we like them (may be after
some resends) Denis's series should be rebased on these two patches.

Vladimir Sementsov-Ogievskiy (2):
  docs: improve qcow2 spec about extending image header
  docs: qcow2: introduce compression type feature

 docs/interop/qcow2.txt | 43 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

-- 
2.21.0


