Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315E57BD78
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 20:12:08 +0200 (CEST)
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEEB5-0004R8-3t
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 14:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oEE92-0001xq-Da
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:10:00 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81]:19615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oEE90-0007Xe-Fc
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:09:59 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 213339585
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VyodeqNqfBopNGzvrR0VlcFynXyQoLVcMsEvi/4bfWQNrUol1DQFz
 GUXWWnSP/3cZmejKNl1YImy/RwA7Mfdyd9lGQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYjdJ5xYuajhOs/3Z8Es21BjPkGhwUmIWNKgjUGD2yiF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56iGqE4aue60Tum0xK6b5Ofbi1q/UTe5Eqa2M00Mi+7gx3R9zx4J
 U4kWZaYEG/FNYWV8AgRvoUx/4iT8sSq9ZeeSUVTv/B/wGXhT1/j8q5SA3gWHpdD1cRdOW1P8
 cEHfWVlghCr34pawZq+Q+how909dYzlY9pZtXZnwjXUS/0hRPgvQY2QvY4ejGp23JkfW6mHD
 yYaQWMHgBDoahlfPFsNIJgj2uqkmxETdhUC8QnO/vtqszW7IApZjpK3Ap3NVt22YdxLtWS9o
 mLU02qgHURPXDCY4X/fmp62vcfWkCbmHY4fCrC83vhthlKV2yoUEhJ+aLegifywi0r7QswGb
 kJLo2whqq898EHtRd74N/GlnEO5Utcnc4I4O4UHBMulk/G8D9qxboTccgN8VQ==
IronPort-HdrOrdr: A9a23:grWkqK2rHo/BH3ynohndjAqjBGgkLtp133Aq2lEZdPWaSL39qy
 nIpoVg6faQslwssR4b6La90cW7MBHhHP1OkPIs1MmZLXDbUQKTRekInOjfKlXbexEWndQtsp
 uIHZIObeHYPBxRofy/zjOFM+sN9vG6zYHAv5ai856vd21XgmNbgjuRxjz0LqQPfng/OXPxLv
 X82vZ6
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2022 14:09:52 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 lb15-20020a056214318f00b00473726845c8so9830391qvb.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtCy0lThYObskLC+s7bi13/Lo/Xta+fSec1igr1zbj0=;
 b=ZuZCk/O74/w3aaZwaCJMcHZdBHv2DQh2M4snZGfPVakPXmNeL2QTEDNwvGNXb/gMaU
 4U1OG9vh9c6i3jyfnSMWpCVu8Tk2BXluh4i6tyxXW0EojDoNCYcYOyDA0h/aO3ny15ph
 JcC2cFxu3pIVeJ91UxpE38lMKYmhUDRMIhFuMZRk9aFvxKHFvGydl5xy6L6jHuVQ+Dhm
 20cB8qPrttPf+n0ml3y46pYcsJopv5wp0gKypmmtTz+hTJEWjlRv3CbGrGptDwqzQ8kZ
 CLGypMXop++MNMmQGhfjbDD9pJey5ozTmxbMbGefsYpQJaMgCXdODVgyNp3XssT3G+SP
 zwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtCy0lThYObskLC+s7bi13/Lo/Xta+fSec1igr1zbj0=;
 b=U3kQKc2utHBIxXGEWk2b7Ok/KgxzjYkFh1xncKqHpBCXJ9XoaxX/tbConCyGIT+mZk
 obSGkI5kcUXAMuzbiRETNZ6lUb5SWEwK8bigUeJBOsxu9bF9x4ilTVeZRcPsg6jQjyAd
 MXgOZy9bz9RX6TCgfBXKn5RBFmEP65mipNOtFJF93Jl1Mg8SO/eR5FjvBBhBtUS/sGN2
 ZYdb/bg60nij6jsGSiXeiygsNEQAy7DGppjbzpaabFcL6uLnAjNDdM3przQQsB98afm4
 oNmzMYMyurPsSUYQfvTT1+tQEhpsn2z7Sybl2vudPaPf8vwOB3RO4QnLaq8vfl8Rj1cw
 iwYQ==
X-Gm-Message-State: AJIora8IdN3RP4+iPbRJVRYCgkZkgkNr2h/a0Z+g3Cg3l7PtDVGTAdT0
 t+F5kz8gywGyW+UFAgshHkjnE0SlDCyFohIuafLNBzSCrj5OdCvf7DYnUeIvfBnYtZ1tksdysF1
 gIqCnTHt+7j2Ucx76ziGa0WzSD5UlfQ==
X-Received: by 2002:a05:622a:654:b0:31e:e8aa:aef0 with SMTP id
 a20-20020a05622a065400b0031ee8aaaef0mr15452429qtb.328.1658340591814; 
 Wed, 20 Jul 2022 11:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uk8nS1b67GzrllMxvoej4BNSDPYqWGRLSpXHHt17Q/SEWq+gz5afcWgGo8TUK+RfMrrvFfaA==
X-Received: by 2002:a05:622a:654:b0:31e:e8aa:aef0 with SMTP id
 a20-20020a05622a065400b0031ee8aaaef0mr15452409qtb.328.1658340591573; 
 Wed, 20 Jul 2022 11:09:51 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05620a280c00b006b5e3bf0eb8sm11282543qkp.19.2022.07.20.11.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 11:09:51 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] oss-fuzz: ensure base_copy is a generic-fuzzer
Date: Wed, 20 Jul 2022 14:09:46 -0400
Message-Id: <20220720180946.2264253-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
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

Depending on how the target list is sorted in by qemu, the first target
(used as the base copy of the fuzzer, to which all others are linked)
might not be a generic-fuzzer. Since we are trying to only use
generic-fuzz, on oss-fuzz, fix that, to ensure the base copy is a
generic-fuzzer.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 2656a89aea..dade5abe2d 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -90,7 +90,7 @@ fi
 # Prepare a preinstalled tree
 make install DESTDIR=$DEST_DIR/qemu-bundle
 
-targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
+targets=$(./qemu-fuzz-i386 | grep generic-fuzz | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
 
 cp "./qemu-fuzz-i386" "$base_copy"
-- 
2.27.0


