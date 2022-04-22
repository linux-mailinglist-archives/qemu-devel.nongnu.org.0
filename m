Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC3D50C001
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:57:26 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyT7-0004in-Vt
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLk-0000T0-4f
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLi-0007tE-Hi
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0tyyR1YenCmBSIgH9GH8OO6TpEMnYwOYvNOwfCgb+c=;
 b=X8vIo/dqLA8UgbzjNvTTSntDA//lxqZcxnknrNK7Jsve/sETwUkmHoJ/DKMnGoXPDgE+2b
 9SKiw9ejh0tB5RuZoK0I5cxJLE+qKqVOnWtCjVG+G3WAqVMlwSp93nODqPlU45BOAmwjne
 2ylBXXEFMiUACyLTdDm3viW7EigHPVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-zarHLxu_Pmq5UaztSQnnuw-1; Fri, 22 Apr 2022 14:49:44 -0400
X-MC-Unique: zarHLxu_Pmq5UaztSQnnuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44B1538107AE;
 Fri, 22 Apr 2022 18:49:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC6381468940;
 Fri, 22 Apr 2022 18:49:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 08/12] docs: add versioning policy to README
Date: Fri, 22 Apr 2022 14:49:36 -0400
Message-Id: <20220422184940.1763958-9-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The package is in an alpha state, but there's a method to the madness.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
---
 README.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/README.rst b/README.rst
index 20f513e..cea1400 100644
--- a/README.rst
+++ b/README.rst
@@ -157,6 +157,28 @@ fail. These checks use their own `virtual environments
 working space.
 
 
+Stability and Versioning
+------------------------
+
+This package uses a major.minor.micro `SemVer versioning
+<https://semver.org/>`_, with the following additional semantics during
+the alpha/beta period (Major version 0):
+
+This package treats 0.0.z versions as "alpha" versions. Each micro
+version update may change the API incompatibly. Early users are advised
+to pin against explicit versions, but check for updates often.
+
+A planned 0.1.z version will introduce the first "beta", whereafter each
+micro update will be backwards compatible, but each minor update will
+not be. The first beta version will be released after legacy.py is
+removed, and the API is tentatively "stable".
+
+Thereafter, normal `SemVer <https://semver.org/>`_ / `PEP440
+<https://peps.python.org/pep-0440/>`_ rules will apply; micro updates
+will always be bugfixes, and minor updates will be reserved for
+backwards compatible feature changes.
+
+
 Changelog
 ---------
 
-- 
2.34.1


