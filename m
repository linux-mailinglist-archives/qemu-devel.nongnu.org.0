Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF22A25F0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 09:18:24 +0100 (CET)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZV2k-0007h5-N6
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 03:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZV0S-0006P2-Hp
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 03:16:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZV0P-0005fq-Ny
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 03:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604304955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EWmP5QDJjU4mKSiEC7MKhzhtOiXsXErvoKKBzEessRU=;
 b=KtHbpi/a6T92SuDmqvDX8HCj+tupf3FQDDbWL+kML5QPZOcdJdaRQiljoMmt3f+VM42LBA
 TvHLM3GBKbIgb4kbJgM4IheC+ZCScV5WU7zTCpqwIrSWpzdVnVCwf7O0C3MC4AIs59l40e
 rwbKPyF8SNekH7s+BVOGQ+ATFNWkQ0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-zJZS1_FEMg-gqlmyF1gozQ-1; Mon, 02 Nov 2020 03:15:53 -0500
X-MC-Unique: zJZS1_FEMg-gqlmyF1gozQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D20A1868401
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 08:15:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7007C5DA60
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 08:15:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DFE641132BD6; Mon,  2 Nov 2020 09:15:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] qapi: Doc & MAINTAINERS tweaks
Date: Mon,  2 Nov 2020 09:15:48 +0100
Message-Id: <20201102081550.171061-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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

Markus Armbruster (2):
  MAINTAINERS: Add QAPI schema modules to their subsystems
  qapi: Fix missing headers in QMP Reference Manual

 qapi/audio.json | 4 ++++
 qapi/authz.json | 6 ++++--
 MAINTAINERS     | 6 ++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.26.2


