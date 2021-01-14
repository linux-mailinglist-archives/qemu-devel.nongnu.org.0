Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B72F687D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:59:34 +0100 (CET)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06uC-0002QA-Sw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l06rC-0000dq-7x
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:56:27 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l06r7-00011H-RM
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:56:25 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EHnMFe104809;
 Thu, 14 Jan 2021 17:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=pN8bhhYvicmXNeiwFFBazmKowYkYlKUC8gFW/XKn2Mw=;
 b=prf1Ld4ASnMURrhfB21O+8dF2ZazMCvL7Dt7hBcnELYBIx2BBuSCSRiPw4RSOHG3Mt9k
 bKAAl4HClAv94qM2LQtilrLRrWc7zwBAxEhUC6TWUg+aPEFHb/tUb3qE6GrM9pLYiBKR
 vuIrAFbxfLueg0kLEsoKpJIRZf1BEKp0CZCZlafGmD6C6j16IA4ZrQrBxfzJpZa9K0jq
 B1AcV3b3kVOD0iDVaMqQgXf9orTJeXkfsEZS5Fm1gx3OPXb5b1Syywc2dN3/zGaY1XC5
 N62gNXXnS/9tNRKgxfTtxeUy1XZoYFM6GxQkwPi8FylMrOEGg61CiG9roTG+vNJ8Azug gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 360kvk9dae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 17:56:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EHosEP067282;
 Thu, 14 Jan 2021 17:56:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 360kenj235-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 17:56:04 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10EHu1lv027091;
 Thu, 14 Jan 2021 17:56:01 GMT
Received: from [10.39.255.240] (/10.39.255.240)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 09:56:01 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20210114162729.GB306329@stefanha-x1.localdomain>
Date: Thu, 14 Jan 2021 12:55:58 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
 <20210114162729.GB306329@stefanha-x1.localdomain>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140104
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 kraxel@redhat.com, quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 14, 2021, at 11:27 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
>=20
> On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
>> +int qio_channel_readv_full_all(QIOChannel *ioc,
>> +                               const struct iovec *iov,
>> +                               size_t niov,
>> +                               int **fds, size_t *nfds,
>> +                               Error **errp)
>> {
>> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
>> +    int ret =3D qio_channel_readv_full_all_eof(ioc, iov, niov, fds, =
nfds, errp);
>>=20
>>     if (ret =3D=3D 0) {
>> -        ret =3D -1;
>>         error_setg(errp,
>>                    "Unexpected end-of-file before all bytes were =
read");
>=20
> qio_channel_readv_full_all_eof() can read file descriptors but no data
> and return 0.
>=20
> Here that case is converted into an error and the file descriptors
> aren't closed, freed, and fds/nfds isn't cleared.

That=E2=80=99s a valid point. I=E2=80=99m wondering if the fix for this =
case should be in
qio_channel_readv_full_all_eof(), instead of here.

qio_channel_readv_full_all_eof() should probably return error (-1) if =
the
amount of data read does not match iov_size(). If the caller is only =
expecting
to read fds, and not any data, it would indicate that by setting iov to =
NULL
and/or setting niov=3D0. If the caller is setting these parameters, it =
means it is
expecting data.Does that sound good?

Thanks!=

