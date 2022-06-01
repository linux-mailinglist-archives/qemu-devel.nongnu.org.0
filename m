Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB053AB98
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:13:20 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwRuJ-0002SI-Cy
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nwRi4-0003R8-9k
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:00:42 -0400
Received: from rev.ng ([5.9.113.41]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nwRhy-0003TC-1i
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qEs8SNoPQQyi3d7qhhSDqZD3ICrgtuHCMvZlSvNc9tA=; b=iN++xofvjtCxcPvD+WJYXzwJHZ
 m2Y33GOdOjmdBVm8LKFCqjRcS3lz45ut/H5k5Wg/cwOJVFPMYaybGRN3sLv+7zSgjFrfW/fdyr6xa
 6+o9htFtBYLnrdcweVRZGiB+rJYUwv4/LjsrJfH9VpWKfV+rAH7KPZmwU2a9dKed+48w=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v10 09/16] target/hexagon: fix renamed package templates
Date: Wed,  1 Jun 2022 19:00:06 +0200
Message-Id: <20220601170013.160531-10-anjo@rev.ng>
In-Reply-To: <20220601170013.160531-1-anjo@rev.ng>
References: <20220601170013.160531-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

The glibc-static package mapping no longer exists, qemu.yml is updated to
use libc-static instead.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 tests/lcitool/projects/qemu.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d068a7a8de..51c9c33746 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -26,7 +26,6 @@ packages:
  - genisoimage
  - glib2
  - glib2-static
- - glibc-static
  - glusterfs
  - gnutls
  - gtk3
@@ -35,6 +34,7 @@ packages:
  - libattr
  - libasan
  - libbpf
+ - libc-static
  - libcacard
  - libcap-ng
  - libcurl
--
2.36.1

