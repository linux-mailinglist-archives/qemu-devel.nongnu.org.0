Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF217A174
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 09:33:29 +0100 (CET)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9lwe-00016B-Ri
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 03:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9lv1-0007qr-Mj
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9lv0-0007mk-Ql
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9lv0-0007mT-No
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583397106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CqOKh2nsu51+3jeV93r1IoLT3LJ49Li6Fmw2d1sglg=;
 b=HD5qqFi/kWQzFk/VyLx/sHEp8HF00xnkGf9m4k4J/P7dNqIizJ58YkPeKNhIiQeNFdz4PC
 FJTJImE588fzbgUfJqaiLwQ1Yfnl6xuNEaOGklp7N7vEBhzEvsZDoAHpeS5bnWWE6H9V9n
 tMHpmAUNHOf+u/IixdL96V0JOFH1+jE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-D-hsxyMLNSOTSAapx0WFGQ-1; Thu, 05 Mar 2020 03:31:44 -0500
X-MC-Unique: D-hsxyMLNSOTSAapx0WFGQ-1
Received: by mail-wm1-f69.google.com with SMTP id e26so277531wmk.8
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 00:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYWPPUhlgOAaxjmcsT5crz3KE7S90eMUEZWRQyjBPTY=;
 b=t+fzunAV5OuzRe1xG7mx37DYiFbqhFL3cbRg49G0loNxznxELpZypYpdHQ8xjoXBla
 jxd+011tdFr7WNtIPY+B0v8qEDEJysJtXRZmSAXJTW6yDML3uBql0MhOovLufdHjwirw
 pAYiI9O4zAT1UCwMsvoqUFI8TnlMUnEZr/sfgaxkH1wXV5BlTyvnB1aUObgNGofspOd7
 yDcpNuxArzEyakh2WIYfn9ETuSpsuGGpxjnwZqYVsIJWSLHRl3GHyn6JFBTSZy6KCsPd
 1s2RYaPKLWK7uMzbxH+MOneFI5+UtNQoMRfsYIGSicMt8NFc4lPomchU0PmW1OxqeoR6
 P0Cg==
X-Gm-Message-State: ANhLgQ2jN1IwftHUlwvRF02JVvoom/ZuLVDrcIgxSA516RdeOEsHxs5H
 TXY60bLo/NsaB//d6zzVJrFuIXQOSNA+aHNy2DRi0cOe5R8W4oZnS+WOjmCAXOLelG+SEz3lTkl
 mdlu6gxbPMlro/vo=
X-Received: by 2002:adf:a355:: with SMTP id d21mr3896827wrb.233.1583397103462; 
 Thu, 05 Mar 2020 00:31:43 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvQFpXbzxh30cSfnGYrTEt/OrYpoBYN35i2prm384PAXn5DY5zjR3N6gkbldHvjYA1U1bg2Mg==
X-Received: by 2002:adf:a355:: with SMTP id d21mr3896811wrb.233.1583397103231; 
 Thu, 05 Mar 2020 00:31:43 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id n11sm10014317wrw.11.2020.03.05.00.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 00:31:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [MERGED PATCH v2 1/5] hw/scsi/viosrp: Add missing 'hw/scsi/srp.h'
 include
Date: Thu,  5 Mar 2020 09:31:31 +0100
Message-Id: <20200305083135.8270-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305083135.8270-1-philmd@redhat.com>
References: <20200305083135.8270-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This header use the srp_* structures declared in "hw/scsi/srp.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Patch already applied to ppc-for-5.0.

 hw/scsi/viosrp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
index d8e365db1e..25676c2383 100644
--- a/hw/scsi/viosrp.h
+++ b/hw/scsi/viosrp.h
@@ -34,6 +34,8 @@
 #ifndef PPC_VIOSRP_H
 #define PPC_VIOSRP_H
=20
+#include "hw/scsi/srp.h"
+
 #define SRP_VERSION "16.a"
 #define SRP_MAX_IU_LEN    256
 #define SRP_MAX_LOC_LEN 32
--=20
2.21.1


