Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E4186AD6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 13:27:52 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDoqU-0004ii-SU
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 08:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiangyifei@huawei.com>) id 1jDo7j-00060C-BA
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiangyifei@huawei.com>) id 1jDo7i-0002Dr-E3
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:41:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3206 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiangyifei@huawei.com>)
 id 1jDo7h-00015V-Vj
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:41:34 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 06690DC951B9B385B6C7;
 Mon, 16 Mar 2020 19:41:26 +0800 (CST)
Received: from huawei.com (10.133.201.158) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Mar 2020
 19:41:17 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] avoid integer overflow
Date: Mon, 16 Mar 2020 19:40:48 +0800
Message-ID: <20200316114050.3167-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.201.158]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, limingwang@huawei.com,
 victor.zhangxiaofeng@huawei.com, Yifei Jiang <jiangyifei@huawei.com>,
 pbonzini@redhat.com, rth@twiddle.net, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the constant default type is "int", when the constant is shifted to the l=
eft,
it may exceed 32 bits, resulting in integer overflowing. So constant type=
 need
change to "long"

Yifei Jiang (2):
  tcg: avoid integer overflow
  accel/tcg: avoid integer overflow

 accel/tcg/cputlb.c |  6 +++---
 tcg/tcg-op-gvec.c  | 18 +++++++++---------
 tcg/tcg-op-vec.c   |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

--=20
2.19.1



