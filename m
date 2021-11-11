Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0B44D4B1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:06:36 +0100 (CET)
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6yZ-0001vE-DY
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6w9-0006gu-0w
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6w1-0000zy-8N
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xwgIx9hoiN9LQl/eH4d4ODaedX7FxxS9K5Qy5HvuTyQ=;
 b=L7ll8xTqFa7ikugz1vLjJeV8GBypzdk2dvYE83CIvBHVfmknScmkLczUNVmnCDuQctv5n+
 MyQjMg2GankrMJRkV8A13pg257G/9bWx5jGdoEsSJnPl8PVT1g0J38W1Abg2VW6Zkb5HZD
 VbRwW8lirIsD8Pb/l+WruIQ5MfjBg+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-xTIlMjyTNNO58yjiNzJVqQ-1; Thu, 11 Nov 2021 05:03:54 -0500
X-MC-Unique: xTIlMjyTNNO58yjiNzJVqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b145-20020a1c8097000000b003335872db8dso1865703wmd.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMX2CvlR0Rym6m80/hmFZoDaPhmQ8CaqGxT+5uHBq2g=;
 b=OkRCltSFAUZhMmXeNR0U76EkH5fuGkwcQWyrsp8PRCYwLXXcq5jA2MHjwvCUQwaVa3
 i30JbkPeCxqftljyDyIt8ZMToR3tTyxqqHmqz7HbjJHxkQgEN/lHKKH4S7761s6l+qPM
 tv4wIxbxLKs9ZVrelwFWf5mSNfGTlQkD0mneCOz6TZ//3QklOQykGh4lK7Pfmxv4g6S4
 h3Jl8bNlX7UZZWYQP74VqRiu26yiUZYSiYEcR7cVdOemvOUaFg6hHFkmdc978bPu74sz
 qCv/4nAz+oYlr9o/8fBBdNAqu18/ozE12Qf2YCUkY8noxKop+UK49EI4HwEb+7t6s7kx
 1sZA==
X-Gm-Message-State: AOAM531OFjVGXlQovVChbCkz9ZjU78eaW9gZQijjfkftnC/aRP+o/c9o
 P5FOlfoQ2KIDqpjqmLht0pLeaIJF5EKs9i4nT+mhPAyyGOkQV7Qi0wgadC25IkQskQlwrDnkn8P
 7WKk6lYoPDbHEKtAzguaHH+iB/T6zkpaeRSyfD0tRO53bU6eSSXEvyPKPhiNWdeFc
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr7348272wri.241.1636625033169; 
 Thu, 11 Nov 2021 02:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8uKUyk48KXtBsvvZJmR27nxNoFZ4oYnJaypC7Hcg+O/VJxmmX5wsW3wxJWP5VWIsRUph72w==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr7348229wri.241.1636625032854; 
 Thu, 11 Nov 2021 02:03:52 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 9sm3434666wry.0.2021.11.11.02.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:03:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 0/6] tests/unit: Fix test-smp-parse
Date: Thu, 11 Nov 2021 11:03:45 +0100
Message-Id: <20211111100351.2153662-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet another approach to fix test-smp-parse.  v2 from Yanan Wang:=0D
https://lore.kernel.org/qemu-devel/20211111024429.10568-1-wangyanan55@huawe=
i.com/=0D
=0D
Here we use the QOM class_init() to avoid having to deal with=0D
object_unref() and deinit().=0D
=0D
I suggest to rename smp_parse() -> machine_parse_smp_config()=0D
after the rc0 more as a documentation change rather than an=0D
API change, since this method got added last week and doesn't=0D
follow the rest of the machine API.=0D
=0D
Supersedes: <20211111024429.10568-1-wangyanan55@huawei.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  tests/unit/test-smp-parse: Restore MachineClass fields after modifying=0D
  tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()=0D
  tests/unit/test-smp-parse: Explicit MachineClass name=0D
  tests/unit/test-smp-parse: Simplify pointer to compound literal use=0D
  tests/unit/test-smp-parse: Constify some pointer/struct=0D
  hw/core: Rename smp_parse() -> machine_parse_smp_config()=0D
=0D
 include/hw/boards.h         |   3 +-=0D
 hw/core/machine-smp.c       |   6 +-=0D
 hw/core/machine.c           |   2 +-=0D
 tests/unit/test-smp-parse.c | 123 +++++++++++++++++++-----------------=0D
 4 files changed, 72 insertions(+), 62 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


