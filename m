Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3554C1599
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:41:46 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsps-00009v-V5
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:41:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiG-0000wa-TL
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:33:52 -0500
Received: from [2607:f8b0:4864:20::535] (port=33665
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiE-0005Z5-Ts
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:33:52 -0500
Received: by mail-pg1-x535.google.com with SMTP id 12so16536251pgd.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rqr4YQfrJMuCFf1eEYLj+krvL5/ClRk4R2U3ZClMFQ=;
 b=KnI9W/wdjzO47IbKOmwg3Nk7mr2+TEesurhiv5NhiORSW0N8Hsannx5SC/rcqnueTd
 kDJ+YAfqcg84xSP0Lb0qeCvl+oR3eGmjiH6CIfr67yiz4twAqiyWM2CBEuJ8MogZi4W7
 dKqRbNKINaSUuwKWQSAKoRPdWyQsu/JtEY2iZ/oMPu6h56dvO8oEdhVFb6yfud0XbgsA
 pBffuuuwiUo6ngA49gro4tObnaH6GQCo1rLkOyooyKrCcSDxX9UBLNSp1n0/aI4O96r6
 ZjFp4CgVurdPWvEOlyfHNFf1Zw1BHPisWA7htdDGLw4VVsmJlUstkNYQVPAzMnXmgMoG
 Cr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rqr4YQfrJMuCFf1eEYLj+krvL5/ClRk4R2U3ZClMFQ=;
 b=xDpOkqvWEQeRf/3SYI8rr35X1V30B1eFJlj57v8UHd2ltgPyo+6XD4Yy/ZRJlY6mdG
 tyzlXs3173GTyVWFnf4iI8yu5LENCSVIn6bUIwl6hYAQqkZQCFT6xQ4VLc6hIMlK4FlO
 G1P33b7BD/IE6rkytaAvrxT1eECiX3/NVTQaXs4X49NUFj9J9iGKITX5CtniVUX9tTJw
 tOK8f4q0lRfWFSEznDEKSOsU8mmTBCCaxb0EQkByuyetAlok8AWWtW+YwmTkA/RajFFV
 qUv/9HMMHwtkS3MIjaLI7/CW6BmfSUUy/qUnxf1oZF0UZkPW2wAR2pe5W/hBPwjYFjTu
 iJHg==
X-Gm-Message-State: AOAM530raxAaOAfQwgJP18daOmSWnOac6vrxdyDfWb2vduE+IN6t4ipR
 8vDm9t2Yh4oHLc21vWEEcM06z7FIEpREDw==
X-Google-Smtp-Source: ABdhPJwFEorVTet6YF9qQFSwPNS8kd+pITATOdzJd0/mXPyBDboEiMao4rUeqeb4xcKu25apbXdcpg==
X-Received: by 2002:a05:6a00:1822:b0:4df:56b7:afc7 with SMTP id
 y34-20020a056a00182200b004df56b7afc7mr30385396pfa.58.1645626828240; 
 Wed, 23 Feb 2022 06:33:48 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:33:47 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH 0/7] Queued patches for the next pull request
Date: Wed, 23 Feb 2022 20:03:15 +0530
Message-Id: <20220223143322.927136-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael :

Here are the queued patches I have for your next PR.

thanks
ani

Ani Sinha (6):
  MAINTAINERS: no need to add my name explicitly as a reviewer for VIOT
    tables
  docs/acpi/erst: add device id for ACPI ERST device in pci-ids.txt
  hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
  hw/smbios: code cleanup - use macro definitions for table header
    handles
  hw/smbios: fix overlapping table handle numbers with large memory vms
  hw/smbios: add assertion to ensure handles of tables 19 and 32 do not
    collide

Eric DeVolder (1):
  ACPI ERST: specification for ERST support

 MAINTAINERS              |   1 -
 docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst     |   1 +
 docs/specs/pci-ids.txt   |   1 +
 hw/acpi/erst.c           |   5 -
 hw/smbios/smbios.c       |  61 +++++++++---
 6 files changed, 248 insertions(+), 21 deletions(-)
 create mode 100644 docs/specs/acpi_erst.rst

-- 
2.25.1


