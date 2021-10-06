Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FB42436E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:54:47 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYABq-0000lp-2m
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA6s-0003vV-GN
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA6q-0007Fc-0v
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i6kw/g/pO0yUtJh+IN6ttJd4uN8mWRjPMYmGQpzDwkw=;
 b=cbqE0MskSHOesB2FA2/+miyt0A/rqzlCOHceN1yNfXcgbwmEA8GDV+Qo146vkWogmTAbAO
 LwEpwROLXv2uoiaxzvxy1LBCLKubo8pVhBKDeG6dy6kgs9lc4pKUftlHrqaKZuvRkEBTXD
 WdLIxOLdACWViggcxITfqDf72hK6JdM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-v1oFGkknOWmWI4ocTyzCeQ-1; Wed, 06 Oct 2021 12:49:34 -0400
X-MC-Unique: v1oFGkknOWmWI4ocTyzCeQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so2375205wrb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEMYrKuemVXhzKX2eczIqtkSQChXwsWeDrX3XqfMYjM=;
 b=QD/V32/4oeryAHrKJY167U9icArO6baXNpiNsTkbD8AWENc70YlEC+9yRWdWebc73O
 NTmm+pIcbyi82INowXaEZtAEvdTMoVaE4s2OFzzE/QmVQtGrto+HL8uUL59URBNS8Mr8
 ANpnvvfpBNsFDgN/YQeodM9eWwSo3ojjcDWsPyzQdKfDqwsAzbp/NbTWc7Z4rmRTpHJ5
 XYXX4QuFBBCuM91wfHBTAOR7K9ZupOvaTKViJMb97RV6k1YBeb/XCZI4kCr5qSaXnjwL
 wLwm7ylgYv26jrnZpFdodx+11RXXZMsOkgKu1EftjPHogq/ecXLoRhirqd9U+g9WNeH1
 9eYQ==
X-Gm-Message-State: AOAM531kEEhIB+/+oa53zlbwL1PSOntAiv1207mO8WZ1AJannY/AxadC
 0xfRcWvchN/21GvaFpzxNjq97uCj/siZIAQzTIOfEKImkrxE93Nev4kVYZKdsXNEhaRll3mOs0N
 DaXB1oswR1i6kLey3GWNEYiiaf+DNliFmS+0ydW9zesOZ+x+uFaG7IOXUXYG00CbH
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr5459177wrc.184.1633538973199; 
 Wed, 06 Oct 2021 09:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0dZlE5GL4/2Z6tK5zWHX/fQMjkWaDnABuNEiPMj0TCJhEEe50EfyBVeGXpY/UB+GV8krfGw==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr5459147wrc.184.1633538972933; 
 Wed, 06 Oct 2021 09:49:32 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z17sm5666397wml.24.2021.10.06.09.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] block/nvme: Fix a memory leak in nvme_free_queue_pair()
Date: Wed,  6 Oct 2021 18:49:26 +0200
Message-Id: <20211006164931.172349-1-philmd@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
While searching for a memory corruption in the NVMe block driver,=0D
Valgrind revealed one leak. It is not what I'm looking for, but=0D
worth fixing (at least one warning removed from the huge valgrind=0D
report).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  block/nvme: Automatically free qemu_memalign() with QEMU_AUTO_VFREE=0D
  block/nvme: Display CQ/SQ pointer in nvme_free_queue_pair()=0D
  block/nvme: Extract nvme_free_queue() from nvme_free_queue_pair()=0D
  block/nvme: Pass BDRVNVMeState* handle to nvme_free_queue_pair()=0D
  block/nvme: Fix memory leak from nvme_init_queue()=0D
=0D
 block/nvme.c       | 31 +++++++++++++++++--------------=0D
 block/trace-events |  2 +-=0D
 2 files changed, 18 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


