Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBBF322EAA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:25:19 +0100 (CET)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaUw-000293-7B
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaU4-0001bp-5r
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaU1-00048z-KO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614097460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRM2VL09H0QIc2reZUXyPE784K6AqgzMJOUxI6K2w20=;
 b=ZltIF1vT6R7ty5AZMh4g0EULFw/SIbjehRQdYwNILQd9AcAlXgnbk6QxBrW8fMR86b49tU
 MJ3TosrxODfS5arNfH763bDPD6qQ72uobxPjcrcPIlYCCdpzlyrkWYhfj9R+R8teLETWP6
 6HYT4CFTWPfHKqoDVmnnVAnUa3+3oQI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-AQhWNjeCMuiIZE5-_hERKQ-1; Tue, 23 Feb 2021 11:04:03 -0500
X-MC-Unique: AQhWNjeCMuiIZE5-_hERKQ-1
Received: by mail-wr1-f70.google.com with SMTP id v3so1045799wro.21
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rRM2VL09H0QIc2reZUXyPE784K6AqgzMJOUxI6K2w20=;
 b=sf5YsfWyeNNSMwumgdKXDcwiXOm6J5Kqg8W5g2XSJROmxY18mljzeQNIkcQR8P/KgB
 nL2r8qy0OSkZAEOso18jddAmKd1VD1lg7LRNl7oFgTM/fo1JEWTW+EOTmneDdWNxSU4/
 nOA/TKr0T9atR7m0J2DlTZ6mka6gy23tK6uszy+nv/JuI4uaisaotRKWQKO6R5ucUNK/
 yU1VfKO5W2ehoj4BR/Tta0BUjCKxY9+AdmmCk//vnXgsFmOJQKn+Oc8Xn1/sWrPYVu25
 CTi7ZDzNLgpHdPUx1JxfffATeuxnLxF96kQxM7V9mfTICpP+8Dpc8dHX+JU7pO5dV9cw
 zaTA==
X-Gm-Message-State: AOAM531MrASYA6M2NnatbIICSALp0QKOFE8CDMH1SxjTa91ZmS/rHG1O
 ueH+9+7WcGAN+6t9tjvMaOeLf7qRORu9siv0ki0fZFvFJ26w5qXIKV8WTwxSxv8CSdiEQMJBqCY
 aQhWDhZrUTKBKqG4nH57a4e7iMQJf47zjhs3yIhVl2lYppxShuo0iYgyimq1Z
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr26491494wrx.318.1614096241660; 
 Tue, 23 Feb 2021 08:04:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRr3LJzVM9FzVJQAchw4Jlq7N/i6MPYR9waJUvi9eTRNrar6gW/Kro3j76LDdlYMCpNOvvsA==
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr26491476wrx.318.1614096241521; 
 Tue, 23 Feb 2021 08:04:01 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id n10sm6163119wrt.83.2021.02.23.08.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:01 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] checkpatch: don't emit warning on newly created acpi
 data files
Message-ID: <20210223160144.1507082-9-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Newly created acpi data files(tests/data/acpi/) cause false positive
warning.
If file names are acpi expected file, don't emit warning.

Fixes: e625ba2a41 ("checkpatch: fix acpi check with multiple file name")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <6899f9ad54cab8e7deca94ff0eeab641680e2b5e.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7f194c842b..8f7053ec9b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1530,7 +1530,9 @@ sub process {
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
 		     $line =~ /^rename (?:from|to) [\w\/\.\-]+\s*$/ ||
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
-		      (defined($1) || defined($2))))) {
+		      (defined($1) || defined($2)))) &&
+                      !(($realfile ne '') &&
+                        ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
 		}
-- 
MST


