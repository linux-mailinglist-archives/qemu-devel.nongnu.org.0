Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D73A4BA6
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:12:58 +0200 (CEST)
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrGj-0005wg-K8
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqs9-0006Qm-Nh; Fri, 11 Jun 2021 19:47:33 -0400
Received: from mout.gmx.net ([212.227.15.18]:41067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqs6-0006Ae-Bw; Fri, 11 Jun 2021 19:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623455240;
 bh=vP3uOGjMT3j8oyBEIC9/FMpOxCFiqSWtFvHhqP58gD0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CY2i2JmMHAP36oa+CLMPILUqfZuabzrqpxkIZspysKTxtuf1a7GaVQORxcZpPz8+L
 y5nmntHCg+WhKHVe6Bt1au1tcVlqwFJGVIzQrnd0At1lA36ocCxnGJY0Xjlm7xXDKv
 psQQXTVyklhPsdchJta43dKXNlwA9ea8rnHHPzTs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MLR1V-1lZMHT260x-00IQrQ; Sat, 12
 Jun 2021 01:47:20 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] hw/nvme: namespace parameter for EUI-64
Date: Sat, 12 Jun 2021 01:46:28 +0200
Message-Id: <20210611234631.81314-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SmpuYZd23ddIcSqrvrOp9Uyz6g+qAEPAkxnp4cTR7AWyMzYLNgM
 S6VtJc2GQn4DdV19Ra2Yz2VLIaPf3dm12LaEPedYQZY5oQTCvLslMr49xveBYGb9+H4g+ac
 L2eKT+QHrcFdTgJ8mS6Xumb26Z+JKhhdt+bzec3uIXuCicBKxTgbzy6g/t0sZT2FQqxPUBl
 mYgZkMAUTZ2CcdP6he9NA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RMRjXU+mhi0=:A3aP7Eo4JfsoAkRkBhFZ7Y
 9TNbDKhAObU2wHcc7KwYJ0rTo6QsuxvhwXZLCu6fsoabVxD7Tod+ccxjcyVtoxe7Ylm6XoTqd
 8kbDBAi3xE8T0FEv0qAwQJNn+7wOtiaiL5Dh2ErLZde7S8iK2QcV8TKoA3WQI8CShoiGQI19Q
 nyXLlbWDGCZMfNkFV8Ywry2VDwR85lzVTltldRIkQ+qnhlypEFL0IMJQyE8yZztyH2vImTHoA
 3qqG9ANPclaqE16jK4s0EWibLSFMMZEUaMJCte9yA4Lmxlea02Bq5yB4Eq3i44R/3Vv12MY7b
 ETWUQbhMhv0me8wByD4q1BWvgGIDHPelZR8uy+FZ3hlc2guYzFUEVLk5zycz2ZDOGxI4lIdIv
 Kxq1/6GTggglTt+3BfbPwMq2ex61OLIho1b6Y3RmSa7ZXH28yTw9ycuGMwOSmxXNoAikJt/ZE
 OQ3HKfa2qFm2RG/SBI3xy38jhHWjnE1hlMqWYhfxJEB7oUnhmcJDB3Hg5of40fE++alGHjM9N
 JOoaPOJxzar8lLRUtmKWD6rrBQbrCDWkRAV+XdMVWfqol0dRsKYYXPictGsfq3gT+93IzmRdL
 EsWSqcy13o39Fr6T0AUQbo8Lw3/CmVVUsjYpzeP+/3T5+aYNyC83qQcTkigTWPeRNyCdN1SuR
 UEdnbn+aVZCHNcj8nmRr5yfXFgsu4xV0NPU0n+GN8v9CqF4zgfaolxNlg0IUC7Ng0Qqf8U3/l
 /dO7z/pbXRRNGQ+nCMZulPD/Uw/oyo+OkFxSCtAcHP8lROM9QrNoEzr72pAEZAaaWkB1ehx95
 H6YBErrsvuk4+k8i1kWFkwiZeafWHIPQXkglPOMHp+n3j+5Z8PnIzVxKwxoy4lCfzkprYO7ZD
 mH4WFtUEn1U3525p4ZzW5eRJXI/A3crALrY8j98QvNiv8Aby6aJV4jw3EcA8dYcPwZRbFfor2
 Rxr6RVDVj6e/vFWIkwCfLZFZrNOY58YM6OodeX8CjKBvG9vGRVInTVgTQ6gNwAYnJyPymTrVK
 hUE/ziW5kWsxdDBsi5LQkH4+AE5UOXBRBinirDnKTV5tQNSTcstN/CC8UpGzLj9nMAEWwPPE4
 fSFLEUZAf4Z0jtvsomCPUHc+WlqJUk2vrEC
Received-SPF: pass client-ip=212.227.15.18; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI-64.

v2:
	include patch for hw_compat_6_0
	add a patch to implement default values for the EUI-64

Heinrich Schuchardt (3):
  hw: virt: consider hw_compat_6_0
  hw/nvme: namespace parameter for EUI-64
  hw/nvme: default for namespace EUI-64

 docs/system/nvme.rst |  6 +++++
 hw/arm/virt.c        |  2 ++
 hw/core/machine.c    |  1 +
 hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
 hw/nvme/ns.c         | 11 +++++++++
 hw/nvme/nvme.h       |  3 +++
 6 files changed, 58 insertions(+), 23 deletions(-)

=2D-
2.30.2


