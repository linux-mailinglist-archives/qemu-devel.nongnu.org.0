Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8A296A5A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 09:36:09 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVrcP-0001Oc-0I
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 03:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVraU-00086G-Tq
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVraT-0003Wv-5C
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603438448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=/t7nK2D86IMy+ol9V2A0GPOGZZrGGwFOfGY69QnSpv4=;
 b=hMneLpgSLgTP6mJT9TY79fY4YXCUDokGc50mtODfxUlUGCdb/BXRvijHaT9Ip/78wLF1nr
 2URkiqRlVQkbj80j6aGM6JfdhlHUljzrD5KeXW2bVxHYfr9il2d9mpBCMWWhl/LVaCDw+3
 atoSnTkdKJbYF2WJ0LytRMXRbWKqKps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-aSbFSs8OMoWzRsTHynZwfQ-1; Fri, 23 Oct 2020 03:34:04 -0400
X-MC-Unique: aSbFSs8OMoWzRsTHynZwfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACFE8192AB65;
 Fri, 23 Oct 2020 07:34:03 +0000 (UTC)
Received: from thuth.com (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76B6D55775;
 Fri, 23 Oct 2020 07:34:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/4] tests/acceptance/ppc_prep_40p: Fix the URL to the
 NetBSD-4.0 archive
Date: Fri, 23 Oct 2020 09:33:48 +0200
Message-Id: <20201023073351.251332-2-thuth@redhat.com>
In-Reply-To: <20201023073351.251332-1-thuth@redhat.com>
References: <20201023073351.251332-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current URL on cdn.netbsd.org is failing - using archive.netbsd.org
instead seems to be fine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/ppc_prep_40p.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 1515561249..e82755c9cf 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -35,7 +35,7 @@ class IbmPrep40pMachine(Test):
                     '7020-40p/P12H0456.IMG')
         bios_hash = '1775face4e6dc27f3a6ed955ef6eb331bf817f03'
         bios_path = self.fetch_asset(bios_url, asset_hash=bios_hash)
-        drive_url = ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-archive/'
+        drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
                      'NetBSD-4.0/prep/installation/floppy/generic_com0.fs')
         drive_hash = 'dbcfc09912e71bd5f0d82c7c1ee43082fb596ceb'
         drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash)
-- 
2.18.2


