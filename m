Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101DE53650C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:54:27 +0200 (CEST)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucIC-0002gy-As
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0l-0000en-Gr
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:23 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0j-0002S1-R1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:23 -0400
Received: by mail-ej1-x630.google.com with SMTP id ck4so9422029ejb.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/FCtk4u6INm00qR2lG2PmRK9MrdLA/PPEmYrOoIpJs=;
 b=GwKMw3QPAwuQngByNe/U7og+zhrrMU1ZCsPnGy1BWOU00AFzlNI7yBASvsyERpBZak
 mDJpaU9fQ71A/Ob9OAby/aS2WBhPthYIJjouVoUfdn3cDYoKTz012n94VgOBNi7pBoQi
 KZrKk0EH74CepxNIbSy4scOen6FoRStiAM4Rs13WLs+tP42Q+kV15/TOe+nZYDQzBvzd
 /Os2y9yAhleQjJNJQy9t4OFBGsxSqzCxMS/X3gw5L9kGBGzWdcws5MC1u8WnnHvAuqDY
 qnpMCvMIcEXcTJzcsyvELLn+p4LnGGHkU1FwdG1rm+asO9a7IYMVZlhhX4jMTguH1yW+
 tEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/FCtk4u6INm00qR2lG2PmRK9MrdLA/PPEmYrOoIpJs=;
 b=ugkDaCfrIODuczsQPe2/EpgleNJ1ZLFv4lEsok56J7tlfDRsJPl6PN52B5i5klicKJ
 bDdNq3UZbEmRJY7z0C+9oRA8JIVydEN3fIGscLRZ31/bK1yQWi5HR35DFJ3bRB7Q/2Bf
 r2ExL2ccaPTD4vT/QiYQNUgbU+LmgKvCsE6TeKyaktpCEJbEj0MDICPezOvLfl7RJDb0
 Kov5jmtER5uWywzMFreTCxGXIPhlXxq1iFh/k1xAlHU6/wnKWEw6KIDeYRQD44lXzK8l
 jebUbG4n8JGx0KZdrdmXwZnofBrM9HhuRe3akArUbpDiNZsyRB9m9Ol4SIwNbbcLfHUy
 2Tfw==
X-Gm-Message-State: AOAM53356lWVjwwUAszSohaTG/hBKqqt3YABQ1233qagbvovLa9a88Pz
 kug+1W2TFdfItK18D6kDg2KM/g==
X-Google-Smtp-Source: ABdhPJxeFqpIC1u7jd6CWGPaPOyIgsSvqAr5gloJ4N2FJ4Yo6ewn+T/xPKqCAKGYPpjCoPy/WLXucQ==
X-Received: by 2002:a17:906:9d90:b0:6fe:b875:171e with SMTP id
 fq16-20020a1709069d9000b006feb875171emr30749051ejc.517.1653665780531; 
 Fri, 27 May 2022 08:36:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 mp22-20020a1709071b1600b006fec4ee28d0sm1585046ejc.189.2022.05.27.08.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0117B1FFC4;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 12/33] configure: do not define or use the CPP variable
Date: Fri, 27 May 2022 16:35:42 +0100
Message-Id: <20220527153603.887929-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Just hardcode $(CC) -E, it should be enough.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-2-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                  | 3 ---
 pc-bios/optionrom/Makefile | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/configure b/configure
index 180ee688dc..7a071c161a 100755
--- a/configure
+++ b/configure
@@ -376,7 +376,6 @@ fi
 ar="${AR-${cross_prefix}ar}"
 as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
-cpp="${CPP-$cc -E}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
@@ -2012,7 +2011,6 @@ echo "CC=$cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
-echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
@@ -2254,7 +2252,6 @@ preserve_env() {
 preserve_env AR
 preserve_env AS
 preserve_env CC
-preserve_env CPP
 preserve_env CFLAGS
 preserve_env CXX
 preserve_env CXXFLAGS
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 2494ad9c25..17ccc76241 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -50,7 +50,7 @@ override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
-- 
2.30.2


