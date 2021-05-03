Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190737224A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:14:46 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldftt-0000pZ-6I
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpp-00042B-5s
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpn-0006yN-0W
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
 b=Pnh3Yqn7AtMg2g4xxVNtDzbmOnoUzDa+BjqqKA8JUU7KV6hqAC/fJx5HYYxT0hZYFNDz3e
 aUNM1e553NDcuiA+XJ5Bi6cNcvO0fzMn6o1wBl/sQkuS5365MeFvLpUiU2k2ZhS5FybUH0
 BRenbR59c2OLbTqog47cTAln7K7GL+A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-0innDAulOMmDuszqxxO9pQ-1; Mon, 03 May 2021 17:10:28 -0400
X-MC-Unique: 0innDAulOMmDuszqxxO9pQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so4605372wrs.19
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
 b=hmN3Xe2fmEjf24waZ+6tbrYu99uwq7Y0T2OcPb8Eh3wEu/1trgn6NemLgdZhl8VZ2E
 UB+u6WLD2C0FWg+M+NYJdkUhzej1Vi39KzfFNp7G5QJp3Qzp4XHssML+DyPabVmLRkcq
 jo2NY8TR6SzPbvJ/NeMLlyFeaGzASG4Zz0R1aW1qp1zKFqf89cR/DDiQfTHvPgrNIZJI
 gE5x1RJug/UjR/waSEfJuxGS1FdU1jZFLOlRqNmfDyH0NRvucCqSmfAq5GHR4zr9Vegl
 FNeUbaMYLMJ6VW8ZzFhE3mO63G/9KCQbh1qmbreEfA808HqIdGrhfjEhfJf1gMKMOXkO
 qb8g==
X-Gm-Message-State: AOAM531bk3nE6Iquz5h9I1N0TxVd5q9b7p1CCmPWV6jeFSwnvm5EYmft
 G+c/vE2DoWvmhuHkakk2PYYKxkzcw79vvAcBVxJwn6Sk3aRUcNjOlWjAS7+ZvyXDKxsw8SS8cX4
 AcXZdenw9SSbT1O8E+8hhsFNBDS0PFXm/lKas12FQ35E4lXRmnO5+abFs4qHeqfBy
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr22800415wmq.173.1620076227540; 
 Mon, 03 May 2021 14:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc3ocGKGGqR6ReiCPR/OnxlCYrUP87FEBH8F93ACKARjFtmy8P4DBVXawgxUi9tIE9eQckcQ==
X-Received: by 2002:a05:600c:4ecd:: with SMTP id
 g13mr22800386wmq.173.1620076227278; 
 Mon, 03 May 2021 14:10:27 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a15sm13328777wrr.53.2021.05.03.14.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Date: Mon,  3 May 2021 23:10:09 +0200
Message-Id: <20210503211020.894589-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c05ff8bbab..5f1f59f9b3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3


