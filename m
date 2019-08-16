Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83E90327
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 15:35:41 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycOK-0006GM-PK
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 09:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyc72-0003W4-KT
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyc71-0005js-DE
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:48 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyc71-0005hb-72
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:47 -0400
Received: by mail-wr1-x441.google.com with SMTP id z1so1504909wru.13
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dgkcpwUGH477Gg/fNptnjN0QOcMB45au6RquMB/K4P4=;
 b=nuVVS+1gnm9rroRAt+Od79+qa3sWRm+YkTgVO99ESs/L4Uuf/0TVn7vEmroNv7QIPt
 F10yq0RTNFlNt7X6rqpiebOcHcbiYl991I/+8zkLPmuUUj7juLGJyYY1/QSUfoi0XLEK
 G2TGi7sIKNUtSXN9txuv4cwVxxEQgCAsYdJ4bhjpYN0XS0ihgyVuVdgsYyl4onFu1nu8
 ouCV6P4A3NPVxUVZpUuYQhnrcGA4Wb+2OqZAxt5z668yJnYaJNjsRsnBfvdtVAYFWLEc
 3ktlS3OuARVBxnZiEZZFZ2EKIpJ9ks2DnwrP/9l09r/q9DgDVD3RpnThfkUY2+EM2OsQ
 K7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgkcpwUGH477Gg/fNptnjN0QOcMB45au6RquMB/K4P4=;
 b=iZG7a86NIYXr2QbS3xMCH8XUw+YysuLGvsE9ANZ1XQHvRZ673Sdh/82Tj7vqAxnNxn
 rKRpyVDIa42YWGOXbzo5uj/A1WlABF7M8tkZ/BkYyz887kCSBOHhHadzwKVWwrtveUAW
 nrNic24Bi+fn7OZQu5MjqFdRn+YTtIxUwn2nLJFT4g3LbxEpMvwJOWBQtQfGN+Lpr0T8
 T/A9Z1t5ZcEjH+C4u+QJp+DFKINTD+uBFnEYvhU+s/HbLVl6WLsDQzxEuoLzgq+qEPAH
 MSccXjPLIjZfQvSKlMejN7btw5QvBh85RUrkiE4XPaF13R9CWlxHfP/p8cAKWeM6xK7w
 +zBw==
X-Gm-Message-State: APjAAAXkJ8ttXqiY+XX4DyFerKH/tYBVGS48TJWveXzRMRFslR0t0aGB
 pAjXIJzNLB1+qiBYoQLT9YUlt9s62zt7vg==
X-Google-Smtp-Source: APXvYqxsX/Q+29MNF5iLNV4Vj5iBoCQzzNJS0aG38BBHcgyxBeYjAChMlzBa4B8yGzmH0sH2NmC9/Q==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr11449675wro.215.1565961464199; 
 Fri, 16 Aug 2019 06:17:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 4sm8705796wro.78.2019.08.16.06.17.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 06:17:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 14:17:11 +0100
Message-Id: <20190816131719.28244-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816131719.28244-1-peter.maydell@linaro.org>
References: <20190816131719.28244-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PULL 21/29] target/arm/kvm64: Fix error returns
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

A couple return -EINVAL's forgot their '-'s.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3d91846beb8..ddde6268b9d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -854,7 +854,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
-        return EINVAL;
+        return -EINVAL;
     }
 
     kvm_arm_sync_mpstate_to_kvm(cpu);
@@ -995,7 +995,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (!write_kvmstate_to_list(cpu)) {
-        return EINVAL;
+        return -EINVAL;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
-- 
2.20.1


