Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0730E780
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:38:49 +0100 (CET)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RjV-0007Zp-0j
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UTMbYAMKCiwLRMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--dje.bounces.google.com>)
 id 1l7Rgd-0006At-D2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:51 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:42208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UTMbYAMKCiwLRMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--dje.bounces.google.com>)
 id 1l7Rga-00017a-GL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:50 -0500
Received: by mail-pf1-x449.google.com with SMTP id t22so910905pfc.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 15:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=HsT+Ov8zrbL/HsoFJSvrskJLSXDBhfAhVatmUMllo8Y=;
 b=UiUoGfM5qVmGbd+MUc4p4XaEBfvNufeCXTv3jovNCkRGZkvKwVIHqJ1oj3g3p+5bXQ
 C93IHucQJ64rJdExABaa/3nMGtK3vOKlVik4i6qblLATwC5PGdNiDscROXtDpre8FN71
 6ZXkf6l+0nEPmWdHf1WyjwF8eOLOgk4PeAnYnlGpxUhAFKIWZ1YUoaB7kyXESZGPetwW
 KVD7KkvKQSYjMVi7ZtRfRBOfmBLo95wMsgD4axxqt65sOA4Def08MuoQH6x8txvo5brq
 48hc96RaJ8MIefg76tkAF3Mi7UgBz9Acl2QLw/r+OJ1nhia0v9kSn2axpvheUocjMVYf
 fX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HsT+Ov8zrbL/HsoFJSvrskJLSXDBhfAhVatmUMllo8Y=;
 b=MtUQQesVSOUVacBsgP7i+AICyQ3/9u5bPSmrmhGBNUCQxVNUojEqn3hjk8/ztbpVNr
 t3lvnhxGPVqlm+XTGuYfepTqbaebEzcoRwbI2VmLqcsoUtiBM9uGnEbrQI95f6S9Rf+u
 b9Z+tm7rsekJrehuQxT7E6jPFz8Hj/m5R+xWi77Gfbt7cwKuR/Df0SM3JruSQ6/8Z7DZ
 IY7q/Ca3xQMcFUWmhpN2oC8PjGLhW77l2LRZBwCA9a9AJ6y0n+XzuI1O46iL5TPyhspS
 Ao7GyDDCZvgosvx0TIhEMWJkqvPTr2Ig16sOvfFDqTwBfElm8Oypwi9lh7tfrHG4kkDB
 /Wvg==
X-Gm-Message-State: AOAM530wI7fYzaIo+YE9OqJdYipnzNMSDCRLS4YVuRU5+7Gb8HQ62ZDv
 lIopJn1FzuAQCkB5Djgsn9jx0oiPJ0W+ifielSYa77L+UJlqwYcz/NZBi3l8/6/JvkyCwGf4AOj
 qQ7rt7boDgWmtv8a/PaDZ0LnhuJW6Mse/smUhqempGlQpiBlxPs0a
X-Google-Smtp-Source: ABdhPJxv7Pa2t3XX/qRiVKXr31USYBVLSfs+UThc3MM0ZocmXIkIGtwG8MyuqyCW+E94nNSX3+HsYQw=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:25d4:96ad:ca30:7913])
 (user=dje job=sendgmr) by 2002:a17:90a:53:: with SMTP id
 19mr5305514pjb.29.1612395345381; 
 Wed, 03 Feb 2021 15:35:45 -0800 (PST)
Date: Wed,  3 Feb 2021 15:35:37 -0800
In-Reply-To: <20210203233539.1990032-1-dje@google.com>
Message-Id: <20210203233539.1990032-2-dje@google.com>
Mime-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 1/3] slirp: Placeholder for libslirp ipv6 hostfwd support
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3UTMbYAMKCiwLRMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--dje.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

This commit is intended to only contain the slirp submodule change
that adds ipv6 hostfwd support.
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..358c0827d4 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 358c0827d49778f016312bfb4167fe639900681f
-- 
2.30.0.365.g02bc693789-goog


