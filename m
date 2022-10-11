Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A35FBDAC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:11:32 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNTG-0001fB-Kz
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0001ai-OT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEP-0003V4-LG
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=votgVLiMq+XbDSvDD8GekiBp/FHoNh2XK9AL1Ft2XZU=;
 b=TQsu3BmuntGHSSiQ0fAUXDRAh7/qlPwogO/7Z2wJ1sj5koj3+4moSxmy6m7GPe245mw/3f
 KD6/EnzyIhIHpb3JHKPIrtYoe8Avj7Hp+nONXqyIGscgTuaEy6rZ8BLBaN2yWYvSszNqEJ
 JmSnecoE+IMQgc7naQzztxqEpqHcJGI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-er5Vbj0_MGeK0fVpNhZD2A-1; Tue, 11 Oct 2022 17:56:07 -0400
X-MC-Unique: er5Vbj0_MGeK0fVpNhZD2A-1
Received: by mail-qv1-f71.google.com with SMTP id
 eu10-20020ad44f4a000000b004b18126c4bfso8690488qvb.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=votgVLiMq+XbDSvDD8GekiBp/FHoNh2XK9AL1Ft2XZU=;
 b=Xv6jxcfHvlVx9zSVE12OmohmTxogYoPWaBh7oct8afb0V3jN31StcsrikNitjRjBY5
 o1W8zr8ZfYzgO2n2+KdQ/q++frafCgA38laIL3Zdqr9q64KNSfPuGLyjjh7vyzWOAN/m
 ZY5u0zq6ai1jgLyJQkPRJBGd03UmClBjNZJ8xSVLxv2GomuyAI1y6azqrhvS5uXIi/q6
 JiCOizSS5rrkWkz5dw4uGmWwVHDFGeOXCPl+PRJ5Lhxg2VbAiz5CdOtaX1EBYBoQJQj8
 gtm3NRsHFnSmsbV0FIdBlzcGUP1kv+apwM/YupdmLguhcyUb9PkRdVVgHXE7Ef1AVC0U
 BgwQ==
X-Gm-Message-State: ACrzQf1z0Y48QRFH30iBessT4WGkMs2xp9DVFdc3/9daaTi76p3MJmrS
 Vo3P2934fDtU+rzxvqDg46ATTGahz2S8K2qQKNtGHv8HjNcqfIlkZ/BKeewfOIsp2APwRJrSyN9
 AoT6ZO9LYvUl26y5Kgkto9n//LtKcFY0Rtr/8lY2ahhBxUh26DQplMSUzMol0/+kg
X-Received: by 2002:a37:9142:0:b0:6ea:e7fc:be79 with SMTP id
 t63-20020a379142000000b006eae7fcbe79mr13400797qkd.679.1665525367095; 
 Tue, 11 Oct 2022 14:56:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7h11qUtqQNEzWWjnmYqQ1xzLJT0ODqpbZb78xYaAeOuk6YMCDqMxfHr+C1zJRC34wqXVEyEw==
X-Received: by 2002:a37:9142:0:b0:6ea:e7fc:be79 with SMTP id
 t63-20020a379142000000b006eae7fcbe79mr13400779qkd.679.1665525366821; 
 Tue, 11 Oct 2022 14:56:06 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 04/15] migration: Trivial cleanup save_page_header() on
 same block check
Date: Tue, 11 Oct 2022 17:55:48 -0400
Message-Id: <20221011215559.602584-5-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
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

The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
to be clearer.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 562646609e..c90feedb13 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -661,14 +661,15 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
+    bool same_block = (block == rs->last_sent_block);
 
-    if (block == rs->last_sent_block) {
+    if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
     }
     qemu_put_be64(f, offset);
     size = 8;
 
-    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
+    if (!same_block) {
         len = strlen(block->idstr);
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
-- 
2.37.3


