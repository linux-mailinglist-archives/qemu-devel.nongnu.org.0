Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA664876BE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:48:06 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nj3-0005WD-Pr
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n43-0001ZB-80
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3z-0002Gq-N3
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=XxSQWEwUBnHieqEsevALqKmBbZhMc/mgMw6VpFq9Ip+MgCfpHTchxwYW+d2pIk0U+nZR/C
 XCeQWKPd4ui7OmZ07VbD5mydAqfKAu2ypyFyAMD5iblzY6OEuZL5rO09lzSXtrSv9IPIjF
 udm6Dg19th3ekztx+EozQL9/DvLLWlU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-CpSYg9u4MVyzG3W_ApdhTA-1; Fri, 07 Jan 2022 06:05:22 -0500
X-MC-Unique: CpSYg9u4MVyzG3W_ApdhTA-1
Received: by mail-wr1-f72.google.com with SMTP id
 i23-20020adfaad7000000b001a6320b66b9so264056wrc.15
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=UZUF7k6qK+IJBW+/uHBK5sUHYgtbJR9hlxF7bXY2mYFrP6I+d/dtceoJ56b6jsp69q
 hEWbkEzPlEGANf7UX/WPP2i2o4SV0kqp8Y+iqmBlBs7SGc6ee/GO7siijcnCcw0/zicY
 3RBDbIJcDVo1TKTcVsS9qaoriqHlyMt3whZUdkQrgHEofYf/C2uoLM89eW+srNyQbTrV
 T+thwXEyYIa7soiPESEQZWzHfyqBrY/QY40krRlXo68row3GIrpqBEvtMWoWebrLFLwA
 UOSdn5jCsuLrEAzsp093OE165vDfAzAJrERItKyee5AcZE4DF6Al2YJ7bD6WYHsdY630
 Z3Sw==
X-Gm-Message-State: AOAM530uzGDqN2FKF2Vkn8PUmAavrqUzQ0St1oUzcV9MJNELH5ihhCdC
 8K+v9sDdgIMENNa22zgQPQ/hgeOPXLIod+jO8+x+HHk7tbPuw08b3JHH3hQcAI2AkPbGUSiDH7N
 S0VpF9oIxSWMaoKJtd31S/BAivDL0i3S8j0KOE2LXo/BcbZn2Y2xR+qG/im/o
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr53719296wrx.193.1641553520785; 
 Fri, 07 Jan 2022 03:05:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzN5isByyhjq9dB1ToplghQcw4P6X2HMoszgUJKktTnXWlxnHYO9ed+cLvF9oqB6rCx72BTw==
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr53719276wrx.193.1641553520537; 
 Fri, 07 Jan 2022 03:05:20 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id h204sm4052428wmh.33.2022.01.07.03.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:20 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 44/55] tests: acpi: whitelist expected blobs before
 changing them
Message-ID: <20220107102526.39238-45-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 ++
 tests/data/acpi/q35/FACP.slic               | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic               |   0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/FACP.slic
 create mode 100644 tests/data/acpi/q35/SLIC.slic

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..49dbf8fa3e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/SLIC.slic",
diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
new file mode 100644
index 0000000000000000000000000000000000000000..f6a864cc863c7763f6c09d3814ad184a658fa0a0
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~)5+i2BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD7?GM2V5Ffej3F#P0!h{7ddihwku0+2v57svwxMxcSn
X_QAxFX+{NzJ3wNL4G8yu_%Hwf>-7!+

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SLIC.slic b/tests/data/acpi/q35/SLIC.slic
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


