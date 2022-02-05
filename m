Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA684AA571
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:51:29 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAEa-00074p-3y
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6J-0003gj-Ew
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6G-0003IN-8H
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+T8qucJ387ei/9dUQXGMLrCgzMKuOac0iEv5x3VIdi8=;
 b=SL0LL/OqxElf5Lig7I0xc4MpOGpymQsPnvLB48B/oqtfyLxUkW8tvs8PXEmQwOq1iX2gWh
 17S7HoXTPkmMJBs4AM6z0bK2LTocVjGWz2i/YQh1IueaEf964I3hfc+getnpzRtBdphyPe
 5IqEr4t8XrgbrmLx0kj1q8HrBhVgx0Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-iWIZzhAFPACtLLzhSMSpDA-1; Fri, 04 Feb 2022 20:42:50 -0500
X-MC-Unique: iWIZzhAFPACtLLzhSMSpDA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso8367504wms.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+T8qucJ387ei/9dUQXGMLrCgzMKuOac0iEv5x3VIdi8=;
 b=oZTXvdH1XBXq04m/I/nTgeCorvavqum1UG5n88tqBJZuYlnGCHt70Sb0BVka3bHWwC
 tqJJl8NZN2PInhNDvDa5fqM4tSBNO+lt+jk3SpICZY+J1XYVKUe8cZLkU3Kk+HU95x86
 x3hOohqN51kSTawZVxT0uRhQy6njaa4TeJWeNPtFrH2vJgC7YPhRKWQVFG4n7zly4M5q
 tUH4Nyax/kBN8trMo+n9Z1bF4BZLHRl9/gUxTgiE11MqY4ZY5HrGpIP9p6wWkYVeYmog
 CWWidFjl3MmCx5MN0vGSiHthhYmKr+UR8GI7pQh3+r9BxzBog2zdzNNLCzKrPKsIgO0L
 oD4w==
X-Gm-Message-State: AOAM5308bLLWPo6PI2/tBfAM1EppFdfGyWYC/coHMRHETwKUjY27Xhn0
 Sc3Kc2ja5sB4D//8vVDia+56kWXXlLEamqja4Zz3kIl7PZLlzyh27ATTE8BGoNbexBMAy7oQz6l
 uQB/+nBo/FbA1tpncaLqPQXuKFD9wB9q9zqKOIgjLfe4anQpMQFdGLUESVpot
X-Received: by 2002:a5d:5552:: with SMTP id g18mr1237324wrw.343.1644025369088; 
 Fri, 04 Feb 2022 17:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/1pBw8bz0icJM7fTq2l+yPMXhLdMaXDf6uv57nNMsNvy2sHQ68bZ+wLGk0JZ+QsDN1Hj3Bw==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr1237310wrw.343.1644025368838; 
 Fri, 04 Feb 2022 17:42:48 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id o2sm11795141wmq.21.2022.02.04.17.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:48 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/32] tests: acpi: whitelist nvdimm's SSDT and FACP.slic
 expected blobs
Message-ID: <20220205014149.1189026-5-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

The next commit will revert OEM fields whitespace padding to
padding with '\0' as it was before [1]. That will change OEM
Table ID for:
  * SSDT.*: where it was padded from 6 characters to 8
  * FACP.slic: where it was padded from 2 characters to 8
after reverting whitespace padding, it will be replaced with
'\0' which effectively will shorten OEM table ID to 6 and 2
characters.

Whitelist affected tables before introducing the change.

1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220112130332.1648664-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7faa8f53be 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/SSDT.memhp",
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
+"tests/data/acpi/q35/FACP.slic",
-- 
MST


