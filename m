Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B450351500
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:14:15 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRx9J-00036J-Kt
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7f-0001j4-79
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7b-0004JE-12
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7NubW1/sIrfaxOxuN6AH7b8Tag5TtDvkNKly9dG2Xts=;
 b=cpglUhImKciRMLU/971cg7sCykl2V9gXr2O6NpXkoVPQt5hJysWVm81IEKIq3tYiU0aFeg
 BokyAZqDtsPpr7tMS8r6NAfQWF05/zbBuuLqwPKULgegxvQdtKbdDz5bUwbw4bkqYKmPdl
 NR5KWZ6hn0NpcEf4wtQJPIyJg0lcmfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-EbAPg3DiNTCrTSvfCyZAjg-1; Thu, 01 Apr 2021 09:12:24 -0400
X-MC-Unique: EbAPg3DiNTCrTSvfCyZAjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32AF5107ACCD;
 Thu,  1 Apr 2021 13:12:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516521378E;
 Thu,  1 Apr 2021 13:12:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/13] Updates to MAINTAINERS, docs, and some small fixes
Date: Thu,  1 Apr 2021 15:12:07 +0200
Message-Id: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210331' into staging (2021-03-31 13:14:18 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-04-01

for you to fetch changes up to ca89d15f8e42f2e5eac5bd200af38fdbfb32e875:

  device-crash-test: Ignore errors about a bus not being available (2021-04-01 14:28:39 +0200)

----------------------------------------------------------------
* Updates for the MAINTAINERS file
* Some small documentation updates
* Some small misc fixes
----------------------------------------------------------------

Connor Kuehl (1):
      MAINTAINERS: add virtio-fs mailing list

Dongjiu Geng (1):
      MAINTAINERS: replace Huawei's email to personal one

Hyman Huang(黄勇) (1):
      MAINTAINERS: Fix tests/migration maintainers

Mahmoud Mandour (1):
      util/compatfd.c: Fixed style issues

Markus Armbruster (1):
      qom: Fix default values in help

Matthew Rosato (1):
      MAINTAINERS: add/replace backups for some s390 areas

Philippe Mathieu-Daudé (2):
      MAINTAINERS: Mark RX hardware emulation orphan
      MAINTAINERS: Mark SH-4 hardware emulation orphan

Thomas Huth (5):
      MAINTAINERS: Drop the lines with Sarah Harris
      MAINTAINERS: Drop the line with Xiang Zheng
      docs: Remove obsolete paragraph about config-target.mak
      docs: Fix typo in the default name of the qemu-system-x86_64 binary
      device-crash-test: Ignore errors about a bus not being available

 MAINTAINERS                 | 35 +++++++++++++++++------------------
 docs/defs.rst.inc           |  2 +-
 docs/devel/build-system.rst |  8 --------
 qom/object_interfaces.c     |  2 +-
 scripts/device-crash-test   |  1 +
 util/compatfd.c             |  6 +++---
 6 files changed, 23 insertions(+), 31 deletions(-)


