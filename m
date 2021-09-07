Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD3402C45
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:58:38 +0200 (CEST)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdUb-00030t-U1
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSq-0000yQ-Ef
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:48 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSo-00067y-0g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:48 -0400
Received: by mail-ed1-x530.google.com with SMTP id r7so14591319edd.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DycWxbP0FmToEbAs9ekzWaS53oHorD5ECMYmL+StYRQ=;
 b=G9qMhjPtL+fQF1LsRLyq3evFJuVecgElxo4miCXRIEEs3Lsa3Zc4vXfG+Df9iQfP/c
 VzMyr5XGA67c1FAixokQ+6lr75jKvY0VKQTURmDC0xNN1IkNHxyAlg2x6N7NghXtKAm2
 Ll11iitJyWI4IGyrVzu4BR7KFvBfcrst7SlOpKGUmNGcGj+VxP74Nt1znn68LzZpbjNV
 PTUI7tbA22jqPncVI/2RqGP36AXnjoNdzKZZqzOWPdZU4S4v23k1DEHSqlUTbp5xAh/d
 hQDMOAZdLRLL0Oq4/uV5+y5LSa6cgVVU/L6h6NErDI71a1eGW5xSu09Khy3zSWBAyIZ4
 ipRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DycWxbP0FmToEbAs9ekzWaS53oHorD5ECMYmL+StYRQ=;
 b=ounsylSrxFD89K5pxhjnlOdnNRxiV3tbBzGpgXP+lsY/b9gbX+UKhy9PCJnDEUs7nQ
 dWJvblLK7VP2qZ/6rjazSB0I5yk/jBXkUU7iRC0PoQ4GsXLdxpgV/A9l/N7NNEHUggC3
 oH7QCM0G//t24wMID1VAIRgUnRg7jhcbeNSruNKb5hZMhAHCda8/l57dVaWKMXra25YO
 o0/byB6rwhjDO2Rqj3nfwqmEhmH3CZ/ZVxFncRdN8LNOSBJaThbuvITZGi60WXGSPdJs
 ylkAF43USOnawUUbLdVGtQonR9VKolVbay04KbsapakWYq6YxtBdO9DcouilVKwb8mdc
 zM3g==
X-Gm-Message-State: AOAM531JfNMrc8OLnz/4leiTIZn6Kq6caKp69Bi2/OUlwzk1diUDKduY
 svBziQVLa2NBYD3qADrNVV92tQ62ngY=
X-Google-Smtp-Source: ABdhPJxVSkmBQDImXqSn1nxPp0md9IEQJI31R+aBO2nglqhjd9Y4PDdaCkjL09DXQReERQ8lsyFVag==
X-Received: by 2002:aa7:dc19:: with SMTP id b25mr148939edu.23.1631030204685;
 Tue, 07 Sep 2021 08:56:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] docs/system: standardize docs/system man page sections to
 --- with overline
Date: Tue,  7 Sep 2021 17:56:39 +0200
Message-Id: <20210907155641.197844-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907155641.197844-1-pbonzini@redhat.com>
References: <20210907155641.197844-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Man pages in docs/system use file inclusion heavily.  Use headings with
overlines in the main files, so that the same included file work well
from both manuals and man pages.

This style of heading is a bit more heavy-weight, so it is not used by
the other man pages in interop/ and tools/.  If in the future they
are changed to use include files, for example to avoid having sections
named "synopsis" or "description", they can switch to --- with overline
as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/qemu-block-drivers.rst | 3 +++
 docs/system/qemu-cpu-models.rst    | 9 ++++++---
 docs/system/qemu-manpage.rst       | 5 +++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst b/docs/system/qemu-block-drivers.rst
index eb276481d6..c2c0114cec 100644
--- a/docs/system/qemu-block-drivers.rst
+++ b/docs/system/qemu-block-drivers.rst
@@ -4,16 +4,19 @@
 QEMU block drivers reference
 ============================
 
+--------
 Synopsis
 --------
 
 QEMU block driver reference manual
 
+-----------
 Description
 -----------
 
 .. include:: qemu-block-drivers.rst.inc
 
+--------
 See also
 --------
 
diff --git a/docs/system/qemu-cpu-models.rst b/docs/system/qemu-cpu-models.rst
index 8c51e2bf49..5cf6e46f8a 100644
--- a/docs/system/qemu-cpu-models.rst
+++ b/docs/system/qemu-cpu-models.rst
@@ -4,18 +4,21 @@
 QEMU / KVM CPU model configuration
 ==================================
 
+--------
 Synopsis
-''''''''
+--------
 
 QEMU CPU Modelling Infrastructure manual
 
+-----------
 Description
-'''''''''''
+-----------
 
 .. include:: cpu-models-x86.rst.inc
 .. include:: cpu-models-mips.rst.inc
 
+--------
 See also
-''''''''
+--------
 
 The HTML documentation of QEMU for more precise information and Linux user mode emulator invocation.
diff --git a/docs/system/qemu-manpage.rst b/docs/system/qemu-manpage.rst
index d6f44e265b..c47a412758 100644
--- a/docs/system/qemu-manpage.rst
+++ b/docs/system/qemu-manpage.rst
@@ -10,6 +10,7 @@
 QEMU User Documentation
 =======================
 
+--------
 Synopsis
 --------
 
@@ -17,11 +18,13 @@ Synopsis
 
    |qemu_system| [options] [disk_image]
 
+-----------
 Description
 -----------
 
 .. include:: target-i386-desc.rst.inc
 
+-------
 Options
 -------
 
@@ -34,11 +37,13 @@ not need a disk image.
 
 .. include:: mux-chardev.rst.inc
 
+-----
 Notes
 -----
 
 .. include:: device-url-syntax.rst.inc
 
+--------
 See also
 --------
 
-- 
2.31.1



