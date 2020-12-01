Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7672C9FF5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:39:38 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk34L-0006SA-Rt
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk300-0002CP-Ol
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk2zy-0003nO-9W
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K3p8N4jYri23I/BabNlKZbK4bs1nk5OdMKsolwRi8eI=;
 b=CAq9a+HG5WJ5/84f7LsSB9ELjW6hLSFEfeB2o+oMa3jotFJOa9dea3A5PZkJeztwloyYat
 X9AJln5Ba7ptm73rv19syAMz+Vk/CyHen9bSbMfKyoa8UzsEH7Ievft7l8HyjeviD2Nebo
 2/ERmDn49pv22EoAUp3o2VcPFSJg+pM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-khiMk4FUNJaIhE4mmbWK6g-1; Tue, 01 Dec 2020 05:35:03 -0500
X-MC-Unique: khiMk4FUNJaIhE4mmbWK6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2B60190A7A1;
 Tue,  1 Dec 2020 10:35:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB5910013C1;
 Tue,  1 Dec 2020 10:35:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/32] kernel-doc: update from Linux 5.10
Date: Tue,  1 Dec 2020 05:34:30 -0500
Message-Id: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

v1->v2: fix bisectability (by disabling kernel-doc altogether)
	pass Sphinx version from docs/sphinx/kerneldoc.py
	remove unnecessary s/atomic_/qatomic_/ difference

Alexander A. Klimov (1):
  Replace HTTP links with HTTPS ones: documentation

André Almeida (2):
  kernel-doc: fix processing nested structs with attributes
  kernel-doc: add support for ____cacheline_aligned_in_smp attribute

Jonathan Cameron (1):
  kernel-doc: add support for ____cacheline_aligned attribute

Jonathan Neuschäfer (1):
  scripts/kernel-doc: Add support for named variable macro arguments

Mauro Carvalho Chehab (19):
  scripts: kernel-doc: proper handle @foo->bar()
  scripts: kernel-doc: accept negation like !@var
  scripts: kernel-doc: accept blank lines on parameter description
  scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
  scripts/kernel-doc: handle function pointer prototypes
  kernel-doc: include line numbers for function prototypes
  scripts: kernel-doc: add support for typedef enum
  scripts: kernel-doc: make it more compatible with Sphinx 3.x
  scripts: kernel-doc: use a less pedantic markup for funcs on Sphinx
    3.x
  scripts: kernel-doc: fix troubles with line counts
  scripts: kernel-doc: reimplement -nofunction argument
  scripts: kernel-doc: fix typedef identification
  scripts: kernel-doc: don't mangle with parameter list
  scripts: kernel-doc: allow passing desired Sphinx C domain dialect
  scripts: kernel-doc: fix line number handling
  scripts: kernel-doc: try to use c:function if possible
  scripts: kernel-doc: fix typedef parsing
  scripts: kernel-doc: split typedef complex regex
  scripts: kernel-doc: use :c:union when needed

Paolo Bonzini (7):
  docs: temporarily disable the kernel-doc extension
  Revert "scripts/kerneldoc: For Sphinx 3 use c:macro for macros with
    arguments"
  Revert "kernel-doc: Use c:struct for Sphinx 3.0 and later"
  Revert "kernel-doc: Handle function typedefs without asterisks"
  Revert "kernel-doc: Handle function typedefs that return pointers"
  Revert "docs: temporarily disable the kernel-doc extension"
  scripts: kernel-doc: remove unnecesssary change wrt Linux

Pierre-Louis Bossart (1):
  scripts/kernel-doc: optionally treat warnings as errors

 docs/sphinx/kerneldoc.py |   6 +-
 scripts/kernel-doc       | 455 +++++++++++++++++++++++++++------------
 2 files changed, 324 insertions(+), 137 deletions(-)

-- 
2.26.2


