Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E73EB487
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:28:06 +0200 (CEST)
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEVM5-00058c-A9
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKM-0002hj-2G
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKI-0004SC-NR
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628853972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4YO/blIyKkflDpvNOjYCPQtNxV/i4fUB2IDZN02Un/k=;
 b=dp2yoNCT6I6rtcTGIOghpWAm9XbxdRLuVtR0718c0zxOA8UQHVDDYF5togQJ9R4soDwLDs
 dCSIP6E1YYx0QU1ungyymGtboxrWEMNdYjWxjVCjBT42NRJCzCBSQNr5JSnaRNmL5BvKO/
 h/06jauL3mTXWktVMNwkA/MtxgQMFSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-7bZHrtkUPTOYiKvpX3Lkqw-1; Fri, 13 Aug 2021 07:26:11 -0400
X-MC-Unique: 7bZHrtkUPTOYiKvpX3Lkqw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so2793492wrs.13
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a3Ic4VqnjF35jr3pyulPnPvpnvfbXc/QI4GwFBVRYFc=;
 b=gvf9r2gKxmgMagUqKLqSzvFJKL7RRd/L40U2RDNvE+ElwZ8qOhLwMg1TGM6NW7eisv
 g3h+2Ddo+iLFBfnT3oxuPX1sj2q9EutWl4uENOJ5NxGmR0CMssY8XWa2/dNbBfiH7CTu
 Upcjs58Bq41cgPJa0/Ugaz6UmJe3ObZyXVFFlsJmnoYg34GpMH+Sjglnr11134eJfAZg
 BdK9TxLnsZfv+SbLWsdh53sTKCMSWg9rJWOcnQ+JAak71WmJBM5BOug0LMkWTgoSWpce
 wAa8v5pZG6LrhZ4lFpB53GjFZ8j6bs2xYPmjkfVwrhcyzPBWGBLay/cJ5qXtF9eq35dQ
 3IXQ==
X-Gm-Message-State: AOAM531Hd61LyqZXQeUzQrwO+NGsueJJGPKYs2uJM9+7yVNszukOKqey
 kDQF4pKmtakBHcdloxsl9bXRXHtqCQx8drgNogqVN8jsgCvCG+HJgqOkEhFAyPhRpZCQgWWIkTd
 ENZlxDWLrZribtDnGnooTCOZC5ZSvPxr9oxZy2VdUue72l8S/So0QvQ7tRanrIPme
X-Received: by 2002:a1c:2090:: with SMTP id g138mr2144797wmg.98.1628853970044; 
 Fri, 13 Aug 2021 04:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQoLuH8Ep3FJ2h6ej4z5Z2Xdira0C9BvPbzShrvscMvH3Pe00q/PZKeCYUaBfkfxNQU0X2bw==
X-Received: by 2002:a1c:2090:: with SMTP id g138mr2144775wmg.98.1628853969796; 
 Fri, 13 Aug 2021 04:26:09 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b10sm1522297wrn.9.2021.08.13.04.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:26:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1? v2 0/3] hw/core: fix error checkig in smp_parse
Date: Fri, 13 Aug 2021 13:26:05 +0200
Message-Id: <20210813112608.1452541-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Respin of Daniel's series checking MachineClass::smp_parse()=0D
return value instead of *errp.=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  hw/core: fix error checkig in smp_parse=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/core: Add missing return on error=0D
  hw/core: Have MachineClass::smp_parse() return boolean on error=0D
=0D
 include/hw/boards.h |  2 +-=0D
 hw/core/machine.c   | 14 ++++++++------=0D
 hw/i386/pc.c        | 10 ++++++----=0D
 3 files changed, 15 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


