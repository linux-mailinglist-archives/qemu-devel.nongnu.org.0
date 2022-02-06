Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31074AAEAB
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:48:47 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeA2-0004hM-SB
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzr-00009Q-7x
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003dV-3p
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+T8qucJ387ei/9dUQXGMLrCgzMKuOac0iEv5x3VIdi8=;
 b=gsvUSHKU13W+I6WcwrCd6JXKa1UKcktONWDyan8AUNTKcRbSPrGe8l2EZHX6QnUCq+42XH
 TbNFL+qCz91Mnxb9W8mYdrqJEv2B+YPkJXrpMw+4A9A3gd0G/s0M+xQSxjQSxgc4pr3m5M
 MNV9kzdIW7vH6eAe+lOz5ACKK76ILJI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-BSnAjnb2NKSQhyMffYc0kg-1; Sun, 06 Feb 2022 04:37:59 -0500
X-MC-Unique: BSnAjnb2NKSQhyMffYc0kg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso3785056wrg.11
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+T8qucJ387ei/9dUQXGMLrCgzMKuOac0iEv5x3VIdi8=;
 b=mKsDKlGRSOcx21jicZy8Ssvqtxd/0EyaIZUmYrqw1VLeFSQiE2H73Jv4qnOJVCpjSk
 98q/Eqi2VkkBQqcI5t63j4X2rU1NSvz0Mr0DmXf/iXJkQvSy3AxsIkHBrJTzH7v5A3lg
 WzdjgHyu6h/BcsjxQWoTdBd3SHEbO7aKEOK7ohmgn6/i6KSvUe4jvPQCRadDIXZiPzLA
 UjlpDkELS1dLQUWcNaAWXQR1vowRTJmWlpGtRqsS5AYDZOzjliHxyWVPuldqiwdZMGxG
 2vqbxdPgUVvftaOUgqqqSjpPj7w0B6QTg0r5zcgK4XTeT0cVTtf+1p9An1aN6qpcdf8T
 ketw==
X-Gm-Message-State: AOAM530eUJOli5+TpwA7+kxV4ZJDzPtk+G7Qcn7TA/yqj7X17HXa3Mac
 ULewQGyW5/WrwQrubYbcjYOGVu+cwTkm+Ty66TT6t7IU6dgj/XabNRyU4Fr3XBKcWdyDZE136Iy
 GfdixZffcfLBFIx2JGgorkLo4OPC1U+4lQpnvd/wC7Ns+8VSw0zQQ0NGaf0jQ
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr994129wru.598.1644140277809; 
 Sun, 06 Feb 2022 01:37:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbewlkIsGqZlE/zpO5BJ9FW5pKJnEX146ZV+hkDr5W9u/4yC9Mr6J9i+8aweqEbOr/x4Z7ug==
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr994114wru.598.1644140277617; 
 Sun, 06 Feb 2022 01:37:57 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id t1sm8014997wre.45.2022.02.06.01.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:37:57 -0800 (PST)
Date: Sun, 6 Feb 2022 04:37:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/24] tests: acpi: whitelist nvdimm's SSDT and FACP.slic
 expected blobs
Message-ID: <20220206093702.1282676-5-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
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


