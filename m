Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00785F4948
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:30:11 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmgE-0003YH-JZ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmb1-0007Sk-Fr
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmav-0005f0-8Z
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PK+Pg5jcDoHUqFGn7VW26jtdDrWlWl0PsL539K4vTBg=;
 b=O/fpSssXcqJXYcR3x+vaOFrjkQqBcHC3Eu4opdheZlZbx192AfrJQi6iSEJ0jT3GPBnWTp
 /aiEXfyQlfMD45rjF3FxjKh4rF8f5/9ZF2LcKDqe/vnm2bQMBKRUFRFLW2EBVu9jO9OjQ2
 1g+bFaVE/jEf8mDKTzj+9MvMzvFFlog=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-ZN_N_jAyNhiTZchzEO_iiQ-1; Tue, 04 Oct 2022 14:24:36 -0400
X-MC-Unique: ZN_N_jAyNhiTZchzEO_iiQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 ay22-20020a05622a229600b0035bbb349e79so9892542qtb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PK+Pg5jcDoHUqFGn7VW26jtdDrWlWl0PsL539K4vTBg=;
 b=7oeithdd2mCWaVCKiaw9Z4JmSofnD/Mi9IERKRo7FZ1n+5IrhcfwvTAQo0zcTwxD/J
 8ndInGO1vEHC3GeW6mLGjCqR0pl0SHbpZfl4faT3DTnY3Qxiw87xlmd8KSSd62VnoooL
 28CNbAlJvkHt2U285AOsQ9Nn/shoR29wP2sFdCMqynrMVxaRR3f8Yw36WIej+0NfV0z/
 WOd+igLkrirFaOAe6N4hfalaf8HkNbZ9GG5LvEA7ZZVxC7WfQbhagmn9Vd2moxmoWkrc
 ZQMJqewAhuhojHue9uoccIVoULoqopi1VTUIBUGuHiNVljqBAL7QIvfFJgOcOGNK38WB
 iq5A==
X-Gm-Message-State: ACrzQf1rCpJv1WCz7K1mpWgL5YwHON7BNCCG6ZpyQksv4YP0y4tsKaw8
 E49OogD5wh82EEtCPgUKGC+tfBQAHKu3zgu5L16IRnRWl7MGej2tFRfPZ6ZYf4Y5sBx8y0WkG2V
 js6hz1Uvwnovbs9N2b9ULVTC+BXdiS+y3YR/Yfo0JLtbCz8lpAD4QX++cMi24ckRx
X-Received: by 2002:a05:620a:15d2:b0:6cf:2d38:9c0d with SMTP id
 o18-20020a05620a15d200b006cf2d389c0dmr17790328qkm.426.1664907875598; 
 Tue, 04 Oct 2022 11:24:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Rc1McOlTHP6YRW4ACEVEU8B79/UZhbjGtl3LMgdXSc90hSvcXvuTNwgPiQBG9B0P3spDjIA==
X-Received: by 2002:a05:620a:15d2:b0:6cf:2d38:9c0d with SMTP id
 o18-20020a05620a15d200b006cf2d389c0dmr17790303qkm.426.1664907875322; 
 Tue, 04 Oct 2022 11:24:35 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 3/5] migration: Disallow postcopy preempt to be used with
 compress
Date: Tue,  4 Oct 2022 14:24:28 -0400
Message-Id: <20221004182430.97638-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004182430.97638-1-peterx@redhat.com>
References: <20221004182430.97638-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The preempt mode requires the capability to assign channel for each of the
page, while the compression logic will currently assign pages to different
compress thread/local-channel so potentially they're incompatible.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bb8bbddfe4..844bca1ff6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1336,6 +1336,17 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy preempt requires postcopy-ram");
             return false;
         }
+
+        /*
+         * Preempt mode requires urgent pages to be sent in separate
+         * channel, OTOH compression logic will disorder all pages into
+         * different compression channels, which is not compatible with the
+         * preempt assumptions on channel assignments.
+         */
+        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
+            error_setg(errp, "Postcopy preempt not compatible with compress");
+            return false;
+        }
     }
 
     return true;
-- 
2.37.3


