Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90931F891
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:47:13 +0100 (CET)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Fc-0004Ib-Ch
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4D8-0002QT-0e
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4D5-0001sD-En
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FJeJWkuxPCPnotyt/2IiMsA+rSkp6BRFBHnf/bs7Www=;
 b=T6ux9IywQmtoK/SuDTnbCXyheD8GTrbqexKHMdMCt3qt7MZRImcaJyRV2xnpJFEhhd2Hnr
 QGn+Td8sl0hyWdoi0FBCI9z7eyfuiXz7EHmre6ZeyJPFfg2c7inX4+xyPq7UuXBIo/wm2s
 fAu4hkK0cA6JSwZb7VSpi4o4EtUBOnk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-RD1lyqE2P4iiHK-_L3LvzQ-1; Fri, 19 Feb 2021 06:44:33 -0500
X-MC-Unique: RD1lyqE2P4iiHK-_L3LvzQ-1
Received: by mail-wr1-f71.google.com with SMTP id v1so2350508wru.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBiPAh6j0La2jswV89eyq5qlhizmmpayYHhAIblEKKQ=;
 b=LqHLfqjHdXGYe5TydI1lcXrVAhmaoQEPxwzNPYVn60x+3IMB5DfazSUiy3M6xbHuv6
 9/PzkIsTSktpyJIfb3N/bQJXtxcjbdB+TmpohJhHswsg2L1JhsS862u3xGItXmVUG+C6
 wwZ1iXScGEKMxI4vXESZ43Yjh8XKHgdOayLl1819OzjvgHcuBVPjAhl1Q7pMIYX5O68L
 KCOBhsQzi9VVE8yZV7jruoEGVjOIrHmjAuUUhrqsW3SvRdRw1819YYajWVUGA5aerGkl
 eGUMi3L2F08hoAh6dwQY2lgpJgi9Z/sDGgLqv4vvvjc4G6EWk94yakFZDa7YL0CEhxgY
 i2nQ==
X-Gm-Message-State: AOAM531f4WG9PUcE/h/Rtys+ogxsGmPjFTTFAZMTwhlNXDvr/C/GBo8M
 +r99mEO0w3Elx22Gjd8lB4JulqUkceuU1AdQnfHRXU6iYqm3tisJHvpVWshL/5/L4mQ9bNP4m/n
 fSpMWiyoSSbY6hFtPCfqhT9JcUVQiid38unAhppFtpdtcN+AHo0pzKDdx4QMC7dkh
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr7983472wmp.4.1613735071707; 
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCQmJUMzqBp58GRknzlFcK+50J5x/1xbRxspDX0PSKwBAjo2a1yxhfME/pP4E86Lbkjw1cYw==
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr7983425wmp.4.1613735071474; 
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l17sm1537098wmq.46.2021.02.19.03.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
Date: Fri, 19 Feb 2021 12:44:21 +0100
Message-Id: <20210219114428.1936109-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims to improve user experience by providing=0D
a better error message when the user tries to enable KVM=0D
on machines not supporting it.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  accel/kvm: Check MachineClass kvm_type() return value=0D
  hw/boards: Introduce 'kvm_supported' field to MachineClass=0D
  hw/arm: Set kvm_supported for KVM-compatible machines=0D
  hw/mips: Set kvm_supported for KVM-compatible machines=0D
  hw/ppc: Set kvm_supported for KVM-compatible machines=0D
  hw/s390x: Set kvm_supported to s390-ccw-virtio machines=0D
  accel/kvm: Exit gracefully when KVM is not supported=0D
=0D
 include/hw/boards.h        |  6 +++++-=0D
 accel/kvm/kvm-all.c        | 12 ++++++++++++=0D
 hw/arm/sbsa-ref.c          |  1 +=0D
 hw/arm/virt.c              |  1 +=0D
 hw/arm/xlnx-versal-virt.c  |  1 +=0D
 hw/mips/loongson3_virt.c   |  1 +=0D
 hw/mips/malta.c            |  1 +=0D
 hw/ppc/e500plat.c          |  1 +=0D
 hw/ppc/mac_newworld.c      |  1 +=0D
 hw/ppc/mac_oldworld.c      |  1 +=0D
 hw/ppc/mpc8544ds.c         |  1 +=0D
 hw/ppc/ppc440_bamboo.c     |  1 +=0D
 hw/ppc/prep.c              |  1 +=0D
 hw/ppc/sam460ex.c          |  1 +=0D
 hw/ppc/spapr.c             |  1 +=0D
 hw/s390x/s390-virtio-ccw.c |  1 +=0D
 16 files changed, 31 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


