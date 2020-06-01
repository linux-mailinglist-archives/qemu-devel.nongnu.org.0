Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5011EA553
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 15:52:44 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfkrr-0000Xr-8q
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 09:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jfkne-0003oM-68; Mon, 01 Jun 2020 09:48:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:38784 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jfknb-0001k6-WA; Mon, 01 Jun 2020 09:48:21 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jfknN-0005dY-JG; Mon, 01 Jun 2020 16:48:05 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/6] iotests: Dump QCOW2 dirty bitmaps metadata
Date: Mon,  1 Jun 2020 16:48:07 +0300
Message-Id: <1591019293-211155-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 09:48:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirty bitmap information to QCOW2 metadata dump in qcow2.py script.

v3:
  01: JSON format output possibility added.

v2:
  01: Refactoring of the Python code in the script qcow2.py.
      New methods were added. The bitmap dictionary was instantiated.
      The all of bitmaps information is read completely before
      printing the dictionary.
  02: The outputs of the tests 031, 036 and 061 were modified.

Andrey Shinkevich (6):
  iotests: Add extension names to qcow2.py dump
  iotests: move check for printable data to QcowHeaderExtension class
  iotests: dump bitmap extension data with qcow2.py
  iotests: Dump bitmap directory info with qcow2.py
  iotests: Dump bitmap table entries serialized in QCOW2 image
  iotests: Dump QCOW2 image metadata in JSON format with qcow2.py

 tests/qemu-iotests/031.out  |  22 +--
 tests/qemu-iotests/036.out  |   4 +-
 tests/qemu-iotests/061.out  |  18 +--
 tests/qemu-iotests/qcow2.py | 338 ++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 346 insertions(+), 36 deletions(-)

-- 
1.8.3.1


