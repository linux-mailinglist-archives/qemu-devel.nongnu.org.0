Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6251C3D0C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 16:30:57 +0200 (CEST)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVc7U-0006Zj-PX
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 10:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc64-0004le-MR
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:29:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30559
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jVc63-0005uH-QY
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588602566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVNBXQ6gCt5bQDUAiEhYyrhSoB3/uLQxROx/EqMXEOY=;
 b=WSPX1s9FyizLf/Lw1AEVG019Gy2DxMSczdDM7DHtFZ5U+pzAxPBC6968zrBTeiHLdlMyE7
 AI7fy2lktinWWsjI06DpxICmH+42YW2hJp1LIIa9L/9zu42LNRcBAT1Yc7OPyvp2Kq/XE7
 qLPgAcFh5Q3CNQonrkilCMVV5J4ZvdY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-SWzU5saQNFaUktpH_B9ZyA-1; Mon, 04 May 2020 10:29:23 -0400
X-MC-Unique: SWzU5saQNFaUktpH_B9ZyA-1
Received: by mail-wr1-f71.google.com with SMTP id f2so10885537wrm.9
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FdYlmucZgrrExS0b58B/UTT/h6F9NNUpPPWcF8bmd5g=;
 b=SzFOZ6hFHTA7KrCs6sMNrdjpsR4ccQ3VwwGnmpy0D5pJ+KuScUm9qX9NNJ4wZPCmsu
 DTQriDAiO+Ith1PDaEVjg8k2SvB0oLdcNI5RzyVSRF8cdCjt5ODzmBLvT+NFr6LRp830
 GOR/nw73GlieLSbAlLJAXzkh/Mgh3zPAtdFv2z3gBccfVRY2uSs0Wuv1+N+qtsJ/P92B
 pmbEWOnBQNd3Qlj7QxNsqMMhOBo+Mr1VhuTQMEkrHQIX2cbC3HQiqSAoKAMSkG1vC7CO
 3mpuIRmm7LuAsFEEbYGJ0n9s8vKHqr5HyjUR42R/3PD89BEq1E15kgCIVqlMA6JSHUU5
 0SMQ==
X-Gm-Message-State: AGi0PubAnKmdpgCEyuiaV1Z6QJkuYzaiZz/9OummVaYkYopO9qaFTr52
 u0DUGUlKZoEAsRMK/iRpHQ4A0MGEUfGauG7RWJNtjn0nLRC30kjdIb1XpllTTBHR93Yv727GgPD
 iBhRAyhpkmJq/kHY=
X-Received: by 2002:adf:de08:: with SMTP id b8mr6998272wrm.76.1588602562253;
 Mon, 04 May 2020 07:29:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlTRZu2f7D3ENRjnzjyZQ1+CGYfWiPg5OcES4XO/b8gNznMiN12K4gJuzWHAisO1NTaI/nUA==
X-Received: by 2002:adf:de08:: with SMTP id b8mr6998259wrm.76.1588602562096;
 Mon, 04 May 2020 07:29:22 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 l16sm18804044wrp.91.2020.05.04.07.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:29:21 -0700 (PDT)
Date: Mon, 4 May 2020 10:29:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] move 'typedef Aml' to qemu/types.h
Message-ID: <20200504142814.157589-4-mst@redhat.com>
References: <20200504142814.157589-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200504142814.157589-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200429140003.7336-2-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/acpi/aml-build.h | 1 -
 include/qemu/typedefs.h     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 0f4ed53d7f..1539fe0667 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -33,7 +33,6 @@ struct Aml {
     uint8_t op;
     AmlBlockFlags block_flags;
 };
-typedef struct Aml Aml;
=20
 typedef enum {
     AML_COMPATIBILITY =3D 0,
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 375770a80f..ecf3cde26c 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -24,6 +24,7 @@
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
+typedef struct Aml Aml;
 typedef struct AnnounceTimer AnnounceTimer;
 typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
 typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
--=20
MST


