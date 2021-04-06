Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A73553ED
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:32:31 +0200 (CEST)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTksc-0000OS-6b
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AF-FZ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn2-0005kw-7c
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id k128so7280291wmk.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pgvSzvRpmWevdA6Azv2SdIXa+CwDZXf40b5iS9adnz0=;
 b=rVXZgVQ4q2Ar/ruSUqRqEA12TzvQo6DgJ3J+JjqyIh0vPh2iJ+bKZH3vPmeNEEuJRt
 5Ig/v1bAnIUrZUT0hJxWnier7qWJj75ukXeua3A4l8qtJD0BIKHzANULh+135ikHNqEF
 F+8x2lJ9pb8YDH1C1hRWjwfWVN16JNsVNnndVreNVG0Q/wXE24pMzHVWuFiOx0NBFXPs
 ZMfNXQvsscvGpFZMYXtOArVEoup2Qvv8Sp/WXYDL3/w0huDaTKAcdJB64ocuxKuA1d/M
 3KbC08Fbv/BeXE6ChD0RBhJEjNvGrpnN7NF9qVXPH5ASTeksyjoE3VVUcM9fYsAmeHJ6
 xP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pgvSzvRpmWevdA6Azv2SdIXa+CwDZXf40b5iS9adnz0=;
 b=KURJyFxtbgCU42nebYsDiNH6Wyx6qZFSvZaq9IgmOXJLyZVxjliOxbcnLcnDE966xr
 zbt42jrhJYJkylV5dOol4ReHSal1Ci1Zj+ZT4U01UYvfaqMYtViViLue9qB9SHywFf/n
 S7N/QZ6BEmgamoNDsdmmgDoHWLK247x6vRnio+HkKtKUd1oqazlXTZpviuU0UxFt7q8G
 Ue/KTvn6mjyll620lP0h2qR7/+iWebQlhQHD+RFZaj/NDCxPpXc87+sPM8nTXJl+oxQU
 NOK3CgWHFYkPB9R5tcSG7RleWGjuDl9Ing5gV0/c+nipu+AaT/YLNZopi3QKK5tYhJOg
 800A==
X-Gm-Message-State: AOAM532iIywYZCdeaHaaxagVfgKyuhwh+YMVABqaa5ktosnTKlWzaOOz
 /yuIuO58wHNia0snH+cHwJHXxn8Ww4mTD+Rd
X-Google-Smtp-Source: ABdhPJx90ukWBJM3JJTEYEcyZh2b6LDr3BXXptOF1kbyMQ3FZFSNoh3QE+43wnBP1D40RFAu37cEKA==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr3866390wmf.93.1617711998172; 
 Tue, 06 Apr 2021 05:26:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
Date: Tue,  6 Apr 2021 13:26:30 +0100
Message-Id: <20210406122635.28268-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406122635.28268-1-peter.maydell@linaro.org>
References: <20210406122635.28268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function machine_class_allow_dynamic_sysbus_dev() is currently
undocumented; add a doc comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210325153310.9131-2-peter.maydell@linaro.org
---
 include/hw/boards.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4a90549ad85..6fc5cefcec5 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,7 +36,22 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
 
+/**
+ * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
+ * @mc: Machine class
+ * @type: type to allow (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Add the QOM type @type to the list of devices of which are subtypes
+ * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
+ * created (eg by the user on the command line with -device).
+ * By default if the user tries to create any devices on the command line
+ * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
+ * for the special cases which are permitted for this machine model, the
+ * machine model class init code must call this function to add them
+ * to the list of specifically permitted devices.
+ */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
+
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
  * returns migratable MemoryRegion provided by backend.
-- 
2.20.1


