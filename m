Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DF52885F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:19:28 +0200 (CEST)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcVL-000431-C3
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcB8-0006QQ-WE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcB6-0001Sm-1e
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652713110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ft1Z2/gGHOhPKkOss/PfKonVOPzGjFX0X4Xzi+ZEyJs=;
 b=jI1Sk38btqqpMJ/rlBlwdtsi4wVZKSL5q6zw29c53aW0AA1UQNl73zj1MdKMrqhTL0loJ0
 YQrJ85VBtKAZWQgXtZXGRMsZJwMxf96uhWTkXx871jrQlKx7kkKAwIbnG8bn9qo27QWwcN
 ggsIzik1lbh0l6uZqkp4j4G+GcCHPXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-geihdO2ZO1muC4jJfTk2rw-1; Mon, 16 May 2022 10:58:26 -0400
X-MC-Unique: geihdO2ZO1muC4jJfTk2rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A43A49483E0;
 Mon, 16 May 2022 14:58:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9281415101EC;
 Mon, 16 May 2022 14:58:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 0/3] Allow Capstone 3.0.5 again and remove the submodule
Date: Mon, 16 May 2022 16:58:20 +0200
Message-Id: <20220516145823.148450-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Compiling with Capstone 3.0.5 seems still to work fine, so if we
allow this again, all our supported build environments should provide
this library nowadays. That means that we could get rid of the
integrated submodule now.

Thomas Huth (3):
  tests/vm: Add capstone to the NetBSD and OpenBSD VMs
  capstone: Allow version 3.0.5 again
  capstone: Remove the capstone submodule

 configure                     |  21 -------
 meson.build                   | 115 ++--------------------------------
 .gitlab-ci.d/buildtest.yml    |   3 +-
 .gitlab-ci.d/windows.yml      |   5 +-
 .gitmodules                   |   3 -
 capstone                      |   1 -
 meson_options.txt             |   3 +-
 scripts/meson-buildoptions.sh |   5 +-
 tests/vm/netbsd               |   3 +-
 tests/vm/openbsd              |   3 +-
 10 files changed, 16 insertions(+), 146 deletions(-)
 delete mode 160000 capstone

-- 
2.27.0


