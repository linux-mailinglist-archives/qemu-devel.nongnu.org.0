Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3C3C1621
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:37:24 +0200 (CEST)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W5b-0006MB-VO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn1-0000cD-4F
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:11 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmz-0008Fl-Nq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:10 -0400
Received: by mail-ej1-x630.google.com with SMTP id nd37so10295712ejc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ioTspNqC51n8g8b33aT5Bz3obIBnFvA/tPrRexRDgc0=;
 b=tbYeDzv99rDfemDZar9InVxqaA7iqcQss4wndGEeaP2nOOA5ZA6kSvCsyDFpMCh9AA
 8aV8eSN1tPTeSPvIBKLwqdrRIsDIzcBSWtIJ1ofe1NMtZATSJc27w/yNKg3uDnlo/aFZ
 jFWxCVlhInpsiuHxd7uDhhjm9vkVGCv5G4Ic7+JbJGW2zjKN6m2lPsaTHmZQDaam+t4g
 fXo2xNuoJ+/XMVD2r4HOr7JDrgaJku5Fh1fZMu5/+ncuglI/zpkYQlzSfBMOwZ3xDCdW
 n7QuMLbd667sPUCw5hbH000VNglYvcdY82B4Jlw/4Ziq+6Le1louKB5D5SrYI9k5LtoP
 7yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ioTspNqC51n8g8b33aT5Bz3obIBnFvA/tPrRexRDgc0=;
 b=uUoLu5OLRcMNZZZsQOJRJK2WQq/OhI3gPgVNwF+H91nykOLjRbGsJ1OUT70sOC2hm9
 lOiVS/8lg436jYsbVqHPmPQhlejCfT36vGDjk3afSMVkNmCHzCjDDsS/uOr2uQ2dvt93
 6MuDFCAfpuMC0ABcK0Orni+sM+8oQJgkkppxIW2b3wFMQB2IektKlkx2p6+bpog8NAMZ
 L7RnXmcbE1w+xwF2w4kV0NyfswdlWmpzFYZIYWhQjfjNb3J3y0CSblyfoy2wgCJXFvE1
 IvXcQo1b7qjDEzPyMSJsXgWsllUBXRMoXyw7NZjJtt3yg6jmM8edzQl/TfE/EiLBkL0a
 ahWw==
X-Gm-Message-State: AOAM5322HUrBq4B4IIFRWU1s0V1+R+SSG8ZnENG6zT0PVjwqFvAm6lpF
 qVryQ9svGyZdJqNFAlKqIyhCz7U8Mns=
X-Google-Smtp-Source: ABdhPJyhcS6cijq8HqgTNOxCqI8pqSfsZnJUvPthRv0xMjTFUwEWN4NTVdqRdmPdv5NnEEIzooX+0g==
X-Received: by 2002:a17:906:58cd:: with SMTP id
 e13mr15759675ejs.177.1625757488404; 
 Thu, 08 Jul 2021 08:18:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/48] modules: add module_obj() note to QOM docs
Date: Thu,  8 Jul 2021 17:17:26 +0200
Message-Id: <20210708151748.408754-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-23-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/qom.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 42d0dc4f4d..e5fe3597cd 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -87,6 +87,14 @@ specific type:
    #define MY_DEVICE(obj) \
       OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
 
+In case the ObjectClass implementation can be built as module a
+module_obj() line must be added to make sure qemu loads the module
+when the object is needed.
+
+.. code-block:: c
+
+   module_obj(TYPE_MY_DEVICE);
+
 Class Initialization
 ====================
 
-- 
2.31.1



