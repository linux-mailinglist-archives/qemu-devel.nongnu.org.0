Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9C6A3461
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:08:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAi-0002Nu-7I; Sun, 26 Feb 2023 17:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Bdj7YwgKCso82489qvqw44w1u.s426u2A-tuBu1343w3A.47w@flex--smostafa.bounces.google.com>)
 id 1pWPAf-0002Nc-8X
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:05 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Bdj7YwgKCso82489qvqw44w1u.s426u2A-tuBu1343w3A.47w@flex--smostafa.bounces.google.com>)
 id 1pWPAd-0003tX-AO
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:05 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so2084658wms.9
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F2/xDX6CzykR5IICwGnIbnY5+mn9dO/N2CJD5gFk5AM=;
 b=Fzluh2XWLotWGcxlRZicSo/gmM3DE+YJ+tYEH4kCZaNZKJjYcS+XlCQojOJ2GItBZ0
 fMGwihOqTNF6xUbipEYLjYGF9AHWkPtFuGyqTksbqJB9YsRmEfEQRwfxlIApoSsPUPzy
 9N80QxZcFlCdMvY5jkxBGh96HrimIowuMiYIQD39FFbTcCpwMBChq140M6maRLifxSJx
 cBh754Y07WsTSbwi+PmbpdmPw3YT6SFArvx6Ax4Iw/dTOjZBc7sbRFAiN2BHQ5exoYTa
 K9vmZ2tTIt1lFqwGnFsj6tH/Z+r2H4A8LkVzHoTsvaZTwQVJI6dQHGDxkQ9EAynagkid
 444g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2/xDX6CzykR5IICwGnIbnY5+mn9dO/N2CJD5gFk5AM=;
 b=t/HhaKxGS5pdc3QXLyEu9WcBh7BsjOWin9Y4er8C4Z2c91xJvLetvNDmK31FRgdov0
 qNghSRO5u04g+0u9P694k/S33eQHQZAV6G99QkqpndU6JAmekIJJgLdgPufb8swk3nRe
 i8ahEo2acc2qTz7ahIdZ3scLK2ngtVMZYbNF975Zl23+ZC60Fu/TwgXex61c+ex1qYSx
 OuUz3K5i4onHNKBwFWgxrGuDtNzIHaBYhpixK1dzHHJpQsFszTOCh0TflV7gooejynwW
 RrQRrKsLkYQ4cElhcxogqq9d0ZhPQfCrwGuxwI1F7655u825VTVmNFampg7MJVnICVjw
 WkLw==
X-Gm-Message-State: AO0yUKU5ooFHJgHg3S7vmZaMZPJWsQ6qmxiCPpjxMQaYihkiPQdpA8Za
 3PTvu7kJPDK9zdXjbRGDykNjAbpj++6tUTzCWwM3+B1mFJeynRF1fUHjJAPlmnSDUtFr0yikd28
 8ycO5tMt16vyP6J42033mJkxUxPJNisoNFynad7Fg1pDk6NlM1k+QyBabSdY40htGqQ==
X-Google-Smtp-Source: AK7set85dUaYtSi5LIoOsHCj/6u7d4ISC6KAZ7050SM9TPjBwBbOdc9RDPeMNhHc06SgXH4vFhj0w/hCIEEkHw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:4dcf:0:b0:2ca:5314:a1cc with SMTP id
 f15-20020a5d4dcf000000b002ca5314a1ccmr390634wru.1.1677449221093; Sun, 26 Feb
 2023 14:07:01 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:39 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-1-smostafa@google.com>
Subject: [RFC PATCH v2 00/11] Add stage-2 translation for SMMUv3
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3Bdj7YwgKCso82489qvqw44w1u.s426u2A-tuBu1343w3A.47w@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This patch series adds stage-2 translation support for SMMUv3. It is
controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
- When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and sup=
ported (default
behaviour)
- When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and sup=
ported.
- Value =E2=80=9Call=E2=80=9D is reserved for nesting support. However it i=
s not
implemented in this patch series (more about this in the end)

Features implemented in stage-2 are mostly synonymous with stage-1
- VMID16.
- Only AArch64 translation tables are supported.
- Stall is not supported.
- HTTU is not supported, SW is expected to maintain the Access flag.

