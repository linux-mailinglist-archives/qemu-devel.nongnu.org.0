Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE6C125120
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 19:59:00 +0100 (CET)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iheXD-0005Rn-Fc
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 13:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iheVz-0004kl-JG
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:57:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iheVu-0004Wv-4M
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:57:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23786
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iheVs-0004SK-7t
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576695453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EuBgiqTdkCEDux4xUxCFu/Qbf9yzvJQgfH7+vDIP2hA=;
 b=cp0olETOpapM3Vb9mgxAUGXzA/Mlgi4x+kwP+WZDCMSlTlGsnAzULw+qyCMRSqGK+tDpUo
 bb/V5tTM+RYOiMbh+o4Y0NRgqONPwW32CIWm7d/eJIkw+1AsNnz7AADfOYZvA5zdRyb9Ui
 QosRVbI+zpi6MH4PEq9W7tXHHsj39rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-m40PIVbZP4ivZJKwxuVmyw-1; Wed, 18 Dec 2019 13:57:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6A3800D4E;
 Wed, 18 Dec 2019 18:57:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A6610013A1;
 Wed, 18 Dec 2019 18:57:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] mailmap: Add more entries to sanitize 'git log' output
Date: Wed, 18 Dec 2019 19:57:23 +0100
Message-Id: <20191218185723.7738-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: m40PIVbZP4ivZJKwxuVmyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of these developers have the Signed-off-by tag properly
written, but not the author/commiter name. Fix this.
Also we incorrectly wrote Arei Gonglei name, update and reorder.

git-log does not use this file by default until you specify the
--use-mailmap flag:

  $ git log --use-mailmap

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .mailmap | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 3816e4effe..1a859d9e65 100644
--- a/.mailmap
+++ b/.mailmap
@@ -56,6 +56,10 @@ Aaron Lindsay <aaron@os.amperecomputing.com>
 Alexey Gerasimenko <x1917x@gmail.com>
 Alex Ivanov <void@aleksoft.net>
 Andreas F=C3=A4rber <afaerber@suse.de>
+Andreas F=C3=A4rber <andreas.faerber@web.de>
+Andreas F=C3=A4rber <andreas.faerber@web.de> <andreas.faerber>
+Arei Gonglei <arei.gonglei@huawei.com>
+Arei Gonglei <arei.gonglei@huawei.com> <root@ceth6.(none)>
 Bandan Das <bsd@redhat.com>
 Benjamin MARSILI <mlspirat42@gmail.com>
 Beno=C3=AEt Canet <benoit.canet@gmail.com>
@@ -67,27 +71,36 @@ Brad Smith <brad@comstyle.com>
 Brijesh Singh <brijesh.singh@amd.com>
 Brilly Wu <brillywu@viatech.com.cn>
 C=C3=A9dric Vincent <cedric.vincent@st.com>
+Chai Wen <chaiw.fnst@cn.fujitsu.com>
+Chaojian Hu <chaojianhu@hotmail.com>
 CheneyLin <linzc@zju.edu.cn>
+Chen Fan <chen.fan.fnst@cn.fujitsu.com>
 Chen Gang <chengang@emindsoft.com.cn>
 Chen Gang <gang.chen.5i5j@gmail.com>
 Chen Gang <gang.chen@sunrus.com.cn>
 Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
 Christophe Lyon <christophe.lyon@st.com>
+Christoph Hellwig <hch@lst.de>
 Collin L. Walling <walling@linux.ibm.com>
 Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Disheng Su <edison@cloud.com>
+Dunrong Huang <riegamaths@gmail.com>
 Eduardo Otubo <otubo@redhat.com>
 Fabrice Desclaux <fabrice.desclaux@cea.fr>
 Fernando Luis V=C3=A1zquez Cao <fernando_b1@lab.ntt.co.jp>
 Fernando Luis V=C3=A1zquez Cao <fernando@oss.ntt.co.jp>
 Gautham R. Shenoy <ego@in.ibm.com>
 Gautham R. Shenoy <ego@linux.vnet.ibm.com>
