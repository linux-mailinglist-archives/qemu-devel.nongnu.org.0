Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC447F52
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 12:09:47 +0200 (CEST)
Received: from localhost ([::1]:45740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcoaA-0008KC-AW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 06:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hcoZC-0007rV-DN
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shmuel.eiderman@oracle.com>) id 1hcoZB-0003oz-GU
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:08:46 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
 id 1hcoZ9-0003n1-AA; Mon, 17 Jun 2019 06:08:43 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HA4cjV147887;
 Mon, 17 Jun 2019 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2018-07-02; bh=jA0YyvcX+AB7cRSOliw/8hbIVdgj+wj+sU+PNRJS6LI=;
 b=SphU6ou/nEucwVGKzTCn8MfDf8oofh522/ZQe4j1LQfaFOikpgj2P/yN7uO9C06U+Fo7
 ySbnJ6xynYGIGVTAHdIyGjJiIkvy/H1V1dO4NgprELQHr5ECqODqFIZ28R6r7KrsYuAO
 5LAtN2r7lw3myMEezXeyRU6k53oNlv5E9PanBxjfZzuzrryjBH2wJl+yehBqhDC0Dm25
 kI7S0pFzcF0k+l4z/Mf2Wy+YU1bRWGvU3YxcPGY6C0afwVnpyh8t899QVRjXfNbaIS4y
 NVOrkI/X0thNwfHwqC8pNLnpBR8ZxfqrOj+0j+ugdxkPCCE//PRljWfaVYCWvZ8WfAYS ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t4saq5mn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 10:08:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5HA8N1D169693;
 Mon, 17 Jun 2019 10:08:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t5mgb97yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 10:08:38 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5HA8b63012532;
 Mon, 17 Jun 2019 10:08:37 GMT
Received: from [10.74.125.44] (/10.74.125.44)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Jun 2019 03:08:36 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Sam Eiderman <shmuel.eiderman@oracle.com>
In-Reply-To: <20190617083842.xlicosythr2gtnvh@sirius.home.kraxel.org>
Date: Mon, 17 Jun 2019 13:08:30 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <34BC5303-962D-49BD-BA3F-56D1CD7E58CC@oracle.com>
References: <20190612115939.23825-1-shmuel.eiderman@oracle.com>
 <20190612115939.23825-8-shmuel.eiderman@oracle.com>
 <20190617072040.yriunmoffbjhvqc5@sirius.home.kraxel.org>
 <ECEA4896-C290-45A7-9574-D1704C63842C@oracle.com>
 <20190617083842.xlicosythr2gtnvh@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906170095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9290
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906170095
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: Re: [Qemu-devel] [QEMU] [PATCH v2 7/8] bootdevice: FW_CFG interface
 for LCHS values
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, arbel.moshe@oracle.com,
 seabios@seabios.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kevin@koconnor.net, liran.alon@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok,

I=E2=80=99ll resubmit this patch series in v3, as well as v2 for SeaBIOS =
soon enough.

* Change =E2=80=9Cbootdevices=E2=80=9D to =E2=80=9Cbios-geometry=E2=80=9D,=
 and remove the struct size
* Add cpu_to_le32 fix as Laszlo suggested or big endian hosts
* Fix last qtest commit - automatic docker tester for some reason does =
not have qemu-img set

Sam

> On 17 Jun 2019, at 11:38, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi,
>=20
>> Keep it extendible for a low price of ABI + =E2=80=9Cbootdevices=E2=80=9D=
 name.
>> Or go strict and rename to =E2=80=9Cbios-geometries=E2=80=9D?
>=20
> The name should reflect what is in there, so "bios-geometries" looks
> better to me.  I'd also keep it strict, unless we have at least a =
vague
> idea what might be a useful future extension.  I don't have any.
>=20
> cheers,
>  Gerd
>=20