To make it easy to support nesting, a new structure(SMMUS2Cfg) is
embedded within SMMUTransCfg, to hold stage-2 configuration.

TLBs were updated to support VMID, where when stage-2 is used ASID are
set to -1 and ignored and when stage-1 is used VMID is set to -1 and
ignored.
As only one stage is supported at a time at the moment, TLB will
represent IPA=3D>PA translation with proper attributes(granularity and
t0sz) parsed from STEs for stage-2, and will represent VA=3D>PA
translation with proper attributes parsed from the CDs for stage-1.

New commands where added that are used with stage-2
- CMD_TLBI_S12_VMALL: Invalidate all translations for a VMID.
- CMD_TLBI_S2_IPA: Invalidate stage-2 by VMID and IPA

These patches update OAS, as it used to be hardcoded to 44 bits, and
according to user manual =E2=80=9D6.3.6 SMMU_IDR5=E2=80=9D, OAS must match =
the
system physical address size, so OAS is updated to be read from CPU
PARANGE.

This patch series can be used to run Linux pKVM SMMUv3 patches (currently o=
n the list)
which controls stage-2 (from EL2) while providing a paravirtualized
interface the host(EL1)
https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linar=
o.org/

Looking forward, nesting is the next feature to go for, here are some
thoughts about this:

- TLB would require big changes for this, we can go either for a combined
implementation or per stage one. This would affect returns from PTW and
invalidation commands.

- Stage-1 data structures should be translated by stage-2 if enabled (as
context descriptors and ttb0/ttb1)

- Translated addresses from stage-1 should be translated by stage-2 if
enabled.

- Record faults should be separated between stage-1 (CD_R) and stage-2
(S2R).

- Some existing commands(as CMD_TLBI_S2_IPA, CMD_TLBI_NH_ASID =E2=80=A6) wo=
uld be
modified and some of those would be based on the design of the TLBs.

- Currently, VMID is ignored when stage-1 is used as it can=E2=80=99t be us=
ed with
stage-2. However when nesting is advertised VMID shouldn=E2=80=99t be ignor=
ed
even if stage-2 is bypassed.

Changes in v2:
-Collected Reviewed-by tags
-Add oas to SMMUS2Cfg, and use it in PTW
-Add stage member to to SMMUPTWEventInfo to differentiate stage-1 and
 stage-2 PTW faults
-Move stage-2 knob to the last patch
-Add all STE parsing in one patch
-Pares and use S2PS and S2ENDI
-Split S2AFF patch over PTW and STE patches.
-Fix TLB aliasing issue
-Renaming and refactoring and rewording commits.
-Populate OAS based on PARANGE
-Add checks for stage-1 only commands
-Update trace events to hold translation stage, vmid when possible
-Remove feature flags for supported stages as they were redundant with IDR0


Mostafa Saleh (11):
  hw/arm/smmuv3: Add missing fields for IDR0
  hw/arm/smmuv3: Update translation config to hold stage-2
  hw/arm/smmuv3: Refactor stage-1 PTW
  hw/arm/smmuv3: Add page table walk for stage-2
  hw/arm/smmuv3: Parse STE config for stage-2
  hw/arm/smmuv3: Make TLB lookup work for stage-2
  hw/arm/smmuv3: Add VMID to tlb tagging
  hw/arm/smmuv3: Add CMDs related to stage-2
  hw/arm/smmuv3: Add stage-2 support in iova notifier
  hw/arm/smmuv3: Populate OAS based on CPU PARANGE
  hw/arm/smmuv3: Add knob to choose translation stage and enable stage-2

 hw/arm/smmu-common.c         | 212 ++++++++++++++++++---
 hw/arm/smmu-internal.h       |  41 ++++
 hw/arm/smmuv3-internal.h     |  21 +--
 hw/arm/smmuv3.c              | 352 ++++++++++++++++++++++++++++++-----
 hw/arm/trace-events          |  14 +-
 include/hw/arm/smmu-common.h |  32 +++-
 include/hw/arm/smmuv3.h      |   4 +
 7 files changed, 577 insertions(+), 99 deletions(-)

--=20
2.39.2.637.g21b0678d19-goog


