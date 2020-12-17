Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7C2DCDDF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:52:01 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpp0y-0005SI-Fg
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozE-00048i-G0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:12 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozC-00070L-Fz
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:12 -0500
Received: by mail-ej1-x630.google.com with SMTP id x16so36709035ejj.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yABgzrIgh18AAhbAFD7vLn70cv4k6N/nxvU8BfZ1dRA=;
 b=n9V903o9bOeRK4Rd7/u0UcH0bKCsNJTE/oxbZgwDb4uxyKEYvbVrPp5xmZFU5EBo6W
 K2KEfMQnBG6duAVJS04nUKkhilhb2uOSJiRPZv0P2eifaQYuSUmJM9g9yYGCcs6MphvF
 13TPJ1LbK+hUknyxZbZUKNFew04JCSQCrAB/VIuvktEX0sBX2+QsCnRH/FbJUjDXgHMp
 beIXRvT3EJ4O5+Y4Z5H9dQcCcbU7Lk48ps93FPMhbsTiD1LcFP5R3D9qof/W85WD2hem
 6xYXUa22+WQer4l+LdE2qnZf6n/GhQoRFU1fjIaSllfsopvtBA3ltDInmQW/brMS3niz
 DI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yABgzrIgh18AAhbAFD7vLn70cv4k6N/nxvU8BfZ1dRA=;
 b=fQs5vgOeF0M0tNCflf+mH24d4UaGANFww3+AF1Y5JX/gMrXmdKevIXS50qWhusE/C8
 3XnD8yBkuAeFhGjl0AZ/xYhxOO6v9riQN3GWacw/rwfz175iid01jSEXBjqSbrdhcooz
 y5ZuBW9X441gmRYvNQdMsxC/WRL2kyyHVTKZ5HU+kzDJk7qD1LmjTXjUd7tNvuG+Ta+k
 q0zK0BPtc3Cl8/tYpV69eBDhaNJfa3kcczz0NG3yfLIsXdVmLQoH4mtdAk16kBgukaVD
 hq0/ZoDvZPR73jTSxlit7AqmjHmz0fxkx9b/j95j+xEjgpK+K3fLc5Hgpv+HlwIFRK0Q
 83ig==
X-Gm-Message-State: AOAM532UdFXpHzY7hTznnAw5L9ObfeZlMEvX3vUhbxAQYxAsXFEtbQS3
 T+jXks177X5rMOIywOusvk3HMlgzPtM=
X-Google-Smtp-Source: ABdhPJwAyU2fDaTPHXFzRqKrytNYtkBF8iYoDoinHdD0BTcYYSjq1By6ZaX7Bxv6b4umdokm+U7VTg==
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr33426039ejw.96.1608195009195; 
 Thu, 17 Dec 2020 00:50:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd12sm22949542edb.6.2020.12.17.00.50.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:50:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] configure: remove variable bogus_os
Date: Thu, 17 Dec 2020 09:50:03 +0100
Message-Id: <20201217085005.10644-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217085005.10644-1-pbonzini@redhat.com>
References: <20201217085005.10644-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The condition can be tested also from $targetos, clean up.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 085a5ad7ff..18af8207d9 100755
--- a/configure
+++ b/configure
@@ -467,7 +467,6 @@ gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 
-bogus_os="no"
 malloc_trim="auto"
 
 # parse CC options second
@@ -620,7 +619,6 @@ else
   # might be going to just print the --help text, or it might
   # be the result of a missing compiler.
   targetos='bogus'
-  bogus_os='yes'
 fi
 
 # Some host OSes need non-standard checks for which CPU to use.
@@ -2016,7 +2014,7 @@ if test -z "$werror" ; then
     fi
 fi
 
-if test "$bogus_os" = "yes"; then
+if test "$targetos" = "bogus"; then
     # Now that we know that we're not printing the help and that
     # the compiler works (so the results of the check_defines we used
     # to identify the OS are reliable), if we didn't recognize the
-- 
2.29.2



