Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C3391D33
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:37:56 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwXb-00070l-AP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llwVi-0005FU-1I
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llwVf-000068-Qt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:57 -0400
Received: by mail-ej1-x62f.google.com with SMTP id h20so2033553ejg.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xm8BamJ6E9yKrFba0HkTcb+RKZaPe26N8XSF4j7Ohvk=;
 b=dI/GbsbTgjhF0Qq+z0waiE4jNYwdUYAyJiWi9UUGGFsSpAfb+fLsHCvVu06pB8kkgX
 D2+zvStxKoYtUmTm2OeYjXuGDvo5Q8PfTCgXIKbxkO9S3KNiQ011IVOXP/YFoHZKKg1Y
 jcBL7/DkJxz4pBM48WwduMat4lVRl2eea5XOtIsGSOMb241nPjCibw9pu+3Zdiri13R9
 I3cKiSSWKR+ie/abS4qDs8Lt1YKdBJNVAxJ6unwXgmqCAQ9863w1WRZfeKtztj6dhr7v
 /6aMY9B3zSJPaTBzfAVj+A8voiMrEnkDBjrR+jElD4OKrEkH5VOE6Se5MHPTCD9ISGHT
 svLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xm8BamJ6E9yKrFba0HkTcb+RKZaPe26N8XSF4j7Ohvk=;
 b=pDg8D50+Z5fnUJt4RXxFyRDIs0Ibee0dilXsRf1G+nKlOYs+yE9gmNa5R8a4tzy3xV
 0GyuVGP0CzqctFvTA16kKwbqT29g2IQjHtZAkLSk9+NHuEA+FhqBQ1jnI5Wj9fr7c110
 xI6AvEFiUMg0aazx+Te/blI6m/NKX9wpPqROzoOm/2dYNXSAHQ7TdmVJCjENpMqevFO9
 +UxSzVK8z/iN6UbQnxsQJrdW/2Cm8Vm8QgEH6lqfNwAP2zDkm333DnDvM2Q0vZTeVaZ+
 fo5MskUgVlbk7UhB4IgtRZ5OHaqjz0f2RTBzmFvzH5kSZ7ggIMUcUX0poZiA4JyAeAzH
 cnTQ==
X-Gm-Message-State: AOAM5335G0B40BdS6TntRn+OTYFm38qfr5JEe56o8gfD6DNpH6wNfNnS
 sNHm6k+CWglRRk1dNtlQBI1TDGVzeOFXyw==
X-Google-Smtp-Source: ABdhPJw1ikMG4Wt3PDjrW4huP+3uF47tcOYzjWFLryt+GwEbZMtlWyY2IVVd4ezBcO3VQQAJuwIXaA==
X-Received: by 2002:a17:906:f207:: with SMTP id
 gt7mr2825562ejb.120.1622046953663; 
 Wed, 26 May 2021 09:35:53 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 a8sm1342001ejt.102.2021.05.26.09.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 09:35:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] doc: Add notes about -mon option mode=control argument.
Date: Wed, 26 May 2021 18:35:50 +0200
Message-Id: <20210526163550.501367-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526163550.501367-1-pbonzini@redhat.com>
References: <20210526163550.501367-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Ali Shirvani <alishir@routerhosting.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ali Shirvani <alishir@routerhosting.com>

The mode=control argument configures a QMP monitor.

Signed-off-by: Ali Shirvani <alishir@routerhosting.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8116f79818..14258784b3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3799,8 +3799,11 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``pretty`` is only valid when
-    ``mode=control``, turning on JSON pretty printing to ease
+    Setup monitor on chardev name. ``mode=control`` configures 
+    a QMP monitor (a JSON RPC-style protocol) and it is not the
+    same as HMP, the human monitor that has a "(qemu)" prompt.
+    ``pretty`` is only valid when ``mode=control``, 
+    turning on JSON pretty printing to ease
     human reading and debugging.
 ERST
 
-- 
2.31.1

