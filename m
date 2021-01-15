Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B517B2F7F44
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:17:14 +0100 (CET)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qqf-00048E-Oa
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QlM-0005bX-0R
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QlD-0000Rp-3W
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vJcVomEyeM6XO+eUf1MiX6+/ZT2Zh17BWZWFMN/bTfE=;
 b=FHgKpoD1MLavuvLcO8hhlKMP0JPK+iTO9HlGoQb2wTJsAJMCv3+l1q8N3umUmQ3gImMECO
 fLL5JA2vps37cavDPESqGCP86fgAOyPMdaLqFwOFUHwJXuJFx28Jy01Khj46QDddL+G0BW
 WVEnykdjRqETlgnTpCxixavxRdSYvXM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-U1MbpvkuMlydjR10ztKvsw-1; Fri, 15 Jan 2021 10:11:30 -0500
X-MC-Unique: U1MbpvkuMlydjR10ztKvsw-1
Received: by mail-ed1-f70.google.com with SMTP id a9so4003742edy.8
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HZwR27Mp8pM1vNTlgMwBLOvkx/+cxKlo4qS0a0rjk+E=;
 b=YU+WZr0Fds4sA6lP1vdC+EG80YsokSWh0YS3Jpj1LsmbkEETykNEZ7Lie0WBcNM1Kh
 vzIWbMJT4PrDPOKMzpVGzmQV5LAZge5GPXqwere/HUTeuivuEmR2qWEJxRa60iB0LmS7
 1sldeZtkA1Qlji0tsCGgaRqVH7NL7j+/B7bAl6z6cqfUHAYtc6GWmLta8RIAsVfUPydo
 A58v1Jk8BwlHW4GDBXKoFrP0DOvCgXPh0OCtV3i61fndXzjX/H1MD+e2QCEVnIMOUxpB
 Dhy+fHGtc0amxxpaYZd+3goQaqVHdeafrrPyHmirHi/FV6CJVtZYQzna8CumRK/WOkRR
 DI+A==
X-Gm-Message-State: AOAM530Nfq+D5b7mZoigYavf9F2dXxFX7C7g3wPbbjyowLQ81eK2VlT5
 iKx18vXQglAkCWS/XcYOl3kHaB2n5one8uPnp6x+lWxplUpj1MF7uftO3obDeBMVP1wEUtsvKxP
 J0aKh+hpkJGK1HARuZLZUM2UuXG7k8GB/j1Zj1peWh/PH7fV/XXNUHkQNNadwJowu
X-Received: by 2002:a17:906:a8e:: with SMTP id
 y14mr8943003ejf.47.1610723488885; 
 Fri, 15 Jan 2021 07:11:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyea+loXuYwgZ2jzx7+wg3vuDkA+FS4mIDqeCc3pIBqmASpyIpEdobqD0sH2iyjI4kgCu8NQw==
X-Received: by 2002:a17:906:a8e:: with SMTP id
 y14mr8942973ejf.47.1610723488649; 
 Fri, 15 Jan 2021 07:11:28 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id cb4sm3637414ejb.82.2021.01.15.07.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:11:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Fri, 15 Jan 2021 16:11:24 +0100
Message-Id: <20210115151126.3334333-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
v2: Restrict tests so they don't fail when device aren't available=0D
=0D
Based-on: <20210115150936.3333282-1-philmd@redhat.com>=0D
          "tests/qtest: Fixes fuzz-tests"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  net/eth: Simplify _eth_get_rss_ex_dst_addr()=0D
  net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()=0D
=0D
 net/eth.c                      | 37 +++++++++++-------------=0D
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  1 +=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 72 insertions(+), 20 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-e1000e-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


