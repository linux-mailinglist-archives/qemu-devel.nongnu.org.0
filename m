Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033EC476392
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:42:25 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxb6W-0001ld-3w
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq8-0003w1-CI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:29 -0500
Received: from [2a00:1450:4864:20::436] (port=45859
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq6-0004IR-I5
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:28 -0500
Received: by mail-wr1-x436.google.com with SMTP id o13so40160035wrs.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efR+euqp1TfYQWL3xVKZMvdNbeMwI7/EvU88T1y9UZs=;
 b=DiJovghtuH+uxPgqAibyXpta+8rSO8RUzbSJY4OaqGjluwSxD23c4HhK+v4+6uZpcO
 CbrFaOqpdds633M+rC8zCcFsZ2J9TiT4QYQBjN11+QcM3hSbSq5Gt8fBQhJgXhEAJ5VU
 xlROvkVq6150klQIUyLlVs6b5PTesaJu7/TJEXax8u8pyI2e2zHRl9isp8jkdpLU+b6b
 E4qMgUpIYLtYer36mK3hu4+Fjpd4GF2Hpr97Manwr24rAA8FUW/eL5EEJh12W280BOlB
 CwjdB4XCoT9191D9SeZkhSg99/3VC+mpj8A9vQgR65cfyPGCf9vZhvhA+EgTSElOThWD
 zLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=efR+euqp1TfYQWL3xVKZMvdNbeMwI7/EvU88T1y9UZs=;
 b=oyBq3VVVqHtczeqBysu3qIkd7uWcQzofQKRhG0SzXA7WD2tfZn3zryQ1tj5tQ59vNw
 BCXZrmWNn+azJ7/pPDcFqjyknuPxwhgcW/dq1pSbdBPWdEfgMDQV1E/FSkRDDtZK2Vx7
 JD5edAod2153sG5hJmOz+FBoGOurVdyPHCl3WJNeCVD+wzRhJH8S4tocQu1v10bBvNyL
 CXKN9bKIDB2jcimtLQMecXag7U2XufcpkkaEXFhJsVegnoFaQ91fDV+zPcmDYIHgHm2c
 5plOjoKYpqlErFYuSINsSvG++gbGdK00rby8DdcymY1O/X8dfPhN99WRh1MMiGjrEQuv
 vNew==
X-Gm-Message-State: AOAM5303+PJnXeZkNV09NYlBrTbs1Q4tixvA50ZPIchN0isCmu3Q9/yq
 bMJulen14mPIHUrPxfFMh3dGyAKGuOQ=
X-Google-Smtp-Source: ABdhPJzOpG8VBfuIxrxE81aP4mgiVOlVb3iu080cCzzywci4X9F/S9myPfSAZpc2qAzxtb3MTG0FMw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr4931091wrn.93.1639599925331;
 Wed, 15 Dec 2021 12:25:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] configure: remove dead variables
Date: Wed, 15 Dec 2021 21:25:15 +0100
Message-Id: <20211215202515.91586-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configure b/configure
index 48c21775f3..d3aac031a5 100755
--- a/configure
+++ b/configure
@@ -626,7 +626,6 @@ fi
 case $targetos in
 MINGW32*)
   mingw32="yes"
-  supported_os="yes"
   plugins="no"
   pie="no"
 ;;
@@ -668,7 +667,6 @@ SunOS)
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
 ;;
 Haiku)
-  haiku="yes"
   pie="no"
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
@@ -3472,9 +3470,6 @@ fi
 if test "$solaris" = "yes" ; then
   echo "CONFIG_SOLARIS=y" >> $config_host_mak
 fi
-if test "$haiku" = "yes" ; then
-  echo "CONFIG_HAIKU=y" >> $config_host_mak
-fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-- 
2.33.1


