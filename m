Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3137694C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:10:08 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3zL-00052U-LB
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3w6-0003hd-OJ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3w4-0008O1-WC
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620407203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Q2p8/fzBlCOYZjBPnsCxDMRGMz0v58wEmS2OKrTEYA=;
 b=QWNDNW4eQ2jlFhRqW7nVyhEDjTPmwu2f8aNmnhSIgcB5cjw5NQNzp/9FlEk6uWXKsQNjWc
 KG1eOk0uKNrKhql7sUvdISMFWtCTbRzzF3vNvNiwC1cBAb8mQe9u+U9YG6fdLIxvnooU3k
 3H1JOZCEodb6N1Q+xGcB+7CG7IDaHkg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-TkcCP5-UNeqSt3SmoNsR4Q-1; Fri, 07 May 2021 13:06:38 -0400
X-MC-Unique: TkcCP5-UNeqSt3SmoNsR4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a1cb3020000b029013850c82dbcso4117223wmf.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uX0BpvF6fMpzfqg6gu8Ay0hHDb26dLpdm11sfGkQfao=;
 b=TzKVqQ3wT7cr1oUNFlyffdt33ho1tPWZlSoWvk3A/GTewAcwrisESdWEGeM4okaEYn
 i/HwdWhOzuD9xK0iKqBR1iw1awOYqrsemxx1DLf+1rtdgS2i4uvOJlJZdqAywtsX18Zx
 s/q1xXrfGqpPmlLpLmwiI4OFYD0brG3Qeln5a++fTfFyZub88xX/tHwT877EePFkWIPf
 d4pZ45psdZktKiT0Kh+K1p47hhEgY4UlMKuTmCczgyakzOAlketq8j66RTB+fKm1Hn2C
 km/G9MIUfz16iVoa3CV7IHZNpMKmnSJDqVZ1KI1p8zDEzrZB7Rpzuh6gAt1+Et0ow+Ie
 3xLQ==
X-Gm-Message-State: AOAM532Zi5IS/Rj10rr/kzR58wEC5S+a/jMfnkQFZrNaeIOgrZqURH/H
 /wi+1nKtHZrO3IyENJ4KQOwaA29X/ivnVW8vG785WR8IKvJF+mnmU6qhfI4oP2XG/tGcy9vAj+t
 m/Z3Fopi4JFk13SPxbJDOV5OGLCiHvPxRgxxEc3bfFTMxD0cSnbfHcFnLJsOgpBHV
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr11121557wmp.98.1620407197599; 
 Fri, 07 May 2021 10:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3A+Y/KogCcHJlvD4Fk27eh1g6CJMNkbPF0kBYWAh4rZYTW0JFs35YCuRaVa2rKG+K8tyu8g==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr11121512wmp.98.1620407197231; 
 Fri, 07 May 2021 10:06:37 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id p1sm1152920wrs.50.2021.05.07.10.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 10:06:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] virtio-blk: Convert QEMUBH callback to "bitops.h" API
Date: Fri,  7 May 2021 19:06:32 +0200
Message-Id: <20210507170634.2058801-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series follow a suggestion from Stefan to use the bitops=0D
API in virtio-blk:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg805139.html=0D
=0D
Since v1:=0D
- improved "bitops.h" docstring=0D
- addressed Richard's review comments=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  bitops.h: Improve find_xxx_bit() documentation=0D
  virtio-blk: Convert QEMUBH callback to "bitops.h" API=0D
=0D
 include/qemu/bitops.h           | 15 ++++++++++++---=0D
 hw/block/dataplane/virtio-blk.c | 19 ++++---------------=0D
 2 files changed, 16 insertions(+), 18 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


