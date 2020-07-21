Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0B228093
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 15:08:02 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxs01-0006EV-Md
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 09:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxrzJ-0005pD-Vm
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:07:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25381
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxrzH-00015X-Py
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 09:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595336833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gqQDSq3K884aDqT8EPR7rlUvE4RMDcoGwgU6LXNZD5g=;
 b=CvDxNNLdD7vj2gEVxXpFTjhCLI/aKRTR23wzLbSWyz/dm6U6eGSRciQi8EQskwIkaZyCFR
 k45ciSZ/mlb98axeUaYJVDFc/xoNe248m5pxx4C6+I2AU6OCcLWN9qBNKT0N0tU4vdqb6i
 HFWtGM0QguLRW/a2GUM3NWZBe5ytfAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-GCTk8pxmP1G_LHdwSXeH-w-1; Tue, 21 Jul 2020 09:07:12 -0400
X-MC-Unique: GCTk8pxmP1G_LHdwSXeH-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1526A58;
 Tue, 21 Jul 2020 13:07:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE1FE69317;
 Tue, 21 Jul 2020 13:07:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A7D6111CA27; Tue, 21 Jul 2020 15:07:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] QAPI patches patches for 2020-07-21
Date: Tue, 21 Jul 2020 15:07:08 +0200
Message-Id: <20200721130709.1242662-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 03:39:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af3d69058e09bede9900f266a618ed11f76f49f3:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200720' into staging (2020-07-20 15:58:07 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-07-21

for you to fetch changes up to cbf97d5b799f4bc47b9e825100d1a98d3cf77c80:

  qapi: Fix visit_type_STRUCT() not to fail for null object (2020-07-21 14:38:23 +0200)

----------------------------------------------------------------
QAPI patches patches for 2020-07-21

----------------------------------------------------------------
Markus Armbruster (1):
      qapi: Fix visit_type_STRUCT() not to fail for null object

 scripts/qapi/visit.py | 1 +
 1 file changed, 1 insertion(+)

-- 
2.26.2


