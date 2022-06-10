Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAA545E2D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:09:39 +0200 (CEST)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZi5-0007Gk-6e
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWZ-0006fW-Um
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWY-0006E5-EX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OWx+CfckBjLGgAwLEqNKdUUoiBgaQnJBO9vst8oxW7k=;
 b=CjF7vxw2M9o3VfU4QDTv48CK2kZQqCElNJ14E1D+iJjadB380B/cO5xBTiBRYqRsrmo/0e
 7ljcTCqRZcD5hCJsLnVhf7R3B3ALVVWlsAUOufEpYM0UNEZp1VDz8HuO3T2kgo0Ulf8onY
 EjttVjJBGC9yIAjBnJY2Q4r50fyEdM0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-gyK8U0bcNyubHhdOI8dMhQ-1; Fri, 10 Jun 2022 03:57:40 -0400
X-MC-Unique: gyK8U0bcNyubHhdOI8dMhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so946820wmb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OWx+CfckBjLGgAwLEqNKdUUoiBgaQnJBO9vst8oxW7k=;
 b=CYngO7GQHicV3KHhw4X9f9wcsmrQfWu9Gmf6h3nDGa0nFpIKAV35SDHJl3GoGE0/AV
 BJxnJ3L6pJfF/rnDPARSpRg2RGwL+Or0oNnDMlRvQdWsbmyq3vZNgBeZCVefl0/ndiRp
 pHPGQilwBSVX9c3T4XXJnzn9t+wBTrOZxW7pBsQmEdD87YuE0VKlTaF+SjDjxEoPHZYH
 IYpLSFmF77mVoJv5VrdXeOtqPj8fN6zmNP9+H/294u47j8uYhcZdl8r3X3RnqoOmz/bg
 0Szc5biXYfaHk4PpetmfuBMbotSjr9wF7s+n+w9TPIm2q5Umo26s7avpRJoOkZ6t4n7x
 Kdzg==
X-Gm-Message-State: AOAM530V9X9+jCnlf4JPhQm4CTu8+x9ZKk4a81cm0v/B22pW5mJnGbxp
 2UJj1aEI2ru0REAdjFVu022q0eFoK6JdIxb5b/zOzSLVUyGApaSzOpd5QJixyUaJ9dpw9OLla0r
 xS5zUzb1CEk0fm/eyNnQD9a7Cd7f8utSJw8KhqTALalwMZ9WRjDPqXIhJkaJ5
X-Received: by 2002:a5d:6d8a:0:b0:219:b7fc:f29d with SMTP id
 l10-20020a5d6d8a000000b00219b7fcf29dmr6900731wrs.665.1654847859341; 
 Fri, 10 Jun 2022 00:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydBoQz931n2Szla5BHqK1A8Ts1SIclY43Mu6nGxL0WB61aUK/ar4hvzZNM1TQbTqW+HDN7gg==
X-Received: by 2002:a5d:6d8a:0:b0:219:b7fc:f29d with SMTP id
 l10-20020a5d6d8a000000b00219b7fcf29dmr6900712wrs.665.1654847859094; 
 Fri, 10 Jun 2022 00:57:39 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4483000000b0020fcc655e4asm26717132wrq.5.2022.06.10.00.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:38 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 12/54] tests: acpi: whitelist DSDT.ipmismbus expected blob
Message-ID: <20220610075631.367501-13-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220608135340.3304695-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b4687d1cc8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.ipmismbus",
-- 
MST


