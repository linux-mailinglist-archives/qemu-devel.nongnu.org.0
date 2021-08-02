Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482A43DD788
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:46:02 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAYGW-0003tT-SN
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAYFB-0002gl-2P
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:44:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAYF9-0006wB-Ej
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:44:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id h14so21524670wrx.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkucGVt1oGSi8S4iDBzNlrG+iK4Ir1Wzbe2N0x86Pjg=;
 b=emBcn/YMcVYrV4y4KUKjmgETHrSQzhSmQSoy4JwWW2biI6i8foZZDdTDelhKC7Wbbj
 k8oUjJxjtOji3BCAJvEEKztNs+Uofo8BnWDAGsEzh4245Qm7551YB3LngpH20M/9ST18
 /9/VTtfTxAlwSZTGTPMBId8Qh4RVQ9BlXc9S7TR7Me2Q5RfRNszRmfws+KVbjnwyQtE7
 e9qksCEqV4GsQbdK0s6Tp498KXia7Qw0zTmrJcOE3ZM0Adq44k6VTnQbaY0tBmEMWG+8
 1nZCgG5p0ugdE6HrmqWTpwDlAUvFULh6TQWbiYONK/1rSmnLiGbBGrHhJYxO9HUUBMsL
 Buzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkucGVt1oGSi8S4iDBzNlrG+iK4Ir1Wzbe2N0x86Pjg=;
 b=U9WoYg1bpN2YYQZV2rA6YNhlE3itcnvcvRRpGNLClu1LrkP4Z1cHW3gGgqNCXLXntA
 m/XiSlvwrSeyOmEREKVrylE3BiTNIKJ2zTzBxpCK88INLDf6wsrEI4+00jQyKq6rHxpv
 VQAP2M4JP59jYOQ8ASlNX/CL/9wkrCHTEjUToHJIKqtl8dBJTlGegItexjKXh23/XalH
 24ARRVvp6Lj3HpcNCMkfjhSZ4v/AqgWaedLIO0X4xBs5oTFtwEFVQkxmtjqvt3jkv7bi
 1YSKJIoo4QN2p3/e68jlsR8h1M6vEjRfWWxicLi8ziS8gKUaSQZkPlPhRZvcL78sPUVa
 pHUA==
X-Gm-Message-State: AOAM532XEbNToo6OEXSfYhtat5NPSjPFquXYZgjti1QNVoH8E7NH36nm
 SccvbB2iHE6cSfGzOIH09ABRjwgQc0w=
X-Google-Smtp-Source: ABdhPJwZ76TdFAgYkRwoGvI7LH7t9Dslnm9gwEgvrK2AxypawpJ+/lH8f0cgMn90lz9/3HwS2QtN2w==
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr17220709wrs.178.1627911872865; 
 Mon, 02 Aug 2021 06:44:32 -0700 (PDT)
Received: from localhost.localdomain ([197.61.223.190])
 by smtp.gmail.com with ESMTPSA id x15sm10518368wmc.13.2021.08.02.06.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:44:32 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] docs/deprecated: deprecate passing plugin args through
 `arg=`
Date: Mon,  2 Aug 2021 15:44:14 +0200
Message-Id: <20210802134414.52037-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87h7g8glor.fsf@linaro.org>
References: <87h7g8glor.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---

v4 -> v5:
    1. Mentioned that short-form booleans are still usable but not preferable.

 docs/system/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..43ae154c85 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,16 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing TCG plugins arguments through ``arg=`` is redundant is makes the
+command-line less readable, especially when the argument itself consist of a
+name and a value, e.g. ``-plugin plugin_name,arg="arg_name=arg_value"``.
+Therefore, the usage of ``arg`` is redundant. Single-word arguments are treated
+as short-form boolean values, and passed to plugins as ``arg_name=on``.
+However, short-form booleans are deprecated and full explicit ``arg_name=on``
+form is preferred.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.25.1


