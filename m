Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F035A52C6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:10:48 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiHf-0006Hq-0c
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4a-0002dp-Jn
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4Z-0008GQ-6f
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSVZP7q1cz5AOinl1NXbXvPRjmI+K/D6yOV6R5m+7mg=;
 b=H+zsg3S0gbRqOuYuTC98zEC4TeUn65QEwCdorC6SYtm86kTvQ1xMJnbTcaYbSL8oJ05VA2
 b8t3+I+c2AdjiYv0dTb87D1QyOL0/hp1eHojg4Ku6cSeu2gPwaFaKRcRZThKxETdCqGEuu
 OAvchiFiGoNziYOm7RBG/YUfasRutaM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-TOfdNtq1NmC0jvHiIG6kvw-1; Mon, 29 Aug 2022 12:57:13 -0400
X-MC-Unique: TOfdNtq1NmC0jvHiIG6kvw-1
Received: by mail-io1-f71.google.com with SMTP id
 g13-20020a056602072d00b0068825561753so4968782iox.7
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YSVZP7q1cz5AOinl1NXbXvPRjmI+K/D6yOV6R5m+7mg=;
 b=DJFHNG8oqmCMTopksmSu1fhj1sMaVWE79QCe/QH33nviFpXSLd1n188N8odMiYE3VD
 pENDIWQT7NNVrMcIVZKl+MjO1XVl5rRXPFMz6iX6uqbjsk9RFaBCRr4DU6wZ35BlhAql
 7VkfL8KHePU8o6KSeBtlup2BzuG/Fqf5bRYPaG5cV9QbzVQXJ9ryMLKUkqb0tInuF3eE
 vj/CQF8OigBTyEkjRMQ3sgHfJ/U9+SdZAZ1Yd6JTv66xHmD++AOYrgrK0TN1xfBUFz9w
 wP7Udbla5c8jibKd/FfUL9EFv7ZYD9pVsETknyGiX/tuYaoQDvWNOLYk699/2TKD/6+b
 YbDA==
X-Gm-Message-State: ACgBeo3vMjfJ2cDuT5FFscpTmg65DLyaLKBIKZvM7kKfMC3sWBztRUPH
 5iu8GMP4qj5G7WwjtPvnJCldVt1RK7M1VUHhJlgOXRzafzCiUYJa8MBs5SyeZuRcHmKQDSyjHa6
 KZ6tspP/IMuCiOpYSdUp+6C1eZhJXHQ1hM2Sj89vqyLIkcEUC0RXgXQthcose6Kzz
X-Received: by 2002:a05:6e02:2181:b0:2eb:3770:e3f8 with SMTP id
 j1-20020a056e02218100b002eb3770e3f8mr1487391ila.79.1661792232201; 
 Mon, 29 Aug 2022 09:57:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5GMA4LXuBUaEb5E56tNKOzyWeU9DedNMvOwPHbcUsdDIRIKPNLzLjdQvC73YuLB3TnbV2JUw==
X-Received: by 2002:a05:6e02:2181:b0:2eb:3770:e3f8 with SMTP id
 j1-20020a056e02218100b002eb3770e3f8mr1487382ila.79.1661792231999; 
 Mon, 29 Aug 2022 09:57:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 06/13] migration: Trivial cleanup save_page_header() on
 same block check
Date: Mon, 29 Aug 2022 12:56:52 -0400
Message-Id: <20220829165659.96046-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
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

The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
to be clearer.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 612c7dd708..43893d0a40 100644
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
2.32.0


