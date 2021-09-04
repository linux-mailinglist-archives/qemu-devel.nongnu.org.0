Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539D400D7E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:13:11 +0200 (CEST)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMeqU-0003Ot-Ad
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeoa-0001aq-QP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeoV-0002jN-Jh
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630797065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+N+Jc5dyr1JwhVXPicVRmvKkcUCOH4GU1N5fYhc7py0=;
 b=izSdvpsW23nQOyUSJ84XZ6JJmz72v0X21UewUlRmMbZr9Oq/4uZl8oph7cu1+Ob88CNVs7
 zrdj0XZWDF1rEHt2XwrJ+ohwCFiPx5S1hBplcmMDQi+Cu5Y7Flw07EC4g+4sebZlEzRwcw
 gQE1q/c+/6MzbJkm1s/mvevPOcvlYqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-rXh6_l17MpCpvn5MDA95PQ-1; Sat, 04 Sep 2021 19:11:04 -0400
X-MC-Unique: rXh6_l17MpCpvn5MDA95PQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so1778104wmc.1
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/g2SGWmc5qs6Urh9ljwmf2by5EM6rBHhxfoRd9k/VVY=;
 b=mDvlnmgPgYA3deovL7FA/wkooGjNmMXprZsKpGapT2xlBWi5y4bFofAGNidVRzY2DM
 2F8GYgaJPITn0/q0mZsJL3g/5nCrSMbKHtbUeSELviA0cAXNLF0vuI6jga41l0MBUP1l
 5PFnwB18Y7a5aE90AVULAa72YqQACIBjWbuWMlG4+yM5B/iQX+wxOfr5rj7HmKO3ut86
 dwJgPPMrzyIbkWiPtv3K5btF1Bk1LslSGmPJ/NDed2JY8wZ0GxWCtfEuDM4VfzyKfHpJ
 3W0a7LKhbKna3JWo1mubxg2uZ/ihx52ld7DO9Si/87l8UYiJvX8SsREt7BsakRl9qaRv
 IC+g==
X-Gm-Message-State: AOAM533UNIL3idp5Mu+xNJu2LJRk5aTuV/HkAUG1RVeAVcL+YGbpk9im
 dvPdT/Yt+Opvi0cQGYU+kyPH8+wcwG2lGYVNUONb7vjyZRJm+jdORAzmbmFHInMadrHyTFjyF7b
 y8cTc0+Y1gmRDja+P71lF2c93oIvewnBQrhI+iaE9d1AJ9k52wlj9C2SUcmsd82EP
X-Received: by 2002:adf:fd51:: with SMTP id h17mr5841593wrs.178.1630797063200; 
 Sat, 04 Sep 2021 16:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtqlydsQ3gmdRFY56lTY1G/XHbjuGnG8CHNIX6UW5WnTrs4TxVBiByoTMyir5PCHANKt7J1g==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr5841572wrs.178.1630797062920; 
 Sat, 04 Sep 2021 16:11:02 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z19sm3758435wma.0.2021.09.04.16.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:11:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/2] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Sun,  5 Sep 2021 01:10:59 +0200
Message-Id: <20210904231101.1071929-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series fully reviewed.=0D
=0D
Follow Peter Maydell suggestions:=0D
- Split mtree_info() as mtree_info_flatview() + mtree_info_as()=0D
- Remove duplicated Address Space information=0D
=0D
Since v6:=0D
- Added missing vertical whitespace (rth)=0D
- Added rth's R-b=0D
=0D
Since v5:=0D
- Fixed messed up during v3->v4 (peterx)=0D
  . Restore format=0D
  . Remove unused 'int counter'=0D
=0D
Since v4:=0D
- Merged patches 1 & 2 (David)=0D
- Remove unnecessary return void (David)=0D
- Added David R-b=0D
=0D
Since v3:=0D
- Fix typos=0D
- Split mtree_info_flatview() + mtree_info_as() first=0D
- Rebased last patch keeping Peter's R-b tag=0D
=0D
Since v2:=0D
- Removed unused AddressSpaceInfo::counter=0D
=0D
Since v1:=0D
- List AS similarly to 'info mtree -f' (peterx)=0D
=0D
checkpatch warning (81 chars):=0D
=0D
  WARNING: line over 80 characters=0D
  #86: FILE: softmmu/memory.c:3359:=0D
  +                                  address_space_compare_name);=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  memory: Split mtree_info() as mtree_info_flatview() + mtree_info_as()=0D
  memory: Have 'info mtree' remove duplicated Address Space information=0D
=0D
 softmmu/memory.c | 150 ++++++++++++++++++++++++++++++++++-------------=0D
 1 file changed, 108 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


