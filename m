Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DC282C5C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Oct 2020 20:07:25 +0200 (CEST)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kP8Ps-000469-2D
	for lists+qemu-devel@lfdr.de; Sun, 04 Oct 2020 14:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kP8NV-0002Cr-Os
 for qemu-devel@nongnu.org; Sun, 04 Oct 2020 14:04:57 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kP8NT-0008It-Ux
 for qemu-devel@nongnu.org; Sun, 04 Oct 2020 14:04:57 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so6552028wmj.5
 for <qemu-devel@nongnu.org>; Sun, 04 Oct 2020 11:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcKbYvK4PRu4k4dZjxhsKkRtkGG0YlBGcreCrvCe9+w=;
 b=eJcoCguyRx0Q9Yp0dvJ5IqDuCoH/In6Iq0VpsVoHXLOid0JGsgRSO9WL9dYoM6Ldz4
 Ex+oDzRSu4wNH7biroDiu31xJLQ1REFc6oFdX2ABj1Tigj8+dc8+ruUBTPZWFbfNflVX
 YvU9fXU8s3SdyOPObusujsvDC84hs+Y72sXq/g6JquNOsyda0ScSTRDlCjG2A2T8oB5A
 n4Cru8U2ApVYnJHKtneHzYcLdRtJpghqvoPpx6vkwkMzbrAsuKWaurIwlph12LThCS2I
 zFNVZ6/LBz45LSXhLay4MuU6c+XiT13tHSMJvMGz30Zx1Eee9kxsBsihp7qD+bQaiLk9
 lahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fcKbYvK4PRu4k4dZjxhsKkRtkGG0YlBGcreCrvCe9+w=;
 b=VuRFPFQOe1jVNGEI0hnJE5UICJfHcX1Q/fuC4pGtF559QSg37maUT7gEpeLzEiHMAd
 4CdMApdKOU+TzL2MSSNQXEU8C0KMLqJEhDMqMIYXwjlLPPshsWmvXzjK6j/+dYxiAWek
 q22xBinjGQJ+STOx7oU07K5195/lrAUqqaiO1FIN488ZyPHeU7EhOmhSiimPOt2RotbC
 TIj2M5cC/gSWGCuIV18SuZUtzRi4AO4fjXhfp4IGf4pRRKZrxr4/0KS+SnaR9IjquuU6
 G+K3QwGt/X/e0Jh+x+HNXdoE3i5K3h532iFD4zWuQLPxSLFdPGqpqnOPuXvc8y8Yy7wo
 tURw==
X-Gm-Message-State: AOAM531k79fx4X9E+UiWmn9scxyAVbxED2Vt4t9beusW5HHtc+wnNPYm
 PXHlZx6xXPJmAAOh1jIk4Ht2XWTp5Sw=
X-Google-Smtp-Source: ABdhPJwcjW4y59JDCc/jEvujoHwYH0eV39DjdXq0SqxzsalyfWbmi1O2k+JOEjxi88NIA7+xajo60w==
X-Received: by 2002:a1c:2e55:: with SMTP id u82mr10808062wmu.121.1601834694253; 
 Sun, 04 Oct 2020 11:04:54 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j10sm9593202wrn.2.2020.10.04.11.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 11:04:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/21] contrib/gitdm: Add Google to the domain map
Date: Sun,  4 Oct 2020 20:04:28 +0200
Message-Id: <20201004180443.2035359-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004180443.2035359-1-f4bug@amsat.org>
References: <20201004180443.2035359-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Joe Richey <joerichey@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Lirong Yuan <yuanzi@google.com>,
 Josh Kunz <jkz@google.com>, Tao Wu <lepton@google.com>,
 Thomas Knych <thomaswk@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Ian McKellar <ianloic@google.com>,
 Andrew Oates <aoates@google.com>, Erik Kline <ek@google.com>,
 Doug Kwan <dougkwan@google.com>, Matt Gingell <gingell@google.com>,
 Christian Svensson <bluecmd@google.com>,
 David 'Digit' Turner <digit@google.com>,
 Todd Eisenberger <teisenbe@google.com>, Doug Evans <dje@google.com>,
 Lingfeng Yang <lfy@google.com>, Peter Collingbourne <pcc@google.com>,
 Shu-Chun Weng <scw@google.com>, Catalin Patulea <catalinp@google.com>,
 Torbjorn Granlund <torbjorng@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a number of contributors from this domain,
add its own entry to the gitdm domain map.

Cc: Andrew Oates <aoates@google.com>
Cc: Catalin Patulea <catalinp@google.com>
Cc: Christian Svensson <bluecmd@google.com>
Cc: David 'Digit' Turner <digit@google.com>
Cc: Doug Evans <dje@google.com>
Cc: Doug Kwan <dougkwan@google.com>
Cc: Erik Kline <ek@google.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Ian McKellar <ianloic@google.com>
Cc: Joe Richey <joerichey@google.com>
Cc: Josh Kunz <jkz@google.com>
Cc: Lingfeng Yang <lfy@google.com>
Cc: Lirong Yuan <yuanzi@google.com>
Cc: Matt Gingell <gingell@google.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Peter Collingbourne <pcc@google.com>
Cc: Shu-Chun Weng <scw@google.com>
Cc: Tao Wu <lepton@google.com>
Cc: Thomas Knych <thomaswk@google.com>
Cc: Todd Eisenberger <teisenbe@google.com>
Cc: Torbjorn Granlund <torbjorng@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
One Reviewed-by/Ack-by from someone from this domain
should be sufficient to get this patch merged.
---
 contrib/gitdm/domain-map | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index a27dca6b44..3e9602287a 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -13,8 +13,9 @@ bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 daynix.com      Daynix
-greensocs.com   GreenSocs
 fujitsu.com     Fujitsu
+google.com      Google
+greensocs.com   GreenSocs
 huawei.com      Huawei
 ibm.com         IBM
 igalia.com      Igalia
-- 
2.26.2


