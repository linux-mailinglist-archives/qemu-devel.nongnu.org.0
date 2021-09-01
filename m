Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916C3FE03E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:42:46 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTK1-0007O8-2T
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSxq-0002HN-DU
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSxo-0003ir-DA
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o9k4VULlBtEVICWMDzetVlf0jUIflUHHlITC/iwhe74=;
 b=F57YOHxN6Kcmc7Jq6eXU4giw5GUXkcO1F/3ZFfUsrhLlVA2hOSJPbkBeqYq0lcaMrKh2du
 WgZ1V96wVQ4uQU6DWu2n05783zzdyxeaOGzWiYtkIMoI0baLV41ZvD5Q+Yz7zVrhLmvHQO
 9Pdt2e1IIqCrPDEIgO0bYKAZMG5vGCA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-cC5_KxyjNwK5q0Dpsg_8DQ-1; Wed, 01 Sep 2021 12:19:46 -0400
X-MC-Unique: cC5_KxyjNwK5q0Dpsg_8DQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso24854wma.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VUR3axTjLiG/ZmEq+5IjJWrMokvFs7tsIqlEnqCtVGE=;
 b=jhBYDap2qAH3o09YtmK3qCDcBKOFmNReOrf8z8JJlnVAlByPa2C2+CsvfNb8jZcd0V
 QWPabNKIgssma3MtnCtuO92SOXTWz9q5bs+IOfxV6hBD4TG5xMEwiiyN8Rh4x+QpUYaD
 NaPTCQYNM8aBRZwIhf0ldTE6MvM5u+pYCejtXSDYehWD7KecC8MJ5ERjKZelVZwJJkD1
 /twBdtaf6/iFnFZGEXf6PF/FBov+q1qszJDuoBE40mV46prkcKH53eM3tyt74F8YJ4O4
 JfRkeaN3vVNARxEP+V32r8Fh65WMVfgUPLu+uPdVciuzFkgTFdVb3w4l7EtMZGHYAb5m
 529g==
X-Gm-Message-State: AOAM532iTld4oDCmlyHXcfR+PrMWYtzspHWN74L+FXWkZ8wYTI/kGxrg
 qzmFqk41upNq9n7E0W0JDBtdftXrcmWhXpGSwemF3wmtr3nf4oKxsWm2aCClOuL/IImX8aGsWzW
 3SG4QTvjagcgN2NkIveMpPHaStL8wXc2SFoyMXezXyQr+SNf7lbQjtuS8pPLOhW4k
X-Received: by 2002:adf:e449:: with SMTP id t9mr170320wrm.135.1630513185162;
 Wed, 01 Sep 2021 09:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGr1wp7QZC5BfQRsSSnN3AlEID5pNrco+6K7wNPYw2XV1NMiQyBmTe4sWAXhVrVjCx2r4OVw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr170284wrm.135.1630513184860;
 Wed, 01 Sep 2021 09:19:44 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m1sm25318wmq.10.2021.09.01.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:19:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Wed,  1 Sep 2021 18:19:40 +0200
Message-Id: <20210901161943.4174212-1-philmd@redhat.com>
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
Since v3:=0D
- Fix typos=0D
- Split mtree_info_flatview() + mtree_info_as() first=0D
- Rebased last patch keeping Peter's R-b tag=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  memory: Extract mtree_info_flatview() from mtree_info()=0D
  memory: Extract mtree_info_as() from mtree_info()=0D
  memory: Have 'info mtree' remove duplicated Address Space information=0D
=0D
 softmmu/memory.c | 160 ++++++++++++++++++++++++++++++++++-------------=0D
 1 file changed, 118 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


