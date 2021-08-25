Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546303F7581
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:03:25 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsYt-0006ZA-TF
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangchn@me.com>) id 1mIjWM-0000F7-DI
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:24:10 -0400
Received: from pv50p00im-zteg10011501.me.com ([17.58.6.42]:49424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangchn@me.com>) id 1mIjWK-0000Jp-IP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1629861845; bh=u5NucTtGkcdeZDjg0PeJj8SBjDBs6AReLtoS/NnYf5M=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=lkOeD/8MMqEnbWv4z2yqCk4Yvwx+45bao6MBGm3NTZQze0i1fYjDvvleKPEINNhP6
 kK6lgjks99yMxEK4k2qa8fFhqP8RkGtTeDyZhxJUUnaWy3vtOe/ySRW6OORpubJLDv
 nt+LquGGFmzuAafJEfeJV9xkGm2ky55BmZayP/53qmog1AU6mvhHsj3dvLEh9Jw4C/
 5ezQGz6zzQeLGzTtx46HeX+Y/HjD1r5kLbBsLq/v3dMekApzuC9gMJ5spjLfuuMmYD
 h0NErn1Sp6NVOZt5ckHgeCuCnYGhH0ue8oM51cBpmzbnUUpB1NOQ95XANnIEf3bm+R
 EkbPIYD8XSH8g==
Received: from smtpclient.apple (unknown [117.10.132.216])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 0F277B003FE;
 Wed, 25 Aug 2021 03:24:04 +0000 (UTC)
From: Zhang Chen <zhangchn@me.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: edid support for a Mac OS 10.8 guest
Message-Id: <5078AA9C-374D-4522-B8C4-BAA70EFF901A@me.com>
Date: Wed, 25 Aug 2021 11:24:01 +0800
Cc: qemu-devel@nongnu.org
To: programmingkidx@gmail.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_01:2021-08-24,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=440 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108250019
Received-SPF: pass client-ip=17.58.6.42; envelope-from=zhangchn@me.com;
 helo=pv50p00im-zteg10011501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:22 -0400
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

> Hi, I recently tried using the edid feature in QEMU for my Mac OS 10.8 =
guest=20
> like this: -device VGA,edid=3Don,xres=3D1280,yres=3D800. When the =
guest operating=20
> system loaded there were no additional options available in the =
Display=20
> settings. Would you know what is wrong?
>=20
> Thank you.
You need increase VGA memory size with `vgamem_mb=3D64`.

Best regards,=

