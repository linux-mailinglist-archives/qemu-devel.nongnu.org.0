Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EA3342DC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:18:03 +0100 (CET)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1X8-0002pu-5m
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1HY-0005G1-Lu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1HS-0003Mp-0q
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RiBHGK+UuwviMwAtQR9vEZ1pS0FwsQK5nrWibyvbzyA=;
 b=W4Fi++NI0e+R+1Xja8G7g2LUJDp5zyZ8YmjyJMkN24Ti9Fjt6hhghyAmKx9Xnj+9jgmX2m
 3c4jdUMgIiuUZXjWHbL9A7zlyC81ZXeY1pzOkT8nfqaSmtTGjAr/4j1H1HX84sgvZL2Nt6
 IHsgV/B1s7Tjg23/1Ts4LAamxiAVNZ4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-koVHCgC_Neahb-wwIS6caw-1; Wed, 10 Mar 2021 11:01:39 -0500
X-MC-Unique: koVHCgC_Neahb-wwIS6caw-1
Received: by mail-ed1-f72.google.com with SMTP id p6so8545579edq.21
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pO2sr18dWtL0EggiPywDCz7/lPZmu/wI1g76T6FZ9Uc=;
 b=dzEbyFCfh0LZE7pBKlFoAwvt1+LsFZzZtF0y1699bGiQEXQIRYNOcSS8jvWu+x27Ib
 FVJtZwYu+NFIJbNf5qywDAK2ADFwLxLWILl/HJBy2NuOnY6R/vv/tySQGarOH9/VXrjF
 mptIiNWlB7iMjNG1DHuNb2ptGBT8IIc9wjlxZMZLzFjA/bY/RybhihgJnzUwAiBTqPTE
 eGtPQmj4CuM5pSMsxSxkE6YBQU+P0MEq+jmX50oNBUuXD66OwjsDHYzqYw5JhhSYXnf/
 xXQbIuYjtBy0KfBvZvHbxJbQPO5XZ7nFZlZorRN+CavpJFnx/Ns4zgPqYteTs31u2Kb1
 FeNQ==
X-Gm-Message-State: AOAM532IXVP5ui++63gelweOs6QqxQaJjz5c4ah4Chz8u7E18pPII+dc
 3dpX2QAzxLGF3xo5agD0WDPrlkGmqEFZJScee3/78Kiri/v3pqanvUvm0C6lL9m8E8kr7168rhB
 aCZhVjjS4HmMH9lxuWBCdupSurVwUwi6m6hbYrKDuFn11EwFFJ9n/GpgQ1H2zBpwu
X-Received: by 2002:a05:6402:17d6:: with SMTP id
 s22mr4090438edy.232.1615392098158; 
 Wed, 10 Mar 2021 08:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcNYC9r0TFzbiI2+cwQSt2r2kMdtDHIp4sPV0Yk5qm5CxS52STeoVp2P7b1bjQBxmFZ44Iiw==
X-Received: by 2002:a05:6402:17d6:: with SMTP id
 s22mr4090412edy.232.1615392097947; 
 Wed, 10 Mar 2021 08:01:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b4sm12051138edh.40.2021.03.10.08.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:01:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 17:01:28 +0100
Message-Id: <20210310160135.1148272-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
Since v4:=0D
- reworked again, tested it with Fedora Raw Hide=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  net/eth: Simplify _eth_get_rss_ex_dst_addr()=0D
  net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument=0D
  net/eth: Make ip6_ext_hdr *ext_hdr pointer to const=0D
  net/eth: Check the size earlier=0D
  net/eth: Check iovec has enough data earlier=0D
  net/eth: Read ip6_ext_hdr_routing buffer before accessing it=0D
  net/eth: Add an assert() and invert if() statement to simplify code=0D
=0D
 net/eth.c                      | 48 +++++++++++++++---------------=0D
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  1 +=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 79 insertions(+), 24 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-e1000e-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


