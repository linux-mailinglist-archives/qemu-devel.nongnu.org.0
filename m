Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02470345D9D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:06:26 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfnk-0002zg-IV
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOfmN-0001wX-On
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:04:59 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:64783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOfmL-0001sG-Ky
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1616501097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5WY9HMrl8jaChDtJxrN50jk+ols5EL9+SkzTcRdL/YE=;
 b=AmnTkTM3lWTgftNlnkW2C1e6oe/wFjfnpk7cYAhFcm5DZvj2XCx9AsVS
 dyRi1wJkGUw7vkOOvrijQ2THRKabNhjzrGf47qPQAtYLoa0rGMciTHcu8
 KrCr1BbNM4GBtyQX4y9ii/rmzCeoow7/BsGkLKxpbEXUYvrAmTeQxEICL M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GpiU+JWeIZ+DU3ro/0jFMSyMzCoZv5xAN5dsEjjv2rhda/AFNRNA+q4Q98EzpaVOI9olCHoNwU
 tJeRoW53gR3PLRaa5qjcv6TPnODzjMYvrLGpZbDHrsjpLoCfv7KfuWkSa9qcqPTqs1Dvv0XZhz
 W6AE2jpe7KCOxdmWh40JPkVO5cgT4nDjO2p8sKfEX14Kw836qWB9IcyZH4BbtThO9wariTvseN
 ZQ+upwDHrLmNKVVT422EULvnzF/0T2UzOhGX23jXvna5WzYTBzXjGfO6bJ2aXjR/3HpxFqTGX9
 rEs=
X-SBRS: 5.1
X-MesageID: 39891527
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Cdm20q9fD1XeGyifVeVuk+A6I+orLtY04lQ7vn1ZYzY9SKOlvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2/h1AZ6JWg76tGy0aLxz9IeK+UyGJwTS/vNQvJ
 0AT4FQE9v1ZGIWse/fwC2VV+kt28OG9qfAv5a9815IQRtxY69tqydVYzz6LmRMSANLBYU0Gf
 Onj6ItzQaIQngLct+9QkAMQumrnayuqLvdfRUECxQ7gTPhsRqU7tfBfySw71M7WzNLzaxKyx
 mnrzDE
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; d="scan'208";a="39891527"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 0/1] xen queue 2021-03-23
Date: Tue, 23 Mar 2021 12:04:38 +0000
Message-ID: <20210323120439.563855-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:

  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into staging (2021-03-22 18:50:25 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20210323

for you to fetch changes up to b807ca3fa0ca29ec015adcf4045e716337cd3635:

  xen-block: Fix removal of backend instance via xenstore (2021-03-23 11:18:20 +0000)

----------------------------------------------------------------
Xen patch

- Fix Xen backend block detach via xenstore.

----------------------------------------------------------------
Anthony PERARD (1):
      xen-block: Fix removal of backend instance via xenstore

 hw/block/xen-block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

