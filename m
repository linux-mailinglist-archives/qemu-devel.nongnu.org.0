Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901DA1F6375
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 10:23:28 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjIUh-0006KA-I2
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 04:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjITW-0004qQ-PR
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42209
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjITV-0006qt-P7
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591863732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VJHM+TwjAxRBHe0a4pzzPVfVsFNVexAysscX9tQCoRA=;
 b=NryoytVnNbtXuOUKPbgq9OVW1JkNQp5AixALQkLVyZf11yyCYc/JpWrpSionJwOXMsE5dt
 e5QNWrqrmQ2HP0dgIAjd11d3x68nPpwMZPevTuchWMgwdOACkBjiO80SxKASkp4AusQixG
 N45Qpmi6YOSNPbOpn8TSDOVcOMsYe5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-W2eypy-JPJmohaCAFh0EhA-1; Thu, 11 Jun 2020 04:22:08 -0400
X-MC-Unique: W2eypy-JPJmohaCAFh0EhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1AFDBFC5
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 08:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90F7C10013D7;
 Thu, 11 Jun 2020 08:22:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 057321747D; Thu, 11 Jun 2020 10:22:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] build some devices as modules.
Date: Thu, 11 Jun 2020 10:21:52 +0200
Message-Id: <20200611082200.26331-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specifically devices which depend on shared libraries,
to reduce the runtime dependencies of core qemu.

v2:
 - better commit messages.
 - add some more devices.
 - general tidy up.

v3:
 - rebase, solve stubs conflict.
 - fix -vga $name
 - fix -device $name,help

Gerd Hoffmann (7):
  qdev: add support for device module loading
  build: fix device module builds
  ccid: build smartcard as module
  usb: build usb-redir as module
  vga: build qxl as module
  vga: build virtio-gpu only once
  vga: build virtio-gpu as module

 Makefile.objs            |  1 +
 Makefile.target          |  7 +++++
 include/hw/qdev-core.h   |  3 ++
 include/qemu/module.h    |  1 +
 hw/core/qdev.c           | 61 ++++++++++++++++++++++++++++++++++++++++
 qdev-monitor.c           |  5 ++++
 qom/qom-qmp-cmds.c       |  5 ++++
 softmmu/vl.c             |  4 +++
 stubs/hw-module.c        | 10 +++++++
 hw/Makefile.objs         |  2 ++
 hw/display/Makefile.objs | 28 ++++++++++--------
 hw/usb/Makefile.objs     | 13 ++++++---
 stubs/Makefile.objs      |  1 +
 13 files changed, 126 insertions(+), 15 deletions(-)
 create mode 100644 stubs/hw-module.c

-- 
2.18.4


