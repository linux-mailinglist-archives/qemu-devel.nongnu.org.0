Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBE3839C8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:27:27 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig5W-0003vu-Fe
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpY-0007Wf-72
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpJ-00063h-7x
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id j14so5270393wrq.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Agdx3G/Ci/HmPNt/TIfwdrNu8lRgFz7owXgkXOV3/r0=;
 b=QGzv/rdnDAo9O4hznhQiZnxawH0k2In2lXaWgTi+LGsJyPCvRBYOp4MVFUhHcrfku0
 a0Ev0buIbEFJw2xUcoArVlYFkh5JazfUnu0I/56ZAEJGeI/C80Pmc4zWhhCxHRlvZw4/
 Og0NecrN5R1OZoftDmFh5KM0WHO0VtMPhU9E6/b9u5bi0H4+C0yuPfUIYatfwsDs74Rx
 lD7LlGs9Gwax5cTnZj7Ysg6m4nhrPjvOGV04RTvDQrb4aAnaHYMFzvSDRvsRx1ejbR4F
 U6w7h1dgqfhzOvm6bfJ2UZcl2EdxLYBHOrlPr55NmH6GB6QiSc2BBs8dOrYmRRvKgCtS
 +mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Agdx3G/Ci/HmPNt/TIfwdrNu8lRgFz7owXgkXOV3/r0=;
 b=VfalFXyocco3IKmEL8l+tP7jIR7y0xhPth84iQKCc8sJZvYC4kePgArDuTQBG3LchQ
 v1WtjD7T+9gqCeP19pgUT0rYgIJiJCIEGBV/9kYj/07UzbDIQ+66WUfVjgqbzojGx7A5
 SB/Xt7i/+gDnlHffQLOuhQ+fizQedEiiJZPV6pch9AST4DbbL+KILpN5JSmvIeWfWPan
 MbgHpO9ClYutL9VcdhldHDGuJvcXlpmM5+qaGISpn4NpuU4Cmjd12M/sjsicPx6TYCr4
 03o73oZqZB6oZejdLX9JKXnC8dWYo5WCeWjWyo408knQ19Q4VerTA2axysZvm+v0PdJv
 GqGw==
X-Gm-Message-State: AOAM531ShXV5TLaevD331mJ9gnZQtXpxHxUtw6N7RQV/wAvn5cVe7/v8
 lyX30f1VCuw6Jz5F5/8dgV051o35h0RlmQ==
X-Google-Smtp-Source: ABdhPJwfvfeSTq8Ta0sY+REeXlkIMFkKc8CJ9KWzZw2BtZwK0iBAfZZ3UgyBTogAdGp50DBoEN3Pjg==
X-Received: by 2002:a5d:4d05:: with SMTP id z5mr485027wrt.127.1621267838383;
 Mon, 17 May 2021 09:10:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm6216631wrw.62.2021.05.17.09.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25D661FF9A;
 Mon, 17 May 2021 17:10:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/29] configure: Emit HOST_CC to config-host.mak
Date: Mon, 17 May 2021 17:10:04 +0100
Message-Id: <20210517161022.13984-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this is needed by the tricore-tcg-tests as tricore-gcc is not easily
available. Thus we rely on the HOST_CC to do the preprocessing of the
tricore assembly files.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-6-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-16-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 0e4233fd8a..df11c8bad0 100755
--- a/configure
+++ b/configure
@@ -6164,6 +6164,7 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-- 
2.20.1


