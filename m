Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A56481D2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWC-0004rV-HT; Fri, 09 Dec 2022 06:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUs-0003yZ-3D
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUp-00010B-H5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+/Qhy5YI+m6ReFDcRj9vmTwXS9tW1f9AMgMdyZi0pI=;
 b=L8TOIHogTlVHfqet8YI7aq7lxL7m8bIxg43679p0hnEnKVjEys7UdelxNGNSwERu6LZoOD
 jhLcC4YQ8vHD6Hx5cjU0exWJ4r/b7x0mnNwc1OXIQfbCkXx0qRVAuE+9eLZcW7Z5dqVa+l
 A3NWvtHavZpHXdvSsW6nHeOPmpNKiws=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-1XQl0gHvPmSOhxUFwZZepw-1; Fri, 09 Dec 2022 06:24:49 -0500
X-MC-Unique: 1XQl0gHvPmSOhxUFwZZepw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sa20-20020a1709076d1400b007bbe8699c2eso2897039ejc.6
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+/Qhy5YI+m6ReFDcRj9vmTwXS9tW1f9AMgMdyZi0pI=;
 b=k2eTqhMxFh+SLJ7gqTeNuqmRVl/UCb1EKg7PzhlsBP/dwEnUxWcSfvPDy2q+b3V1pr
 21DMvkMr5b3IOeYlbLb9mgeeFIzNCcTJ+gswHkrH3GYjhXx166NJtI1TPM0+A5+l/x79
 NcAEajPYJvKGt3Sy36JSlSsXQAJ/uBhirrMs6CVVYxxEiIH7pRNritQ1a63GRR2fBqmE
 ES+xMCB0n4/nts84+tovrw1Ul5MyN8XHJzdXaMQus+lw/PARs4a3J6jVDWRLmPXaB4nn
 V4eM7UJM4litQu6KXiMFNfUiIoNd8HvGjQTukK4d5oggtdsydAUL2RMm0HyyhsHJVjZH
 VtNQ==
X-Gm-Message-State: ANoB5pkg0Ca5OgYHTM75Q+PfgRj+54Y7P1heJ+aClctvrg862ur9olYE
 1yyAqllmfRV88bZknbSJdNw1xcCNnKO0uyx8tke58KCiL0+beyComXscNKXPiBdep69TeGDlZmj
 gisd2mkkGA0d+RDLH/RPSP4a1bHNWSBNNfDK4qgDz5QqaBU6uKE7V4GqTDHV0HB6FWp8=
X-Received: by 2002:a17:906:4bcc:b0:7c1:b65:440f with SMTP id
 x12-20020a1709064bcc00b007c10b65440fmr4394532ejv.25.1670585087953; 
 Fri, 09 Dec 2022 03:24:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7XUtAoMyEdPSDvySxZPAFlxFPogyvF2MAdWdwgQWUtFJWWR1j23Qi6IvX+Y8h+0apxyx8zVw==
X-Received: by 2002:a17:906:4bcc:b0:7c1:b65:440f with SMTP id
 x12-20020a1709064bcc00b007c10b65440fmr4394520ejv.25.1670585087564; 
 Fri, 09 Dec 2022 03:24:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 mm22-20020a170906cc5600b007c0fd177c0bsm449917ejb.46.2022.12.09.03.24.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/30] configure: remove backwards-compatibility code
Date: Fri,  9 Dec 2022 12:23:52 +0100
Message-Id: <20221209112409.184703-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The cmd_line.txt mangling is only needed when rebuilding from very old
trees and is kept mostly as an example of how to extend it.  However,
Meson 0.63 introduces a deprecation mechanism for meson_options.txt
that can be used instead, so get rid of our home-grown hack.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/configure b/configure
index 6efc2055ce09..113db838a16f 100755
--- a/configure
+++ b/configure
@@ -2556,16 +2556,6 @@ if test "$skip_meson" = no; then
   if test "$?" -ne 0 ; then
       error_exit "meson setup failed"
   fi
-else
-  if test -f meson-private/cmd_line.txt; then
-    # Adjust old command line options whose type was changed
-    # Avoids having to use "setup --wipe" when Meson is upgraded
-    perl -i -ne '
-      s/^gettext = true$/gettext = auto/;
-      s/^gettext = false$/gettext = disabled/;
-      /^b_staticpic/ && next;
-      print;' meson-private/cmd_line.txt
-  fi
 fi
 
 # Save the configure command line for later reuse.
-- 
2.38.1


