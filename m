Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC32B681C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:58:59 +0100 (CET)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Rd-0000L1-JC
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2QX-0007uK-N2
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2QU-0000kR-Bh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605625064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qet0PwxiW3DVJcEUrA4AXcgBlDPym3TBpA/WD9mtWv8=;
 b=MEKlYegiagEuIG7i1VsO5QvVFfkwdRR/FVOk3NPT95UPsrAErBcSkZPgc3Ai70xiTYQheq
 S08qXOPw2XSKTDSe9QcGXHYZgAr2Lo6plNS/BgLN6mHp0/o8DA8dy86UPf3Voqx6/3ye1X
 AOVtFIODEk6piKwBRXlghuKELspUlx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-ubakkycDOwKOPdctx7ixEQ-1; Tue, 17 Nov 2020 09:57:43 -0500
X-MC-Unique: ubakkycDOwKOPdctx7ixEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF4B5F9D1;
 Tue, 17 Nov 2020 14:57:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9623510013BD;
 Tue, 17 Nov 2020 14:57:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E09411358BA; Tue, 17 Nov 2020 15:57:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] QObject patches patches for 2020-11-17
Date: Tue, 17 Nov 2020 15:57:38 +0100
Message-Id: <20201117145739.3314926-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1c7ab0930a3e02e6e54722c20b6b586364f387a7:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-11-17 11:50:11 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qobject-2020-11-17

for you to fetch changes up to 922d42bb0d08c154602dd9112da00d22d2b46579:

  json: Fix a memleak in parse_pair() (2020-11-17 15:39:53 +0100)

----------------------------------------------------------------
QObject patches patches for 2020-11-17

----------------------------------------------------------------
Alex Chen (1):
      json: Fix a memleak in parse_pair()

 qobject/json-parser.c | 12 ++++++------
 tests/check-qjson.c   |  9 +++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.26.2


