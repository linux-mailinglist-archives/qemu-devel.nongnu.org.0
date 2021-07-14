Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB883C8AD1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:25:52 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jZu-0003fT-Vp
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVQ-0003fE-Cu
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVO-00024b-OE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so4376719wrw.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WWEmcDKnDSbCo8OPiJEcX1elCpFxgkjrB61ifCUy5Jw=;
 b=m8UsmN3SLLQ+ezhVFTglOsUn9RbaEKnuW2Y4bH0ExCwdB8qquM1tjLmZ7U5z7dYl4m
 PAyf6C+/jblaHIFv7HPgSLG8bO4KP15UYkp5y31gYt83DUD2CgSS/po6C9cZy5bSJDxk
 GJ0jc5d+bB1BZENIddSNJPTPiDMBftmWxgKGrG0l6ylBGnnbsnB+jfrmwJWYlkEGHAXx
 4zgIqOX98byh0oBNTkYyDnOVhr021Qg2fku2N3PeCqeNWjUJIfoDxADk535K3eYcz+t1
 584P8G+CqXYRC0agMgdenwAeCzw/JYZO2IOXORzruy/QDWOmfMfqYwVEk8CjCPu29nr8
 A18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WWEmcDKnDSbCo8OPiJEcX1elCpFxgkjrB61ifCUy5Jw=;
 b=mMJ+ZwzWFBp4Zg0OGystPNnz9M2dI83U5MTYAtPHFPek+UHimCiwjN27NQ4AadbKp0
 VplzDyUNITBhScffKAV+boD+91W6qwW0x4AFngdv9Vps/zJQZ/U9YhcRHludUZp/AUlK
 nU575QB+uvIffM4CXRgaJbMq9ByybqjsgckB6Iv7zRGgC2Yn+nuJjhSgrAaAWiitwEGG
 I58LHOd2/wduXPpYHuWTqBp+YTEj+xy9d49ceuqL2klnNHd0RzgF+7glBhiWxq5ttfDF
 ELyrA2XBQdZI9I66nK1bm4x0/zsTshuphSbbs0c6f/qMqyHFQjkcZJOmg8DFOqaERu3Z
 5zpg==
X-Gm-Message-State: AOAM533d3K/m/v51EyAkqBANvEym3s5OwoBFJUzqcCdjMeWbFhnv7DmG
 gt5Fii04TO+12kfdAqkn53XKSA==
X-Google-Smtp-Source: ABdhPJy2/WCTKF3uexWTITnUDZBWvHJoiKW76mFFmoSvDuxCuqjxtn0PnbMhJhRzXC45LDeNzZMAZA==
X-Received: by 2002:a05:6000:44:: with SMTP id
 k4mr14727005wrx.174.1626286869574; 
 Wed, 14 Jul 2021 11:21:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm2844067wmb.35.2021.07.14.11.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 491F31FF93;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 07/21] contrib/gitdm: add domain-map for MontaVista
Date: Wed, 14 Jul 2021 19:20:42 +0100
Message-Id: <20210714182056.25888-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Corey Minyard <minyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Cc: Corey Minyard <minyard@mvista.com>
Message-Id: <20210714093638.21077-8-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0074da618f..efbbb15643 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
 microsoft.com   Microsoft
+mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
 oracle.com      Oracle
-- 
2.20.1


