Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4960333211
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:52:19 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJm9C-0005Pi-7b
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7b-0003bI-WC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7Y-0000oI-CZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dh0mQzCaU2DagcGhFJC+rMogxY32MBBErdj7FfBP8Pw=;
 b=QQ1y7nFj/NAVu81Q/xZwwvd6qyQ9zwKTzs3X8hXtZ2Ud2myfY512ae9cRZw1XSr7s/Nyus
 AVUuiWHPMhe2iu877a9weJz+50LwmBM3wkAjFONl0HZikHfPEYHcxmJEffM9O72PQ3a2zg
 2RxDldPCgq30BeZEIhn0qvKmQQMxhTY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-NT4twDUAPau8Ixk1kJD4lA-1; Tue, 09 Mar 2021 18:50:32 -0500
X-MC-Unique: NT4twDUAPau8Ixk1kJD4lA-1
Received: by mail-ej1-f72.google.com with SMTP id gn30so6347480ejc.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mTnzQ2H9+6hUOZvJ1faDGw1/+b6W4b9CAOfOZEZNy48=;
 b=NjMr+Ieo3OkkZoqY0LdUk84hbeV2Eh1IzrtiTrhwVpPbf8EiZecCVfcYlDSbVqY9uY
 HafIGkDGf/rtcq79DYSXxrRDdrWMGKaenEWMTzcZ2+BgPRxFuLIWc0wbJIcAReR98b+i
 RxHTWFHePgD8d1Zglh9NDcHXHXcz6TUBknItZrfESD7bqsvnD7xZnXLRae2dhHVR3144
 NH48RJjhU3vB75hg/wtL1rVNMxigH75QblfTCoQYPC3JTKDIC7QZCWyqBdAs48gUjNrT
 46lW14OKQhUwLExzFbQljAF/s0YQ1tUro1lfgRd6FxI36RX4h6nW+xJJrRDaiXUWM1JQ
 7B0w==
X-Gm-Message-State: AOAM533aS/uYUcXA05CYMs/Q9uw4OC/w73sxCzEEUhKpptqYz/GjZ3iF
 hSR+dh8ioMmFAFJEMJNEUrrJrmzzk98Sxckn4jQnINCXsHYVGrwClYtzMrganSd3vguERjKu2C5
 tG4DVndYgAfxt49+nZMVfmkkpBUpxBJinEYr5Ywn8XEEhYcMbBtUYGvyfHuaBx2iM
X-Received: by 2002:a17:907:3e92:: with SMTP id
 hs18mr569585ejc.396.1615333831147; 
 Tue, 09 Mar 2021 15:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDAVa6Y1jewNNv3t/gCpdZNQQTpxVtMNo1nHB7fWQGYUEBFg1Dow53LCIvsjdrUtYNb0scuQ==
X-Received: by 2002:a17:907:3e92:: with SMTP id
 hs18mr569563ejc.396.1615333830913; 
 Tue, 09 Mar 2021 15:50:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ec18sm9138552ejb.24.2021.03.09.15.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:50:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] hw/block/pflash: Refactors around setting the device in
 read-array mode
Date: Wed, 10 Mar 2021 00:50:19 +0100
Message-Id: <20210309235028.912078-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I remembered this almost 2 years old series while reviewing=0D
David Edmondson's patches... (which I plan to apply on top).=0D
=0D
Basically we move things around to make the code easier to maintain.=0D
=0D
Please review :)=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/block/pflash_cfi: Fix code style for checkpatch.pl=0D
  hw/block/pflash_cfi01: Extract pflash_cfi01_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Extract pflash_cfi02_fill_cfi_table()=0D
  hw/block/pflash_cfi02: Set rom_mode to true in pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Open-code pflash_register_memory(rom=3Dfalse)=0D
  hw/block/pflash_cfi02: Rename register_memory(true) as mode_read_array=0D
  hw/block/pflash_cfi02: Factor out DeviceReset method=0D
  hw/block/pflash_cfi01: Clarify trace events=0D
  hw/block/pflash_cfi01: Extract pflash_mode_read_array()=0D
=0D
 hw/block/pflash_cfi01.c | 201 +++++++++++++++++----------------=0D
 hw/block/pflash_cfi02.c | 238 +++++++++++++++++++++-------------------=0D
 hw/block/trace-events   |   1 +=0D
 3 files changed, 235 insertions(+), 205 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


