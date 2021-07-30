Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F53DBDFD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:56:40 +0200 (CEST)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9WkR-0000pQ-BW
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m9WjT-0008U0-6S
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:55:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m9WjR-0005ei-Cv
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:55:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so12622321pjn.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFs5wuhTR8oju9OT0BSMxHcAviwL9wjor8UzOMeqWEU=;
 b=cvtuqc3qS3+yLqsZGSZKAduGwJVhq67iyZ7V+SeZsRFm0aaNBlI0pFiPp95+G/i6GQ
 996HwGBFuR62FxDQ0SAGkM9RX4sBiLdx2tWiK1KtlWfkgRFuEjQy1sV/+vOjbC1y47eI
 QuFjALwdN4g7JLlLjyRnXotSTz69v8JVILL6owTIDzIjgnOtJPy7loOZ3Hz1XyxvViNa
 X5zqqfxrbrJ9Ia77+rhNcHIaHMGsxZsQHBoiZkE65mhqlbmJlgLZdrebOhpUxQUTMNWG
 rS+MfNszvZqlQ9vIzlztEgBCP68KSQS9wn9G9xHGn98eG0V4VOYAsenaXfwqiYmQ64tB
 fWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FFs5wuhTR8oju9OT0BSMxHcAviwL9wjor8UzOMeqWEU=;
 b=eNN+LovcKdHvnH7fQemZkqp8t4BFFqLYLODD822zxHoePOcoGX5t8HFfuC7UmXZtyF
 aPuAg8rPbRg4UNv3AsWPRm1Qar1KPQYKV+R5NS0nHVEYCFEQKx5NFeikSvHtOXVDObF2
 GwOQLLoL1N0BaJXRuJBf8ju0momJ3JoLKwhFgqY8MqYtEPu9B5execqCtBee2um52Ukm
 HcY3ww2I263k0UGpL09w5pKhTsPnWILmZobsPzYPNNdHn4kB04A8uVH+GjCJxlni52Tu
 DIIjB5xxE8fqqcidGZCSTkP0jTnBWlaOGYqR0JJMsQDk6EnRJ+j/Q3bMUgovt49g4eB0
 PSJA==
X-Gm-Message-State: AOAM530dz2LYoHzTk13N72pYaX+2Ndhk/b1JOoywrdy359N+t/eCxcsV
 +xu8UYQQmrks/TWHP7qKxA6h42PyFj3U1w==
X-Google-Smtp-Source: ABdhPJzk3G9lPJkJeK8J0EWQDjjqQQD61/ldlJAoIiLzJEEfIt7dmiSkiWgKSz7VULE5EqeyiB4t/g==
X-Received: by 2002:a05:6a00:2489:b029:3a9:ba9c:aeea with SMTP id
 c9-20020a056a002489b02903a9ba9caeeamr3997518pfv.77.1627667734879; 
 Fri, 30 Jul 2021 10:55:34 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.159.107])
 by smtp.googlemail.com with ESMTPSA id a13sm3291652pfl.92.2021.07.30.10.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:55:34 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Added myself as a reviewer for acpi/smbios
 subsystem
Date: Fri, 30 Jul 2021 23:25:14 +0530
Message-Id: <20210730175514.40147-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 mst@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have developed an interest in this space and hopefully can lend some
helping hand to Igor and Michael in reviewing simpler patches.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adb..1c90ea4e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1739,6 +1739,7 @@ F: docs/specs/*pci*
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
+R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-- 
2.25.1


