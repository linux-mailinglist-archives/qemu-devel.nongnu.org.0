Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF32F7DF2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:17:49 +0100 (CET)
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PvA-0002WV-8l
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l0PQx-0008Vt-ML
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:46:35 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l0PQv-0005IY-4E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:46:35 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FDdoXj042277;
 Fri, 15 Jan 2021 13:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=l6o150Qobd+z+/TFQoNvqCHflSA2zkP7AYhx4ty+cGQ=;
 b=SQjGt7OyXh8p80Zk4Z/gbQCOdL9Y/4KxaJW/MXgbn8zGxg+Syv9NJqQNVlHYL8y3o1eb
 EV8dSNRrVhGLF1Rj8dDe2bFPRSxGoanGCtynOznB3gGQjnV6q6HXGPuDYdWjZ3PLcccU
 v+QuMnhWc8HbsCQIMTYsoLslO8llEnMYYZru89oHMnoZa+EOgLZ2StjYsHz4MzjKsEmc
 AZnEWp2e8Sm1tso5/2sjtB4If/YryJbcMLq5HM5Id7MqLyyknYpnMUuLbPDp6sQOFZ8W
 KRvtVzpPWCNOwiasXQUK+2Pf7A1K2je+9d/g98cmDbPDgdZ5nMZ8wB+OuxfnnvEn47h6 gA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 360kg24ycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 13:46:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FDf1Ha051260;
 Fri, 15 Jan 2021 13:46:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 360kepw8hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 13:46:12 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FDk9HN001025;
 Fri, 15 Jan 2021 13:46:10 GMT
Received: from dhcp-10-39-193-44.vpn.oracle.com (/10.39.193.44)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 05:46:09 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20210115092017.GA334489@stefanha-x1.localdomain>
Date: Fri, 15 Jan 2021 08:46:07 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <62563EA4-2C73-450E-A96B-2D8014E4ED03@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
 <20210114162729.GB306329@stefanha-x1.localdomain>
 <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
 <20210114180035.GY1643043@redhat.com>
 <1DE4BD83-5AD6-4F70-8702-03DE1548DBED@oracle.com>
 <20210115092017.GA334489@stefanha-x1.localdomain>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150085
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 15, 2021, at 4:20 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
>=20
> On Thu, Jan 14, 2021 at 01:24:37PM -0500, Jag Raman wrote:
>>=20
>>=20
>>> On Jan 14, 2021, at 1:00 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>=20
>>> On Thu, Jan 14, 2021 at 12:55:58PM -0500, Jag Raman wrote:
>>>>=20
>>>>=20
>>>>> On Jan 14, 2021, at 11:27 AM, Stefan Hajnoczi =
<stefanha@redhat.com> wrote:
>>>>>=20
>>>>> On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
>>>>>> +int qio_channel_readv_full_all(QIOChannel *ioc,
>>>>>> +                               const struct iovec *iov,
>>>>>> +                               size_t niov,
>>>>>> +                               int **fds, size_t *nfds,
>>>>>> +                               Error **errp)
>>>>>> {
>>>>>> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
>>>>>> +    int ret =3D qio_channel_readv_full_all_eof(ioc, iov, niov, =
fds, nfds, errp);
>>>>>>=20
>>>>>>   if (ret =3D=3D 0) {
>>>>>> -        ret =3D -1;
>>>>>>       error_setg(errp,
>>>>>>                  "Unexpected end-of-file before all bytes were =
read");
>>>>>=20
>>>>> qio_channel_readv_full_all_eof() can read file descriptors but no =
data
>>>>> and return 0.
>>>>>=20
>>>>> Here that case is converted into an error and the file descriptors
>>>>> aren't closed, freed, and fds/nfds isn't cleared.
>>>>=20
>>>> That=E2=80=99s a valid point. I=E2=80=99m wondering if the fix for =
this case should be in
>>>> qio_channel_readv_full_all_eof(), instead of here.
>>>>=20
>>>> qio_channel_readv_full_all_eof() should probably return error (-1) =
if the
>>>> amount of data read does not match iov_size(). If the caller is =
only expecting
>>>> to read fds, and not any data, it would indicate that by setting =
iov to NULL
>>>> and/or setting niov=3D0. If the caller is setting these parameters, =
it means it is
>>>> expecting data.Does that sound good?
>>>=20
>>> The API spec for the existing _eof() methods says:
>>>=20
>>> * The function will wait for all requested data
>>> * to be read, yielding from the current coroutine
>>> * if required.
>>> *
>>> * If end-of-file occurs before any data is read,
>>> * no error is reported; otherwise, if it occurs
>>> * before all requested data has been read, an error
>>> * will be reported.
>>>=20
>>>=20
>>> IOW, return '0' is *only* valid if we've not read anything. I =
consider
>>> file descriptors to be something.
>>>=20
>>> IOW, qio_channel_readv_full_all_eof must only return 0, if it didn't
>>> read any data and also didn't receive any file descriptors. So yeah,
>>> we must return -1 in the scenario Stefan describes
>>=20
>> That makes sense to me. Reading =E2=80=9Cfds" is something, which is =
different
>> from our previous understanding. I thought data only meant iov, and =
not fds.
>>=20
>> So the return values for qio_channel_readv_full_all_eof() would be:
>>  - =E2=80=980=E2=80=99 only if EOF is reached without reading any fds =
and data.
>>  - =E2=80=981=E2=80=99 if all data that the caller expects are read =
(even if the caller reads
>>    fds exclusively, without any iovs)
>>  - =E2=80=98-1=E2=80=99 otherwise, considered as error
>>=20
>> qio_channel_readv_full_all() would return:
>>  - =E2=80=980=E2=80=99 if all the data that caller expects are read
>>  - =E2=80=98-1=E2=80=99 otherwise, considered as error
>>=20
>> Hey Stefan,
>>=20
>>    Does this sound good to you?
>=20
> The while (nlocal_iov > 0) loop only runs if the caller has requested =
to
> read at least some data, so the fds-only case doesn't work yet.
>=20
> This suggests that no current QEMU code relies on the fds-only case.
> Therefore you could change the doc comment to clarify this instead of
> adding support for this case to the code.
>=20
> But if you would to fully support the fds-only case that would be even
> better.

Thanks for confirming, Stefan!

Since we are adding fds support in this patch, I suppose we could add
the fds-only case since you feel that=E2=80=99s a better approach.

I believe it=E2=80=99s reasonable to assume that the caller wants to =
read file
descriptors if it sets the fds double-pointer. I think it would be =
reasonable
to wait for data if the caller expects to read either data or fds, as =
follows:
while ((nlocal_iov > 0) || local_fds)

Thank you!=20

>=20
> Stefan


