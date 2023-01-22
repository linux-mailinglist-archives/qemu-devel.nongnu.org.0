Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5816770F2
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdop-000233-0M; Sun, 22 Jan 2023 12:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdon-00022f-5H
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:45 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdol-0005TS-MZ
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:44 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx13so25024749ejb.13
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3CAnXsRy85VRCNv93i2BxaVFHv6PHWDf4w66A2vf0g0=;
 b=Erc5Z7/N9EfVF72u6anFTc+uedXk03BGJmEV4VrLV5OiolUJU9tgw8PY/I8skYek5w
 sk5P6fMS1vxW7eN2lE/dtyU6CDzz6lJNZfFjZl+IWo64wlF8i27+ACyAMs/TpStFCt6C
 S76HRZKR3eXCBSqAvMKKItdvSzgrh0eSbrQ2Z/68HNtWKSSw0QX4OEwQS4y+VfmSCOJq
 vI3HpEcxtj49dmSP7LaRtVqXkM7+qZ47O2eYDozO+F7mm6vj10nmnNaQlULs4d0DKm2Y
 QTmzmbCZ8w8B5ya/mL4ZuEUxlUKSsSEpPXZLF18ds/YhcrySqj4tALOQfW+AM/tXz6kY
 ZXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3CAnXsRy85VRCNv93i2BxaVFHv6PHWDf4w66A2vf0g0=;
 b=U6YREH9Xt7Vps/Vb25grmJeay8wWA61WLWAM1/wcqVcE1I54v4iQDBPZOwpRlLDGbS
 HrvvQ5ystQoR2VmuB9wPyyCqaUf3549YZDMj73M8Eqe/SqR+oY9DOC+t3eRUi2azzwBk
 g3SwlZzHmtDrtyLMWgUi47Wl+gnp8k+Fqrawg1ADPEf8FyHFasFcekE/+EorReEaKhU/
 YIttf6kV7BO0DEVEe2tqtn5k3g/ny7/ai+alMo/mrwIgkvu6ZLtfQvfX7HqwJi3wWI6L
 fEdi4W9biDDm8JAbmmOumvFkeOMltT1Itca4fvQzrwz4Me76wpn193u0RmYPNi7nJ7xe
 5tsw==
X-Gm-Message-State: AFqh2kp0gFa8YljHVWktk7TlmTG9ONZ5nAGaf8tJ/Spt0WrhGHhgnOOz
 SwaQgAVaqUzyk8QZU+JRmt6YzbIwnHyEQg==
X-Google-Smtp-Source: AMrXdXsjQ2tmkp4wCOpJVZoieLecf4jKJfvY30BhZULIggjTHnmMVH52YfSW6OCtQWODNp9mOBBAIA==
X-Received: by 2002:a17:907:3f24:b0:86e:f629:6c9b with SMTP id
 hq36-20020a1709073f2400b0086ef6296c9bmr27247437ejc.42.1674407261391; 
 Sun, 22 Jan 2023 09:07:41 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/7] ACPI controller cleanup
Date: Sun, 22 Jan 2023 18:07:17 +0100
Message-Id: <20230122170724.21868-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This series brings the PIIX4 PM device closer to reality and resolves some=
=0D
redundant code along the way.=0D
=0D
Testing done:=0D
- `make check`=0D
- Starting a live CD under pc and q35 machines and check that the GPE acces=
ses=0D
  are traced=0D
=0D
Bernhard Beschow (7):=0D
  hw/acpi/{ich9,piix4}: Reuse existing attributes for QOM properties=0D
  hw/acpi/ich9: Remove unneeded assignments=0D
  hw/acpi/{ich9,piix4}: Resolve redundant io_base address attributes=0D
  hw/acpi/ich9: Use ICH9_PMIO_GPE0_STS just once=0D
  hw/acpi/piix4: Fix offset of GPE0 registers=0D
  hw/acpi: Trace GPE access in all device models, not just PIIX4=0D
  hw/acpi/core: Trace enable and status registers of GPE separately=0D
=0D
 include/hw/acpi/ich9.h  |  1 -=0D
 include/hw/acpi/piix4.h |  3 +--=0D
 hw/acpi/core.c          |  9 +++++++++=0D
 hw/acpi/ich9.c          | 26 ++++++++++++--------------=0D
 hw/acpi/piix4.c         | 31 ++++++++++++++++---------------=0D
 hw/acpi/trace-events    | 10 ++++++----=0D
 6 files changed, 44 insertions(+), 36 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

