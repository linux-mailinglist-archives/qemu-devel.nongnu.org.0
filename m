Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0648AF13
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:02:42 +0100 (CET)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HjU-00056H-F1
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvF-0003bk-Fq; Tue, 11 Jan 2022 08:10:45 -0500
Received: from [2607:f8b0:4864:20::929] (port=42793
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvB-0007QU-3p; Tue, 11 Jan 2022 08:10:43 -0500
Received: by mail-ua1-x929.google.com with SMTP id p1so29559125uap.9;
 Tue, 11 Jan 2022 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lBvtXoSEXQr/3QIUlqHxqIAO+YSVNLMqW4uLYCYnzn8=;
 b=OOjZDaBGsH1FfuUwNSAX1Qz7uQB0xV2qaYo8p6kt/Jp6Ky7cXWplFxB2eji5rJOAtc
 DkDvozV+LTLn2ueoZUiEzrJIQyQCTeoqNjqVdfGQs7jBIOTwhvX9YS4Kdz3GeGWSLAh4
 wJl9x3tFJyRVQi3n5kQ2nr1yM/+2XBkDyHgtYYVb8cBsh75Gtq4/mdKDerwA4IoDO7Y+
 /83qsaR9JDu79lhKWGXFIpg1MEQMDPpzuR+ABbEvecL/dEwWl+gE4XJod6UNSKW+ZMhG
 J+SMDDxiSTjFcuZZKUthceWrXPYMCrNdMa8FJvD5sL7fy1RMVb/tmm4Q/ghqHnWnulfa
 jXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lBvtXoSEXQr/3QIUlqHxqIAO+YSVNLMqW4uLYCYnzn8=;
 b=7NpOG7oGsdRukDyOdVf4O7o2l0zzg3PvJutgx6CDFkk65rj/qPpOezyyvWVO/QYREl
 uf1komP62b/T6Ic5w6eedCIi4+jB1j0U70qpASoIoreaAs0DhoOocNzsHLfT2LNMsMjl
 G3op1jQCjtRTAZqMiTAcOfAHW2FHMjUnsgwUhtOcnnPC+32D1t2yH2hu2Cm/tFpYchvd
 Hybl85E9yqddw+EIiDL5ZFj09KrPK8CIjZNuNcI+ijkQhNCufb5PPoYoNNVkeq+olpYQ
 bKfVnzCn8AGmHSfWRxcn9XtqT4C04zvdfESfoupxPxWwTcFFlDPOwliNvm/2juxDxeGP
 vE+w==
X-Gm-Message-State: AOAM532nMC7FTCL0QgrzwlKGKuo8Zruzv4+YYnQ50L/tiYCXYBQnIWdH
 nJzAIJF8KhfFnMNXt1koq67pUyIzVpi4OuDE
X-Google-Smtp-Source: ABdhPJwBe5jPpoiAm7F+EMHYaMzJcoNKLe6vuC/6HcRiu6cGpCQQ+p2QIgw5VJdcDqIYDIa4AYvUmg==
X-Received: by 2002:a05:6102:290d:: with SMTP id
 cz13mr1940998vsb.34.1641906635829; 
 Tue, 11 Jan 2022 05:10:35 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id f1sm5386381uae.5.2022.01.11.05.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:10:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] user creatable pnv-phb4 devices
Date: Tue, 11 Jan 2022 10:10:22 -0300
Message-Id: <20220111131027.599784-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This version implements Cedric's review suggestions from v4. No
drastic design changes were made.

Changes from v4:
- patches 1,3,5: unchanged
- patch 2:
  * renamed function to pnv_phb4_xscom_realize()
  * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
- patch 4:
  * changed pnv_phb4_get_stack signature to use chip and phb
  * added a new helper called pnv_pec_stk_default_phb_realize() to
realize the default phb when running with defaults
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html

Daniel Henrique Barboza (5):
  ppc/pnv: set phb4 properties in stk_realize()
  ppc/pnv: move PHB4 XSCOM init to phb4_realize()
  ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
  ppc/pnv: Introduce user creatable pnv-phb4 devices
  ppc/pnv: turn pnv_phb4_update_regions() into static

 hw/pci-host/pnv_phb4.c         | 430 ++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb4_pec.c     | 329 ++-----------------------
 hw/ppc/pnv.c                   |   2 +
 include/hw/pci-host/pnv_phb4.h |   8 +-
 4 files changed, 431 insertions(+), 338 deletions(-)

-- 
2.33.1


