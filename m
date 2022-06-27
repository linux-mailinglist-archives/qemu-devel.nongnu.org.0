Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3855B920
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:26:34 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lwv-0005z4-1M
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltD-0002Fd-NV
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltA-0004rL-Mb
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n1so12308150wrg.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xGfYsNRh+T8DdsY8ZXI23Otvr3XKAab1Mft3LeNJ+zM=;
 b=MHDieZJyCCjnv3y/MNjWazejTogkxeHsHXpq5MvXsUuh68RI04lHIc1bp+CM4Ke8UR
 WPQeGjZnUJVf6oCCAHJZMaqYj54Ms3/ZdYRmS4o0034q94iufZX422KapnQoSmJrDAJq
 RzyMkn11dgm9mFgVjdPM8eMj9gDgFzXNeaoNG3QpqyDsuGCN24GiLqn+4kz126smhfW9
 vg79/4CBBm4nDG+K6eB1GNlzDnb3tvoraDS8dkw+EJBQ2BsYanH7IMuJ13lF6LhFAcS7
 cFbAaL22Uf2h4dTovUQfHbF4PwJOETAJSLpuH5xFm1EcqCh6/WMILLW39da9cv3kx9Fw
 BmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGfYsNRh+T8DdsY8ZXI23Otvr3XKAab1Mft3LeNJ+zM=;
 b=AMPD6ty3EPNmtflAwch62ODiA63Mux9RWpMJS8UTpige5wlgUVrIf4HW5n2nM6DX+S
 MpnVavFOh+SGUvlEO+qRI1TYZa69HQ965/kUZZOBH8I6DKNdmC5aq+fVDTGp1V9qcEjS
 XovnX3yPCKTsc3qbnrn7UP+pwUDL3oZB3ianf42LOuKtvWLM4MLdkdMbl9kFIxfh55Oy
 WKJYVXeWBsKmxG5+cttSmLAkTGN6wMzAwxpBqR+JU9pz+xP2GAjHqrmhcpLPMN8ii8eB
 TU3EsunLbYyvYwubilemut5jhCbOjJHHDhRYljpHL2ChanokOxVAvX2RNWrW/CkxisPD
 e9qQ==
X-Gm-Message-State: AJIora/jL6Hempy4UguLnK8bTcQghbtt2yI65fjqiQsx296d4EiLBp31
 7+CLLINDjhuGNpZNcXBceGbfVz9AHGMuhw==
X-Google-Smtp-Source: AGRyM1uNNbTaFStqIkup99GOnRQMAjbGsjHnSfEzisg2ng3pAhYyLqwynGO31LQyBHyIQS7UTMzzKA==
X-Received: by 2002:a5d:67c3:0:b0:21b:8cd4:ad60 with SMTP id
 n3-20020a5d67c3000000b0021b8cd4ad60mr12065544wrw.380.1656325359328; 
 Mon, 27 Jun 2022 03:22:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/25] sphinx: change default language to 'en'
Date: Mon, 27 Jun 2022 11:22:12 +0100
Message-Id: <20220627102236.3097629-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Martin Liška <mliska@suse.cz>

Fixes the following Sphinx warning (treated as error) starting
with 5.0 release:

Warning, treated as error:
Invalid configuration value found: 'language = None'. Update your configuration to a valid langauge code. Falling back to 'en' (English).

Signed-off-by: Martin Liska <mliska@suse.cz>
Message-id: e91e51ee-48ac-437e-6467-98b56ee40042@suse.cz
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 49dab44cca5..e33cf3d3812 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -126,7 +126,7 @@
 #
 # This is also used if you do content translation via gettext catalogs.
 # Usually you set "language" from the command line for these cases.
-language = None
+language = 'en'
 
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
-- 
2.25.1


