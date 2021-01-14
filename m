Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E32F6986
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:30:17 +0100 (CET)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Nw-000812-4b
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l07Ip-0003gW-JL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:24:59 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l07Im-0004aA-Qj
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:24:58 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EIDwgl071516;
 Thu, 14 Jan 2021 18:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=T48Htqu1uaIMuNVRpURuhQ1evjFs2dhEaVB1YyvWiXw=;
 b=Z0He24KwHJdMxo58n576g4T6lRZYFdxc2lWfybowV2pO6rp8gU0rffhF/m6b78jLjZH4
 LgS4H4bxMx7CEY2lurSj63Eg7SD26x6kvTJTGd+DJDlBNiSlDhhd0Gw6G2dp65qE0WMA
 uRNJiQ/vbYJ9c52rTOi2vXI9xfAPftDYdZgNWEl79ZuW1gDXPNItEO0YJaN48WJyozR4
 NsKlDeTFsCgz53aTHT1dDB2JE5+1WudQr8+21h4wWZY137nuQ2AP8WUqxRTlqqkwmjYy
 ZktDenEa08tuv3wp++cCWUu5yEP1i6F6B+qu1+t7GPZ58pDpUhz7WV+4yqYhFJTKzDnE gw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 360kg21mfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 18:24:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EIEcD4056698;
 Thu, 14 Jan 2021 18:24:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kf9v8ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 18:24:41 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10EIOd4Z009391;
 Thu, 14 Jan 2021 18:24:39 GMT
Received: from [10.39.255.240] (/10.39.255.240)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 10:24:39 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20210114180035.GY1643043@redhat.com>
Date: Thu, 14 Jan 2021 13:24:37 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1DE4BD83-5AD6-4F70-8702-03DE1548DBED@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
 <20210114162729.GB306329@stefanha-x1.localdomain>
 <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
 <20210114180035.GY1643043@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101140107
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
 alex.williamson@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 14, 2021, at 1:00 PM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Thu, Jan 14, 2021 at 12:55:58PM -0500, Jag Raman wrote:
>>=20
>>=20
>>> On Jan 14, 2021, at 11:27 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
>>>=20
>>> On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
>>>> +int qio_channel_readv_full_all(QIOChannel *ioc,
>>>> +                               const struct iovec *iov,
>>>> +                               size_t niov,
>>>> +                               int **fds, size_t *nfds,
>>>> +                               Error **errp)
>>>> {
>>>> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
>>>> +    int ret =3D qio_channel_readv_full_all_eof(ioc, iov, niov, =
fds, nfds, errp);
>>>>=20
>>>>    if (ret =3D=3D 0) {
>>>> -        ret =3D -1;
>>>>        error_setg(errp,
>>>>                   "Unexpected end-of-file before all bytes were =
read");
>>>=20
>>> qio_channel_readv_full_all_eof() can read file descriptors but no =
data
>>> and return 0.
>>>=20
>>> Here that case is converted into an error and the file descriptors
>>> aren't closed, freed, and fds/nfds isn't cleared.
>>=20
>> That=E2=80=99s a valid point. I=E2=80=99m wondering if the fix for =
this case should be in
>> qio_channel_readv_full_all_eof(), instead of here.
>>=20
>> qio_channel_readv_full_all_eof() should probably return error (-1) if =
the
>> amount of data read does not match iov_size(). If the caller is only =
expecting
>> to read fds, and not any data, it would indicate that by setting iov =
to NULL
>> and/or setting niov=3D0. If the caller is setting these parameters, =
it means it is
>> expecting data.Does that sound good?
>=20
> The API spec for the existing _eof() methods says:
>=20
> * The function will wait for all requested data
> * to be read, yielding from the current coroutine
> * if required.
> *
> * If end-of-file occurs before any data is read,
> * no error is reported; otherwise, if it occurs
> * before all requested data has been read, an error
> * will be reported.
>=20
>=20
> IOW, return '0' is *only* valid if we've not read anything. I consider
> file descriptors to be something.
>=20
> IOW, qio_channel_readv_full_all_eof must only return 0, if it didn't
> read any data and also didn't receive any file descriptors. So yeah,
> we must return -1 in the scenario Stefan describes

That makes sense to me. Reading =E2=80=9Cfds" is something, which is =
different
from our previous understanding. I thought data only meant iov, and not =
fds.

So the return values for qio_channel_readv_full_all_eof() would be:
  - =E2=80=980=E2=80=99 only if EOF is reached without reading any fds =
and data.
  - =E2=80=981=E2=80=99 if all data that the caller expects are read =
(even if the caller reads
    fds exclusively, without any iovs)
  - =E2=80=98-1=E2=80=99 otherwise, considered as error

qio_channel_readv_full_all() would return:
  - =E2=80=980=E2=80=99 if all the data that caller expects are read
  - =E2=80=98-1=E2=80=99 otherwise, considered as error

Hey Stefan,

    Does this sound good to you?

Thank you!
--
Jag

>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


