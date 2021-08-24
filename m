Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0163F5FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:15:09 +0200 (CEST)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXCk-00055C-JZ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9o-00050g-4P
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9l-0005Io-TX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rai7h32TrTkDK/wiLtMpSewodwbvjWhnx25D5kPSBpM=;
 b=K9tokYdLbM9sO0OUWB2N5HSN991XAilrs4WFe4tThz8+tg3yIbsrW8O5c2vIcl6LVYn6qc
 cPH4h9qUOCqhOHTvWSayp8ppRpq7rp536x3yN0c6gRmnosh/gC/lcKqaNOFHGXU23V7PMF
 ao8pLLQLJG+/+2RTSWiFe95tREsbm4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-oagS4kkhMd62ZW_TE76BsQ-1; Tue, 24 Aug 2021 10:11:59 -0400
X-MC-Unique: oagS4kkhMd62ZW_TE76BsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso1100506wma.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rai7h32TrTkDK/wiLtMpSewodwbvjWhnx25D5kPSBpM=;
 b=n5wfdTxVnIHL4jp2lhTOqlWeDA80/KhHpmRuUSVYd+ex1nVvmcmtItOkaBLhiJyUH9
 mtFM+tsExy8g7jZxnpAOcpEoiAUG5fWvyDjl5qXGN1tttI//9C0rSk5Ers15iaVO+Gvb
 Vze6kbTAHP82k7JM5lmoYq1KbPngmce36/nn1DfNY6ebiCuh4VGGlb0N3Rt0yxmY27Xz
 lA7dXhtH77PCpMRnva5AFbUi2TMnGlnWbUKcftAkuzJJBFTn4GlP8RD7GAzVMu1JitDe
 XdtIkahqGTvehE2uFETMuKZyozuvioOIIq+PPLk7m6twuSGqXivoyzNrNGAM1it4XXCl
 BCEA==
X-Gm-Message-State: AOAM530x7UHIhHa1W042jtqSroO21rLmquQo3HA65sXtM9DGmztde3/p
 Em9NPc9nivY7jtjtUZVMTQ7UhUctk/MgC66n2twsb7srQK8r2rkkz7PVmLb5Zt6HcSDcZvXhUaL
 3ZrBOI//FakWyxSQJl5lC+XrVcbzN/qRMarIeX6MI2xPsEXng3SemvK1KrFWPRyTR
X-Received: by 2002:adf:f743:: with SMTP id z3mr12275643wrp.211.1629814318443; 
 Tue, 24 Aug 2021 07:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbkfSVNDCdzjgg5KW9qyinMJbGLgAOUfEcqYQmvPVBmbH0VSbq0b7aHa1mIRyoBnh4hkV1jA==
X-Received: by 2002:adf:f743:: with SMTP id z3mr12275624wrp.211.1629814318280; 
 Tue, 24 Aug 2021 07:11:58 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j1sm15012386wrd.50.2021.08.24.07.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:11:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] util/vfio-helpers: Let qemu_vfio_verify_mappings() use
 error_report()
Date: Tue, 24 Aug 2021 16:11:36 +0200
Message-Id: <20210824141142.1165291-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of displaying the error on stderr, use error_report()
which also report to the monitor.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 911115b86e6..1d149136299 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -660,13 +660,13 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
     if (QEMU_VFIO_DEBUG) {
         for (i = 0; i < s->nr_mappings - 1; ++i) {
             if (!(s->mappings[i].host < s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d not sorted!\n", i);
+                error_report("item %d not sorted!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
             if (!(s->mappings[i].host + s->mappings[i].size <=
                   s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d overlap with next!\n", i);
+                error_report("item %d overlap with next!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
-- 
2.31.1


