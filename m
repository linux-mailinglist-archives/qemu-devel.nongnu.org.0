Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00993A82FB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:34:39 +0200 (CEST)
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA9G-0001fJ-M9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wa-0004PC-TX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wW-00021j-D4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623766885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jMGxKRbuXncEcK+x6kO9beoNwnk/0iHqW2CgHBQWIDI=;
 b=JKgxwx77JN4GWm9nqjgu+sS69x4J/xB2R0Xl9fzC+LBToCyvlElPuwweiBb4x1Ph4JeLsa
 /v/gLmRE3R7HWm2kop5aLysfO0D7QAL9ABUtJXWkjD/xotMC6Kraaus8Ck5dWy6cUEUvSV
 jBwyW7WhN8PUq/u7yR7PF76MQP49ihM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-P3kS5riDPIGLAJaj4UMNOg-1; Tue, 15 Jun 2021 10:21:24 -0400
X-MC-Unique: P3kS5riDPIGLAJaj4UMNOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020a5d688a0000b0290119c2ce2499so8596673wru.19
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BdHo0F2MCVd00uojmQBMnSdLeISErbiTdTpPEkM1tvc=;
 b=KPvS3NKJZGUzgYj83mw8L0weuKyv8DKJwC8psWS3bfttag1HfphLQBYG3bk12G80q8
 /82fMyY/uexfJMFeyh18nVvEVUkyl8nvV+VrgwrNbU4pSF1+BPeQYlNtJIYKhiohbzlo
 uoBep3uwhxJo++VBvB4LxiM+rkOpzQ90e34HrYxwTChVbQUbUCIP26GzAhshCpz/epZc
 1um5QezljUgzqZV46a1Ht8Y1lqfSBT/aEgtABmPEz/BvYitxiAfqYdeovYbUf79qRDpH
 ImnvU8qOa12fV944qpMYFPi0aOdh1DvDMjKc99C798OaIlXWSUbsQjiZR9oPS0X0N3JM
 ibjg==
X-Gm-Message-State: AOAM533+tp1imddH1HWTAIP1U9dyS6b61ZjGyfamjIBJJxdVLu3RzL7Q
 o1XyqSJEox342cO/4qds2P4Aa/dHQc5B6zx+rzIIOt87RFh8EkSO8Dq82TYS0y1jsd2JPhbomtH
 sxMMQmCjZgk+z8bOHGHWLBzyQ/dBY1d2H3YP3XvcG+zDikA/11zJYrStvgx00Vr3e
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr5521725wmg.19.1623766883133; 
 Tue, 15 Jun 2021 07:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3f2QPiqU73XSKt8hKYGYcVhI+8mRz+BAOfNthH/69iNHFSlbKqqTL4s/sL+TW0sne8T/0yg==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr5521703wmg.19.1623766882878; 
 Tue, 15 Jun 2021 07:21:22 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o3sm23156765wrc.0.2021.06.15.07.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:21:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] tpm: Eliminate TPM related code if CONFIG_TPM is not
 set
Date: Tue, 15 Jun 2021 16:21:16 +0200
Message-Id: <20210615142121.2127692-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
=0D
v4:=0D
- invert HMP #ifdef (Markus)=0D
- update MAINTAINERS=0D
- add Markus R-b=0D
=0D
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
 MAINTAINERS                  |  1 -=0D
 stubs/meson.build            |  1 -=0D
 13 files changed, 75 insertions(+), 51 deletions(-)=0D
 delete mode 100644 stubs/tpm.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


