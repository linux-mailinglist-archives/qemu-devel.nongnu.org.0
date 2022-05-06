Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052A51E05B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:52:26 +0200 (CEST)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4w5-0001Xy-71
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sT-00035b-MB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4sR-0005qY-RS
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/SWn1Y5lutF2XxN73y0O2iVgxc5UthNc7X3URCKzgY=;
 b=e6uvNZWDFpJJLsribyeRz3JVfJ9tJULzEFaX0ORalGWDD8eG3Gh7+Ww8Xl7L+9yrNT8UKh
 QLkNi9k1FH55T3Aeh0kd0cusxJhmcWWTr/aCaFsf91jJ1GkItc79zbsi4gAKfevx2W41D6
 hqZqsQM2bDXkDkPRUB84fBcjVzmq4g8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-80zpBjzHNk6jeJq0oGamCw-1; Fri, 06 May 2022 16:48:37 -0400
X-MC-Unique: 80zpBjzHNk6jeJq0oGamCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 809A6811E76
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 20:48:37 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2422540CF8E8;
 Fri,  6 May 2022 20:48:37 +0000 (UTC)
Subject: [PULL 07/11] sysemu: tpm: Add a stub function for TPM_IS_CRB
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Berger <stefanb@linnux.ibm.com>
Date: Fri, 06 May 2022 14:48:36 -0600
Message-ID: <165187011323.4166595.4846048800121434051.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

From: Eric Auger <eric.auger@redhat.com>

In a subsequent patch, VFIO will need to recognize if
a memory region owner is a TPM CRB device. Hence VFIO
needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
let's add a stub function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
Link: https://lore.kernel.org/r/20220506132510.1847942-2-eric.auger@redhat.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 include/sysemu/tpm.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 68b2206463c5..fb40e30ff60e 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
 #define tpm_init()  (0)
 #define tpm_cleanup()
 
+/* needed for an alignment check in non-tpm code */
+static inline Object *TPM_IS_CRB(Object *obj)
+{
+     return NULL;
+}
+
 #endif /* CONFIG_TPM */
 
 #endif /* QEMU_TPM_H */



