Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8A322E5A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:08:01 +0100 (CET)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaEC-00089e-MS
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCS-0006XJ-8o
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCQ-0004hN-MR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7iIhzId1IuQhhQJ1K602hukzgZZn8+WgBAjDnNvPnA=;
 b=KfoNqVZpYJYPCLwLaoXrLNEu+yMzyufIrjXWrfprKX/mD9kCzoM0HhFuEUSM2KTaUew7Oj
 ynxQrU6I9dfZm5kepl/tDJ5nN88TYdiwRoTTuBA+BZ9siK2BtG8oL6+pQw9v2wuo8XT25R
 ORn9FYkljPz28mrIutXHIwMvFlUn7Iw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-M9QtlxKAO9GrVaNOnVu2CA-1; Tue, 23 Feb 2021 11:03:55 -0500
X-MC-Unique: M9QtlxKAO9GrVaNOnVu2CA-1
Received: by mail-wr1-f70.google.com with SMTP id j12so1929317wrt.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W7iIhzId1IuQhhQJ1K602hukzgZZn8+WgBAjDnNvPnA=;
 b=aNO09qba0YiqsekWZZ7YhuPX32kRvQSA3BhcMIob1ySiANuqvl3z2p3aAEKncQeLoe
 INAxFmCET5THQ6Xi7QWJNscgpsqpLAM7hB4mEEDF3nvvFLHUmdSwOXvvWvxxVgHOpUtd
 u0kOHwlaUFtndZil3CwpvrhOebCTTNT5bZNhCMzBxuUmHasP6hqSiBsg3lmeYx7CoBVR
 p0LO8HOWq/cAV5JSL0R+6rgXh41PAHliWOenteLdfR+EjUMLc2rNInoaX6LYo8Xh8o4p
 GClNlm1VSSL3S5WSC+dZsEKFxUJM5H7vQfDYZxidC5ytQgqZ6b/5rMkWIM7bUjGWGUfL
 E3oQ==
X-Gm-Message-State: AOAM531+hoD5YX6YC7LoApE3ani9/16dEIV6oLuBGzxT/p77bIncNcNJ
 NSLvVs1iJdOx+Dix7ApiPy+FT9Lnci2Nj8zISR1zckJNcx1T3tSLZhyrLLAO/kRZrdT9+6Ws3Fv
 gpmsPykAXCJSFlzHkG4mU4z+osQN1BxvmiwzdB0JBxKHdrvpwsF3sCNs6toDx
X-Received: by 2002:a7b:c157:: with SMTP id z23mr22508349wmi.176.1614096234196; 
 Tue, 23 Feb 2021 08:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJhoC8ojGZxc6RD3AIqY2KgfBf2dvqFVx3gAxfNwoEp19+BkvoruxqALccK03xO5tVl2xXaQ==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr22508335wmi.176.1614096234060; 
 Tue, 23 Feb 2021 08:03:54 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x15sm2007186wmi.43.2021.02.23.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:53 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] acpi: Allow pxb DSDT acpi table changes
Message-ID: <20210223160144.1507082-6-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Xingang Wang <wangxingang5@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1612490205-48788-2-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..90c53925fc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT.pxb",
-- 
MST


