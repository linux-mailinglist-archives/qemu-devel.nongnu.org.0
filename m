Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E2F2B5C77
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:02:04 +0100 (CET)
Received: from localhost ([::1]:47316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexoJ-00079B-J4
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkO-0003LJ-SL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkL-0003Uj-UV
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a58ip3fhIQWC725sqe6TyIlIuM+QnBNQy9RtBJFzd9M=;
 b=bdXnnvZGi7TD9SurDKHpoEB3/a7fCapSuStjmTDyhLq0TTv05OVtAPSIzop0F/a0GYL0rI
 CsNlmShtZ76fPnqf/kZ0kOriUMr0VY9+182+khRSFwaQtYvql4epvGd0Vj7OksA9jTwgl7
 sd1DWmhRZJRY2rFVUkmRMjbfLaD1Q4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-iDoO5vIuNlS7TgKO61GA9w-1; Tue, 17 Nov 2020 04:57:54 -0500
X-MC-Unique: iDoO5vIuNlS7TgKO61GA9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17754186DD56;
 Tue, 17 Nov 2020 09:57:53 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C1B15B4B6;
 Tue, 17 Nov 2020 09:57:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/12] qemu/bswap: Remove unused qemu_bswap_len()
Date: Tue, 17 Nov 2020 10:57:37 +0100
Message-Id: <20201117095748.122371-2-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Last use of qemu_bswap_len() has been removed in commit
e5fd1eb05ec ("apb: add busA qdev property to PBM PCI bridge").

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200928131934.739451-2-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/bswap.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 1d3e4c24e4..8b01c38040 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -169,12 +169,6 @@ CPU_CONVERT(le, 16, uint16_t)
 CPU_CONVERT(le, 32, uint32_t)
 CPU_CONVERT(le, 64, uint64_t)
 
-/* len must be one of 1, 2, 4 */
-static inline uint32_t qemu_bswap_len(uint32_t value, int len)
-{
-    return bswap32(value) >> (32 - 8 * len);
-}
-
 /*
  * Same as cpu_to_le{16,32}, except that gcc will figure the result is
  * a compile-time constant if you pass in a constant.  So this can be
-- 
2.18.4


