Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC23F1EE1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:18:08 +0200 (CEST)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlg7-0004OH-Hn
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGle0-0002LK-SZ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:15:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGldx-0000gi-QZ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629393351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J7wr6m9xtwIzgByfa+MntP8DbSP81IC+NL8umwC96aU=;
 b=IUTVP3iyb1hn+4hCZthFSUJ/HEh00XDChJtgs3fOBLY/Nf6Vg+GI1nwtn5DVRauiC+yF0d
 5eNDPFqbl91X9HoJYyAMXqxfhmdgKq7XR9wY6mS6EWnMjfCVLvwy50n9RH9sxDBwt+C0wa
 2nuWLyocaX4Oqvw0rTQS/SESccc49ts=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-2WUtuGtTOSuAyUCkqBx6PQ-1; Thu, 19 Aug 2021 13:15:50 -0400
X-MC-Unique: 2WUtuGtTOSuAyUCkqBx6PQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso1915448wri.18
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGq+uQ+l389hvpJSZEGyjdIEcpqyU00oM2WS3Spc/4M=;
 b=o5784P0Tiu/qxqE8VgrZfeeXLrU1Ui+HR/oDJEfABs2dULh7EQSmsmzEgjevTfhHNt
 DsJgwtoVio1PngmRNnkgUteb5/lll9FkkR7BYaHbwJ+Q12E+1Wov03YRWky7e6Z7Ji1p
 qzzsommypHYbw03GobHH3CyI8gyCR4zKtJ2ifAw1xwpJI67WTFgkgL8oOrkprQWCbDIE
 4bRvtJVgvFKgm5xf9KJvRkv2WfRbddn+UKGVIAiXdRwYEzNcPdrYhumoK6Rj/vmdpcsZ
 12N72RIgIuo5bIJvn3bisaSdwNe64oVoM8tbZ9sq9/zQbJuhhPuyz666+31QD6zRCsjM
 OPrw==
X-Gm-Message-State: AOAM533usEQIE5E6KDlvZbLHaRHok40O76x28Gz07XySRpMgRmGwt/LE
 HnsUQBOigWFsFg12dmWHzp6d2L5RCRD0PvbYp0qOVQ0qtMbjBNT4b6CsCo1Q1STXtX9v8j4hoee
 gDNCnkd+QokUIrcVEal2zbNm77uCNjyGut9MbkPilMjJEkHdUI8AD1tqqj8xpDT0o
X-Received: by 2002:a7b:c935:: with SMTP id h21mr14792404wml.143.1629393349012; 
 Thu, 19 Aug 2021 10:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvmKpG8e51kIX/2UoLpMkmBzwtA5PVq3kz9Tmo0fPlPBoCVwxMxGErqW0q8xwKNAkLUA47KA==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr14792382wml.143.1629393348828; 
 Thu, 19 Aug 2021 10:15:48 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e6sm3482790wrx.87.2021.08.19.10.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/usb: Always expect 'dma' link property to be set to
 simplify
Date: Thu, 19 Aug 2021 19:15:44 +0200
Message-Id: <20210819171547.2879725-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the XHCI based devices by always passing a MemoryRegion=0D
property to the device.  Doing so we can move the AddressSpace=0D
field to the device struct, removing need for heap allocation.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/pci: Introduce pci_dma_memory_region() helper=0D
  hw/usb/hcd-xhci-pci: Abort if setting link property failed=0D
  hw/usb/xhci: Always expect 'dma' link property to be set=0D
=0D
 hw/usb/hcd-xhci.h        |  2 +-=0D
 include/hw/pci/pci.h     |  5 +++++=0D
 hw/i386/microvm.c        |  2 ++=0D
 hw/usb/hcd-xhci-pci.c    |  5 +++--=0D
 hw/usb/hcd-xhci-sysbus.c | 13 ++++++-------=0D
 hw/usb/hcd-xhci.c        | 20 ++++++++++----------=0D
 6 files changed, 27 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


