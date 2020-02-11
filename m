Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B221591E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:27:14 +0100 (CET)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1WVN-0002fQ-O5
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WUC-0001Nd-0j
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j1WUA-0002Ri-Ow
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:25:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:45000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WUA-0002QA-Gf
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:25:58 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j1WU4-00009Q-6v; Tue, 11 Feb 2020 17:25:52 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] Improve virtio_check_params test
Date: Tue, 11 Feb 2020 17:25:49 +0300
Message-Id: <20200211142551.13072-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
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
Cc: cohuck@redhat.com, philmd@redhat.com, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* fixed failing on non-existed machine type removal
* the test refactored to add more parameters to check

Gereral questions left:
   How to restric test for using:
   1. on a set of target OS-es
   2. on a set target architectures
  

Denis Plotnikov (2):
  tests/acceptance/virtio_check_params: remove excluded machine types
    carefully
  tests/acceptance/virtio_check_params: prepare to check different
    params

 tests/acceptance/virtio_check_params.py | 52 ++++++++++++++++---------
 1 file changed, 33 insertions(+), 19 deletions(-)

-- 
2.17.0


