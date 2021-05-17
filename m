Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA9383BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:52:03 +0200 (CEST)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihPM-0000tI-Du
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNN-0006ou-Eq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNK-0002to-LM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fK2upAWAX+daeoVn4JkWRhts2G1fEpxL7EWeI+oc9is=;
 b=JoNcoC/ZtrQTDaNrqFNQIKgj+bXwjSlQ7pls5bu8TfQKycdR9jmLC4yhVyRYORI2UjH/kA
 vlevpq+bFMdZESVO2Q03iSHtV/M+hqSCykNgZwLflbyeeN/VXMaWqH7jIiV7aInIzTpKGe
 CGjFBqqj97I2RtmoLPume4KJhZxs2ak=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-Jn9mwtbFPhK_cu-Gng-4NQ-1; Mon, 17 May 2021 13:49:51 -0400
X-MC-Unique: Jn9mwtbFPhK_cu-Gng-4NQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so3579026edv.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=exY8bVMLJeeG0OGPmDEddgaqB49yAueIrebLaQjJ+wk=;
 b=QU0oy4d8ARjMW62AmPTpfUd79Viz8x53Dpr59QwQq/mt/byhMUOXjikPNmPreEhrhV
 Hadyq8vyKItR7tmSVpBsueD726McqDjttq2CBVb61rXi9kbUlMGPLvXp4f3VYl1lLlDq
 /be9eLpdo+q5sr2ccjz+Sdd4tGUzTXBqYrDWAuo5uj/y3TQwhMb+Snf6fZ3l1GShREgG
 xoQTLgXfIF138jBFYb4QYSSPWXKlhdeXzJHGRpBeorqFu6J9V/rRf2cRfhzIz/iXQA4p
 9nAnDhYScH+MeZ+B5wYf7jeJDomWUp/Nay3ck0/QMAVPGNdUJhMsb4OM88FwLQmIrXir
 Zfxg==
X-Gm-Message-State: AOAM532EqRbhfxetcBReBjYhA73WIwbqvIJVmezERZW90w6BkYFpj0TY
 6GPzuH74OP2dSExVXBk1p72rdbFQaHiUuNoLbzNIpkU/SBddxRu9Cw+Uyd46X9PYeunOzlBuPLG
 fbZiued7CtOUxhCRiZwVFKvSOKmvkeVz3v1YmJQ0wOCc6/3+Q/242LhB9FVrZuv+A
X-Received: by 2002:aa7:cc97:: with SMTP id p23mr1464047edt.372.1621273789846; 
 Mon, 17 May 2021 10:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQXNmjFsF0YKBMPxz5RuL+DgpMuuEOX9VJKhpRgOE8Kww4tr/K1W7J+P1G9ECsl/Z121NRaw==
X-Received: by 2002:aa7:cc97:: with SMTP id p23mr1464013edt.372.1621273789502; 
 Mon, 17 May 2021 10:49:49 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o2sm6549606ejg.48.2021.05.17.10.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:49:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 0/8] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Mon, 17 May 2021 19:49:39 +0200
Message-Id: <20210517174947.1199649-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
=0D
Hi,=0D
=0D
The floppy disc controllers pulls in irrelevant devices (sysbus in=0D
an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).=0D
=0D
This series clean that by extracting each device in its own file,=0D
adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.=0D
=0D
Since v2:=0D
- rebased=0D
=0D
Since v1:=0D
- added missing "hw/block/block.h" header (jsnow)=0D
- inlined hardware specific calls (Mark)=0D
- added R-b/A-b tags=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
  hw/block/fdc: Add sysbus_fdc_init_drives() method=0D
  hw/sparc/sun4m: Inline sun4m_fdctrl_init()=0D
  hw/block/fdc-sysbus: Add 'dma-channel' property=0D
  hw/mips/jazz: Inline fdctrl_init_sysbus()=0D
=0D
 hw/block/fdc-internal.h | 156 +++++++++++=0D
 include/hw/block/fdc.h  |   7 +-=0D
 hw/block/fdc-isa.c      | 313 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 224 +++++++++++++++=0D
 hw/block/fdc.c          | 608 +---------------------------------------=0D
 hw/mips/jazz.c          |  16 ++=0D
 hw/sparc/sun4m.c        |  16 ++=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |   8 +=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   6 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 16 files changed, 758 insertions(+), 612 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


