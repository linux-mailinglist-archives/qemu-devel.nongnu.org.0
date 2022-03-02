Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C04C9ADD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 03:03:41 +0100 (CET)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEL6-0005Xb-BB
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 21:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kM0eYgYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1nPEH1-0001tP-Og
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:59:29 -0500
Received: from [2607:f8b0:4864:20::c49] (port=36377
 helo=mail-oo1-xc49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kM0eYgYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com>)
 id 1nPEH0-0008Kn-Hb
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:59:27 -0500
Received: by mail-oo1-xc49.google.com with SMTP id
 t26-20020a4ac89a000000b0031c5daeddb4so242252ooq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=SsuwZhWo+ed7nVZvOpG/H3KPAbRwMjbTiNEUiQeQcno=;
 b=je6Ogwc0aUtFCzQUa/h4EBtoFJY8KIyyIqElzA2HgJz0x4u4zcwNzny3T3AOlWTdej
 6r8MfwGys6lFwgIai8dEVIHzAdUoCbo9UFT7TI6r+6aV3z+SA29978Mo2CqMyd9RyE6f
 fPUF42Kxii4ITceibIJqGvZ0sW+z5y8mQT91uFhEZSUqwyVc6KW1rDhgobpOBcvK/S+F
 iafBSHVTnZYAmt5tF0Pa9QunASYubO++T6ees55xcI2XvXPylC2ZRcRVkl7AgsLnVRXU
 mCqhXD5MqKClBW0wf8gG32JtqPieknznf3U7TKpkmk8IaaehZ85CKPnzSKWn4dNWVuAb
 oklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=SsuwZhWo+ed7nVZvOpG/H3KPAbRwMjbTiNEUiQeQcno=;
 b=f/W+jR6KnbJ+unDZTZIcSNc5m7/6MT/YwgmLvoxTg2zLlA+BZ60T+tl2uL0+QXKAJC
 yPykTxSv1CHNa5mVBKZE0tAXUdfSdQllUeb1cpyLOJ5Nj58Cj8US3tHkuyID064azK++
 CtjFFgggzTcgvIZ75dkW722/YgpsCevpLFOeNAHiLbM216s3HT7EERy0m0NaX9wAp4KB
 Ge5QKlVyYDkH602AK/O6UW4aKbij4uCnr4DBjvr6wwn1OmbK9PThtzUV2Y0nVtzb+mz0
 2LIEhgK+UBxK8x09YL1nVvFt2HLgVfkIR0d7rEkQimaGckhyf389yCRDc0LGB6FPfJul
 +MAQ==
X-Gm-Message-State: AOAM531bxuCNIjq247zt+kajhYs7w2igAT38GwhylbT+fsAPbsx3MENe
 HzRRKKr0VcBA1RTho46lIro0u7jEr3E=
X-Google-Smtp-Source: ABdhPJy/uwhxOrqaK7vLsjLNQKQWXmfglIUKYpFsTobCx+G7A4gl3VohDxGNCox9dtbakvwckQWGxL2x4aE=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:2087:0:b0:623:249a:73b6 with SMTP id
 g129-20020a252087000000b00623249a73b6mr26619843ybg.139.1646185872616; Tue, 01
 Mar 2022 17:51:12 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:49 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-6-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 5/9] hw/i2c: pmbus: update MAINTAINERS
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c49;
 envelope-from=3kM0eYgYKCr0wlwxvujrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--titusr.bounces.google.com;
 helo=mail-oo1-xc49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

add self to MAINTAINERS for the PMBus subsystem and related sensors,
and set PMBus as maintained.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..3601984b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3135,6 +3135,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
--=20
2.35.1.616.g0bdcbb4464-goog


