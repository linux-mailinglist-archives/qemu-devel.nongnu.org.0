Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859292B1B9F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:10:33 +0100 (CET)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYqU-0006LT-Qr
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYm8-00033V-BZ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:06:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYm6-0006H5-E6
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605272757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pntoUoq4tAYXwWYCY3c34cNy+7HODmYpHCEPpKposHU=;
 b=AitS8jA7lJaiQvxME40Lrktb6UzU6Eu2OG0gl7lwi4nfnKxFYi1YRXQnsRNfGRc/KrmjNl
 vD+gXoJZtC9RpTuLVHYlySOQs/aqtKOjhMoZBSRtTAObuqt1jjV0jn2cowsXSWPp2VbYPi
 dYVUz/3ibusHl0t5pfc4QXhQKIaDpag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-r01CdUWBNe-3N9p7y3L5Jw-1; Fri, 13 Nov 2020 08:05:53 -0500
X-MC-Unique: r01CdUWBNe-3N9p7y3L5Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD3218C89C1;
 Fri, 13 Nov 2020 13:05:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FCDC5C1C7;
 Fri, 13 Nov 2020 13:05:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	kwolf@redhat.com,
	lichun@ruijie.com.cn
Subject: [PULL 0/3] hmp queue
Date: Fri, 13 Nov 2020 13:05:45 +0000
Message-Id: <20201113130548.127093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit be2df2ac6f6b9eeee21cc057de0a119ac30fbc60:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20201112' into staging (2020-11-13 11:36:30 +0000)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-hmp-20201113

for you to fetch changes up to e7cff9c68d4a46343861fbc3cc6b2a0b63b2dbb8:

  hmp: Pass monitor to mon_get_cpu_env() (2020-11-13 12:45:51 +0000)

----------------------------------------------------------------
HMP fixes

Kevin's HMP fixes

----------------------------------------------------------------
Kevin Wolf (3):
      hmp: Pass monitor to mon_get_cpu()
      hmp: Pass monitor to MonitorDef.get_value()
      hmp: Pass monitor to mon_get_cpu_env()

 include/monitor/hmp-target.h |  7 ++++---
 monitor/hmp.c                |  2 +-
 monitor/misc.c               | 24 ++++++++++++------------
 monitor/monitor-internal.h   |  2 +-
 target/i386/monitor.c        | 11 ++++++-----
 target/m68k/monitor.c        |  2 +-
 target/nios2/monitor.c       |  2 +-
 target/ppc/monitor.c         | 22 +++++++++++++---------
 target/riscv/monitor.c       |  2 +-
 target/sh4/monitor.c         |  2 +-
 target/sparc/monitor.c       | 12 +++++++-----
 target/xtensa/monitor.c      |  2 +-
 12 files changed, 49 insertions(+), 41 deletions(-)


