Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8434B6FD0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:33:00 +0100 (CET)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzp5-0005Ol-GQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJzo9-0004it-DT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:32:01 -0500
Received: from [2607:f8b0:4864:20::102e] (port=40722
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJzo6-0001Tr-U0
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:32:00 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so3199733pjv.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 07:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p7SqXYMTajVkBABRyBqfUV05cAfvK6uBYaLQJ2ar4i4=;
 b=kC/XY1Bq9lT5REa+9XQM6pChEv8ncfdWgeG8gsWMXfzMGAvOul78WHeFfOFuhtyiN9
 QFea/xEz4WTRz3nkLrz+5y91jG1Qj1rW9b+tmJjdPL0yC6zPl3rkLO72lPNUf1sFepfm
 eso/5odAqJFe439/+HTydkBzszZez3TH1GwQVvIyHTMxSFmhj5jaf2VnKJItRbl83pBK
 +wuWNWIAk/TxG8+uvHYV4ROlN9qlr0v9a7voHeFMLND60fpbKICq34P1kHhsf2WR3Ibl
 YflYOMnZP1St4zRJ5D57mUBse5geSLL1KjGruhJbi7LuUSwCwMny2O26X61laL4kVNDh
 WbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p7SqXYMTajVkBABRyBqfUV05cAfvK6uBYaLQJ2ar4i4=;
 b=F7ZzjDLRH5igWAXZCajDOZxH+uPTpGmhE6SRIESzWcSmIOjJgMUrz+IAyaQerdOXg2
 fvZ9solC92VIrDikjtVo3uETNDApZxxH13qzhR362PdTXudnhcaTJpOqImhy4SQWRVDH
 jK6/bfcxGsml0dtkVbz+q3ybHiC/XoQLVG6Lv3g/TT6iGqLahie8MF6XAh7QSxpwjnBq
 ZOn03SKapDrvWIf93WpTaVmwEmDnc8brwvuUJcI7m6tRrVwZanVjvL4sk+YbPgheSOjA
 Ypd3KaOVdGl19awBu2LuAHFUPB4ZrKL1AcH8P1kxu573i6vurmtnW5aHYtxR6COHavff
 EOlQ==
X-Gm-Message-State: AOAM533powgaPEo4KItqCO5cdX5tDD5FlBC8NI7SOMGtGtM8XtbjsXVJ
 7G6KHBUtfWKgQCihTF5Jt6XGnFW73CBbFQ==
X-Google-Smtp-Source: ABdhPJz+WBm6X3zUOwKarPXGqi3czuMi5ZYGFgrYCT7W3zXv81hdf1zydLCS7guHmlUgFBGivlIAvw==
X-Received: by 2002:a17:902:a9c1:: with SMTP id
 b1mr4689386plr.45.1644939116871; 
 Tue, 15 Feb 2022 07:31:56 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.141.137])
 by smtp.googlemail.com with ESMTPSA id na15sm3234710pjb.17.2022.02.15.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:31:56 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
Date: Tue, 15 Feb 2022 21:01:40 +0530
Message-Id: <20220215153140.128528-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
as a part of the ERST implementation seems to be unused. Remove it.

CC: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
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
2.25.1


