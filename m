Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B893FE93A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:29:28 +0200 (CEST)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgE3-0005ja-6a
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgAt-0002zP-BR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgAr-0003SY-HN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630563968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QGRTeNi+wm0nl5PfsXaGmdZ9NVeNLWctHgQBDODYdmE=;
 b=gNuiFP2klRj+ZVXKmpCeP3a/Fr/d+o+oPslevt43WkBIHAQs715APj6tZBjYzIcujlGh8o
 lwsyYEVpP+Hdfu2U7O72yJKs2PfiqK/zykP50k1TYK8LFZW36QEatUPp48N2KKyVms0QVJ
 ECItAs4ZhXMl0UkTAybC7vt8fLX5ty4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-4ycmuBxhMAaPDt7LLDkPuA-1; Thu, 02 Sep 2021 02:26:07 -0400
X-MC-Unique: 4ycmuBxhMAaPDt7LLDkPuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so542586wmc.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xc2ng71fZNSBa2wr7JfhR2W9o5frLZrPn3z3LkeD/ig=;
 b=muCaUd81cReBBjLiFaP5gMifS7n8Jhst7WecB0IeRBTiBcov5PpHzE879r6J0XH+49
 ZaaIyO4s6J/JTO3tBY5Ev9CM/W7BkT466hlNBl4/sT20/MsK3BG/wuRVTtbhinWb5Nfc
 D7P4X+wY1EiKl6cisJ7nz4PRecJonuEZlEA0KFJ01k/6ECEqtWgKEPxRnP/X45Em1NCh
 nkoN6PnxR/MIcbJoR91Ryf812raKGGEopZN3hXivciU1FsiZkdwP6lMSWVahzATGq1P8
 hUlW1wBE+M7isu+M4urYNrsPAx/bqiGlnM7o+RJurNcC7RPtzFj48YoTebMKO8o17N4d
 y7aw==
X-Gm-Message-State: AOAM531LnrjFP8wFuF6Duhhag0N8Lf7bfH6upxzOFKj/i87M8r7bg/Dp
 VULCpZ598IXTDMf1PkqRi4hZLdahxTda/Bgo8raJpdXa3i86SQFddCiIx9zoHlBkeeOHjyGdCn3
 L8Gu1KT34SvUhpHOwKp2Oq2u0Ly10/E7tOMojBmCbxiDQ/Uy8vIzYWGW+N4rS4t6q
X-Received: by 2002:adf:9e49:: with SMTP id v9mr1637232wre.39.1630563965831;
 Wed, 01 Sep 2021 23:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPBQEocd/lyo5deQLpp+4vw7LcuiK4IRyjDu0SpTahWAZ4T/+lnqkRYyBQcN/Z+yvkh3Ijnw==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr1637199wre.39.1630563965519;
 Wed, 01 Sep 2021 23:26:05 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c24sm845504wrb.57.2021.09.01.23.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 23:26:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Thu,  2 Sep 2021 08:26:02 +0200
Message-Id: <20210902062604.182620-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

Follow Peter Maydell suggestions:=0D
- Split mtree_info() as mtree_info_flatview() + mtree_info_as()=0D
- Remove duplicated Address Space information=0D
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
 softmmu/memory.c | 158 ++++++++++++++++++++++++++++++++++-------------=0D
 1 file changed, 116 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


