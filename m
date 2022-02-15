Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC164B7409
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:20:25 +0100 (CET)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1V2-0001uN-DZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:20:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1DB-0004yv-Tl
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:01 -0500
Received: from [2607:f8b0:4864:20::1031] (port=44872
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1DA-0007cZ-39
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:57 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so2659163pjh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jbp3QzYSS62PQerIrzVbH5CGEQniN3jLvXj9hWTcleY=;
 b=eGx3OeSUTLvsyde7clvsH8AbdBu1l8asduWKRi+b81BGRkwOYlonElwtw+1S7fGcE7
 njn91oDz3VMLKAyFZHDeAjqW8E/naeWAUH9nZ2em3fL0OgtDOLO9cu+JiX51vJb1kv47
 XQgfv65norTnCBDkb/bjVE4ZrdeKnxX0rXam9aAOu95fPiTO58ueQ9F0aEmERVWgQMM3
 OCAK1vyvb4l/sGlyms17QiuwoiFXool3WoHVDTtdmwi+AhzWWS7Uxs0EknCK+oEsit1v
 O2zXfS/VocT0v7SwL7NMUjT/2TO+S90bZ8+H2yVA4goIlzJlK1Ld1k0/oLFZFhD3W213
 DrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jbp3QzYSS62PQerIrzVbH5CGEQniN3jLvXj9hWTcleY=;
 b=2uPeUr39Je86QEPXcOVcTGkPUSec7qzVcHI2keE8MkxoS13AZNl5pfJ8ScmepC19hy
 CYhdEo00WNdYmuavmnCS0OwfujBgLFPV6OaLZVpA91+7YNztgjw+ueAozFGWdzqJ4dgK
 pVOzb3WUN4J6XuFJTMLwsmv/PKYwHevHpzSPml/Dmeuez2fP4bXSDnF8TEeEsnMhe1Rc
 6C2Ve/0NARvfzH5fw188PZXit4342bseqoQpikUN6FxTcNgl9fVTghM8u08gDUcC/JFT
 WSmMaiMzoNjqD7AThDIPeD8e7WXPUOeCeG6qPUdbwA+mPjsIngmgx8WN/IcQtLs1dOa+
 6iJg==
X-Gm-Message-State: AOAM532jvWUiDsL/jlOIDp+oECWDf1JliTc7YnW08Ueg/4z6B7s1ab6I
 FfWQITiZCk2MlhTr2avAwV7VuxUTcFg=
X-Google-Smtp-Source: ABdhPJxFPY/nlM8KiroGPEgIav61AH8FFLL/wUdd1yzVriWArXNj+DLJ5ZdO6jCx5KYwt8MJujYOzA==
X-Received: by 2002:a17:90b:4b88:b0:1b8:ca46:472 with SMTP id
 lr8-20020a17090b4b8800b001b8ca460472mr5494583pjb.0.1644944514503; 
 Tue, 15 Feb 2022 09:01:54 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d2sm2829503pgw.62.2022.02.15.09.01.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 5/8] meson: Log QEMU_CXXFLAGS content in summary
Date: Tue, 15 Feb 2022 18:01:03 +0100
Message-Id: <20220215170106.95848-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 287be51ff2..215c253683 100644
--- a/meson.build
+++ b/meson.build
@@ -3305,6 +3305,7 @@ if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
+summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


