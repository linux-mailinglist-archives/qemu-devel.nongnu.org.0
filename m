Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1836C7CE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:34:56 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOnf-0003Di-O2
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lbOmJ-0001xd-SM
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:33:31 -0400
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52]:57237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lbOmI-00067Y-67
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1619534007;
 bh=KUUS3oSuML0QSoMV8E9GpGqhj48vgz4fWZQ2O5vUUgo=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=zCP4UpiEZQNN0l513UPx47TUn/zCjszYjuSdje1L3ZlcDeNh3JF3J8SzG8GJJpXQh
 /mwjjefI+vPd6t0Ctq7gd8YJpcvWzaGm/W+yANvdldRgGNuMwDVh9TrbqYOaNLqA+K
 Uf4ssCZLCHSR6JvWVTBKzVOx5sJDmIZ3108dC2rWVuN422kkFBxFBnjIDKaf7LNQmH
 rSkvZpwJ725VdIts1XXAP8H02Xx05fV7zrzsApFiPigZnqT1I1tQ97gyAodQkHRKtS
 H6jkWH59FSLVf2Q56WH6yGltlw9ZrOAyUSBSBGgwW3HohBo5tgFMhWZ2qEVTuvBnma
 2VZOQZV7hYtjg==
Received: from [192.168.50.241] (unknown [112.65.4.76])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 8C891660499;
 Tue, 27 Apr 2021 14:33:26 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 27 Apr 2021 22:33:22 +0800
Subject: How to understand vvfat
Message-Id: <F32ECA9D-5F73-4463-8AAE-BD9ECE3B7071@icloud.com>
To: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: iPhone Mail (18D70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_08:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=696 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104270105
Received-SPF: pass client-ip=17.58.6.52;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-tydg10011801.me.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,
Recently I=E2=80=99m learning QEMU storage. I think the two structures are v=
ery important, BlockBackend and BlockDriver. Usually BlockBackend resides in=
 the block device structure like disk, flash etc and the block device is sto=
rage device seen by guest OS and driver. BlockDriver will handle the stuff w=
ith host. Hope my understanding isn=E2=80=99t wrong.

And vvfat is BlockDriver, can I understand it as: it is constructing a raw d=
isk image (based on the host directory) which can be read by guest? If my ba=
re meta guest setup a fat filesystem, the raw disk image can be read and wri=
te correctly?

Thanks a lot=20=

