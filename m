Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445F6FF461
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:32:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7Ju-0003Pt-FI; Thu, 11 May 2023 10:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e7444aba70c32e2fc315b3c08043f4115b30cbb1@lizzy.crudebyte.com>)
 id 1px7Jr-0003PL-1p
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:30:59 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e7444aba70c32e2fc315b3c08043f4115b30cbb1@lizzy.crudebyte.com>)
 id 1px7Jm-0000RB-9M
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=D+avSEZJTjxcKFNfuZkn1RAsd1RZ+AxWhlL6dvn4QEk=; b=MT/Yw
 UYyyBTRqjpJZZaF2uijX9fxbY4oACJDzExWRXeQ9JTXmWtiWYpd0cRL9uyLaYKOMlEIykBcAxQh47
 owk2V4u7Eu3KH5BwpqcTX/+o0Nl1l10Irw7PPQAhpGR03bwI5PoDG3cCn3bLFko70ytiTIpaLiGPb
 23YzpwWlJ9jHDusr5crIlwQ/NW2ZtIWs4viijv/oou7/y9M7ZmSCjkgchCldOsf7aY8FfferZ8qGa
 Mbb1IZBzn8JeS5d8sFjTknXMh4+V3Lp/JaUB2JsL/fbsF4WET2MBlBx69p/UAK9I1V14+jGUrjVcF
 C8MscoJ+RRZ+v7TOcqHM6/mS9VElw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 11 May 2023 16:12:34 +0200
Subject: [PATCH] configure: make clear that VirtFS is 9p
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <E1px7Id-0000NE-OQ@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e7444aba70c32e2fc315b3c08043f4115b30cbb1@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add '9P' to the summary output section of 'VirtFS' to avoid being
confused with virtiofs.

Based-on: <20230503130757.863824-1-pefoley@google.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 5d8373b608..5d65f53fec 100644
--- a/meson.build
+++ b/meson.build
@@ -3922,8 +3922,8 @@ if have_block
   summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
   summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
   summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
-  summary_info += {'VirtFS support':    have_virtfs}
-  summary_info += {'VirtFS Proxy Helper support': have_virtfs_proxy_helper}
+  summary_info += {'VirtFS (9P) support':    have_virtfs}
+  summary_info += {'VirtFS (9P) Proxy Helper support': have_virtfs_proxy_helper}
   summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
   summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
   summary_info += {'bochs support':     get_option('bochs').allowed()}
-- 
2.30.2


