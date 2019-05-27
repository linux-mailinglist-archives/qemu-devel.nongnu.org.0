Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32102B02C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 10:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVAzA-00034M-4v
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 04:28:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hVAy7-0002fc-Go
	for qemu-devel@nongnu.org; Mon, 27 May 2019 04:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shmuel.eiderman@oracle.com>) id 1hVAy6-0002gy-Mv
	for qemu-devel@nongnu.org; Mon, 27 May 2019 04:26:55 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shmuel.eiderman@oracle.com>)
	id 1hVAy4-0002Vy-HY; Mon, 27 May 2019 04:26:52 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x4R8IvXD067126; Mon, 27 May 2019 08:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : message-id :
	content-type : mime-version : subject : date : in-reply-to : cc : to :
	references; s=corp-2018-07-02;
	bh=79DQ0SyVkb5ix3coXVrXpZP2iCyqevVAFfu1q6efoVY=;
	b=MdhJZcFJ0v4fOy7jBUo9dC51Sb2Dv128pL6reVBgsJlCDcLtvCMhqCmdm5oGe/XUuIcV
	3KrAbJkdvlNuHqy0Wg3ZpJ/R0vhxIaWUVQNkKP1mqsX/nikuPYD6HYw0q37/ratF/qnk
	bgNB4HVD3ro/GS6Ti7z5f0H+mJTMlpxNMNIh6uqJcbGXivQ4haNgHt4BDpplgw7Nj2RP
	EIQAg1K+h4tXJbQKEVLqB6qosYSVa8SVYmZPUuaOR3+0TbCfWR7ypYLoXplHGxrFoW0Z
	ixFmi/MIUpp1aiMHoNmOyJpzXRuDTOzVNnVARUHuakodbkyPYWNdweBRO1robkFXJxmv
	aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2spw4t4xsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 May 2019 08:26:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x4R8QJtC170909; Mon, 27 May 2019 08:26:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2sqh72k1ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 May 2019 08:26:37 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4R8Qaco024054;
	Mon, 27 May 2019 08:26:36 GMT
Received: from [10.74.104.80] (/10.74.104.80)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 27 May 2019 01:26:36 -0700
From: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-Id: <99A38D7A-E358-41E7-9FFE-184EF4B5A22D@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Mon, 27 May 2019 11:26:29 +0300
In-Reply-To: <7687F664-4BC3-47B9-A6CB-1B9B72ED80C2@oracle.com>
To: fam@euphon.net, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
References: <20190424074901.31430-1-shmuel.eiderman@oracle.com>
	<7687F664-4BC3-47B9-A6CB-1B9B72ED80C2@oracle.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9269
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1905270059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9269
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905270059
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.86
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 0/2]: vmdk: Add read-only support for the
 new seSparse format
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eyal.moscovici@oracle.com, Arbel Moshe <arbel.moshe@oracle.com>,
	yuchenlin@synology.com, qemu-devel@nongnu.org,
	liran.alon@oracle.com, Karl Heubaum <karl.heubaum@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping

> On 12 May 2019, at 11:14, Sam <shmuel.eiderman@oracle.com> wrote:
>=20
> Gentle ping on "[PATCH 2/2] vmdk: Add read-only support for seSparse =
snapshots=E2=80=9D.
> Yuchenlin reviewed "[PATCH 1/2] vmdk: Fix comment regarding max =
l1_size coverage=E2=80=9D.
>=20
> Thanks, Sam
>=20
>> On 24 Apr 2019, at 10:48, Sam Eiderman <shmuel.eiderman@oracle.com =
<mailto:shmuel.eiderman@oracle.com>> wrote:
>>=20
>> VMware introduced a new snapshot format in VMFS6 - seSparse (Space
>> Efficient Sparse) which is the default format available in ESXi 6.7.
>> Add read-only support for the new snapshot format.
>>=20
>=20

