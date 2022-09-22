Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B35E6956
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:13:40 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPlb-0000Dh-AJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBL-0002GV-GW
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0005Ts-BT
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t14so16403670wrx.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=v7AVH/6LvpLE+QUztT5pZ1JpIwSOJX2Mt8zbxlW+u0s=;
 b=gTtY5bTuGITw2KV0sOJZpPmvhPOjvn4P2k0QtZ0h1sSPpk7Xj/HHpdeW0GsbLy5xxQ
 /U2XDF4WnxxXedV+rMNG0ZGyRQGmOfWPk0GXAgCq/shU0q9NRjal9U9p6FR2L9s3TjaH
 NMFYH9YaZxs3ZsxLUxUzWzkHX5UZymQRLybuPEv3SOKHVqMDR9ADbTiep+K/TExPODeP
 gyInnU70L8EPPfbvI/kuLfEqYvUexPlJ6Eqj8U1rrD4Wa7ORe4w3mo1CNNXx0168HFI0
 N+APpKcqm8dmBajsdT3HFuOONfLAgTSnDuwPaSMCirD4r3gqmXQAwNca/iNLCzqRXX0p
 h1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v7AVH/6LvpLE+QUztT5pZ1JpIwSOJX2Mt8zbxlW+u0s=;
 b=t8xYTdRi3XzjkqRLGpXNrDtzqCTEPapr7lSFRF/cTwhDySOEi76maqtktxhIRBohT5
 zrk0w+jRZMJlc76W7Pvdvz02PBO29BIolLO7wWN56G0waqXMW7a/DnEyU90kEe/15i+h
 rfbjwyKfYT60hakthP5Y9qfHlNhOgDmhNMOfYvAt59WbYrXadYLDa9KSCi2yxumC/rO7
 yL1Xt9dhfTcc6xHV2QrfYqpAGP1/UEQWeMh4o7tzHQiu4iJDD7EJPjehTRo7yvlzAsyE
 fIpQR2TIinQUdbQjySE0+QM37MfW4RA18XhxjIhKPOoxzRxPlZoW338wbqfhO7HgqAAz
 pBYQ==
X-Gm-Message-State: ACrzQf32i0aEZLvPET3zzrhrDhqnlplOz0w/V7F80vWDGuUMTTsIqAkG
 acKxBqILbYmxfGDbfmHb0vDx+7NlwFrmuQ==
X-Google-Smtp-Source: AMsMyM5SJc0eET9z4kqJjCPZTmKKJIpnFUz+W3b1OqoEyBIalJyrHt+5TN+rarVUkfD6aoDg2/iJ8g==
X-Received: by 2002:a5d:598c:0:b0:22b:100f:c2d2 with SMTP id
 n12-20020a5d598c000000b0022b100fc2d2mr2524782wri.263.1663864562492; 
 Thu, 22 Sep 2022 09:36:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.36.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:36:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/39] configure: Check mkdir result directly, not via $?
Date: Thu, 22 Sep 2022 17:35:35 +0100
Message-Id: <20220922163536.1096175-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Shellcheck warns that we have one place where we run a command and
then check if it failed using $?; this is better written to simply
check the command in the 'if' statement directly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-7-peter.maydell@linaro.org
---
 configure | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index 8b48e72a135..b39561b2ed7 100755
--- a/configure
+++ b/configure
@@ -67,8 +67,7 @@ fi
 # it when configure exits.)
 TMPDIR1="config-temp"
 rm -rf "${TMPDIR1}"
-mkdir -p "${TMPDIR1}"
-if [ $? -ne 0 ]; then
+if ! mkdir -p "${TMPDIR1}"; then
     echo "ERROR: failed to create temporary directory"
     exit 1
 fi
-- 
2.25.1


