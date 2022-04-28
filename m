Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32276512CAA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:25:47 +0200 (CEST)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyX3-0001AN-Oi
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy26-0000Iy-MX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:46 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy25-000564-Bz
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:46 -0400
Received: by mail-ej1-x635.google.com with SMTP id m20so7574821ejj.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d57+wLsg6C86Ce9YcdDwqygNOrnIY2eU+VWx4qkmQXk=;
 b=ldJsYzryGyyGsyexENi3KudRtNkw21PU3hVSuayc6ORAoXpYHaYytAC19oopFLn9Y2
 9Huz2D1autuTesz0pwwZh8BK61nZLFANPZZLf8Ja+hTuZLnU9iUAOacAn0H6LYm+eBFh
 MbFHJ64eSE4dkyQ2UXuMaMspB2QzI2pjjhWq0OluZdRNrCLQ8fw8oM01cpkjibHAcsZ+
 Ccn/OLSK4Nyc8nbM5X4eGOKABq3sfa4qmafH3v96yRZKqG4txHkCN87R9pKUptXYq4Zr
 9jTcMK0P6ZQly7RuGVAUy5NrCpIRwt+BVdv/aQnPaTrdsvydNnbAsY1eJFcxhTpSm2EY
 UR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d57+wLsg6C86Ce9YcdDwqygNOrnIY2eU+VWx4qkmQXk=;
 b=scHvmcqGPri3IUOOUmjONc8IAtSl6qZzva0rhBHQVhWcdzZgkEI5BPcmWrT/YtT/NQ
 oqnLhSVWMkUlCv+7TDEhdpu0Oxi1cus0qFViNBVAgFSQYOckQnt8M83E6B9SUHjqqKE1
 ItU3z6Ig4Fw8NgoNyp1HonToaPCTKYyLkfzF589spNBljhTK2b5GDmtaU1XGaNQ9joir
 Tq0DtvaaQOb66shjVCgE0DI5O7umINRbYmSO/h7KKzqZbWKP/cV/Qnl3s23XXsljgzyF
 C0iCx9WWu3KyEAMQNt65V4OdG9rYxojNwEs18LQDLdr6sfXHn7NZfwF6LuwCXH+Gt/yI
 Nwfg==
X-Gm-Message-State: AOAM533myGUACHVuL+OElrHUXDyBw5D/mypDouKzpHJbhs6Ck3vsP2op
 kNk1fwYiXesg6dJfKp8kRFvZWKeKNmysdw==
X-Google-Smtp-Source: ABdhPJy5O2e9TxwSs2ww0aA/Cu07GXH8n02cr+UVkV+kIaIyUEn0/aQE3fzae9Haa/H6CoaqMsKkow==
X-Received: by 2002:a17:906:e9b:b0:6f3:cfcc:922e with SMTP id
 p27-20020a1709060e9b00b006f3cfcc922emr5340079ejf.346.1651128823996; 
 Wed, 27 Apr 2022 23:53:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] configure: gcov should not exclude fortify-source
Date: Thu, 28 Apr 2022 08:53:26 +0200
Message-Id: <20220428065335.189795-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason other than history (dating back to commit 1d728c3946, "tests: add gcov
support", 2013-01-06) for this, remove this unnecessary conditional.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index a6ed3498f2..e404b55da5 100755
--- a/configure
+++ b/configure
@@ -2625,9 +2625,7 @@ fi
 
 write_c_skeleton
 
-if test "$gcov" = "yes" ; then
-  :
-elif test "$fortify_source" = "yes" ; then
+if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
   debug=no
 fi
-- 
2.35.1



