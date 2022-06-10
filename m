Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454A5461D0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:24:13 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzasF-0006lk-R1
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYN-0002Re-LU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYM-0006SZ-7N
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLoG+6d/H5CJ2YWH5V8iDYChaCq33BzGT2o7sdPVSIU=;
 b=ZDyd4SEYtjYI8/09hsz8Ks8lQoQa1fHN/IskWRPk3eqSbMj8MP5viUUl2vEFrRgmgANiME
 lSVfbFJxqvgUP7RB/Pgq06ZkD6zlhcnvf40BUrtxqB+xwvaaZbrwyFSPK/QhfI4XXAYwI/
 VmkRQqRKgIglD+NwfgXhPkGuPsqokgY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-uDzHF7JbP9CrEuH736RsJw-1; Fri, 10 Jun 2022 03:59:32 -0400
X-MC-Unique: uDzHF7JbP9CrEuH736RsJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l3-20020a05600c1d0300b0039c7efa2526so82409wms.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YLoG+6d/H5CJ2YWH5V8iDYChaCq33BzGT2o7sdPVSIU=;
 b=68gcPflnHTjThQuoDUSPjbge1wakRqMv0HNpXHeukObgpxuSx/zLW8sVOAkYZrMg86
 NDQ94y0DVdlPUUnsRXZYv8JjGBP8xUhE7oFcsuCLRsePY7a/M2ZwTqnP8HN3IhgkwzIJ
 ugIuaeMXy2zTrukqiaNUJZ+3et9+B0GhXD/GBofqx/jb0LM7L6sSWEO5XnHWaKgRjNmS
 JeFSkl0QOAnDFO4ncr/79fci5PI2ctiwYpQDiXQ0XIl6PWV846V0iQ0aUITNuVMbD1kD
 BfMreE6ZCmd0kMGaaghfQp9OCMut2wliQKU5JKXZKT9IfU21ebR7fG6QHOE1xfcGIPpS
 CI2A==
X-Gm-Message-State: AOAM532m+gADervrdQSvmpUX74piDvgzDshtmFzV6Wb3vEpwSLhQih3i
 IoRVTM6MHhtLyutvje+eigBR6F+2mr6HYD1mLmb523RvkdDwowImaTAe1R55hsPIpJd/XLbqJ3G
 VP3MGxBX7LzUoQyDq7zurBVdjGBMa6r7g7BVNno0drcmJJ6Q7QsTpGRNjl02n
X-Received: by 2002:adf:f688:0:b0:215:6e4d:4103 with SMTP id
 v8-20020adff688000000b002156e4d4103mr35229702wrp.372.1654847970799; 
 Fri, 10 Jun 2022 00:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyuYMC98iTOvRIvNXbzXMt4tNh2QNDem+DeyWJH07pl7YgNcc4vyIjdXPEjgoA6lH0F+1RDQ==
X-Received: by 2002:adf:f688:0:b0:215:6e4d:4103 with SMTP id
 v8-20020adff688000000b002156e4d4103mr35229679wrp.372.1654847970567; 
 Fri, 10 Jun 2022 00:59:30 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0020e5b4ebaecsm26786458wrs.4.2022.06.10.00.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:30 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 49/54] tests/acpi: virt: allow VIOT acpi table changes
Message-ID: <20220610075631.367501-50-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-5-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8367ffe1d4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/VIOT",
-- 
MST


