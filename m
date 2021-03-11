Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EE33757A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:23:59 +0100 (CET)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMEI-0002lG-BN
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCw-0001Rm-2I
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCp-0003cb-6x
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r5ZtgF+BNU30u2JT6LhTLX1xIaKvJt8mBxAqme7Wg6k=;
 b=LDJvCE7bMCEpm9bVi+dNyrOLc7Ni0uZRMrfewLGKnK/2Af/gDggDDLSD6IjzixFO15whtN
 CvnuOfcfPJ4dwbMwR3q3LHknrF25Y/iXqP08+LL6und15Bx0JhUFtO+CvVqMCHO5igrRxC
 iDa5BI3oihHYhS3gXmNcqhcrZd5vbMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-B2Sr7Pj6OtaNrXRX6m6Rvg-1; Thu, 11 Mar 2021 09:22:22 -0500
X-MC-Unique: B2Sr7Pj6OtaNrXRX6m6Rvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9692F8030DB;
 Thu, 11 Mar 2021 14:22:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5510F2BFF1;
 Thu, 11 Mar 2021 14:22:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/4] gitlab-ci improvements
Date: Thu, 11 Mar 2021 15:22:07 +0100
Message-Id: <20210311142211.1547864-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the build-tools-and-docs-debian to a better place, add dependencies
and merge some jobs to speed up the CI.

Thomas Huth (4):
  gitlab-ci.yml: Move build-tools-and-docs-debian to a better place
  gitlab-ci.yml: Add some missing dependencies to the jobs
  gitlab-ci.yml: Merge one of the coroutine jobs with the tcg-disabled
    job
  gitlab-ci.yml: Merge check-crypto-old jobs into the build-crypto-old
    jobs

 .gitlab-ci.yml | 95 ++++++++++++++++----------------------------------
 1 file changed, 31 insertions(+), 64 deletions(-)

-- 
2.27.0


