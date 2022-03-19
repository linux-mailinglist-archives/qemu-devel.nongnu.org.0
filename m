Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBED4DEA83
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 20:58:25 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVfDU-0003uW-7D
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 15:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nVeo6-0005GF-0n
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 15:32:10 -0400
Received: from [2607:f8b0:4864:20::643] (port=43835
 helo=mail-pl1-x643.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nVeo3-0005mB-Kf
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 15:32:09 -0400
Received: by mail-pl1-x643.google.com with SMTP id w8so9574946pll.10
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJkdM8YOqt5gHWBl2UdtOXoKQyEntcQUuHXQyC1vYtc=;
 b=KXz7xYfTH6SkJLjGSLeJsB7Kkr+6BHm9n84jI/Ehz5Gf0nyDYeGRc9Dlji4CfGB5ci
 QbMAqwAFbRe8RA/5iDBR4i8Qq+mCDkJRvEOaK5RUR/EiielLX6+VUpmWL4yrqoTRVQuS
 w012qLnO6n9x0Pg/VkDMncGLsYq8IaXdngzRrYENVTrNwRwreWmKXVMCDspxKhOG2EOp
 6fVl0or7jhfRHQK0yVoB9cEP0AuqVdW1D4P/mmfSRU1KzQ7KmxUzNOSyO2BEnZP73z3/
 3NAPCR6oHMChIiS9QItttZEz75nUoXzO2wZphcNe65nmPAfk8TDfNK+vrjzwel5jHj9Z
 /DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJkdM8YOqt5gHWBl2UdtOXoKQyEntcQUuHXQyC1vYtc=;
 b=7MzFvwxVPFxFF81jA6lA1StST75Vytp8zGAgpi0CMYs+E6JJD/t/haWORho0AkVTvj
 J3n66p7xfWA8qjFNboDmasfWqv92aUW0e1kcP0dREd5pQXP0jbRvkcjEt/AQF7f7N8Wo
 mDIXSKpSTU6sC+VXwL0syXT3adjthwnnsWNC7BScviDi9qIooyQW1MzKdQ1yF1YbiKBT
 NtnCKfKPiA4eMYa2oLpIScwrj3rZ605QXR9I0AGzbIbI3RSWkp2gmkEXbDOQ+8FH0ok7
 uAMu3QmMccGN2B7ssY7sfddPItwtIVdMltZNA9BR3NhdRghAU3+BSgVfP6f+HJ5idKVx
 7f5A==
X-Gm-Message-State: AOAM533lViwS18zrREE7r4I1J520qKIgybGXGDzZlEarDBaXy2O6pPbF
 VdwndeLatfBSEw1RiPYa/QZDyTZ58A2foUkE
X-Google-Smtp-Source: ABdhPJzmJOSe4qD1biIKyyoFfOSjlWc7pxqlkX/7BYFO9CGZU75IJ8gLMMP6DT2tQF4C4cMSgwJoaA==
X-Received: by 2002:a17:90b:314d:b0:1bf:1dc5:8e8d with SMTP id
 ip13-20020a17090b314d00b001bf1dc58e8dmr28723679pjb.204.1647718324612; 
 Sat, 19 Mar 2022 12:32:04 -0700 (PDT)
Received: from dev.lizongyuan.local (61-221-155-10.hinet-ip.hinet.net.
 [61.221.155.10]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056a00159100b004f763ac761fsm14406865pfk.33.2022.03.19.12.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 12:32:04 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 0/1] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
Date: Sun, 20 Mar 2022 03:32:13 +0800
Message-Id: <20220319193214.56553-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::643
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::643;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x643.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Mar 2022 15:56:40 -0400
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
Cc: Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a WIP patch set trying to resolve

https://gitlab.com/qemu-project/qemu/-/issues/811

which tries to totally remove 'qemu_irq_split', and
uses QOM object 'TYPE_SPLIT_IRQ' device instead.

I just want to make sure I'm on the right way.

Zongyuan Li (1):
  hw/arm/realview: use qom to replace old irq function

 hw/arm/realview.c | 52 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 8 deletions(-)

-- 
2.34.0


