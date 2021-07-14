Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47D3C8272
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:10:57 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bqy-0001uI-2D
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQJ-0005Ig-3m
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQG-0000Ex-Iw
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so2412170wrw.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvc0BPKB1sR/Rn+i6q+NnoukvDXoahmUQu52zM+1gKA=;
 b=ZDyuL0pgoP+EjCBt4S0CSZrri964Z/E6apkOL4mN83RVfbLVU85n+hkOFT18ZMQ6Pi
 ZccqU4uQokXbhrM8VigjGum3ucj0yyl0caP1CComYvLMTchWEvVELASfsFfqsJlgYjJ3
 Ic5Cmn9rJcXqCEKYd/7GQRPDbtW93g9xxE8VcDH+LarKK3jPE6LYtTZzZWgKSUh54uKc
 Q6b1zXV/+k9Chf+Cb11inQAtkh/gJPXzCPspjVApD98wjQ+vru1NG8so0GwsiFD+Yfm1
 G/c7W5cPNOO67xkJQz2qJtnOWATPA9aYqQYqZHj4bOuYGcFNhrFNCOj/B0VjqoFkyRVm
 Aklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvc0BPKB1sR/Rn+i6q+NnoukvDXoahmUQu52zM+1gKA=;
 b=YZzok8Q3p4XZYvgvkH+CQLz6kMq03h+q79swFfw+/E797jbB05DMwXDFeg1juMofYR
 H0NR+Dz/eWxo+byOrm+eh4Atj6i+qcX3BqGyZ9U/9d81FKqNch2R5kb6jTvaFVtnr4tA
 odgBee/SGdpB7d6wzRZ8WLV/3ASSMhk8MWmxW55HJj8dZU2u2shuzHa3NdCl9v91o8vK
 NKIqD19GrpcATbceVqQcVNEoI/JSKr6V5JSeubxZuNd8s9VdQc1XM7AEnl4L9DKQt4Xo
 nrOHhvWMbt0W0VB1bN+j3QgwKtGPTNZ1x0MmFtYlfhGOq2jPA1//dbACB5CJaSTVE0ch
 LStA==
X-Gm-Message-State: AOAM531evTVW05HxUTxoUZ4gi9/ZoXkuXDu5qFzzp0F+OStTdoXc6Ok+
 pii4eeHFlOHB9GZDo7x24TKlFARSEdKpsg==
X-Google-Smtp-Source: ABdhPJwX1NNVJOWZa61cpksDBFwk6e49Y4VVFXsP+T/0yS+/m1wLOE52nrykTmfQ5sSE5MsYMIsA7w==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr11627281wrf.32.1626255799189; 
 Wed, 14 Jul 2021 02:43:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e6sm2261933wrg.18.2021.07.14.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A9421FFAE;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/21] contrib/gitdm: add domain-map for ZTE
Date: Wed, 14 Jul 2021 10:37:13 +0100
Message-Id: <20210714093719.21429-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Yun Liu <liu.yunh@zte.com.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yi Wang <wang.yi59@zte.com.cn>
Cc: Yun Liu <liu.yunh@zte.com.cn>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e42861cd11..bada5384dd 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -40,3 +40,4 @@ windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
+zte.com.cn      ZTE
-- 
2.20.1


