Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C74423ABA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:41:50 +0200 (CEST)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3Qr-00077B-Ic
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3Nu-00053c-H5
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:46 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mY3Nt-0005An-6m
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:38:46 -0400
Received: by mail-ed1-x530.google.com with SMTP id g8so7506635edt.7
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kypvQf9DLm7zyJ0SU8nS9HAvF4sYmUEyxLivOr32PBU=;
 b=Re8bBA5nrTv1se4fkmdLhbWwFztdTLlRmRFigB7zDoVyaQL+XxWQINDYEqWpAVUj7n
 Ua/hq0NBYPkm+P8RwJ2poeIgRWITvy2Dv5tqTDi/gScOPVCWfL3U76cToKWx/pQmZwhV
 gXMQO7TGO0nfeYKTPaM+4qeSDXC/dqsbeIM9/zgukcbDgaRSqRjHQcOJ5GGcFs0bBLr8
 yosKB7GI8MF6huNgOgtnJybEYQ8wdJGZhkIwgJqb0DPVIR/E1YCq8OcGj6vkFYNtGVe3
 HKxtfJXjZdl8JrUiG5Ule+BUCiiI083LAOEjImnl0FugHGw3IZIO4nqpm+PxHGZbGjVy
 010w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kypvQf9DLm7zyJ0SU8nS9HAvF4sYmUEyxLivOr32PBU=;
 b=n6BQu8geODdqviKt8aJNLtwg+qzL292BHxHbdjJ+TkFK6aq/IOzAGoKhbWM0uN7hEs
 /MwtGDw+S7sH8BMR1Zvgl4GLUGLBMF6yjo8Y5egX229I37+M3NhfIuX7KjoVsag1qI1K
 fpJruVbnEvZler0o4BBlXFM1KfD2jzSLuxIqzauuwGlfMFbL63l4XtkaV83CHmLvpROG
 XHVm6fe62LQPMRYo6DT6cOigXoTieRuphhX/zKhdesBJfD+cgINEozwhX6XlRFQNDy4g
 DBhNe8qNHvJE5D77oOvD7fqWynCXlgFVyaAe+a+I5255xBVxBR4JBV1oNF4MxPm0iNVY
 N/Yw==
X-Gm-Message-State: AOAM5334vcWFt3Y604iBsVPgd57Cu+NXNP+rt5XWaU3/gH2RcuHyYVO3
 DBn8lhOHNIIocS8OT4JILrmNms3VEhs=
X-Google-Smtp-Source: ABdhPJxZEy9vsaRXLps8Q6SHs3NCiNBNFhh/q4JkaYPa2+UJvKM7KR8DuGQrRpO35Z5pKJkLWMTXBw==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr31316748ejn.56.1633513123931; 
 Wed, 06 Oct 2021 02:38:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w5sm8907838ejz.25.2021.10.06.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 02:38:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests: add missing dependency for check-block
Date: Wed,  6 Oct 2021 11:38:41 +0200
Message-Id: <20211006093842.453750-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006093804.453503-1-pbonzini@redhat.com>
References: <20211006093804.453503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-iotests run qemu-storage-daemon, make sure it is up to date.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7426522bbe..b42fd06462 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -152,6 +152,7 @@ QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXE
 check: check-block
 export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
+		storage-daemon/qemu-storage-daemon$(EXESUF) \
 		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
 		$(filter qemu-system-%, $(ninja-targets))
 	@$<
-- 
2.31.1



