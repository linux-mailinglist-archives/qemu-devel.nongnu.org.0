Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C64CF972
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:04:52 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAEV-000351-Qi
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABX-0008Ro-Bd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABV-0002aE-Qn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=fFdnoejDJJhm+PyPpwoS4ONfmtqHZT6RQBY4xj5FbXweNLgAtIyS0rlC0I3+uw6Ahtfaid
 v9ludksw2fVcN+3rrl0EGGHXnoWM+RLhmLARCwlaBIX0V7aQmhIQBYPZ2Iy/3x2Xlh4TLi
 5JwhV7onL1VsnuS27dE/7DVd/+UzPKo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-M7zrvvooP3KrNpKkc-qsWA-1; Mon, 07 Mar 2022 05:01:42 -0500
X-MC-Unique: M7zrvvooP3KrNpKkc-qsWA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so2422816edn.23
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1o/co5SzJ3afQc19M+6XwM/OcyfK5XPAzn/pSwX2qvQ=;
 b=2tgS9H9QvPiVgcAH/EHignEjeCoyOFW+x9I9JW9TlWHuEXJruso/jAU/HmU/AcYt9w
 QiXCwN0fBaah8qx9VVsI+lciUHYjWdflgBjRYdLW6zHSvo/R8+BxNoxIQuYhkq5/d5Iv
 VCCHyB+5CvfnpW2RhbzuFOComp/V44UTonxcYJtc6gqAUZwAIe1oe2qvEI6VCYRNMgHG
 TRWXmfbu+1jhQLxDBzPb86kEcx1TAVrdIIM6btQ5POGxvStMxH45tc3/GjvqSxLRPr+x
 Y1B5UrTxTPN4N+dfM1noi5uz//dhIWr87xriXZoV7q1+GKJYxRFvUCcjoq8gV/PfeTDz
 M4xA==
X-Gm-Message-State: AOAM533pSIOkqVPDRZwY+f8NM/eNjUkaa33sYkzaIZA4qnC9Q3uyxELN
 xzLHjJUYlNrXRMITNjN0bFWNIs4vzn1JlaPvcq8ikC7IaYOWGA/sOT6I0moYaDxcKLyRCjr+ynU
 Oa9Oj8r1+DQmn6YNxqe52lqgwwK9ormIC0CCBlLiXFZUxJhwDDnPQwd6laTXd
X-Received: by 2002:a50:d592:0:b0:415:e599:4166 with SMTP id
 v18-20020a50d592000000b00415e5994166mr10178806edi.195.1646647300942; 
 Mon, 07 Mar 2022 02:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVTCJsUdEKLwmI0F5B1b8bvaPtpBSyam3BO6+9gWEdWJ0s3VcrjBS/Fz0AxdbCaMFzsGnzkw==
X-Received: by 2002:a50:d592:0:b0:415:e599:4166 with SMTP id
 v18-20020a50d592000000b00415e5994166mr10178785edi.195.1646647300711; 
 Mon, 07 Mar 2022 02:01:40 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm4593963ejm.200.2022.03.07.02.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:40 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/47] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD
 macro
Message-ID: <20220307100058.449628-6-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
as a part of the ERST implementation seems to be unused. Remove it.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-5-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index c0a23cf467..de509c2b48 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -80,11 +80,6 @@
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
 #define UEFI_CPER_RECORD_ID_OFFSET 96U
-#define IS_UEFI_CPER_RECORD(ptr) \
-    (((ptr)[0] == 'C') && \
-     ((ptr)[1] == 'P') && \
-     ((ptr)[2] == 'E') && \
-     ((ptr)[3] == 'R'))
 
 /*
  * NOTE that when accessing CPER fields within a record, memcpy()
-- 
MST


