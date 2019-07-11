Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620CF65E6B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:22:58 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlcmX-0007w8-L2
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlcm0-0005q5-2q
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hlclz-0003jJ-1s
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:24 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hlcly-0003i1-Rd
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:22:22 -0400
Received: by mail-wr1-x442.google.com with SMTP id n9so7167585wrr.4
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RxYfAEyw36ihWSXQYKfqSMDy1K9OXWQsSR7Cb5/oOMk=;
 b=PmGVcfthSxJ+fHCa/bi19s0VtpgRlUtxyC7RLRL1GOu0yffMUyI32MIwnAzKz5FOL7
 99KmcX5Nvcl8n/kuNbgg12N73vApHl7H7h7PYkuLT5p1JkeHGF5AlKhx5TBoCmK8plHO
 ROS4aQK3dsGp85OcNr5OuCP6AbkZasJSffPWKM/PDtk2Utns2V3NWXl8q6/Ygu0nTU+A
 5eS8h85lsavLJnU2OL0+WsE9+hizNirIfUTXfMiTSeEmE/xwHUzKKQZawjQuCaEadLUf
 wXJTE558QiUSwm1LWLPIgGZNvqFrZ1AUStOb46EA1xxEjBdD4GQf2EJe/5ooL6BeDS8/
 wL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=RxYfAEyw36ihWSXQYKfqSMDy1K9OXWQsSR7Cb5/oOMk=;
 b=GuQda7FDJqvrvPFfRgw0j+MEPGlGgL6teWtsuOUi9zR4B3yKbS0KvACUcFxvq0dWPv
 Nrgbp/XPcBR+3KkmBuu9hO4ekx0tcXYmH+2FA3Jgj9iUb6gjAPOsX4bCBhllPuhQeyrn
 8PsHtnH2FAaY5ni62WKMTBVqqHdahSvPOqk702geTyB3rod+odh7b7u/7BlXduYPat0v
 aCPagxHJS22mk7LWKhoXuwBIibjgBxpJ6okbJnSxmNfLqpki/bd2MxZzMzCZM+LUijBM
 Se4Dcug7S9GWtgvVJpRRhL6UV6nlSAaCfrVyj0ik1BVg+kyVZbl2uXe4zJOXx0Cn1fit
 YDFQ==
X-Gm-Message-State: APjAAAWsTvPcHVfIkBGGF6jeVQGX6EHXVldgOQ7DLURywZ4d/n5XHt6U
 kAT1cIHEskHX7+yrzB2+Grd13soQcdU=
X-Google-Smtp-Source: APXvYqzchK2uToAFfTfutp8KJqYHTQciCRLD2h3RWRxRvPbn2xlvFt/6nD1IdosiefQ3ZccRsa5c2g==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr6004069wrm.315.1562865740294; 
 Thu, 11 Jul 2019 10:22:20 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c11sm8654514wrq.45.2019.07.11.10.22.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:22:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 19:22:16 +0200
Message-Id: <1562865736-3546-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562865736-3546-1-git-send-email-pbonzini@redhat.com>
References: <1562865736-3546-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 2/2] create_config: remove $(CONFIG_SOFTMMU)
 hack
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_TPM is defined to a rather weird $(CONFIG_SOFTMMU) so that it
expands to the right thing in hw/Makefile.objs.  This however is not
needed anymore and it has a corresponding hack in create_config
to turn it into "#define CONFIG_TPM 1".  Clean up.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure             | 2 +-
 scripts/create_config | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4983c8b..eb635c3 100755
--- a/configure
+++ b/configure
@@ -7159,7 +7159,7 @@ if test "$live_block_migration" = "yes" ; then
 fi
 
 if test "$tpm" = "yes"; then
-  echo 'CONFIG_TPM=$(CONFIG_SOFTMMU)' >> $config_host_mak
+  echo 'CONFIG_TPM=y' >> $config_host_mak
 fi
 
 echo "TRACE_BACKENDS=$trace_backends" >> $config_host_mak
diff --git a/scripts/create_config b/scripts/create_config
index 00e86c8..6d8f08b 100755
--- a/scripts/create_config
+++ b/scripts/create_config
@@ -54,7 +54,7 @@ case $line in
     done
     echo "    NULL"
     ;;
- CONFIG_*='$(CONFIG_SOFTMMU)'|CONFIG_*=y) # configuration
+ CONFIG_*=y) # configuration
     name=${line%=*}
     echo "#define $name 1"
     ;;
-- 
1.8.3.1


