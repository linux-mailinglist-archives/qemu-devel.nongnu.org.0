Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F2702E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:41:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsX-0008LW-FL; Mon, 15 May 2023 09:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqq-0004TS-7d
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqn-00011L-0G
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wa7lroBwX8eGov14ZuIfxfc/Q7d65wWLO6J/WwGB63M=;
 b=CCOWDzmjXzEJvOxmastxeP4k0mM7CSLhlnElPhz2BpVFD5hs/TPRMoeAOmGypi6b/0f89k
 nQsk4FtPv59cIOJvALN3MCtEOp/ZycTmaeKnJnN3NU799vbUTVOqMN93VpP/ocGgjhYqut
 PD65FAmYhFLBLBMY/57h0LguHllDKTk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-BCtTISpDOoahAlYiSuTyOA-1; Mon, 15 May 2023 09:02:48 -0400
X-MC-Unique: BCtTISpDOoahAlYiSuTyOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D2FB3855569;
 Mon, 15 May 2023 13:02:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D6140C6EC4;
 Mon, 15 May 2023 13:02:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Ani Sinha <anisinha@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 07/21] tests: libvirt-ci: Update to commit 'c8971e90ac' to pull
 in mformat and xorriso
Date: Mon, 15 May 2023 15:02:19 +0200
Message-Id: <20230515130233.418183-8-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <anisinha@redhat.com>

Pull in the following changes from lcitool:

* tests/lcitool/libvirt-ci 85487e1...c8971e9 (18):
  > mappings: add new package mappings for mformat and xorriso
  > docs: testing: Update contents with tox
  > .gitlab-ci.yml: Always test against installed lcitool
  > gitlab-ci.yml: Start using tox for testing
  > tox: Allow running with custom pytest options with {posargs}
  > gitignore: Add the default .tox directory
  > dev-requirements: Reference VM requirements
  > requirements: Add tox to dev-requirements.txt and drop pytest and flake
  > test-requirements: Rename to dev-requirements.txt
  > Add tox.ini configuration file
  > tests: commands: Consolidate the installed package/run from git tests
  > Add a pytest.ini
  > facts: targets: Drop Fedora 36 target
  > gitlab-ci.yml: Add Fedora 38 target
  > facts: targets: Add Fedora 38
  > facts: mappings: Drop 'zstd' mapping
  > facts: projects: nbdkit: Replace zstd mapping with libzstd
  > docs: mappings: Add a section on the preferred mapping naming scheme

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20230504154611.85854-2-anisinha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/lcitool/libvirt-ci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 85487e1404..c8971e90ac 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
+Subproject commit c8971e90ac169ee2b539c747f74d96c876debdf9
-- 
2.31.1


