Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BD3D3E57
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:17:15 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ynS-00043L-UE
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybK-0000hz-Iq
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybI-0005du-Dv
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id k4so1196564wms.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5v97PX7fNC1w2NoLHKmte07uLTM5IHjXaw74dPEUIg=;
 b=GcyLPbQZ3usf5KiNuVHo/FtZ6tQoj9y+Q5AHEiDqHoAKmVN5cBZdnO4kxyhKvT3Zo8
 je52CRcrqgQAUkoFRyoEIgrC9Acrn4v1Vh4V9dkvOJZgnPcoAXkhiUdSIJLFnr1EfARz
 mbmF0UhGH6RIJi38EywRSkQKiXpwLc0hd8VP9DAp2NCvr47cj3ASYRL7NgmyzHAvtLG6
 mmn7lEv96ckQEsKcfwfB9DvBvDppvEtK9QjJPcNxGTk3A7wwKw0MMFrBH9yljJapS9SQ
 tb7/EgO3fikiRQgubiHHQzSfW2LIv92i3iI/Pq1szSofiu5Sg2cXYdqsCXiNv/oQF53n
 psfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5v97PX7fNC1w2NoLHKmte07uLTM5IHjXaw74dPEUIg=;
 b=P0aVcpJbgxjq720zoc+qSK7ThzpyuI2luHrmOOPrXARJDy97XGQrx6JeXMBLEPkEE/
 6cdWx1Kcy/rYeWfGN1UewRrzvMjQDFF4dmZ1jrikZ95ISP+qbxDKXzTU6erFGxbaUh++
 fgXpPerVRqt8n+K9f6wEuPQiuqhUBKe2A5QLK3om+iyTPEKMCeCj1xs5tfQgL79qxGNr
 +afopLoyKYKrBrUhIiuZCDMjcGdWoQMREQ8iakmiQTTCBlB4HI0IWXd6PFPYjJgx9nj+
 esY99ITrYcrtJFDqoprc8MorpNh/yoUsxZHmQXrJuvdEY4vnmAuxfz8DgtAY75HLB/Ov
 pmoQ==
X-Gm-Message-State: AOAM533dyZXa6K3cRXMh37lglQ310bRO8gXbJMgzlD8NQKumwbW+vbhB
 a3orNhsYcOXJt/9Ly3Je0ti1Jw==
X-Google-Smtp-Source: ABdhPJztDL53jp4xMLCiVL6Us8Q2p6k51C/PQRiQRv1FNgPOoeFsTKNufZLWOF8E0z+lixOtA3PGRw==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr5499728wmi.149.1627059879079; 
 Fri, 23 Jul 2021 10:04:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm38946183wrv.72.2021.07.23.10.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F1771FF9A;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/28] contrib/gitdm: add domain-map for Eldorado
Date: Fri, 23 Jul 2021 18:03:37 +0100
Message-Id: <20210723170354.18975-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Luis acked on IRC:

  #qemu@znc-oftc_2021-07-13.txt:[15:00:02] <lffpires> stsquad: "eldorado.org.br Eldorado" is fine

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210720232703.10650-12-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index beeb24341e..41875c9e75 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
 greensocs.com   GreenSocs
-- 
2.20.1


