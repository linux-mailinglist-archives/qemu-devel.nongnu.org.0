Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B0284FA3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:15:15 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPpcQ-0007nP-QA
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUV-0005iU-P2
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:07:03 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPpUT-0003zp-OC
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:07:02 -0400
Received: by mail-wr1-x443.google.com with SMTP id m6so14141907wrn.0
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klEJXyyNmOkLckjLcCINpsQA4XGYzHNPMYjdTmsewc4=;
 b=ScbijrEvh46G9PAU+bBBY7qPyq+fyFCL3meJYzUcBZlGvt4z107DQPglZKDnd/wnwY
 kjZBQSU9BkS0/45QhHMEpdd4a4uDtm06h8l+MwYyB4DOnhRhFGONzMpUp2f4QsA+hFzf
 PUZv61qTFO5BTIid8ywLWPd7Go5oUj8aQTsezJckAW9mrpCYusxYNLYA2sRlTEgiTzH5
 vKIsNgxYr5LVEx131LHkQury+kN4tIyVfo0cJyPhjPSauDCdVgELVzETqQ2sRvsLbZud
 0neR5JIe5PRCQfLNeZA0NqvKphjhYN590OcnW7GtUbvYPg/tXF7yHWaA59sjtsWApo4t
 8X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=klEJXyyNmOkLckjLcCINpsQA4XGYzHNPMYjdTmsewc4=;
 b=as1DcP7aLmhGzrP8foLTYKiLvOihxMi8iA8soyGn42+fl2d55CDCmPYPdAetiS2ftk
 HTsi9M+A6kCXqo1DU+1W08EZ7+3wGzcu/tCsIY9CXIen1aSaRRxAbxB2caE3h4+lKMlG
 brhKFoAQCOoS/ieS5h1DZ/CyAZrWLBSIFTW7ytc0xLc/ZZtVQHcOvObF3MGrheNqqLcs
 3m3BoZBTb8s1LNocaJVhPfqRCO3FtYwLJmtoC2nPSAFSH/Grf/icY5jOXMRfig9Vh2n+
 ZjBMfEJo6dsQwXkG2DM/G89pfeoA6kwm75RuzT+X0b4sKC+29964emkXEJHUuX6sId3F
 rDLA==
X-Gm-Message-State: AOAM530+UGrG8WsRVULWa7eOH9ZrXEI8I3TW+GmNul6pJS96l7h7Pxzl
 uoFER6toH+hBNaD3LLlvlrM=
X-Google-Smtp-Source: ABdhPJxVjR66tRIXlKbjlOF5r6Ju0/+FJhc/zYK0P7wx8djCsdRDFHmRldkUveJSmhbk54HklH/oKA==
X-Received: by 2002:adf:f784:: with SMTP id q4mr5733770wrp.126.1602000419208; 
 Tue, 06 Oct 2020 09:06:59 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j17sm5204629wrw.68.2020.10.06.09.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 09:06:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 03/12] contrib/gitdm: Add Baidu to the domain map
Date: Tue,  6 Oct 2020 18:06:44 +0200
Message-Id: <20201006160653.2391972-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006160653.2391972-1-f4bug@amsat.org>
References: <20201006160653.2391972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a number of contributors from this domain,
add its own entry to the gitdm domain map.

Reviewed-by: Chai Wen <chaiwen@baidu.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index dd79147c76..a4102154b6 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -5,6 +5,7 @@
 #
 
 amd.com         AMD
+baidu.com       Baidu
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 greensocs.com   GreenSocs
-- 
2.26.2


