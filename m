Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766476AFBEB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM6-0003fk-QP; Tue, 07 Mar 2023 20:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM2-0003TA-FR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM1-0001f3-0V
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rF0SXZBaKaXInEGmRiFB0FY2stf33tILeVSsXB3T3wg=;
 b=XH9TnQiTaWBrIx0Va/vVFxoKFRWADJlwy1cXSJnKsJ695MjI8DqOJgXveGJu9uHvCXp2NB
 Qv3GO6XLbas8XhoK1jKbirIyl8nNXf0rqRNFG1u8Z/UgJ6N2OatFootggJcmwQINLNYvBe
 pbisZJ8KzdZYMQCBWBMFkts/DS22a3o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-OeVdXYG9NB2eaSa5UFx9wA-1; Tue, 07 Mar 2023 20:12:27 -0500
X-MC-Unique: OeVdXYG9NB2eaSa5UFx9wA-1
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so21465893edh.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rF0SXZBaKaXInEGmRiFB0FY2stf33tILeVSsXB3T3wg=;
 b=XSFERFevmDhepfSLy8TZR5Xu2FBEDIyix0mjd7W77FHobxFcCTtGtRX4ikYZBEVkxI
 ul6iT7ze1MV+sc2E+U0LP6GeX3BB1z0Ef0h+zfOJu55LNEUpATUxvPEuB+5A040kUAVL
 ly7TVLHLzRSLLlEhUapzRv+v+66mN/hEEK854EGNUO6HgFSTUb1Z91Z0EMx6sZd2CRSi
 39lQQdrpQu67qjrGMWO2hNjvF1kQDJontmH2+QvMJsGWcEhBu4jqjFZB4E1KjhH7872b
 1lXOHcCT4QJU2W5sgpWAzgR+yKFmePN6zvagcprM1djHB30YbpPqHDGi02sb2yx67gVG
 3G4A==
X-Gm-Message-State: AO0yUKV1gLh3RS3GQcLmubXfqtYq4BJyHkSiewpCnBOtdgcqRx3LDBai
 9P3ZAWaK/L+0EvAUaALLeHIeeNX3C08C+jFDE1K5dPfNZvsQ+2H2FRG2kWwK5q1qLuRPfozvoS3
 QjA8SGWnkHzJdyJgRw4p1izeETQAK2KHbhjcjYqmj//7Gn2rDd6Di+0CVtPSTjV04nwRD
X-Received: by 2002:aa7:d6c6:0:b0:4af:59c0:d303 with SMTP id
 x6-20020aa7d6c6000000b004af59c0d303mr14331894edr.26.1678237945667; 
 Tue, 07 Mar 2023 17:12:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8t0p2Yfl2uR+dD9oxumh0K7ms7GuKoYXdgHmxJbWvzJh6olAsmtE5AfqcHiDkMSZUtaUO3FQ==
X-Received: by 2002:aa7:d6c6:0:b0:4af:59c0:d303 with SMTP id
 x6-20020aa7d6c6000000b004af59c0d303mr14331878edr.26.1678237945378; 
 Tue, 07 Mar 2023 17:12:25 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5096cf000000b004f0de6d52fcsm1204416eda.74.2023.03.07.17.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:24 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 31/73] tests: acpi: whitelist q35/DSDT.multi-bridge before
 extending testcase
Message-ID: <0ece4e3bc339a0dcbd0eb575b8ede2fab7844271.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dabc024f53 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


