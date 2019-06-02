Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D260C325A7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 01:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXa6Q-0002mM-2G
	for lists+qemu-devel@lfdr.de; Sun, 02 Jun 2019 19:41:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liran.alon@oracle.com>) id 1hXa5R-0002TO-7B
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 19:40:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liran.alon@oracle.com>) id 1hXa5P-0000Xb-CA
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 19:40:25 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <liran.alon@oracle.com>)
	id 1hXa5K-0000Fi-L0
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 19:40:22 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x52NeBgL100342; Sun, 2 Jun 2019 23:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=content-type :
	mime-version : subject : from : in-reply-to : date : cc :
	content-transfer-encoding : message-id : references : to;
	s=corp-2018-07-02; bh=YfGH64P/BjeVjuvbYmHdOmfFD+q2/Xv9H4aA9W2VlYs=;
	b=NPExSWhblX6qvNif5LMle4/Iz8ZJq+lFjGDKTJww41vZchBJEWQhLrw1xhlVGa2B50px
	jXPbkH9WWTexqRMgiaoxLiIcIwnFwg1xrE+Wy7zEngfENU9n4k6lIC+XYwvnmsiF6ntA
	mDYkElNrpzE0fw2wA4WLE8igrQ7VlPV5gYCH2s54ywJ9sr5z1JJpqLM+tMr+gnsYTFm8
	QvXlLmprcC1Ui+MQK6z+3UTbZ4a2jpXFuYXwEnJzkznUPB96aaTkEB/ndyEamjs033kf
	y6jfOIFZg+9EJiaaRDT1blYUk0hwsfGanRhtIKMHH/5T6uQEe0/hOlE7DSOMMd4bJNEE
	pQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 2suevd45x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 02 Jun 2019 23:40:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x52NdWcE189380; Sun, 2 Jun 2019 23:40:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2svbbuv52k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 02 Jun 2019 23:40:10 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x52Ne87J019488;
	Sun, 2 Jun 2019 23:40:08 GMT
Received: from [192.168.14.112] (/109.66.241.232)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 02 Jun 2019 16:40:08 -0700
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
From: Liran Alon <liran.alon@oracle.com>
In-Reply-To: <20190425135319-mutt-send-email-mst@kernel.org>
Date: Mon, 3 Jun 2019 02:40:04 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E3C459B-630A-4636-A660-11756467A011@oracle.com>
References: <20190416125912.44001-1-liran.alon@oracle.com>
	<20190418094101.GA23876@stefanha-x1.localdomain>
	<17635C1F-A477-4C0F-B052-2948D853E6CD@oracle.com>
	<20190425083819.GE30231@stefanha-x1.localdomain>
	<20190425135319-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3445.4.7)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9276
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=706
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906020174
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9276
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=749
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906020174
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.79
Subject: Re: [Qemu-devel] [PATCH v2 0/3] vhost-scsi: Support migration
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
Cc: ehabkost@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
	mtosatti@redhat.com, qemu-devel@nongnu.org,
	bijan.mottahedeh@oracle.com, pbonzini@redhat.com,
	nir.weiner@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any news on when this patch-series is expected to be merged to upstream =
QEMU?
It was accepted 2 months ago.

Thanks,
-Liran=20

> On 25 Apr 2019, at 20:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Thu, Apr 25, 2019 at 09:38:19AM +0100, Stefan Hajnoczi wrote:
>> On Wed, Apr 24, 2019 at 07:38:57PM +0300, Liran Alon wrote:
>>>=20
>>>=20
>>>> On 18 Apr 2019, at 12:41, Stefan Hajnoczi <stefanha@gmail.com> =
wrote:
>>>>=20
>>>> On Tue, Apr 16, 2019 at 03:59:09PM +0300, Liran Alon wrote:
>>>>> Hi,
>>>>>=20
>>>>> This patch series aims to add supprot to migrate a VM with a =
vhost-scsi device.
>>>>>=20
>>>>> The 1st patch fixes a bug of mistakenly not stopping vhost-scsi =
backend when a
>>>>> VM is stopped (As happens on migratino pre-copy completion).
>>>>>=20
>>>>> The 2nd patch adds ability to save/load vhost-scsi device state in =
VMState.
>>>>>=20
>>>>> The 3rd and final paqtch adds a flag to vhost-scsi which allows =
admin to specify
>>>>> it's setup supports vhost-scsi migratino. For more detailed =
information on why
>>>>> this is valid, see commit message of specific patch.
>>>>>=20
>>>>> Regards,
>>>>> -Liran
>>>>=20
>>>> Looks fine for vhost_scsi.ko.  I have not checked how this =
interacts
>>>> with vhost-user-scsi.
>>>>=20
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>=20
>>> Gentle Ping.
>>=20
>> This should go either through Michael's virtio/vhost tree or Paolo's
>> SCSI tree.
>>=20
>> Stefan
>=20
> OK I'll queue it.


