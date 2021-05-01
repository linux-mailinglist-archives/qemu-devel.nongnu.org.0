Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A9370934
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:38:49 +0200 (CEST)
Received: from localhost ([::1]:49792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyG8-00061k-OL
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEG-000494-6O
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyED-00087p-IB
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
 b=Zy39JdQIqBoZxGXQsfoARkliH8D7S8iE2XufsrJU/trAqScw7HSr42XoZnS6gnYZfrZOtE
 xHqM5pfVte/uyZwrcxmlE/W23M8EzROg/9Z4PZIg5fXRkZhdtJsVTPk2d/CH/fdM5LbUpe
 m2gk0BYHsKYnlmcSjmJOnZcB+8uz4mo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-6bT0zKreM1Gbi3OC7tsb2w-1; Sat, 01 May 2021 18:36:47 -0400
X-MC-Unique: 6bT0zKreM1Gbi3OC7tsb2w-1
Received: by mail-wr1-f70.google.com with SMTP id
 h60-20020adf90420000b029010418c4cd0cso1285825wrh.12
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
 b=b8sB8eVgzittu6s5DJrGjPugRE38rT7xjOFX49ZgmbNFeS9a5k6FP5iBOyiCKldSWp
 E8HFYrsgpe+sm6TmnMBlJt8pbOOT4jsj3vuYSSEPzGGxRDbtf2D6ej0rilsL6K4IiXoL
 5sUAm4VAcSAqwcVF4dlioCcyYNav9BKyVWItuXG2rGPYnz83yYduW669gQst5wxap1qZ
 CusAZK2wwKmk7CAd+hxYvjMobcHYeHiUjimHQWtnJW2GfjdhlCXauzxWxphUHZmFVeZX
 By/GuST/o1gxsmmwbzq4y/FhmT3J4a+Lg3gEhpSENNt46ABjkusCNzmp0K0+50V/dS+2
 f9rQ==
X-Gm-Message-State: AOAM533dpQjRoceVWmgiViXRXBlfBNhaldibrF4FzijxFnp7fJm9kfAM
 7ZeEtxLQUpmuysGrxfvMZg3i6zq/pt2MUaemT+nYu0fYQblJ94WGpU5d7mdRAPcRiRDu1aIjd8h
 C8pDFNQQuPmJwArHYH1AzRpY+fSCHgheooeBvcOV/MCLHTDjW2VMsA4AGgwh3W8zC
X-Received: by 2002:a1c:5945:: with SMTP id n66mr13739570wmb.139.1619908606074; 
 Sat, 01 May 2021 15:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRtwoaKF09JBQQTEcLGM34cADJCYOJwykKT5bzZk0b65Zgjykd4tZQTMH/+gnxeSogNnFeAA==
X-Received: by 2002:a1c:5945:: with SMTP id n66mr13739542wmb.139.1619908605850; 
 Sat, 01 May 2021 15:36:45 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z7sm7154737wrl.11.2021.05.01.15.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:36:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Date: Sun,  2 May 2021 00:36:29 +0200
Message-Id: <20210501223638.510712-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
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


