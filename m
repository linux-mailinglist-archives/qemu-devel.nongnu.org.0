Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE23A6FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:12:03 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsswE-0003fQ-Sj
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssu6-00014D-Ef
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssu3-0002pL-05
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3A9XQpUbpdyJ+8EY8vqWmSLu6gFPDNUkcoJ1JkTzveM=;
 b=HGbd6fu39KcQdSIu50Fi7AcPuIOcgtIh8BqMw8Xo26evY+HlGC7T77ePWnwc0taNUgcI/X
 dZPoVzwXUPmtY+fJo3yMpFySOu2Niuqhk4h01gN1uxsokzpqPJczMUwLWT+cMWEXvodwKu
 +RKwjN/iFUHwNWVor4nOjq1sZ7wgg18=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-6hez6ppvNiGgxWDW5xtLGQ-1; Mon, 14 Jun 2021 16:09:43 -0400
X-MC-Unique: 6hez6ppvNiGgxWDW5xtLGQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso7505010wrn.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbVl2zhzIPoNrOU/Bzhb3zaz1wZUkviYsQ5osFjyS50=;
 b=hb/IEpNRpGkKKKbYfbqTYYWjuAulU1P32LDiESsDfYq7BekhlWDAHW99np5EyEAtSF
 paeAVtbgBq5j7dYJnrktUjVU9c1PQeHgfXM0umjb2jgiWK6d9uUx7PFPMeJim0CJkdyk
 vaqL32yJqJ4dfqH2R0m/2LV+T/Ru5JrA+fr+oGCUcraWXYYHq6+gC50J7cumg8hXxTHF
 yIJHtkl+UE4zPwFhmFV4NiHQvtaT0Onmd1yM44G4+U9llHsJC5Btt1G3lTTVMriUBT1D
 eDJ8k3zWJMX22lvFUMtu0GeSIS0Zfas+N2Hxf+EvQ1zSzEK2nSdm8hteUBhzUV89VRbm
 hmsg==
X-Gm-Message-State: AOAM532blOo3j+lTwGalFVX7kiVZLesvNhlf+7Dfp16PIBpLeVhPPLjG
 pKVqKmCmwdLdThj5MF3fDBSWCaVSmYZvkYN096G+xTeWJDLrF9UEHmo5eeGuEYSUeo+EHx0tPqQ
 R9cFgJqYfC56PVbFFLlQJKHfe5xr5tl5VAtDCTbnOGYteECg8i9HLlsyizGKMvvf5
X-Received: by 2002:a1c:7418:: with SMTP id p24mr930911wmc.80.1623701382107;
 Mon, 14 Jun 2021 13:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxztvEWIzV4pOEtT0e47qxHJIn9gWpK7BkxHmBFn1+wEyP2FtXHd6SjdEHvDoJIqH78gBxFA==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr930882wmc.80.1623701381851;
 Mon, 14 Jun 2021 13:09:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm344802wmq.48.2021.06.14.13.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] tpm: Eliminate TPM related code if CONFIG_TPM is not
 set
Date: Mon, 14 Jun 2021 22:09:35 +0200
Message-Id: <20210614200940.2056770-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3=0D
- make the qapi schema conditional (Marc-Andr=C3=A9)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  tpm: Return QMP error when TPM is disabled in build=0D
=0D
Stefan Berger (4):=0D
  i386: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  arm: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  acpi: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  sysemu: Make TPM structures inaccessible if CONFIG_TPM is not defined=0D
=0D
 qapi/tpm.json                | 28 +++++++++++++++++---------=0D
 include/hw/acpi/tpm.h        |  4 ++++=0D
 include/sysemu/tpm.h         |  9 +++++++++=0D
 include/sysemu/tpm_backend.h |  6 +++++-=0D
 hw/acpi/aml-build.c          |  2 ++=0D
 hw/arm/sysbus-fdt.c          |  4 ++++=0D
 hw/arm/virt-acpi-build.c     |  6 ++++++=0D
 hw/arm/virt.c                |  2 ++=0D
 hw/i386/acpi-build.c         | 20 ++++++++++++++++++=0D
 monitor/hmp-cmds.c           |  4 ++++=0D
 stubs/tpm.c                  | 39 ------------------------------------=0D
 stubs/meson.build            |  1 -=0D
 12 files changed, 75 insertions(+), 50 deletions(-)=0D
 delete mode 100644 stubs/tpm.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


