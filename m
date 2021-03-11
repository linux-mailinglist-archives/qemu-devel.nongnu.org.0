Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE8338122
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:14:24 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUVa-0003Q4-J1
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTf-0001h5-DN
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTU-0004zW-UJ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LJW/mzHGQ1NGtCTMOxz9c/B6EOk6c5uZ3kaLug/0I0I=;
 b=Bh3nkSCaGu2FPnzR+eErwJeFCaKRw/aeWK8x3HRkIsSJ+awtmx/xyhM422/CpRB4lSCajE
 k9XgwklP1kDBfaK2kivCRH43hxU45tcTya7f6e5bC7/8PpjAcLL2+neh20s7b3AxFXadHL
 jxYb+qcsKl8i0jkjuyQUz8F6E3z6YD8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-V1hzM8ZPNF6YxmKxIdC19Q-1; Thu, 11 Mar 2021 18:12:07 -0500
X-MC-Unique: V1hzM8ZPNF6YxmKxIdC19Q-1
Received: by mail-wm1-f71.google.com with SMTP id z26so4651355wml.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zfR7RPcuNDHDQ2aIvmkGMVu3VLHkTVnh2kI0ZtOC34=;
 b=hrbpu9IXsL15OisD7qMkHcSbArPx8PRAgIEsEz5EM8BP4DHEu468hSRuzrfm518l5O
 Kc4mguV0wOEZiJ0e2lPacxZ6S/womZX0PAopMo5lFtK4xWj/xdTroZSAimaJbsjItmkq
 gCYX5D+A+x2YI911Uq5h0hTljQpjTfKRZZcpV+R8opRO6funmbxJIib9sYiqDMAHgbRF
 LHspHgieZdhWQkhXl+Seh0V9qdE+6LN7LnF4T3C9VP5GzxV6ounF9JzSvBEjdVaOamPb
 8hni0XClRWBaVFaYkiyP7MRqC5KC2HkPs3Ek20G06UutyKWE0qHfE2EM0KhOouzRodSC
 MQvw==
X-Gm-Message-State: AOAM530Wdt4mRW0HtR+1fDZzKjD/0DpDfe6Mn3uCnlc6MsTQK+fwVQC1
 lAt4nHG6hjHATX9p3lcljeEIp+LxzLYO/HHGHx7LgT9ku2LH6vwH4AbtcGLU6I9nOXuX0xPdITz
 TclEzUtXHU776zwfK1gxcEpUYFNbnC0pSVEIYvZtVk9aj1up4W7b6sm8TULXmkNR0
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr11015031wra.419.1615504325746; 
 Thu, 11 Mar 2021 15:12:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeIoNsvTgux076Hpo4thhl3nyOVbzR4DxO3eGy6Lb5WVNPIogfkMioFZGYGf5cNWA1sDaypg==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr11014997wra.419.1615504325317; 
 Thu, 11 Mar 2021 15:12:05 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z13sm5663674wrh.65.2021.03.11.15.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 0/6] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Fri, 12 Mar 2021 00:11:56 +0100
Message-Id: <20210311231202.1536040-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_probe_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test and arm-cpu-features on KVM-only builds.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_probe_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/arm-cpu-features: Check KVM availability at runtime=0D
  qtest/arm-cpu-features: Check TCG availability at runtime=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 55 ++++++++++++++++++++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  9 ++++++=0D
 accel/accel-qmp.c              | 47 +++++++++++++++++++++++++++++=0D
 tests/qtest/arm-cpu-features.c | 35 ++++++++++++++++++----=0D
 tests/qtest/bios-tables-test.c | 13 ++++----=0D
 tests/qtest/libqtest.c         | 24 +++++++++++++++=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 8 files changed, 173 insertions(+), 15 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


