Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF33966F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 22:06:34 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZL8D-0006jw-4P
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51913)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZJfT-0006Ex-Fc
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZJfR-0000Zq-FG
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9053)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZJfQ-0000T2-GB
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 14:32:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E68CD2E97DE;
 Fri,  7 Jun 2019 18:32:32 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D7F8CFBA;
 Fri,  7 Jun 2019 18:32:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri,  7 Jun 2019 15:32:26 -0300
Message-Id: <20190607183228.22454-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 07 Jun 2019 18:32:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Machine Core queue, 2019-06-07
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 185b7ccc11354cbd69b6d53bf8d831dd964f6c88:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190607-2' into staging (2019-06-07 15:24:13 +0100)

are available in the Git repository at:

  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request

for you to fetch changes up to 754f1dbcf1d4d543167e3212366055761c30bcf4:

  accel: Remove unused AccelClass::opt_name attribute (2019-06-07 15:28:46 -0300)

----------------------------------------------------------------
Machine Core queue, 2019-06-07

* Improve CPU hotplug error message
  (Laurent Vivier)
* Remove unused AccelClass::opt_name field
  (Wainer dos Santos Moschetta)

----------------------------------------------------------------

Queue for Machine Core patches


Laurent Vivier (1):
  numa: improve cpu hotplug error message with a wrong node-id

Wainer dos Santos Moschetta (1):
  accel: Remove unused AccelClass::opt_name attribute

 include/sysemu/accel.h | 1 -
 numa.c                 | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.18.0.rc1.1.g3f1ff2140


