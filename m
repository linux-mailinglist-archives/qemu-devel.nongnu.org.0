Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC227B8F3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 02:42:07 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kN3iY-0003Xk-33
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 20:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SYJyXwsKCho7IA8DD4CE4D6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--hskinnemoen.bounces.google.com>)
 id 1kN3gD-0002GG-Is
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 20:39:41 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:54424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SYJyXwsKCho7IA8DD4CE4D6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--hskinnemoen.bounces.google.com>)
 id 1kN3gC-0000PR-4F
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 20:39:41 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id s128so2930157ybc.21
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=sYg5Kzsr8KLjdNXvzs0OEoN/iOhrZqYW4HJOWew+/+s=;
 b=BZ3o1k9NYKMO7qfF55oxjLloDhis/h5uzOHdD1+Glkqmycmr7sdCcWQLIM8oHrLam/
 ajvjmoiHKOmluhD5kRvP9yAy8nkLeOn9zNnG+l/kin32Slr+YyXhfrS4vOmw+sO5hTFw
 7dH3QsZWfT+1QozINyHSnTShuWvSazI444mwNyCv/r0l3MFyH6OWlCMG0CF4RDrCb1wJ
 LlgtJkmSd75Gxk+vd3QQHqybpwIXNZFITctH212DCsBAyAxm4yicYhvpez5VKnymXsRp
 Rmv9V5j3igggOx2UU00uA+7/X3QlP3xfgnEl5KUQHfg9dho2KIiKE/Js7XK2Hq0w2LhD
 aavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sYg5Kzsr8KLjdNXvzs0OEoN/iOhrZqYW4HJOWew+/+s=;
 b=UbMguYQvh2UDS7Tiky/VdkQgm99QqJSYjqSC2e9LFUYWPOvxUyqZyry+ustPxcH44S
 xvlq5ZwOzl2nkwnqZ7NNDHO9UOFkX43mrPhfulS7CJP7//1WbfdAJWLuKlzAxH63pitv
 0pBf5sBO5LZm1og0WAqE7m1BzvG7goeoIscbzfXfBpJpsUQjrdT2eVPXLZCDPYZy39oN
 /KcyEyufvhfP809E1GxkSVoF4ZSiW3dujUb3BEjkXRZ5OOZTuporLYZCBd/HBNgvdMjM
 I6uk7z/3sL3ipF1pz0xTR0iL7WmQIb/zJBZ6S7ErEVLcEqtKBWtyu4VWda12+zdM8V4C
 6uiw==
X-Gm-Message-State: AOAM532QgsZrdkFiU6MnPlc8pkXGCfXX2uhf306Qo8Bm/PJoedr2jkUf
 vOwzfh3GEAvRe44BflCu+Yy/F3a8h/v7ZHqiLPZDVhwZtrDX/S2i5hAJICdgODa+usySr12ASmq
 uaJJmac+9wqF+cVsnQ2zYAEEk3VWs4zRMPH8RS1nMid60OHFx7V+ToF2ypi/YLZTkjYEsDEWp9Q
 ==
X-Google-Smtp-Source: ABdhPJxTcetwlCFZyOjMP+C2TBvcHwYdQfNWBOFiw86GDfnqsPDSJMZnoA0+3ma64bpwlR8iehEF39QYoElAnO4qTQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a25:d1d4:: with SMTP id
 i203mr2838876ybg.429.1601339977897; Mon, 28 Sep 2020 17:39:37 -0700 (PDT)
Date: Mon, 28 Sep 2020 17:39:14 -0700
In-Reply-To: <20200929003916.4183696-1-hskinnemoen@google.com>
Message-Id: <20200929003916.4183696-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200929003916.4183696-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [RFC 1/3] docs: enable sphinx blockdiag extension
To: qemu-devel@nongnu.org
Cc: Avi.Fishman@nuvoton.com, kfting@nuvoton.com, joel@jms.id.au, clg@kaod.org, 
 venture@google.com, wuhaotsh@google.com, minyard@acm.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3SYJyXwsKCho7IA8DD4CE4D6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.468,
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 docs/conf.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 0dbd90dc11..7c72f1a074 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -67,7 +67,10 @@ needs_sphinx = '1.6'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'sphinxcontrib.blockdiag']
+
+# Fontpath for blockdiag (truetype font)
+blockdiag_fontpath = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
-- 
2.28.0.709.gb0816b6eb0-goog


