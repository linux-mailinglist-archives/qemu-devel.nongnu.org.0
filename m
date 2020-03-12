Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0271836C6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 18:02:00 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCRDb-0005sS-8K
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 13:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxo-0000i1-TV
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxn-0005IL-RY
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCQxn-0005Hm-K5
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id r15so8375108wrx.6
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nS/aDfnl92D82KTfGKjjCWslOmck/fORd79XKsoQXJY=;
 b=p+HrIuEZdgWIPu5cpkPGzDMxTUDBF9b88V1Xo45LkVofoQIMgnThviF+pTxwZCDzJQ
 o2Pld5tlDvxKvnvGhmvEn79P/oSrLj0I0HuqT/K0LXu/8/SuG09DwrAIysDyAKQDjtgs
 yZCedUIIndS5Scxb1LN4vCrB6XKKYY0PXnKSUU5V52L9iaWfVOwkOtnrzsZ6o92b28Bh
 xUka0wJWkK9FYdktou5uz1sE9MXBOkj+n7OVP8YVExRh1YH4mWVrtS3B9XdKzZX3S5uc
 Q70DZqekbXD+LzmqCXxkAxAso85kIrB8vBQ4w2/MaPsj1m1yxTME1Lfi8V1VcNhWwHG/
 5wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nS/aDfnl92D82KTfGKjjCWslOmck/fORd79XKsoQXJY=;
 b=mgCVD6/8T8jIZYoRtQcntlSlrWfBygueC4xN5N6vRvDqhTok4JFVS9pKw1KTmxSAZm
 wcbZ9SviiiFHrpMTe7MXPLoiROTLJJWeNI99Wxeu04ewrEjj/MIKF2ijlcmJShhCl5Or
 zHqHkhtTTgz2LoOamkvmrvBJJ3iHJfbseQ++q2EvPivGAIESy5p5PNwIOaFduv1+dGam
 FZYvBB49KERob3A2+Mj/PiW40ocCbRMaMMdCeFBKBFzDwU2Q+sFxP5120j+R2q5/ToOQ
 20C9oCXQCb9Rc4Bma+jeRKuXNf8PAiYot9ZWR3ocQgKy37TsGEjTGEKwbb8/4zcJAcuK
 nioQ==
X-Gm-Message-State: ANhLgQ2tHBlINEQY8gEZhV3xZRpCpyK5uPN38CAy0DWR7UID/m6ElsWs
 IQCKWgsZOgfj+XsFb1RefJvLHyIU/DNYFA==
X-Google-Smtp-Source: ADFU+vtF1WHQwLXMX++mhB4LHyszuza/npE08IDiOyLPkv8aIiEOaIwj4kvKen7Y50eB+WiVujJF6A==
X-Received: by 2002:adf:f503:: with SMTP id q3mr12526107wro.363.1584031538324; 
 Thu, 12 Mar 2020 09:45:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm36838640wrp.85.2020.03.12.09.45.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 09:45:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] hw/arm/virt: Document 'max' value in gic-version
 property description
Date: Thu, 12 Mar 2020 16:44:53 +0000
Message-Id: <20200312164459.25924-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164459.25924-1-peter.maydell@linaro.org>
References: <20200312164459.25924-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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

From: Eric Auger <eric.auger@redhat.com>

Mention 'max' value in the gic-version property description.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20200311131618.7187-2-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 32d865a4886..7c38c6c7f91 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2146,7 +2146,8 @@ static void virt_instance_init(Object *obj)
                         virt_set_gic_version, NULL);
     object_property_set_description(obj, "gic-version",
                                     "Set GIC version. "
-                                    "Valid values are 2, 3 and host", NULL);
+                                    "Valid values are 2, 3, host and max",
+                                    NULL);
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
 
-- 
2.20.1


