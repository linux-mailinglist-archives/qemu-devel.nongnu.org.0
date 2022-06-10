Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F192545E2C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:09:35 +0200 (CEST)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZi2-0007F2-9H
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWR-0006Rd-Eb
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWP-0006Cq-Vq
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kDyfM4SfFP+l7PSGm7C9/Ykz21RiBvUGS+3VSOcz54=;
 b=U115ihR91mi2MDzcCDnSJPXgFPYQX4p2l6I2GH0lQS3y8qnIZRuuPfJ/7LyllVBy9C26P8
 /vYC4GEQvvUzcl0u2MSC1b9NWNlioWvwwhvoRJXVB5Ua0ZC74c1MOgJDF4wHwyjIkyN0cQ
 slrUTxDHpvIjRI3OgjXV7UYwsjpY0jQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-45tM1UOdNWOQA844vSngCA-1; Fri, 10 Jun 2022 03:57:32 -0400
X-MC-Unique: 45tM1UOdNWOQA844vSngCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so9342624wmr.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5kDyfM4SfFP+l7PSGm7C9/Ykz21RiBvUGS+3VSOcz54=;
 b=nCUAkpNSPY8Ya/AbhUweDQf9p4Ky6mCv/GsvcIMtsE53MMBaYp9jInyuZp3rv9ta8W
 zIRE/MTMg0UHo9FTptIP1o24Ppk3D+fDK/RTWCZcBLg9wJNOCgnqukJRkpiDP+NCImiM
 JYX/ltn062KU0wX6QTHWU6xeuhL75ZuMqgNz+qlm33gl8kDu+5zxHq0wvQZbWPZQCKVR
 +i8l0BORIQegiOtRth1N7wlOKwFxNmyPGsLQY6i09HhSeFvCjibu16bcc4YLSXeSUEoU
 LFLO8cFdM6m9Dl5lmYQ8BBpELR2Hs0pOSM2wIeFqMpPN+41E7CrFKTggN/NUZ7FNxWTL
 0HaQ==
X-Gm-Message-State: AOAM530MFqiSgKXeH12bbYUzH8SMRmQNm9UwFUxRwEAOnWo9EhV9M16T
 Udd30aSTxktuOSzcZibH2lI/aRJqsDpud76qeSSHgh88ASaa/qWcV/2V/ZEvgjaHvckr/rYkxAX
 eItKYOyPUB5rQxKyjGtU2FWyVJ3IA05nOY3SJ1SYgvEIwJ8lDrDdvEDaLD3RU
X-Received: by 2002:a5d:4ad0:0:b0:217:d2cb:d6d4 with SMTP id
 y16-20020a5d4ad0000000b00217d2cbd6d4mr27297161wrs.211.1654847851021; 
 Fri, 10 Jun 2022 00:57:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzExv7GpJj4RpNgvWDZIAneZOVIlPDbRdELvaHXCvKTxPngWrx5U0XzjIUayBX9wzE6X/k5XA==
X-Received: by 2002:a5d:4ad0:0:b0:217:d2cb:d6d4 with SMTP id
 y16-20020a5d4ad0000000b00217d2cbd6d4mr27297136wrs.211.1654847850781; 
 Fri, 10 Jun 2022 00:57:30 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 y4-20020a5d4704000000b0020c5253d907sm25979853wrq.83.2022.06.10.00.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:30 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 09/54] tests: acpi: add and whitelist DSDT.ipmismbus expected
 blob
Message-ID: <20220610075631.367501-10-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

.. which will be used by follow up smbus-ipmi test-case

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220608135340.3304695-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DSDT.ipmismbus          | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.ipmismbus

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b4687d1cc8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.ipmismbus",
diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


