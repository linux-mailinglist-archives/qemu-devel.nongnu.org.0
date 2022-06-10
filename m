Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FE545F4E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:36:28 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nza83-00088S-C5
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZX8-00007n-Gr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZX3-0006I5-BL
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rvIx/BoI0pIYAkZbBQ6pra8sY6RBuWirW8hnBbq6FvA=;
 b=ANg/mQORtoRXwIgtse6Ti9+7bhOeiFBzwkvs4n9KkBY68sM9svMpfuLf3FkqeQZGRbKBnX
 iwA+PW842wQ6SfATBqA2BAb4vTj0caMSfOxm6lzdUAFaw8dEe0KECNYA2yuF6MZPd3SVzd
 j8cYrP+0HTYhd9od4iIRVdKKXj7/erM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-s_5sjBxwPcax0XKLKy_01A-1; Fri, 10 Jun 2022 03:58:11 -0400
X-MC-Unique: s_5sjBxwPcax0XKLKy_01A-1
Received: by mail-wm1-f71.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so1221953wmb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvIx/BoI0pIYAkZbBQ6pra8sY6RBuWirW8hnBbq6FvA=;
 b=zRSPCeuC4gcHppaZL81UEpka0SmyKZK5cfHnSIlpdGpMdrYbnAdqokYSNWcUKNVQCd
 CgIJXKM6z4ifkEFJVaYZ2fljbITmq5HKmSh3+eNUc7a208yxBgTd1PC/1CUAl5yvlfnl
 Ct+iSUFhBwnKboPZnTSmGzPdaZyATp4vJe9AVik0I6zrGXZVJhHJFZIk+yD7CbJqXV1Z
 C9blrfpD6pZrqWu9RdSawIUksN4bWBKbw4iJnAG3OFRkP+1PiPVtRNJhP7DlhUeLEv79
 kIBD1a+P3/8FHYnWOZL/kpR5qYFW1S8Mde159iM8HJEl2iS7dlJWk0dXD3TahtfHAnWS
 g4/g==
X-Gm-Message-State: AOAM531jEdnU15ekrdCueVUyz5LdIl203sgKCnVmfyMdmp96XAr5LEnc
 g+5xISO6LE+swRNy6VqiIEq5md1R9O4ftPxYu7pw3JxBNqYKyLtA2NtXLnYwp59E4WuT9k+4TZP
 VILtO6TsLmzfHFoBtEExtwZtB1LM44CpK/9ZLl+ONn1Ehv5Hbww7GEQS12OK4
X-Received: by 2002:a05:600c:1e09:b0:39c:5351:789a with SMTP id
 ay9-20020a05600c1e0900b0039c5351789amr7503286wmb.177.1654847889983; 
 Fri, 10 Jun 2022 00:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUpl8unYoQ51oxtsAHNrIfW/9XUphk3ITG8TyEpurSXGFnGFSLw0IUC6IIEMXYEJVblLSzyQ==
X-Received: by 2002:a05:600c:1e09:b0:39c:5351:789a with SMTP id
 ay9-20020a05600c1e0900b0039c5351789amr7503263wmb.177.1654847889738; 
 Fri, 10 Jun 2022 00:58:09 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 bv18-20020a0560001f1200b002183cedbf34sm14418933wrb.73.2022.06.10.00.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:09 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 22/54] tests: acpi: add and white-list DSDT.applesmc expected
 blob
Message-ID: <20220610075631.367501-23-mst@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220608135340.3304695-23-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DSDT.applesmc           | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.applesmc

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e893029d87 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.applesmc",
diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


