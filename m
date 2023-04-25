Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA16EE756
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 20:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prN36-00030S-Rw; Tue, 25 Apr 2023 14:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN35-00030E-L8
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN33-0005QM-6r
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682445952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvKzLqz4F3yaHXWfvdcfuuyAObt3ehw2kidxZA2rkdg=;
 b=cIP6yIcF2Te38CZR/48fXhHrHYB+z21rOAdSdTTUVE22qf16pmqjgQIR19Omop7K0G5fUN
 nMlD6c1tqG8fsirL6UPrdNvprgN0ldou6mCnv+lMB7GIAJSlY+YczMr73twFFjGJAvBsa/
 86ExkUugGU945M/ts9XnHxEdrUGWZcA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-pBOCz_nbNCuM9CJpjqBL7g-1; Tue, 25 Apr 2023 14:05:51 -0400
X-MC-Unique: pBOCz_nbNCuM9CJpjqBL7g-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ef4f29c9d1so15305371cf.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682445949; x=1685037949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvKzLqz4F3yaHXWfvdcfuuyAObt3ehw2kidxZA2rkdg=;
 b=f/FSALvpUM6Bb9tDl6NVk4PkZ8DYTT5bM4hd0geWu4RcsDQcLYisfOr86sSWz9Gjl4
 BbouFcaHSiI5+TrdW0o+xa7c3GO6Z3y5gE0CQ/FkeatIQphuarHW4wE9KjiyYfiw7TeL
 6x8oCWUwgeWwqHbIzIM2mMoYRZmB0w1jgBFovOHE0JPisYZGn92JMfiDEeWUJN2jYcKP
 71EhpM8ObOJC86y0kMHdFVPFP96MDPjrDZUU77qCwbnsOMa3ZHpG9rKfBcYr2X1aEzY8
 KUoZ7SQl1Krlug4CT1TTfFUg49XvlxGfSjMFgnFAFXlBgc8YW8SYZSFKill7UBE/T5h+
 K7hg==
X-Gm-Message-State: AAQBX9fXvB0L0e3hluofzBP6yh8A5LG13oaIAwACBnAPyOXj9NJpva0b
 hxWZVb/i1qF3Y+KjZ+PQKntsRNL7x5JyfZz8lwGrJ/OvH754FXpz4k44cYJLdDTtxqpYKU973bb
 NCR9JHA5bm9bfVR5JnMp9kr4qlMPsKAJhYTF7hseUx91rfKa+rhvkezNvwXPpedQU4aJ3Fkgc
X-Received: by 2002:a05:622a:86:b0:3e2:be32:cb74 with SMTP id
 o6-20020a05622a008600b003e2be32cb74mr30314126qtw.3.1682445949129; 
 Tue, 25 Apr 2023 11:05:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHjfdHmA+VdmF3/DjpWpdYcKAOhQPulrTuR8K/CbIugltcgxMaAUpn+v6DmeqQdVbuWvs8gQ==
X-Received: by 2002:a05:622a:86:b0:3e2:be32:cb74 with SMTP id
 o6-20020a05622a008600b003e2be32cb74mr30314076qtw.3.1682445948667; 
 Tue, 25 Apr 2023 11:05:48 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05620a271100b0074e034915d4sm4552297qkp.73.2023.04.25.11.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:05:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH 1/2] migration/vmstate-dump: Dump array size too as "num"
Date: Tue, 25 Apr 2023 14:05:43 -0400
Message-Id: <20230425180544.1815888-2-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230425180544.1815888-1-peterx@redhat.com>
References: <20230425180544.1815888-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For VMS_ARRAY typed vmsd fields, also dump the number of entries in the
array in -vmstate-dump.

Without such information, vmstate static checker can report false negatives
of incompatible vmsd on VMS_ARRAY typed fields, when the src/dst do not
have the same type of array defined.  It's because in the checker we only
check against size of fields within a VMSD field.

One example: e1000e used to have a field defined as a boolean array with 5
entries, then removed it and replaced it with UNUSED (in 31e3f318c8b535):

-        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
-                           E1000E_MSIX_VEC_NUM),
+        VMSTATE_UNUSED(E1000E_MSIX_VEC_NUM),

It's a legal replacement but vmstate static checker is not happy with it,
because it checks only against the "size" field between the two
fields (here one is BOOL_ARRAY, the other is UNUSED):

For BOOL_ARRAY:

      {
        "field": "core.eitr_intr_pending",
        "version_id": 0,
        "field_exists": false,
        "size": 1
      },

For UNUSED:

      {
        "field": "unused",
        "version_id": 0,
        "field_exists": false,
        "size": 5
      },

It's not the script to blame because there's just not enough information
dumped to show the total size of the entry for an array.  Add it.

Note that this will not break old vmstate checker because the field will
just be ignored.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 9671211339..550c38f0ef 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -536,6 +536,9 @@ static void dump_vmstate_vmsf(FILE *out_file, const VMStateField *field,
             field->version_id);
     fprintf(out_file, "%*s\"field_exists\": %s,\n", indent, "",
             field->field_exists ? "true" : "false");
+    if (field->flags & VMS_ARRAY) {
+        fprintf(out_file, "%*s\"num\": %d,\n", indent, "", field->num);
+    }
     fprintf(out_file, "%*s\"size\": %zu", indent, "", field->size);
     if (field->vmsd != NULL) {
         fprintf(out_file, ",\n");
-- 
2.39.1


