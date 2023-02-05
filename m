Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCA68AF13
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObZi-0003TB-Lm; Sun, 05 Feb 2023 04:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3fXrfYwgKChYE8AEFw1w2AA270.yA8C08G-z0H079A929G.AD2@flex--smostafa.bounces.google.com>)
 id 1pObZg-0003Sa-Ls
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:40 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3fXrfYwgKChYE8AEFw1w2AA270.yA8C08G-z0H079A929G.AD2@flex--smostafa.bounces.google.com>)
 id 1pObZZ-00016K-BX
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:40 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso5014924wmb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KfMorMYSGc4JfQxXzXwgbIQQHxTNHS7ayWS+e3rDB5g=;
 b=TC91rSsMQpvDRVvDNpaNkJcKuqAeZemOLmA4Evy9DhTCCaHG0gz1124jd09ViJx7WT
 2UFUmpjhz4QuVUa/MlHxOBy68o7dTK3RTTIhOzoBHJDfWn0idBM5CxoUwnsYmfL9RRRy
 ueF3KcI9NcOqip8MgAwjWuph6nsgCBrNipkAaUhB9PMkl1q+RdgSwyaCioaS7aJPymNi
 3ncr/ywmmIa6uMDmRkrzJuM7vBoVPdb5vJFYJs7oa1MI8bhYlTFmWTQP0ZwPzJSOQVV0
 /vzZWB+4dIx2j9OZTUxJi273WWMt+Y1xJZZJXvGipPzwKXNeOBeSk3zP5EnVAkY/YpzA
 iIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfMorMYSGc4JfQxXzXwgbIQQHxTNHS7ayWS+e3rDB5g=;
 b=jvwTJeDrvX5l+y65IkBshVGy8kISOUF+KcFfSd8M32angNezQB0X+pTWIUZ00uCU3y
 qI+Zuh2wviBsBRTWrm++JaPUmTgvA0EKtp93zxSOjTNng76MYx6Lw4Qfv1s69VMOg2pj
 Gc+NYXXmBZcujMlhzajL8aEYmkbLzS9CkNKLPN+bvpBqj49LJafWuuEALijnc3h1eNg6
 Flos0bx9PklVj0NaGJ+fEPSzTH2Z3k51KXcl8EySpH8hGMKVQ7Z5VmE783Gk4eSmlRIN
 rCwNO40XxSk8k1rQExQpoUpnaVoyQIZxsof2CnrKFjVLZKYwnrlOusBTZwZCY7JuDDbJ
 s4bw==
X-Gm-Message-State: AO0yUKVQZyf3OX11C6gva4ylS3R2Yz/h6A+TzqrAu7MqHzBNZXF/2JeS
 BmPDqgwvCDZoFIdB5rT5UwbLy8BzMTEzcfDMhz8YpFch+aFx5QYhc4WRncXYtQjaOCxpkLKijPP
 /KGoShBb7VR66zbDBsTr9otZQADpf2stg5mH+HpazMPd6mK4D5j5wV8xsZJsi0LbLXQ==
X-Google-Smtp-Source: AK7set9f5xBFuDTWhnrwQneccAwlJj98B76OKkZ6uX0VSbbjgP5Rt71mvkouUjRLezih6AnR1Oj7Nv4x8q3CUw==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4e45:b0:3dc:4480:b6ab with SMTP
 id e5-20020a05600c4e4500b003dc4480b6abmr687681wmq.120.1675590269410; Sun, 05
 Feb 2023 01:44:29 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-1-smostafa@google.com>
Subject: [RFC PATCH 00/16] Add stage-2 translation for SMMUv3
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3fXrfYwgKChYE8AEFw1w2AA270.yA8C08G-z0H079A929G.AD2@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
behavior)
- When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and sup=
ported.
- Value =E2=80=9Call=E2=80=9D is reserved for nesting support. However it i=
s not
implemented in this patch series (more about this in the end)

Features implemented in stage-2 are mostly synonymous with stage-1
- VMID16.
- Only AArch64 translation tables are supported.
- 48 bits of IPA.
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

SMMUv3State.features has 2 new flags (SMMU_FEATURE_STAGE1 and
SMMU_FEATURE_STAGE2): to indicate stage-1 and stage-2 support in HW.

This patch series + GBPA patch
https://lore.kernel.org/qemu-devel/20230126141120.448641-1-smostafa@google.=
com/
Can be used to run Linux pKVM SMMUv3 patches (currently on the list)
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

Mostafa Saleh (16):
  hw/arm/smmuv3: Add missing fields for IDR0
  hw/arm/smmuv3: Update translation config to hold stage-2
  hw/arm/smmuv3: Rename smmu_ptw_64
  hw/arm/smmuv3: Add a system property to choose translation stage
  hw/arm/smmuv3: Add page table walk for stage-2
  hw/arm/smmuv3: Parse STE config for stage-2
  hw/arm/smmuv3: Check validity of stage-2 page table
  hw/arm/smmuv3: Support S2AFFD
  hw/arm/smmuv3: Don't touch CD if stage-1 is not supported.
  hw/arm/smmuv3: Make TLB lookup work for stage-2
  hw/arm/smmuv3: Read VMID from STE
  hw/arm/smmuv3: Add VMID to tlb tagging
  hw/arm/smmuv3: Add CMDs related to stage 2
  hw/arm/smmuv3: Add stage-2 support in iova notifier
  hw/arm/smmuv3: Add fault configuration for stage-2
  hw/arm/smmuv3: Enable stage-2 support

 hw/arm/smmu-common.c         | 168 +++++++++++++++++++++---
 hw/arm/smmu-internal.h       |  41 ++++++
 hw/arm/smmuv3-internal.h     |  10 ++
 hw/arm/smmuv3.c              | 247 ++++++++++++++++++++++++++++++-----
 hw/arm/trace-events          |   4 +-
 include/hw/arm/smmu-common.h |  19 ++-
 include/hw/arm/smmuv3.h      |   1 +
 7 files changed, 433 insertions(+), 57 deletions(-)

--=20
2.39.1.519.gcb327c4b5f-goog


