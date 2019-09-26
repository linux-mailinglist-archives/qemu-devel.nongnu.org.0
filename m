Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D093BF98E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 20:48:20 +0200 (CEST)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDYoN-0002tO-1J
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 14:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYca-0007yz-Uf
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcZ-0006Xz-Bi
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39247)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDYcY-0006Vm-BY
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id v17so3621941wml.4
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmOXc27QvVcSjgeTI4mxEGUEwV8YWY/I3aMvZWF+EgM=;
 b=qKllLvETgFNMaFY8Llh3zDLcUG8rjJn89ta6vstwa0/NdE9fOvpAXCzq2rd2w6O7DZ
 c3SsM+vNRuiPoUomIax8hLtc0O/tvxlaMHDKRk7NkMPxZaWzEf7VVSGzTN6siQm4PJsL
 N4UexIHbl9LQRTlDhdrvwScSAbbXTA/Ho50UAtkGtog8nTNKh/KYGU9YMWp8aJtcl8+O
 xeRyFs6RFH7+uJTaPER8v955HuEVtp35tNa6Kkfj/Hyum0fRWX5+LkfO9a1yt+VM263A
 ZH6Ib1yD3IjnU0VPbKLZjJZg+H11GxUxch4EPhZcb5jpHNhnjzXbevFDILcpEfnD9phh
 dZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmOXc27QvVcSjgeTI4mxEGUEwV8YWY/I3aMvZWF+EgM=;
 b=GxEjaeFJgLEFJ0GfHaSDm64RaZN4NEyRAcgwBM+MBY9dsmnBN/3rlYKoY5kSKKsnLG
 E4LGnR7HQawXAxe6YJdxcF6hyApxhMmu6K9K10OMbjRRJdzzZ8EA/ZhtIgCMp1yH+0/D
 huSr3rOQ6sKrOK7XKA91bZv/ze7jAnM3YXc7VIJ+ZjgzfySjyMsWLWQdgeyJggCfJ7Wo
 ev59igcjMMu/e7gld7OeA2SsgJB+tG6x1U49bL8+Pgw3CCSjJ+SW3B4mWbl+tGU2A6hU
 S1NRXYIiLeIy/GuhiC3OnlhFwifvFxNblHMyMK73IdxT92dbxrl6qxzz11VAIXcFans7
 nZNg==
X-Gm-Message-State: APjAAAXT5298XUMtbNjswq9f2C3dgYt3xU/Fios7yZmo9i6YMB7ob/kc
 IX3dy6TK8XXrQXRbHOwy58ieiw==
X-Google-Smtp-Source: APXvYqzYZxevxdz0fQbt6qGNnAXPsJnrln24pcW2RNbENHIBMkadQ0drIJsVSfdvv2aw3BQd1gC1Og==
X-Received: by 2002:a05:600c:24cf:: with SMTP id
 15mr4490979wmu.112.1569522964909; 
 Thu, 26 Sep 2019 11:36:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i73sm5872387wmg.33.2019.09.26.11.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:36:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26EA21FF9B;
 Thu, 26 Sep 2019 19:35:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/28] tests/docker: remove python2.7 from debian9-mxe
Date: Thu, 26 Sep 2019 19:35:36 +0100
Message-Id: <20190926183553.13895-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926183553.13895-1-alex.bennee@linaro.org>
References: <20190926183553.13895-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

When it was based on debian8 which uses python-minimal, it needed this.
It no longer does.

Goodbye, python2.7.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190918222546.11696-1-jsnow@redhat.com>
[AJB: fixed up commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/tests/docker/dockerfiles/debian9-mxe.docker b/tests/docker/dockerfiles/debian9-mxe.docker
index 7431168dad..62ff1cecf2 100644
--- a/tests/docker/dockerfiles/debian9-mxe.docker
+++ b/tests/docker/dockerfiles/debian9-mxe.docker
@@ -16,7 +16,6 @@ RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C6BF758A33A3A276 &&
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt-get install -y --no-install-recommends \
-        libpython2.7-stdlib \
         $(apt-get -s install -y --no-install-recommends gw32.shared-mingw-w64 | egrep "^Inst mxe-x86-64-unknown-" | cut -d\  -f2)
 
-ENV PATH $PATH:/usr/lib/mxe/usr/bin/ 
+ENV PATH $PATH:/usr/lib/mxe/usr/bin/
-- 
2.20.1


