Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB845957A5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:10:09 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtWS-0000xc-9N
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNtLf-00051i-QJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNtLc-0000xq-BZ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660643935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O2NbkmSCiqhMmm3fE3LYhuFpwXCbXDa69NFXhUt4pyw=;
 b=edUm4semFxGKxYilyUzFr9pPdg8o48vx7LxRLu8Oe7ynHW6ixCWAfL92lRdbS0NBxftPtD
 2IlQlyjJKTkSlCSF0ibgTyPpCerXO5/aPdaivVxtP0ge7q9MRMYsu+fqbLHevXv4odFzGO
 cHqY9ZEct0MfCgFOdLQ+NglTKw/NmZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-1VtEkCBPMrSE_xO7174_lQ-1; Tue, 16 Aug 2022 05:58:54 -0400
X-MC-Unique: 1VtEkCBPMrSE_xO7174_lQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB1B81C05151;
 Tue, 16 Aug 2022 09:58:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1887492C3B;
 Tue, 16 Aug 2022 09:58:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/2] Two small fixes for QEMU 7.1-rc3
Date: Tue, 16 Aug 2022 11:58:47 +0200
Message-Id: <20220816095849.211139-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Richard!

Two minor fixes for rc3. If this is too late for rc3, please feel free
to ignore, I think they are not severe enough to justify an rc4 later.

The following changes since commit d102b8162a1e5fe8288d4d5c01801ce6536ac2d1:

  Merge tag 'pull-la-20220814' of https://gitlab.com/rth7680/qemu into staging (2022-08-14 08:48:11 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-16

for you to fetch changes up to effaf5a240e03020f4ae953e10b764622c3e87cc:

  hw/usb/hcd-xhci: Fix unbounded loop in xhci_ring_chain_length() (CVE-2020-14394) (2022-08-16 11:37:19 +0200)

----------------------------------------------------------------
* Fix a possible endless loop in USB XHCI code
* Minor fixes for the new readconfig test

----------------------------------------------------------------
Daniel P. Berrangé (1):
      tests/qtest: misc tweaks to readconfig

Thomas Huth (1):
      hw/usb/hcd-xhci: Fix unbounded loop in xhci_ring_chain_length() (CVE-2020-14394)

 hw/usb/hcd-xhci.c             | 23 +++++++++++++++++++----
 tests/qtest/readconfig-test.c | 12 ++++++------
 2 files changed, 25 insertions(+), 10 deletions(-)


