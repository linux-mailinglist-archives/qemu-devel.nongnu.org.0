Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF077440325
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:26:30 +0200 (CEST)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXWH-0006hx-ML
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgXF1-0001hb-Rc
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mgXEy-0004wZ-0Y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635534515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s53s2Zht4ROqXYB9FO37L11y2LHJ0A9CpfB4sDaKsiI=;
 b=W29/8jcSMZUaswq6qrDmnhEOKfrgGLQDMUq7B+C/nUGAc7Mbw24xe3eYOw5/MeMqbO8aym
 lUclgRz8j2Mc0go6azTSVN6zBo8HY2RFm3Q1+OiMxN693HhbA5SACtU5SnDQnwmkvxgdj1
 xtZ9gH3sECufTVfLBdyKZh0p9c1V+XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-E895sF3sN-imqBtuwnGZjg-1; Fri, 29 Oct 2021 15:08:31 -0400
X-MC-Unique: E895sF3sN-imqBtuwnGZjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFCA41006AA9;
 Fri, 29 Oct 2021 19:08:30 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADCA510016F5;
 Fri, 29 Oct 2021 19:08:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] target/i386: Remove core-capability in Snowridge CPU model
Date: Fri, 29 Oct 2021 15:07:58 -0400
Message-Id: <20211029190758.2021640-2-ehabkost@redhat.com>
In-Reply-To: <20211029190758.2021640-1-ehabkost@redhat.com>
References: <20211029190758.2021640-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

Because core-capability releated features are model-specific and KVM
won't support it, remove the core-capability in CPU model to avoid the
warning message.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20210827064818.4698-3-chenyi.qiang@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fc3ed80ef1e..598d451dcf0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3749,9 +3749,10 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             },
             {
                 .version = 4,
-                .note = "no split lock detect",
+                .note = "no split lock detect, no core-capability",
                 .props = (PropValue[]) {
                     { "split-lock-detect", "off" },
+                    { "core-capability", "off" },
                     { /* end of list */ },
                 },
             },
-- 
2.32.0


