Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B32B97A4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:22:25 +0100 (CET)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmhU-0005Am-Aq
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcv-0007kQ-7q
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:41 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcr-0006V6-4p
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:39 -0500
Received: by mail-wr1-x443.google.com with SMTP id u12so7093347wrt.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8eLVJbUNjYZyxrSQxAmxCAQnENDI0cgTjzGKpzQgynw=;
 b=Rkft/W1wjBqamc8D7GwFCpJNnldlRzjhYXSodM+OE2E8LfkOyPLtMADyIPoCbgpqQ6
 fbKz9+/Cj9Tvh0eMH8MCBr5wjU21svjdFFWXDCWUlLKchLP3GHLQ4FwpSXnqYQ9zbl6L
 w4ZhSt93HNnRgzCl+xCJ9OPlxSQATZ96+KG8+yTvA6AZ3HtE+3nDOVNL/gXSw1KKqIGT
 XHCaX80bq4j/ffc2gxMgT+Lmu14hDXmeCqFIoJ2UJYz2DvQ/gggaRZ5ubfoZwCTdsLtR
 xYujJK9eS9gbBD0Fss4x9YkVYoSy691mluAwh8vWfDsrbKbPza3adMQKg4Al/eCj3EUE
 SyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8eLVJbUNjYZyxrSQxAmxCAQnENDI0cgTjzGKpzQgynw=;
 b=Jbz7lEHFjRVSQ7u1INRwgMDL0oPSUvDjm4JUic9iC55k66t6OztOz1sE62ucMGxNPa
 NCo96P+LuQa/GG8Fezs1Oq3gU0ixDlkw6TQNB15ZrKQC5EL2P4fEs07PvDTDJbnTWTJ5
 OSTwplkoZth8oNrCzCmkYJjB9BeBba25c63HN46Rr+7veAYy5vAh36dP2lPauPwLWEj3
 NoFQx9oIpJizAP4Z/roreM9ggzqwITVKbmri6zxt5KxuKhOKuPL1cpzUy1WtJcMK21af
 XAr81NH2Kq0GbRqB+jM39+HRD8v6YWvB225X65pSY+N5GcOl8+iXSxUfCmGxw7qMn5MU
 WAzg==
X-Gm-Message-State: AOAM532djU4P6J1xVgEYYKJ7WWeANVAE3+msM9jRuTbTyZJWKnOi6Sms
 0oZM+PrrzPtYfrBG2esX5l3Ahbp943s=
X-Google-Smtp-Source: ABdhPJwp9Aiv2XdNJwc0GX37kiZDDD5JTYHsG+GrSJYAYnvPLKWLdLigpls4qk6HJH28qVy3l8BbKQ==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr11197447wrv.306.1605802653037; 
 Thu, 19 Nov 2020 08:17:33 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p19sm398640wrg.18.2020.11.19.08.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:17:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] RFC qemu-binfmt-conf.sh: Add MIPS64 o32 ABI
Date: Thu, 19 Nov 2020 17:17:10 +0100
Message-Id: <20201119161710.1985083-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... but this is wrong as the same header matches MIPS32 o32 ELFs...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
checkpatch errors:

 ERROR: line over 90 characters
 #9: FILE: scripts/qemu-binfmt-conf.sh:71:
 +mips64o32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
 ERROR: line over 90 characters
 #10: FILE: scripts/qemu-binfmt-conf.sh:72:
 +mips64o32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
---
 scripts/qemu-binfmt-conf.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 9f1580a91c7..ee86345ff8a 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -68,6 +68,10 @@ mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x0
 mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
 mipsel_family=mips
 
+mips64o32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
+mips64o32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mips64o32el_family=mips
+
 mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
 mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
 mipsn32_family=mips
-- 
2.26.2


