Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06D37A527
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:53:32 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ15-0007rc-N3
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq2-0005h4-V5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPpz-00029X-T5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j7d1rDqCAA8qsauHkv0gSWnRoeiYJXBL904ZNG6nFw4=;
 b=XXXwgcWl8W3hMGh4l4GAJE30qrM9ymhrGB+ReFt3PUjGsvjDUwkHjwGb0v5APMFBYjH/FQ
 GvvlokwowOkLlOcHqVsmDhlj2zFqMjAq9J1saSm36c1di5TecVuZaVVX8WpfeAFhYlWO3K
 +eibUoHp0QW8nqo0kUdCONQ8hq3yo4E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-AAPzoR7fMGOKKqPjTZy2Ag-1; Tue, 11 May 2021 06:42:01 -0400
X-MC-Unique: AAPzoR7fMGOKKqPjTZy2Ag-1
Received: by mail-wr1-f70.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso6115897wrj.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlbWfCBF6vgyaOmQZsaQ9/Pu05E9+2cb/6mazZenWLw=;
 b=lYDClSz2QW1Gu/uLQWSDQeQp5HkSFAnd1903TWE1MymTHnjbTNpzSMFs8W9Axl+xuV
 2Okj5c/Q78uuYpvqn5DHRjg7hm+92uu5sLSSve9w+IGbD2kTVWzW/78/h4AYI7dKAy3f
 ZfZVVCgzxshGPkCW2TTIprDT5yBBHGVbVsPGMoN3aKHp0HKOcPScu4uZNIqLpenxvPnt
 /rj8bh1sstfqhoBD4JYvIWq52psMjmysct3Fp8cxxaD04Yg1qveUJJvmxqMiMrt+MDqc
 ySnnk9u3ySBfXzRN1YRha7fo/ulou6mJ5G+eZiX08rh3wr6/mPIZWnGfoYwJ/I/MuCM8
 ud+A==
X-Gm-Message-State: AOAM533R/koUIWxx+c2Uelnt+ArxEm9H1iLIJsDd99WpimQrkZm7GayL
 6lYjgJh7J4nDCmG35FbTgtzgm7Hhab5QkCChZgKiJvpXt8ki1ZvQROLT+zzw5/FwFA8wqEeMqFh
 /Zw+O10opAk8HKo0Nz9/mFYI0ttaJBb5B/9cHOdfQ7/p/SDiNuZa0kfKAy0b4p5Dy
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr4775944wma.24.1620729719531;
 Tue, 11 May 2021 03:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCyErJiTg41DmdKwoAWDvCZL8zC81AHLAksjWGgU15W7MXq0ie5JAVqWzuF+KCA/O2XzOrdw==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr4775913wma.24.1620729719288;
 Tue, 11 May 2021 03:41:59 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f18sm2954194wmg.26.2021.05.11.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
Date: Tue, 11 May 2021 12:41:54 +0200
Message-Id: <20210511104157.2880306-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches to keep VirtIOFeature arrays read-only=0D
(better safe than sorry).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/virtio: Pass virtio_feature_get_config_size() a const argument=0D
  virtio-blk: Constify VirtIOFeature feature_sizes[]=0D
  virtio-net: Constify VirtIOFeature feature_sizes[]=0D
=0D
 include/hw/virtio/virtio.h | 2 +-=0D
 hw/block/virtio-blk.c      | 2 +-=0D
 hw/net/virtio-net.c        | 2 +-=0D
 hw/virtio/virtio.c         | 2 +-=0D
 4 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


