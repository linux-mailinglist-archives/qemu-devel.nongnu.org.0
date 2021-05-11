Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4237AF57
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:32:00 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgY6p-00052s-SQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgY4u-0002p4-NS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgY4r-0001cX-Qz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620761397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zvKIX2kA+GWYzPQZrTRCIqJQLxKVCWpsPDOOLn+J7e0=;
 b=YBrjpMjj0h+qRlNWAY6hrxvNe9sCFd+RpKXfICTt7JnlWUfigCAi+k/RmkmzpIRoAajYyf
 cfKOpyHC0gTeNAKmuzjQKvKs2DjCqXSzT6UbO/tIAzc6zd4AnMWF3ct7/aLzJt5GYX2M83
 mAHZ3jsmgMp6gs4zI4jzcoQiWQ/VCpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-akAz6ss7Ol6X_JwSV_g4sA-1; Tue, 11 May 2021 15:29:53 -0400
X-MC-Unique: akAz6ss7Ol6X_JwSV_g4sA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59404802B78;
 Tue, 11 May 2021 19:29:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 455E75D9D7;
 Tue, 11 May 2021 19:29:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] docs: fix broken reference
Date: Tue, 11 May 2021 15:29:50 -0400
Message-Id: <20210511192950.2061326-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Long story short, we need a space here for the reference to work
correctly.


Longer story:

Without the space, kerneldoc generates a line like this:

one of :c:type:`MemoryListener.region_add\(\) <MemoryListener>`,:c:type:`MemoryListener.region_del\(\)

Sphinx does not process the role information correctly, so we get this
(my pseudo-notation) construct:

<text>,:c:type:</text>
<reference target="MemoryListener">MemoryListener.region_del()</reference>

which does not reference the desired entity, and leaves some extra junk
in the rendered output. See
https://qemu-project.gitlab.io/qemu/devel/memory.html#c.MemoryListener
member log_start for an example of the broken output as it looks today.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27..3b9ca696061 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -571,7 +571,7 @@ struct MemoryListener {
      * @log_start:
      *
      * Called during an address space update transaction, after
-     * one of #MemoryListener.region_add(),#MemoryListener.region_del() or
+     * one of #MemoryListener.region_add(), #MemoryListener.region_del() or
      * #MemoryListener.region_nop(), if dirty memory logging clients have
      * become active since the last transaction.
      *
-- 
2.30.2