-Gonglei (Arei) <arei.gonglei@huawei.com>
 Guang Wang <wang.guang55@zte.com.cn>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
 Herv=C3=A9 Poussineau <hpoussin@reactos.org>
+Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
 Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu>
 Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
+Jay Zhou <jianjay.zhou@huawei.com>
 Jean-Christophe Dubois <jcd@tribudubois.net>
+Jean-Christophe Dubois <jcd@tribudubois.net> <jcd@jcd-laptop.(none)>
+Jia Lina <jialina01@baidu.com>
 Jind=C5=99ich Makovi=C4=8Dka <makovick@gmail.com>
 John Arbuckle <programmingkidx@gmail.com>
 Juha Riihim=C3=A4ki <juha.riihimaki@nokia.com>
@@ -96,9 +109,11 @@ Jun Li <junmuzi@gmail.com>
 Laurent Vivier <Laurent@lvivier.info>
 Leandro Lupori <leandro.lupori@gmail.com>
 Li Guang <lig.fnst@cn.fujitsu.com>
+Lili Huang <huanglili.huang@huawei.com>
 Liming Wang <walimisdev@gmail.com>
 linzhecheng <linzc@zju.edu.cn>
 Liran Schour <lirans@il.ibm.com>
+Li Tianqing <tianqing@unitedstack.com>
 Liu Yu <yu.liu@freescale.com>
 Liu Yu <Yu.Liu@freescale.com>
 Li Zhang <zhlcindy@gmail.com>
@@ -112,11 +127,14 @@ Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
 Marc Mar=C3=AD <markmb@redhat.com>
 Michael Avdienko <whitearchey@gmail.com>
 Michael S. Tsirkin <mst@redhat.com>
+Michael S. Tsirkin <mst@redhat.com> <mst@robin.(none)>
+Michael Tokarev <mjt@tls.msk.ru> <mjt@gandalf>
 Munkyu Im <munkyu.im@samsung.com>
 Nicholas Bellinger <nab@linux-iscsi.org>
 Nicholas Thomas <nick@bytemark.co.uk>
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
 Orit Wasserman <owasserm@redhat.com>
+Pan Nengyuan <pannengyuan@huawei.com>
 Paolo Bonzini <pbonzini@redhat.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
@@ -124,15 +142,23 @@ Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
 Peter Crosthwaite <peter.crosthwaite@petalogix.com>
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
+Peter Maydell <peter.maydell@linaro.org> <petmay01@cam-vm-266.(none)>
 Prasad J Pandit <pjp@fedoraproject.org>
 Prasad J Pandit <ppandit@redhat.com>
 Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
 Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
 Remy Noel <remy.noel@blade-group.com>
+Richard Henderson <rth@twiddle.net> <rth@anchor.twiddle.home>
 Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
 Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
+Siwei Zhuang <siwei.zhuang@data61.csiro.au>
+Sochin Jiang <sochin@aliyun.com>
 Sochin Jiang <sochin.jiang@huawei.com>
+Stefan Berger <stefanb@linux.ibm.com> <Stefan Berger stefanb@linux.vnet.ib=
m.com>
+Stefan Weil <sw@weilnetz.de> <stefan@kiwi.(none)>
+Stefan Weil <sw@weilnetz.de> <stefan@weilnetz.de>
+Stefan Weil <sw@weilnetz.de> <weil@mail.berlios.de>
 Takashi Yoshii <takasi-y@ops.dti.ne.jp>
 Thomas Huth <thuth@redhat.com>
 Thomas Knych <thomaswk@google.com>
@@ -150,6 +176,7 @@ Wenshuang Ma <kevinnma@tencent.com>
 Xiaoqiang Zhao <zxq_yx_007@163.com>
 Xinhua Cao <caoxinhua@huawei.com>
 Xiong Zhang <xiong.y.zhang@intel.com>
+Ying Fang <fangying1@huawei.com>
 Yin Yin <yin.yin@cs2c.com.cn>
 yuchenlin <npes87184@gmail.com>
 YunQiang Su <syq@debian.org>
--=20
2.21.0


