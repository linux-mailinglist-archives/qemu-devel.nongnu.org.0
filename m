Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF894348FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:33:05 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8u8-00024c-Io
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8h8-0003CA-9y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8h5-0002nT-6k
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ye8xamo/xFWVL8QWKzRp1k9WG6eLXO+rQQkUJvOw6N4=;
 b=A16N4qqo7hmw8E7zja2JymXRIzM9R8NYvWMwRcn/PoaERPQp13pO5nJ0xUARQBStBAOiN1
 wFiGn8ACxbStWIkiEo/VjnojgKN/+hAKQQuPUaXf3C1z7gMwe9vFRIZKkIvbO2HMJdXl0N
 W7xOwvfLImLSrQVrSIsCkJVG4rSjFUo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-5600E1q6NyGA8bCIPxJPaw-1; Wed, 20 Oct 2021 06:19:33 -0400
X-MC-Unique: 5600E1q6NyGA8bCIPxJPaw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cy14-20020a0564021c8e00b003db8c9a6e30so20531907edb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ye8xamo/xFWVL8QWKzRp1k9WG6eLXO+rQQkUJvOw6N4=;
 b=BQpb0hg+GWgKFst/jVZojQrU6s4+pAywlO59NS9KXN3zpgKaGVuyAwiFUWzHCLBBJg
 ZjfkGmkw13MYZieqbyEii3otTNX/P7ZDj1VpTzMJVLqU6vq2r1vVhSJCZBhNGBEi3kOx
 3G2lz22R1qMfCuDbGo7e6nls5iV28/EP+5i5SBlbXw8bdcXJdUgzuDjOuhX69DlCj/Gw
 CYu8YZaSNKPa/NdtaqvOwUnEsk/Gqnseo2O48tqRjhhakzT/1ZYp3mAfcUSshJLaG7C7
 B7f7jZKd+mVj3sa9oAwN8q6GCxQoCGRQ3dsQ89iH786bGGLU4az/YgaDqiJPZBvkx0Ta
 +Qvg==
X-Gm-Message-State: AOAM530/tZdcmpP7HrA/uvmy5bCBa/Q9uDfiIN2LSdSOmLVMIYDLGQdO
 StE29+EI5PW4s48Eee0x9KbZS3EDRrWOr4p5NVYQgI9S5dZRbi/Y51QOzNJejUHQydK4GrFg4Oy
 QDpDT3VxzpWER7lI33D7OkiYZDRiGO9i/ckgLFhuuOSnsEN5I4joa1W1RoJFu
X-Received: by 2002:a50:d8c7:: with SMTP id y7mr61401321edj.133.1634725171886; 
 Wed, 20 Oct 2021 03:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEIPvi0bIji9GKMEZnxcLvIkAKtJeQOhStso3RjQqoQpZhaJhwUEsJAng2inQ5kjIYsddgkQ==
X-Received: by 2002:a50:d8c7:: with SMTP id y7mr61401280edj.133.1634725171646; 
 Wed, 20 Oct 2021 03:19:31 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p3sm823104ejy.94.2021.10.20.03.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:31 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/44] tests: acpi: whitelist new expected table
 tests/data/acpi/q35/DMAR.dmar
Message-ID: <20211020101844.988480-7-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DMAR.dmar               | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DMAR.dmar

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a2843335c8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


