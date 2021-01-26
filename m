Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101B303B85
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:24:28 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MSR-0001ZB-JP
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MN7-0004fn-Q8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:18:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MN5-0000Yr-BO
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e9o9HSbgrAO9dhwuuX5RxoGyVnZHiCuOqoEwkUXX8gk=;
 b=g2OHyR6lKjoXk5W1qbaeNH0qUqh3lkguCvKrT1jPxydKsqAaQjlpT8R4RWZq4/7uBU2HHC
 XPhKTroa1tMLIb2c2qc7ShI7ihcd8L9tK5poSOceaCZTh/N7WrNMA2g9G4wuc8SwcUO1O1
 DcfTEOxmNaNlwxFbcnCzWj71YCaDyW8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-17dIS3HUOvGqJlHjKn7auA-1; Tue, 26 Jan 2021 06:18:52 -0500
X-MC-Unique: 17dIS3HUOvGqJlHjKn7auA-1
Received: by mail-ed1-f69.google.com with SMTP id dg17so9236617edb.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cMgfQ2dDiKnx/eP1FpimyOYb6jMKw5Z/xIj2oE0pYsE=;
 b=hJfEiV8zoVDqRVVdij488vTebemaxVG1ak2NyhJu4LbhgL2B/0G+euyIRED0QNu9Pb
 1ELogREHXN6sA0dvC0wbyBwWdprViMYVfZaJXqpCbU5dG+udw16LQ4mbyH2ee70wZfmL
 l6vhja/k6iYvXA3newuShnjbvH4GnZns3DwUMz2xk4pUlNMa/fts9I+JNUMMzRyb0LHu
 yNlrkVK4gSfuLLIeUkCHrFVSgn24bcwgDfJXqDJFnFE09qHl9M3kQVaHlytmROb3UHQW
 SmzBe2d+Q5AdVXgdOlJbxHQAw+FEGlORwRl+XEJFPo9X2hvfuQTSc52mKrTaavNI8bTJ
 dFwA==
X-Gm-Message-State: AOAM531WvcvfdauN5Sqp3KJqaxJKTmc0mDPw/zw5kZOCpXb5vKls1RuC
 VPz39S6tqObtXzQfw2aqUsjZK2np1J1Zs/IQEKfIY/XELQhA6x1ea6Gy6efu2KQqbyOxK8xNYAF
 Zq4YvgtsasPZaBz166gMr88woKJb/Vm4IKumBnDavRWikTSSjf8YKZ2bFm5vII/yw
X-Received: by 2002:aa7:c2ce:: with SMTP id m14mr4067340edp.76.1611659930883; 
 Tue, 26 Jan 2021 03:18:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp0KxUfCsWAMIync58kU2EnTUXsXrZyDfhEJzjMz+H12aPSTFDDWtJm45yBrWouU+b5u1R6w==
X-Received: by 2002:aa7:c2ce:: with SMTP id m14mr4067321edp.76.1611659930704; 
 Tue, 26 Jan 2021 03:18:50 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id co6sm12266189edb.96.2021.01.26.03.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:18:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Tue, 26 Jan 2021 12:18:45 +0100
Message-Id: <20210126111847.3142636-1-philmd@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
v3: Added Thomas qtest Acked-by=0D
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


