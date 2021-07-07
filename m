Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C302B3BEA7A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Da-0005Hv-Rc
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195G-00010Y-5K
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195E-0006dd-29
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WWeA2pIPO0IzUBt1/L/ZYIXmbfW8GvdQP3WWUiJJGag=;
 b=fzgeuwSoYooOGSjg2WKO8um81ud7N7zn6cCYsVsOJGotYxryttPbozLSnKYI1m8EEQ4KDA
 471aHwyV4D+uKzREAISq8frkQmYwXeLYETs3F1f1x1f+1ZLQRo13e5g7KshWZ7iR0hicRz
 RwG/tmahCTlNuGOU9sKGzTkqfp4UmRU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-8u-rkQmxNe-YJMPtE2tIJg-1; Wed, 07 Jul 2021 11:03:25 -0400
X-MC-Unique: 8u-rkQmxNe-YJMPtE2tIJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so872389wri.16
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WWeA2pIPO0IzUBt1/L/ZYIXmbfW8GvdQP3WWUiJJGag=;
 b=M+lCL4XeYW2h2ftIuiAWJgkU0P4GSG+dxqG3fUcCzz3S4KrR8dsyHAcq09m2OPe00x
 3zDOgZ02ox8exDtzTwlp57S4JWKOvvYNOGA++Vji8g4u5ZyJVjiisolXe/WpN5zrFwNL
 HBsEmy50ppKzSMv6VMlSatVEFcGddWo95qDuAH+nWsjPPN61yOP5/pa/UWt8q2XXa3ZM
 NchnTBT7XdJjq64RIDLKSsJ8Joy4pev+YkT5p8/F30rFqP1cAfeqDV1p1/bPFJdPue+j
 fct6uCIoadX9rR65TCkCWdIaJbr+RpGk4LA1MCerY9N+O4zCXjvoIplXjjaKqGAKL/Zk
 b7zw==
X-Gm-Message-State: AOAM530Rl8TdSCDe1My7t4zR8Yhpqjhetv8lBGq4aa+gjngf3cjYgBEm
 ozMYVuInFxfOgo8krsEmFCcppA3y2pM9RZKoPx70WN3mmdecjxnVa+8f9i2oC+92g7ZXaitAFxP
 dnJ/MEFdDM2q2k3ycMw74/1n17eC/oy+T6QcW8fIyL8KN40YYz7p+Kg7lJNFQ
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr21558826wri.263.1625670204072; 
 Wed, 07 Jul 2021 08:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaFAnUIZgI4vkVVyngx6WjflrFHqUq8rwmqpW/BMuUyIGvmJE/+8ccWLurU05AOquLbWt+Ug==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr21558804wri.263.1625670203914; 
 Wed, 07 Jul 2021 08:03:23 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id p18sm18874739wrt.18.2021.07.07.08.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:23 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] tests: acpi: prepare for changing DSDT tables
Message-ID: <20210707150157.52328-9-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 John Sucaet <john.sucaet@ekinops.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210624204229.998824-2-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..6c83a3ef76 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,11 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.hpbridge",
-- 
MST


