Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628B3A279
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 01:37:16 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZktf-00050R-Pi
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 19:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZkra-0003wn-6q
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZkrZ-0006aO-3R
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40466)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZkrY-0006UR-Tc
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B542CC01DDEF;
 Sat,  8 Jun 2019 23:34:54 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04AC35DD83;
 Sat,  8 Jun 2019 23:34:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  8 Jun 2019 20:34:46 -0300
Message-Id: <20190608233447.27970-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sat, 08 Jun 2019 23:34:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/1] Export machine type deprecation info
 through QMP
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes v1 -> v2:
* I've decided to get rid of the status-message and
  suggested-alternative fields, to avoid more bikeshedding.

This series adds machine type deprecation information to the
output of the `query-machines` QMP command.  With this, libvirt
and management software will be able to show this information to
users and/or suggest changes to VM configuration to avoid
deprecated machine types.

Eduardo Habkost (1):
  qmp: Add deprecation information to query-machines

 qapi/misc.json | 7 ++++++-
 vl.c           | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.18.0.rc1.1.g3f1ff2140


