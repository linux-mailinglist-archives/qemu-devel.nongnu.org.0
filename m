Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067E192C0F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 16:17:36 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH7mh-0005Wn-6P
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 11:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jH7lA-0003n4-80
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jH7l9-000868-60
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:16:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jH7l8-00084j-Vr
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:15:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m17so3554703wrw.11
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 08:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hddMp6YbU7VIRh+p3dmSk6KMYfcJvHBxPkgSszrgB38=;
 b=ev5FjM5Ew7LWhxoP6rZJMO+8+DPDef97WiPSduRHUtbI0LOpr6ET5WCwr7GLAWp/Bz
 IMveDXwSTXIKtl4IzvmheHDWd5p5gUGwP5pXFxG2URuPFaGmYNoH+PRyptBeT3Z4sMJC
 z7++NuGZW00IxHvfOw1CmgTx9McjTnrp83lliKWtLRSoQSTxURZsSeClIX73TkwTBxnQ
 AVSLayWkbRSpz/QQOELDJ2pnJQ/B0v9q5uhmamcQTjN/4RKpOi5/AJ0cklDxYzU2pvms
 kDNnOKMiYlcEKfbs9dXNm5Q7BTnmrojThRxyjKQemMZtxcUevFH/LFINERDskDhO6kNV
 rr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hddMp6YbU7VIRh+p3dmSk6KMYfcJvHBxPkgSszrgB38=;
 b=R0sCjGHEH1q5O0i+5t9bJb45c/1x1XFJDUUGTYAQGuY9UnRwI/xKyzfmERLdM3IIP6
 V/wjzHN+fWVECynWP0WEBb0gmz3TUCfB6kaI+WD1zFwT4akn191PIDqB5rh54pUPPfO0
 IHdlgfvKIku006IXcnVC9V5sA4wGTaD4LjN5RDTuTIetxJ8qi7KDwAE2FM/dsQ5IRlvH
 ikjzYm0bNNUQQtPy1HhOOJp5e3L+64EZaArE2FG3N60g9IVV2ddtXhENET7d1yvHe/aS
 +VK1Y8kJX9USP+dbV7WfTXeZdA/FjBUqet8t3xsWUs0gVq0fvl7qgc3bOg8lNRGPiAWQ
 fZcA==
X-Gm-Message-State: ANhLgQ10Uc8wzvOi+eGPEfN80yfOKT8qme1AOGDmA8YVjbg7ZmrqX+PW
 5dk2gnshxEJo9pB+MrbDD09Xjg==
X-Google-Smtp-Source: ADFU+vtYJwXVW3lIPTgEKtC/+uqpc+ZkP2gUdLXhET6sHnfKKANlMn//PD1WJhHfEZKAVTMaZrbHvw==
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr3926101wrp.184.1585149357904; 
 Wed, 25 Mar 2020 08:15:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm2851392wrq.95.2020.03.25.08.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 08:15:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F40531FF96;
 Wed, 25 Mar 2020 15:15:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/11] tests/docker: Install gcrypt devel package in Debian
 image
Date: Wed, 25 Mar 2020 15:15:40 +0000
Message-Id: <20200325151543.32478-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325151543.32478-1-alex.bennee@linaro.org>
References: <20200325151543.32478-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In commit 6f8bbb374be we enabled building with the gcrypt library
on the the Debian 'x86 host', which was based on Debian Stretch.
Later in commit 698a71edbed we upgraded the Debian base image to
Buster.

Apparently Debian Stretch was listing gcrypt as a QEMU dependency,
but this is not the case anymore in Buster, so we need to install
it manually (it it not listed by 'apt-get -s build-dep qemu' in
the common debian10.docker anymore). This fixes:

 $ ../configure $QEMU_CONFIGURE_OPTS

  ERROR: User requested feature gcrypt
         configure was not able to find it.
         Install gcrypt devel >= 1.5.0

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200322120104.21267-3-philmd@redhat.com>
Message-Id: <20200323161514.23952-9-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index d4849f509f4..957f0bc2e79 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -16,6 +16,7 @@ RUN apt update && \
     apt install -y --no-install-recommends \
         libbz2-dev \
         liblzo2-dev \
+        libgcrypt20-dev \
         librdmacm-dev \
         libsasl2-dev \
         libsnappy-dev \
-- 
2.20.1


