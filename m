Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC961545F17
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:31:24 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nza39-0001g7-B8
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWs-0007ou-29
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWq-0006Gz-Id
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UGM7Pha2fbz/FtClJTsCx1egAuOz3u50vfg5WpAXg6U=;
 b=NWJZAizVKFvZcuSrHlyYJFi7KOL6P5upBzNxWwfanaqapy4ABquWe7nQcJuVJrXIzD3Kqk
 DLZwI5CJNBslHX9WVjL6svsqrueIoQbRh0w6yWc7prF22O8CNg3IEYSMBeLQzZzhbymdP+
 pzHjfiXacGqZP7IcN2QPEzTcbw4IsvQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-bBfJ6sDqNDaTkKAX4oMvxg-1; Fri, 10 Jun 2022 03:57:59 -0400
X-MC-Unique: bBfJ6sDqNDaTkKAX4oMvxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so977589wmj.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UGM7Pha2fbz/FtClJTsCx1egAuOz3u50vfg5WpAXg6U=;
 b=hVjBj46BAf0zPCD/BBhQek7gU21jNVioOSeK8BvxDIUtchGH/S+OTmCFLq5V2TFucz
 hkm8S+5F85Cqvi5ist6K3yBTXXp4O/D99enkL7MESNer5ejO5pGyvJOUdq0rYOOfud1D
 HVsCo4PdUsSw/xJB6bH91wRJyw6Oz4WS2gzY/SroWFGq/UOnZ+4XiiNLOQtlRJH570YM
 DrollbmVAVpJXDgl/h3eatvGO0rm/TIf5tCnOp5aqE+jfIMwPsLYkVy1DktK3iTNhcPE
 dMBaB345Jh/b+Nz/ZokxEryuYV5pF2xwlmrXtTEza3KrOTLzuRW/axo2ONchPl6CCppN
 oeuw==
X-Gm-Message-State: AOAM531+NHes62eVfp5/D8GeSV5h2mEOMkjZVWxDxKCb8RET0QKpbk6D
 vYPfyFjJIOsJQClYhkm55gKIdSBlDiUn6Hkhj7iF4QILVMdOOM38pT+a90u/1+qs3VRLQgqReSE
 CYzsl6ClNLhcD0XPusxErqcv8xcl9P5Zad53Q78V4mOmCrVtoe3z4Z0RqgdPB
X-Received: by 2002:a1c:19c3:0:b0:39c:6479:3ca with SMTP id
 186-20020a1c19c3000000b0039c647903camr7518056wmz.27.1654847877530; 
 Fri, 10 Jun 2022 00:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsavnxbZBvIHIa05XU2d9nWIn1zTHGqa/+mtEhkJwS7XwHXVvbptZ9RsAyU7ji8ZYjpSmk1A==
X-Received: by 2002:a1c:19c3:0:b0:39c:6479:3ca with SMTP id
 186-20020a1c19c3000000b0039c647903camr7518035wmz.27.1654847877298; 
 Fri, 10 Jun 2022 00:57:57 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b0039c41686421sm2048491wmb.17.2022.06.10.00.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:56 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 18/54] tests: acpi: white-list to be re-factored pc/q35 DSDT
Message-ID: <20220610075631.367501-19-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220609114855.3477822-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..666e257bf9 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,33 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.cxl",
-- 
MST


