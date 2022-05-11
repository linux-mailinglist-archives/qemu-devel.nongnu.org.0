Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89835523E09
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 21:54:37 +0200 (CEST)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nosPs-0006tA-N3
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 15:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norLZ-0006cB-8T
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:46:05 -0400
Received: from 66-220-155-178.mail-mxout.facebook.com ([66.220.155.178]:40039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norLW-0003qI-3Z
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:46:05 -0400
Received: by devvm5719.atn0.facebook.com (Postfix, from userid 279525)
 id 7B0B113B0B86; Wed, 11 May 2022 11:45:40 -0700 (PDT)
To: 
Cc: irischenlj@fb.com, pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, patrick@stwcx.xyz
Subject: [PATCH 0/1] hw: allow write_enable latch get/set
Date: Wed, 11 May 2022 11:45:38 -0700
Message-Id: <20220511184539.1099161-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.155.178;
 envelope-from=irischenlj@devvm5719.atn0.facebook.com;
 helo=66-220-155-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 15:50:19 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Iris Chen <irischenlj@fb.com>
From:  Iris Chen via <qemu-devel@nongnu.org>

Hey everyone,=20

My patch adds the get/set property for the write_enable latch. Currently,=
 it is not an exposed property but this change adds QOM visibility and ma=
kes this property modifiable.=20

Acceptance tests have also been added to verify the value in the status r=
egister (after the value is set).=20

Thanks,=20
Iris

Iris Chen (1):
  hw: allow write_enable latch get/set

 hw/block/m25p80.c             | 30 ++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

--=20
2.30.2


