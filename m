Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DB3DD547
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:09:19 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWkw-0003AA-NI
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaT-0000o3-SG
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaQ-0003cS-68
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c16so21141310wrp.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cZmxhO8Ua6HfhbJqYgf1vh7riK06m+t8EzfL2eNpEIM=;
 b=HZz1tywwGMZv+x6k+FqAovSZ02j1We5d+jrADsr/fx/ksfx8s/YantCSz6AVf4bbPg
 tEDzPZ14Zdy3Sk0PVa6zfbVquWp+JdAekThmGViNqGxE8lh7/X9br4KzIgkxMalhO8Rg
 bLy81oCjWmHqc3puB9qsnRFlUsRQo6JquNOHfePPldD/0L6AT0Yqjir3BmA1cQ/nfV53
 x4zS4DTSzYvv+CHkKgnlqOoD+EDmu9q/QknRtoJdfznopC0cXRWpFJtJlLULGrOMPsUK
 aNrVhGSb38IXCDRG+X9ZwnP6arVwhPhMMDCbfvrhFywn3hGcNiLMx+u90C4bnAbOLETY
 VUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZmxhO8Ua6HfhbJqYgf1vh7riK06m+t8EzfL2eNpEIM=;
 b=JRyagguiBs5h+nD323W5TVJFKAc2a9W4QdqgxdV69HaVtx72BJo/Lz6jgnEXrJ7GMG
 T55/bmChSn+RBuo7Uw4AsNmoS6otOQgslYngPIJggnoqVw6FaxEVY5tw5b8hluSyTQiO
 wdPkJLWUZhRaEgDeQ7VlDwtdstRN4UKr3Ymkmq7f5U5JTvz3aAGmApovsUCasZQRIqdj
 Zu9NZvff6lUjmS5NiqxaWTUi+UviHl+OOkOdmsSKLgmObptDvlbskP6i1ybhSep7a1B0
 penZFHm4klu07IgLqqiIMCwiHrQQDP5IjnlO5Z4ZvBUe9wHYgoLQONDl9vZx8+BMevgf
 ILxQ==
X-Gm-Message-State: AOAM533aoB90dacWay5EGhN6QX1XkWRcJM+oI09snuU296uwELQZKa4i
 GW07lG9jxOfcFERduLL9lpqj8RSY0cnHnw==
X-Google-Smtp-Source: ABdhPJxcQj6qlDW/EYup8cwJ8hQZ9H10ApE/SMZ9qEqxDi1p41zbc99iFIRyuPJdv230LLRQeBvCCQ==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr17103494wrq.322.1627905504750; 
 Mon, 02 Aug 2021 04:58:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] docs/about/removed-features: Fix markup error
Date: Mon,  2 Aug 2021 12:58:06 +0100
Message-Id: <20210802115812.10731-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The section describing the removed feature "-usbdevice ccid" had a
typo so the markup started with single backtick and ended with double
backtick; fix it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210726142338.31872-10-peter.maydell@linaro.org
---
 docs/about/removed-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 28bb035043d..07d597847c9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -124,7 +124,7 @@ devices.  Drives the board doesn't pick up can no longer be used with
 '''''''''''''''''''''''''''''''''''''
 
 This option was undocumented and not used in the field.
-Use `-device usb-ccid`` instead.
+Use ``-device usb-ccid`` instead.
 
 RISC-V firmware not booted by default (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
-- 
2.20.1


