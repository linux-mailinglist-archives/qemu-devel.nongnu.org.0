Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6436FFDF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:46:22 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXDZ-0006ep-3W
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvs-000199-1u
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:04 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvp-0003m3-L5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:03 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 u48-20020a4a97330000b02901fa060b8066so965371ooi.8
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OkwiX6GCbC0EZtNw2bGTkv6iCiDNG0f3hxJpeAYM5Y=;
 b=hehggAW2KHLWjrgOlpEyQgyC7yMFmve1+DOx1U8Gv1z1OeG3ulJaGrrPNtLXL6CLua
 Eu82QIwWKZFY401F4q/fGA67XwkieNIdoorNl483f3Rh3+iJXVuKh010UQQc5cZiYll5
 +LZfqoysyADo6Wlk62XhIfdwCGy5KcHB0MxrTKD2jvjWwfr1f8Py0+2NVQBo7ZALSFlX
 c1jLn56ldyHzt/p7tH5G4LGvZJpToTrZZS7ow83MswxQ1FyJtHyNXeXq19XvenOFumzr
 OPJEYfozN8q9RQTIrXBBs4XNeiCEO1nF/h9HAUEgBsRbMFPfA8JmjoIWyFA8cvw2XQqI
 hu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OkwiX6GCbC0EZtNw2bGTkv6iCiDNG0f3hxJpeAYM5Y=;
 b=eXiuq5cY/G6bMgd9uY53cBEqgX41iPOYoak3cP8nwRpSImEc3YCIm5r2hLpDTWBQCn
 vNGXF9Vzh6lQribam53MqJXYieqJ8HVct2u+AUnaiyQib/UAUjNQdYooA08bISLz14gN
 5v/8qGcHMyrL41HJ6D3Jc74/bRHRemaMGJNhugBAN9FysizAcY+SSwfCZ5iI05Be6PCY
 iIqpChHzhVyfDhmMdFzZY0V1Icx5gSFTkyvPS19CUawswWAU3qvlCXe7nqdIz4wLZu2o
 2D87mXxRgLG5dnDfCK1vNpiHbe4DgB/qNkgPMbaxSaxHJWi0jwqpj6IEr2H+VOQWlj34
 gluw==
X-Gm-Message-State: AOAM532jLmT/S0+sbe+slglTiyAKNYf3UQetJx+PO5NcAqlTD8fNCSo9
 IWj/JqCs2NNxAoq+r22GIsk2TMxye5hyVQ==
X-Google-Smtp-Source: ABdhPJycB522nmZd8NOgaBeO7D2BluwZOusC7nAwEUf78FtZ+IcWGI4PUEKyK2DVSOz3n+weldtoew==
X-Received: by 2002:a4a:b4cb:: with SMTP id g11mr5434974ooo.41.1619803679572; 
 Fri, 30 Apr 2021 10:27:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.27.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:27:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] bsd-user: minor cleanup patches
Date: Fri, 30 Apr 2021 11:27:41 -0600
Message-Id: <20210430172746.99818-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=imp@bsdimp.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ffa090bc56e73e287a63261e70ac02c0970be61a:

  target/s390x: fix s390_probe_access to check PAGE_WRITE_ORG for writeability (2021-04-23 14:10:56 +0100)

are available in the Git repository at:

  https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210430

for you to fetch changes up to 58b3beb483d08066548d84eccd007b9d8bd24a2b:

  bsd-user: style tweak: Put {} around all if/else/for statements (2021-04-30 09:14:06 -0600)

----------------------------------------------------------------
bsd-user: start to cleanup the mess

A number of small cleanups to get started. All the checkpatch.pl warnings for
bsdload.c have been fixed, as well as a warning from qemu.h (though more remain
and this patch series fails the format check still). I've also fixed a
compile-time warning about a missing break.

----------------------------------------------------------------
Warner Losh (5):
      bsd-user: whitespace changes
      bsd-user: style tweak: keyword space (
      bsd-user: style tweak: return is not a function, eliminate ()
      bsd-user: put back a break; that had gone missing...
      bsd-user: style tweak: Put {} around all if/else/for statements

 bsd-user/bsdload.c | 55 +++++++++++++++++++++++++++---------------------------
 bsd-user/qemu.h    |  4 ++--
 bsd-user/syscall.c |  1 +
 3 files changed, 31 insertions(+), 29 deletions(-)

-- 
2.22.1


