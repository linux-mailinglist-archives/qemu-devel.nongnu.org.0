Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D83C7962
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:09:46 +0200 (CEST)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qb2-0003eB-Ul
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ5-0001Cf-TT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:43 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ4-00063l-Jx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:43 -0400
Received: by mail-pf1-x430.google.com with SMTP id j199so47402pfd.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dGTiGJOTp/bspxX8sMms2I88vB/dqPcoL0Gmp03XhO0=;
 b=sjqKedvhKjF95ZoKRNKedis1PtjzoO+KO+Wrj9wvKjbLpoTpzbvDhLqB/kPS9n7td+
 cOTpAcPVqs2MZGSwI/eW5CMD4eEHbpXF8XfL0E5ZEGZFc29VhiVOJJi3J47vz5ygGgNC
 0sI9Bal+xAzFAntAokuTKOL5wi2Uwaidws3JU+AejdMulNrav+npZBml2fd7aOddWIPU
 2dT8yviPucozkF11PAu0hy0AHVJW+SD7ZgBhpfEm3pTbiviOcg6hsAVs3/Wi5T0m7ZoQ
 KSlZQRZADNXNxFQAwCyZu+8oOCQSigbHwrpVSynxSX+IPA/jnOAfvwc4+xsGyORhK7Em
 vhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dGTiGJOTp/bspxX8sMms2I88vB/dqPcoL0Gmp03XhO0=;
 b=CqWej1pJbw9VQ+2RWqU2qgHJJcvbelKT7IWL415TDHQIYYcafXprBecGlb/G5ahnZy
 P7KEFtdU4pYWY3Z+HV7RU67AK5YJcgJZSm6hk0iFMdz7wwYxt0AGFPVB2MppBzgwK9bp
 58BzF6wiOn3Mw2vucVBt4qne25OB8NhVxdwd7/q0VR+VqRrCWLHvc0yh5fEOLrkfBtC7
 iObKAN8DOs2YRF/BfgZ8n8J+TUjvymjewopkY9hvz4cy+1SOzJD8zdCPfLcXg2gzynze
 nnRkCtyeCB/+eZumF3mSNKx4gXHOPo+uHY0Jp/KhdNSa1UUDBRH85oZDW3Vj5tPXvKfe
 X8CA==
X-Gm-Message-State: AOAM531QRu4K3LBfQRtwTKfoH4rRD3+ynEK4GbAQIBhCdhoQBil2gGiV
 fAgzARxstvgd8V9ScKWCc89ujW9YskzHVQ==
X-Google-Smtp-Source: ABdhPJy0Gf9IjCyK8Aw1tRmhScaYxnlmJakDLgqqwL+SOliDEc/P8RNoLxoWix4p4Zs1qIzlNme8/Q==
X-Received: by 2002:a63:fa11:: with SMTP id y17mr6294774pgh.128.1626214061143; 
 Tue, 13 Jul 2021 15:07:41 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:40 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] python: disable pylint errors for aqmp-tui
Date: Wed, 14 Jul 2021 03:37:29 +0530
Message-Id: <20210713220734.26302-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable missing-docstring and fixme pylint warnings.
This is because since the AQMP is just a prototype
it is currently not documented properly and lot
of todo and fixme's are still in place.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index bce8807702..1a552d672a 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -89,6 +89,8 @@ ignore_missing_imports = True
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
+        missing-docstring, # FIXME
+        fixme, # FIXME
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.17.1


