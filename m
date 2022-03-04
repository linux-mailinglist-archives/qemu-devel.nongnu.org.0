Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796804CD7B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:27:58 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9qX-0008Em-2b
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9Wv-0004k6-JE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:41 -0500
Received: from [2607:f8b0:4864:20::102e] (port=37817
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9Wt-0003kL-0M
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso10824647pjj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5NYdaFf96oRp6hjkD9t2XSw3gtKLISKRGIOjtA0DPig=;
 b=CGSY5paJ3pBIlmsTHWBLjedRTPJvDnVmscR4+o+A5ImiyDrPXsWf2PS6ei9DnoAAQr
 38iZv1V43T7sSDOCMiHXqLypj8bcX8BroxvmM/B+1D2vXB0mqi7ww3OxfTsaWwHvHLgZ
 4rh+bOL/iYhK5R/vcqN6lg7Don1eZ1Ho/EKD7MDFkkURkMFI0zwx6iNq/WYbyOMiLUxT
 b8S0upbEWAcbmM5SJBEXPBzEsggP6VzM+IzxrEIknXCYCPAME9D52yLF0eGWe5QwVby+
 UWDkuWh/f6R/IenyOC+Zq0KjLAF4hTyyj2K/S0pvqHFq4HtkQ1NudAC3s437PaQ1trVK
 HbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5NYdaFf96oRp6hjkD9t2XSw3gtKLISKRGIOjtA0DPig=;
 b=wJkTUKjW6T1NCconVdl7egQjxU8XjhsN27ymlL3OKu7SrlY7e2OBHWcYb5mfpv0xN/
 m1BxzQ9I5vlvwavOA7pJ4nGsleFkXXjtdwRA5vFKnOIHewRo2YMaJ/n2W7PSnst6UoG1
 auFfR7cLTvUIiZE/0JArpM2joqAbE++7faFEzn/W2BIrbJZLcq1emz1K2ogfs2ADAFkz
 bizu1p24123DG/IdeKRmGJwYatQr79NdCkwkuwFdsexhowLNItIwcFetc3fv8eTfQELg
 aMra+ZJkF3qP4+MvWVWHDP15gbborwtgHUAdtEogbFHdCTsG2QOVAoiwuWeeCDql1EJk
 Wltg==
X-Gm-Message-State: AOAM5314QEP61GX5vdTImI/ghvbndxffmhNyWg588fbJ6P6rYLUTFPvz
 eeZkNlXq31CAshLXKu9zquQMVHBX20Tc+g==
X-Google-Smtp-Source: ABdhPJwrgmJduU7vxHGnfdla37zPxZvM1hOWENKbcSlCAl7iM1VgbdKTHmGK2IAp2f26pBbnqcRzew==
X-Received: by 2002:a17:90a:67c1:b0:1bc:f062:62e8 with SMTP id
 g1-20020a17090a67c100b001bcf06262e8mr10980736pjm.86.1646406456763; 
 Fri, 04 Mar 2022 07:07:36 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm8278861pjb.21.2022.03.04.07.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:07:36 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/4] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Fri,  4 Mar 2022 20:37:18 +0530
Message-Id: <20220304150722.2069132-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, liavalb@gmail.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

To allow "flexible" indication, I don't hardcode the bit at location 1
as on in the IA-PC boot flags, but try to search for i8042 on the ISA
bus to verify it exists in the system.

Why this is useful you might ask - this patch allows the guest OS to
probe and use the i8042 controller without decoding the ACPI AML blob
at all. For example, as a developer of the SerenityOS kernel, I might
want to allow people to not try to decode the ACPI AML namespace (for
now, we still don't support ACPI AML as it's a work in progress), but
still to not probe for the i8042 but just use it after looking in the
IA-PC boot flags in the ACPI FADT table.

Changelog:
v6:
addressed comments from v5. added microvm changes too as a part of this series.
v5:
Addressed review comments from v4. Also got rid of microvm changes. Will send
them in a separate patch.


Ani Sinha (1):
  hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if
    present

Liav Albani (3):
  tests/acpi: i386: allow FACP acpi table changes
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table
  tests/acpi: i386: update FACP table differences

 hw/acpi/aml-build.c            |   8 +++++++-
 hw/i386/acpi-build.c           |   8 ++++++++
 hw/i386/acpi-microvm.c         |   6 ++++++
 include/hw/acpi/acpi-defs.h    |   1 +
 include/hw/input/i8042.h       |  15 +++++++++++++++
 tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
 9 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.25.1


