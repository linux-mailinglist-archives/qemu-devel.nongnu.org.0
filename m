Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6AD2F7D1C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:50:05 +0100 (CET)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PUK-0003wf-Nz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3j-0007FR-HV
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3H-0003M0-QH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieEtz9inMaPDHP22qFuU9z212My8cb+nsAi/mVgAWmM=;
 b=eHWAlhI9rWsR7LBUPo1HGKc0+ZEhe+QghczdEkgPT/xv1Z6CrG8WAAm9HHJIddjWOc+nsT
 Hvca7u9JDEDvqu0p4CBMQLmu+vkP7wuUZktJBW4F6lGMLLZt4vbPpYP+XLjE5nGOBsX2wi
 XKpkzCXKpyHlZSOEVaIlcRLtISIO8V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-BmDiFk5tOkuAJkUZ8Pvx_g-1; Fri, 15 Jan 2021 08:22:01 -0500
X-MC-Unique: BmDiFk5tOkuAJkUZ8Pvx_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747B7107ACF8;
 Fri, 15 Jan 2021 13:22:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 383541002C11;
 Fri, 15 Jan 2021 13:22:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BA121800D5A; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] audio: space prohibited between function name and
 parenthesis'('
Date: Fri, 15 Jan 2021 14:21:46 +0100
Message-Id: <20210115132146.1443592-31-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Han <zhanghan64@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Delete spaces between function name and open parenthesis'('

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-8-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index f82593bb8db2..c6714946aaed 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -203,13 +203,13 @@ static void glue (audio_pcm_hw_gc_, TYPE) (HW **hwp)
 
     if (!hw->sw_head.lh_first) {
 #ifdef DAC
-        audio_detach_capture (hw);
+        audio_detach_capture(hw);
 #endif
-        QLIST_REMOVE (hw, entries);
-        glue (hw->pcm_ops->fini_, TYPE) (hw);
-        glue (s->nb_hw_voices_, TYPE) += 1;
-        glue (audio_pcm_hw_free_resources_ , TYPE) (hw);
-        g_free (hw);
+        QLIST_REMOVE(hw, entries);
+        glue(hw->pcm_ops->fini_, TYPE) (hw);
+        glue(s->nb_hw_voices_, TYPE) += 1;
+        glue(audio_pcm_hw_free_resources_ , TYPE) (hw);
+        g_free(hw);
         *hwp = NULL;
     }
 }
-- 
2.29.2


