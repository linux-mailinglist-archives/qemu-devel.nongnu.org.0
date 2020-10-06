Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F1284FAF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:17:00 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpe7-0001IH-G1
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUe-0005mZ-GP
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:07:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUd-00041S-2v
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:07:12 -0400
Received: by mail-wr1-x444.google.com with SMTP id e17so5413936wru.12
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAXERRLIiX9EVQ8r6aiVtPv3vKoqIsumVK1/LqT0L7I=;
 b=ci20ra9CG2gA/2s5cQHL7TD7eoibfRRWlihpxBnK8F4GncoPqHKHnKS3lAYTHU/jGD
 ZHb/IcJmM6G2aFLBGiHrotCGJFd0U/O5RR6hL30fmC/D/pP14WDcoUB/P0V9jbs7AF8I
 vNiGt/eWVBZ28QQ54JIz/W5EgaM8gseyhrlIruV8W+8T+01PWKKR8gSUbvpUfVOWZwIT
 Dv1GF59dwxJYPDPcCDO+tztukfa3dH3dPneen56tE7V2bB+KutkIpmxU6BVsFQSx4cX2
 7+dbxxVRhPz9V3JHQlYGuZUKNyHcfUutRfReT5b8UahpeybBU5jloYOGmtZ0ZvAPG+fm
 /1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TAXERRLIiX9EVQ8r6aiVtPv3vKoqIsumVK1/LqT0L7I=;
 b=YGd+yYaoFko6o1buUl8YEmjcKGa4EVIcDyK3g6kQzAyZWsQcHbqea/0u7WMX0AzCdX
 Cm3BUZ0FxE4Qg8bgUa3roNxkOpQtlxele8RPYsB86xm6tCIx3oSd896j13hJfFk7szOc
 EmcZx327obx6QHHvZ9CbBQUn+VF2k4BacX1zdZdi1Hb/oJ7Nv6YIQOR+4+tD5HRLrLvV
 d7AmiEsihpxcSQxQdIirP29NrnfKnxmx6vth3mU6snKB6LWYoQRCrlrdcPp/qMBrWf13
 vbJWgCGGyXGXsiDomieGooicC9HPzkWImxwQBCwjPWZnf88WWn25iES+I+yFSSg4ky4Z
 YYnQ==
X-Gm-Message-State: AOAM530bZ0EhtOPRCEADViqKSET7D6tO0dp8UdNBXf17HaIAcQLF7zKv
 AL//yOKBVYcUZPCtj9lWf34=
X-Google-Smtp-Source: ABdhPJw3gtBgtfHmLMPl+hNxqHy+w954iQTAlLlJNW3fDm2IkhCvHd1PgJhBS+g4iRfN2daFLoxqKA==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr3009351wrw.302.1602000429837; 
 Tue, 06 Oct 2020 09:07:09 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j17sm5204629wrw.68.2020.10.06.09.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:07:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 12/12] .mailmap: Fix more contributor entries
Date: Tue,  6 Oct 2020 18:06:53 +0200
Message-Id: <20201006160653.2391972-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006160653.2391972-1-f4bug@amsat.org>
References: <20201006160653.2391972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Erik Smit <erik.lucas.smit@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These authors have some incorrect author email field.
For each of them, there is one commit with the replaced
entry.

Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Erik Smit <erik.lucas.smit@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index b914c9e290..663819fb01 100644
--- a/.mailmap
+++ b/.mailmap
@@ -85,6 +85,7 @@ Christophe Lyon <christophe.lyon@st.com>
 Collin L. Walling <walling@linux.ibm.com>
 Daniel P. Berrangé <berrange@redhat.com>
 Eduardo Otubo <otubo@redhat.com>
+Erik Smit <erik.lucas.smit@gmail.com>
 Fabrice Desclaux <fabrice.desclaux@cea.fr>
 Fernando Luis Vázquez Cao <fernando_b1@lab.ntt.co.jp>
 Fernando Luis Vázquez Cao <fernando@oss.ntt.co.jp>
@@ -142,6 +143,7 @@ Roger Pau Monné <roger.pau@citrix.com>
 Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
 Sochin Jiang <sochin.jiang@huawei.com>
+Stefan Berger <stefanb@linux.vnet.ibm.com> <stefanb@linux.ibm.com>
 Takashi Yoshii <takasi-y@ops.dti.ne.jp>
 Thomas Huth <thuth@redhat.com>
 Thomas Knych <thomaswk@google.com>
-- 
2.26.2


