Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF3388092
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:36:22 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5Vt-0003q4-EF
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5Se-000191-JJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5SQ-000741-9O
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621366364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NPUODHQD3BIOMe0gXH+//Fy1KZ8KABlm53SXMux3YIU=;
 b=I483h1W6EO20AeUNA0L4AeRXnhwUfHMwyHsfXDf3QtjqPP4vFtXbHGyac4iS12tzsn7QU5
 7Sk6gTN2DncG6fIUM4xT/Il5hsyLxfBe+1NaXp8wlWFMyzzmzRd2YtUzuIlZ+B5VQ5Vopk
 1qdcH309e4NwoTflPxJsPl5sArrfmKs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-5SDsUfycNFKURJ0us1douw-1; Tue, 18 May 2021 15:32:43 -0400
X-MC-Unique: 5SDsUfycNFKURJ0us1douw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m6-20020aa7c4860000b029038d4e973878so2149832edq.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=miWufss4ogxoVLiMTU6j4jqUrs999Wny5QHKRMPlhHs=;
 b=Ybu9pDd4hqvQX10ga5AjmeQ3pewTmGVrz2QBUzqABbMkGjomS+ad4bFhQv4LIDhuLX
 w3J7jdyL7mrMpHRuX/nJI0Qia1sR+OHW4+Zsr2Mnz6OetXHNqpRduhelol8PNNYXLrpu
 IYM41S1YuhYBaTm4xaFmj/dQfhD8NyvRsxIdxF0APsOgAfedFkIDTDSBwgSqQciC5/0m
 KH7FlxArIPJ0GULkZrE5eq8tPlSSlVKzN0CHXqnpVcfGDuOuqSGv0Tg8GyB0Akv2TsXQ
 0n/zr+4ObmR85GyDiyIWwc7FQwRSsmW859vhcWNfraiKfNhnkanRyMKIsQOTndqHsLN7
 g8VA==
X-Gm-Message-State: AOAM530LIfXOje+fqkDUuH/B+nvpghA4kR4FDVimndQs9nKEIhgfC7e9
 a8ohYAmvAyz7GXg+02q+znM7AXCde1QwUEBcIfk41bm9v0yUkIr3Ih9Nt7vKogMynRmT9/H3JwA
 cITvYlOdZvGzGPvfFSIv5vvcY4wO2TCQtTmMtB4CMsOW/y2H4MZSKvI7h1J9AUe2J
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr8018335ejc.458.1621366361694; 
 Tue, 18 May 2021 12:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn3gyZCoa/mzEbC9tE2Me4f4w15hFwr20GyB/pYU1HaKTccTAZZbMNOZZeAtDND5PiRqTX0Q==
X-Received: by 2002:a17:906:144d:: with SMTP id
 q13mr8018310ejc.458.1621366361486; 
 Tue, 18 May 2021 12:32:41 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j22sm11092111ejt.11.2021.05.18.12.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:32:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v5 0/6] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
Date: Tue, 18 May 2021 21:32:33 +0200
Message-Id: <20210518193239.1725624-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
The floppy disc controllers pulls in irrelevant devices (sysbus in=0D
an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).=0D
=0D
This series clean that by extracting each device in its own file,=0D
adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.=0D
=0D
Since v4:=0D
- Dropped machine patches for later due to DMA jazz issue=0D
=0D
Since v3:=0D
- Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)=0D
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
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC=0D
  hw/block/fdc: Replace disabled fprintf() by trace event=0D
  hw/block/fdc: Declare shared prototypes in fdc-internal.h=0D
  hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c=0D
  hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c=0D
  hw/block/fdc: Add sysbus_fdc_init_drives() method=0D
=0D
 hw/block/fdc-internal.h | 158 ++++++++++=0D
 include/hw/block/fdc.h  |   2 +=0D
 hw/block/fdc-isa.c      | 319 +++++++++++++++++++++=0D
 hw/block/fdc-sysbus.c   | 258 +++++++++++++++++=0D
 hw/block/fdc.c          | 621 +---------------------------------------=0D
 MAINTAINERS             |   3 +=0D
 hw/block/Kconfig        |   8 +=0D
 hw/block/meson.build    |   2 +=0D
 hw/block/trace-events   |   3 +=0D
 hw/i386/Kconfig         |   2 +-=0D
 hw/isa/Kconfig          |   7 +-=0D
 hw/mips/Kconfig         |   2 +-=0D
 hw/sparc/Kconfig        |   2 +-=0D
 hw/sparc64/Kconfig      |   2 +-=0D
 14 files changed, 770 insertions(+), 619 deletions(-)=0D
 create mode 100644 hw/block/fdc-internal.h=0D
 create mode 100644 hw/block/fdc-isa.c=0D
 create mode 100644 hw/block/fdc-sysbus.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


