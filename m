Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F293FE593
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 01:02:43 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLZFi-0000wG-9l
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 19:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD3-0007KT-IY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 18:59:57 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:15890
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD0-0001jS-EH
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 18:59:57 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 181Mw535003151
 for <qemu-devel@nongnu.org>; Wed, 1 Sep 2021 15:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=vLpQSiv1KX3TInMV87Lqn+ph2VhFme0+494mZrhJA1A=;
 b=dw0A+5kFeWr9bD4Fp3DFODbPgFHzNSaUyJPkCrzkl2oIYea/JE+EKjnfVzeMkzWCwkKl
 gv0f5WdeGsntKsrxjM46y3bRpv+rdeIsAuDHQUD7/lDiXn1OCg17GOMxMIaydEpwFUaD
 9EyXxOdUf1D7Oz07sLRKZgradVRoMHC9VzQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 3atdyh4nb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 15:59:52 -0700
Received: from intmgw002.46.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:59:51 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 744C317DA286; Wed,  1 Sep 2021 15:59:47 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
Date: Wed, 1 Sep 2021 15:59:45 -0700
Message-ID: <20210901225946.500125-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 2zaa-1h6_duz_P3a9ebzpOdQRYjG5VMg
X-Proofpoint-ORIG-GUID: 2zaa-1h6_duz_P3a9ebzpOdQRYjG5VMg
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109010135
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

Adding a new Aspeed AST2600 machine type, uses MAC3 for ethernet1 and
UART1 for the serial console, which is different than the existing
ast2600-evb. Otherwise though, my usage so far hasn't required a
different set of hardware strap registers or anything, so I just
inherited the rest of the configuration from the ast2600-evb. If
preferred, I can eliminate the inheritance and just declare Fuji
completely independently.

I included more info in the commit message, but just for convenience,
here's the DTS link and a link to an image I'm providing for the
acceptance test.

https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch=
/arm/dts/aspeed-bmc-facebook-fuji.dts
https://github.com/peterdelevoryas/openbmc/releases/download/fuji-v0.1-alph=
a/fuji.mtd

I'm not sure exactly what the requirements are on the image url
provided, or the requirements of the image itself.

The existing OpenBMC acceptance tests mostly use images from the Linux
Foundation repository's releases, e.g.

https://github.com/openbmc/openbmc/releases/download/2.9.0/obmc-phosphor-im=
age-romulus.static.mtd

Although, I do see one image from a regular user's repo:

https://github.com/hskinnemoen/openbmc/releases/download/20200711-gsj-qemu-=
0/obmc-phosphor-image-gsj.static.mtd.gz

So maybe it's not that unreasonable? I also might be able to organize a
release link on the official Facebook OpenBMC Github.

As far as the actual requirements of the acceptance test, I didn't use
the existing "do_test_arm_aspeed" because Fuji was sufficiently
different (different U-Boot version, kernel address, CPU, SPI control
register, doesn't use systemd), but I could try unifying them if there's
interest or suggestions on how to do so.

By the way, Fuji takes a long time to boot on my Macbook:

(19/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_as=
t2600_fuji_openbmc: PASS (85.13 s)

The next longest boot time is <20 seconds:

17/38) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast=
2500_romulus_openbmc_v2_9_0: PASS (17.46 s)

Not sure if that's a problem for the CIT infra time or not.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Add Fuji machine type

 hw/arm/aspeed.c                        | 14 ++++++++++++++
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

--=20
2.30.2


