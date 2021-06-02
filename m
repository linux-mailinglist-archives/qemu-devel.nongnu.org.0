Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994B3991F4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:52:41 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV2m-0004nz-5O
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1U-00031r-Js
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1Q-0000mm-16
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622656274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+UIQP599cMwM+duNKvZVZuBN0j2scvMy2rJZfj96aNY=;
 b=fuUDTkdOEcNpVbGvaYRWEZWAr0lMXZe3SmYCA/xEwIH3CwNW97oZinf6xjlzAZMJnEL71e
 LYOu86yNWIYJoZVZdXciHaRoVjTEOckolMSTet+V0cU8qJr/BmrXtTCZGhHprv+XPiYpa0
 /bb73TDOoxyQ6yJm7XYFyZhAEFk3bvA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-OQUw0KS6PoiIJvGo0OvPXw-1; Wed, 02 Jun 2021 13:51:08 -0400
X-MC-Unique: OQUw0KS6PoiIJvGo0OvPXw-1
Received: by mail-ej1-f71.google.com with SMTP id
 e11-20020a170906080bb02903f9c27ad9f5so981769ejd.6
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPwlSzDOcnW2DU3ZC9LUy4niRTWJAeltt2Q9iCdxkvo=;
 b=JhaCiK0MJX45UHcicKkpR1vILgulZ0xrbOM9X5DJ39Qb98YvXl+0/7ShpMot679eDL
 qc2eGP73G/Y21JOralssBTD/DOlZFn3W9b9QR4jAuQb1sEQkz29utRsdq0rX4l4dPFqt
 CqykamBAcKYU4wvmNy8Quy2+09/t6Ti3V+Vj7oQSpCV/IjcBR8kzEpYNbA2PPJpm197v
 lSqDWW0j5LwkN6llqGEys9ZcUIcn8+PJFRkda02V0IboKP+6sQeMGaZVJccCiZQDrfvv
 NbO2PsVbRnXtA+Dzq+v+++yGBZU+u97K5j/Bs6fTuhaJCnz81B9sqIhrxaS19BmeG8rD
 MHOw==
X-Gm-Message-State: AOAM530DDFxha06KA2PHEgrW9DMy2WxbyOnO9BgHykwkMxTzLathSQS2
 ZRa1QVfttixQ9tnoIB+cgL0OHiVkxTCNrmrizLLs3luGDdIB+hFbqcCYBznAVvDNsr9DFrict9w
 6UPIELYv+IUEAQ/f43dhgPKBjgLtevBNbriixzWhLnlDMjK3Be0GpWNf5C8u4f24E
X-Received: by 2002:a17:906:e2d6:: with SMTP id
 gr22mr8263049ejb.514.1622656267226; 
 Wed, 02 Jun 2021 10:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynmN4Meb6JF2D5dYMWMn3Jag9qE7M4IYVx4yxjMTtzwSZs6V/zdY2jNIV5WVjzzkgIXsVUSQ==
X-Received: by 2002:a17:906:e2d6:: with SMTP id
 gr22mr8263027ejb.514.1622656266982; 
 Wed, 02 Jun 2021 10:51:06 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id du16sm311942ejc.42.2021.06.02.10.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:51:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] migration/rdma: Enable use of g_autoptr with struct
 rdma_cm_event
Date: Wed,  2 Jun 2021 19:51:02 +0200
Message-Id: <20210602175105.2522032-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_autoptr to free rdma_cm_event to avoid missing to use=0D
the not so obvious rdma_ack_cm_event() instead:=0D
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg00511.html=0D
=0D
Li Zhijian (1):=0D
  migration/rdma: Fix cm event use after free=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  migration/rdma: Enable use of g_autoptr with struct rdma_cm_event=0D
=0D
 migration/rdma.c | 33 ++++++++++++++-------------------=0D
 1 file changed, 14 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


