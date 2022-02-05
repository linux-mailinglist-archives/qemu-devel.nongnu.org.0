Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F74AA57D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:58:43 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGALa-00024h-B0
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sM-HB
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6n-0003JH-31
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALRDgS1o8czRYC4IeFcfTwDqPAZgH2apoiLtTHvcCYM=;
 b=KH9kh0eTQyaOYJb+1yPRIOKffsB2mLvpFU9kY4uFlGJ+iQPGbMtgDz6U81T9nHnpVsTzKc
 J3kARqE+ib6FYA04VcpSve87IIH1Dk3O7B3hnlIecRnFGC5pKBrrXbVd5wydCFMX424aSI
 6naTRCKcXxIdJ32QaOf1PrxFrR37FLg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-g0YOO2rHMa-fhcnxs4oFlg-1; Fri, 04 Feb 2022 20:42:55 -0500
X-MC-Unique: g0YOO2rHMa-fhcnxs4oFlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso8367597wms.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ALRDgS1o8czRYC4IeFcfTwDqPAZgH2apoiLtTHvcCYM=;
 b=KYkil0u8WveOHLa/NKxS14M528Qrp4fEugHehXIQHZ3fDmzZHCpRRT83PzngxY4XZJ
 hGrUlP6A8JjWyqa1V6Uj/Rs9Veqxa1muhqbgkog3epPQdm8KlOg68hyzyi6u5mqna0VY
 B8Ncp9dtc/KS63CMmsIXGTdMwZzQKn2AaryAJ5R+XTuR8+OdmszwIl2UiVV4qP24j2RS
 gsr+VSvRfD86FsPoRQT1SeHYFExUKTopNajL6GcQdB+hECuRw/0/MeOyTok9z5mj5eMs
 juTPSUrAaiZYWhU0/4+g8ZmXHSpyQlRckOS4uED5QM7wNlVp3J/IY3YUa7xjIUCt+Hqo
 17cw==
X-Gm-Message-State: AOAM532df/Cx1j4qqFW+cJsqrGqN3nePb+SEBm8pWhIBJJeInF4uAGoW
 tRj4fhqeX7Ndt2kJE793X6y8RmZhzOmIpSmHZgRy4+R+30dlYVfR8cVUudIA65TYWBEGojdGQCy
 yCtd8PS9Q7HE7+ZPJgmdH4WdXBnWr5lSSQgRrPbwJR6qtBBM6y04fkx0vylSG
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr1237903wry.523.1644025373698; 
 Fri, 04 Feb 2022 17:42:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVcTr85Ji3y6yPjhMremzt6aXmPjxx+FcfPq/PdzRBjC2UpF7zv04Lb3pj8jqsblVdYW7ZNQ==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr1237888wry.523.1644025373456; 
 Fri, 04 Feb 2022 17:42:53 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id a1sm3317318wrf.42.2022.02.04.17.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:52 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/32] tests: acpi: update expected blobs
Message-ID: <20220205014149.1189026-7-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Expected changes caused by previous commit:

nvdimm ssdt (q35/pc/virt):
  - *     OEM Table ID     "NVDIMM  "
  + *     OEM Table ID     "NVDIMM"

SLIC test FADT (tests/data/acpi/q35/FACP.slic):
  -[010h 0016   8]                 Oem Table ID : "ME      "
  +[010h 0016   8]                 Oem Table ID : "ME"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220112130332.1648664-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 734 bytes
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 736 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7faa8f53be..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/SSDT.memhp",
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-"tests/data/acpi/q35/FACP.slic",
diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index a50a961fa1d9b0dd8ea4096d652c83bcf04db20b..ac55387d57e48adb99eb738a102308688a262fb8 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortW0;e_vq!LkUzm%huP+0`Mu}rg0HzrUKL7v#

delta 33
ocmcb|dXH5iIM^lR9uortqnMMwvq!LkUzm%hudjl_Mu}rg0HV1GKL7v#

diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index 891fd4b784b7b6b3ea303976db7ecd5b669bc84b..15986e095cf2db7ee92f7ce113c1d46d54018c62 100644
GIT binary patch
delta 32
lcmeyu_=Qoz&CxmF3j+fK^CjmX$6yZyUsoUp2qsG00RW!Z2#x>%

delta 32
kcmeyu_=Qoz&CxmF3j+fKvygL;W3Y#Uud4zWOq93-0G2oijsO4v

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 617a1c911c7d6753bcedc8ecc52e3027a5259ad6..98e6f0e3f3bb02dd419e36bdd1db9b94c728c406 100644
GIT binary patch
delta 33
ocmcb|dXH5iIM^lR9uortqnnezvq!LkUzm%huP+0`Mu}rg0Ho;&F8}}l

delta 33
ocmcb|dXH5iIM^lR9uortBb$@Ivq!LkUzm%hudjl_Mu}rg0HKKqF8}}l

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index e8b850ae2239d8f496b12de672c2a1268e2f269d..375d7b6fc85a484f492a26ccd355c205f2c34473 100644
GIT binary patch
delta 33
ocmaFB`hZm;IM^lR0TTlQqrH>Avq!LkUzm%huP+0`Mu`(l0HqiSFaQ7m

delta 33
ocmaFB`hZm;IM^lR0TTlQ<9{cAXOCb7zc3e1Uta}<jS?rA0JOLYFaQ7m

-- 
MST


