Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF004334B7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:31:42 +0200 (CEST)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnLJ-0000jH-Un
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAD-00009O-Im
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAA-000211-94
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NYKn9Og3lz4o30x/1JiH1NpvUb3mCz2MPvSBP82Jf0k=;
 b=WfU5Ct/ko5UfuasrjdMAxfCPnEityAOxZ69fTmO3UOqcCZvEhW7qHhYoSkMVi8VnD3Ht9G
 sMvjt7tva37FhF7bTzu+VynmhQtR7jijTVfE16GGPge2FU7ffN3YOF+GrM5LIfQjzREw79
 bbbzKBoJJ6537aHC3kXHdlVPmk/bkyc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-hQ82ZHE7P7Kt6BWEoyq_aw-1; Tue, 19 Oct 2021 07:20:07 -0400
X-MC-Unique: hQ82ZHE7P7Kt6BWEoyq_aw-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so17255713edi.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYKn9Og3lz4o30x/1JiH1NpvUb3mCz2MPvSBP82Jf0k=;
 b=nQj4w0D+OnKQlZgKPV4sLQ1EECoW6+fqSmZuC5ghbv/Oj3jBNaEwuu/UDuxJ+6tLx0
 gYH6gGuqum66SgT34L/MAO6nBTkR20A9a/Icc390lcbiMytWNK0b4l4CAWH4XLgVgUzn
 hl+sQQ44ysta9zN/qNijSgfhQNF1CLjFOSDthQ5yFGLgr6OQJX0wP4GduFn4Fmo9Dayp
 K7gUkgYKvp1gYL0UZsTp08eZtmFMrUjuFEzKWvVgDDoTZKnqm9IVoSa24E2gpasIUu3e
 oAvqdlzH7h4TRtNK8J2nhMvHInn3s19Di4UrccruDKSzPa0VV9nyZDInh+cgKYAOwrPr
 tLDQ==
X-Gm-Message-State: AOAM533beu3vyb2mOaTxLV2VjNIZ0nGzoSl8LHDE/Mus3krB3A9vTqKw
 5IApymSmmuy2PPCrViWmbV7S9wVNfhswFzpKFAK3znOeZJMzRvezC3otorcYOpUK6GshYqAZbAH
 Tzw7WesiqZOdhwMycuKwDa6FeTyaWahoWYh+DjEe/yrz2mwg42iOdqWupHNhi
X-Received: by 2002:a50:eb92:: with SMTP id y18mr48464049edr.153.1634642406221; 
 Tue, 19 Oct 2021 04:20:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8KleK3vROsemyunYrR7urylwE3fhZJnp/iS0B/urEjRr3Bg+/+ug1A2LECfZWePLvkd9fBw==
X-Received: by 2002:a50:eb92:: with SMTP id y18mr48464012edr.153.1634642405998; 
 Tue, 19 Oct 2021 04:20:05 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id w15sm9919883ejb.4.2021.10.19.04.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:05 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/29] tests: acpi: whitelist expected blobs for new
 acpi/q35/ivrs testcase
Message-ID: <20211019111923.679826-10-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Message-Id: <20210902113551.461632-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 tests/data/acpi/q35/DSDT.ivrs               | 0
 tests/data/acpi/q35/IVRS.ivrs               | 0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs
 create mode 100644 tests/data/acpi/q35/IVRS.ivrs

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4fe8e8272a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/IVRS.ivrs",
diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/IVRS.ivrs b/tests/data/acpi/q35/IVRS.ivrs
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


