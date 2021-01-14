Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD02F654A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:58:50 +0100 (CET)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l051O-0000Es-06
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04kV-0001DC-Jv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:41:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:50980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04kT-0001VB-BQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:41:23 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYBnv149877;
 Thu, 14 Jan 2021 15:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=Q+MYlewq+O0OSc1V0KeJ1mHK3RBeKKZb8JEyFJC1Wrk=;
 b=ZmHHsnTKt5fkPDVyTYja6YHFmccqn110bPhlmZaTQWtbS32Ik27oBEH4oHbRoxi6Fe+b
 IFxWYhsJmU30/swcRy94efpXNx2Hr2nCinJaJK4t6Vdx2gyEI81VYO8vJk9TcPEMKWkq
 mNwvk6AHmRWbnJV7ZsdkDEoOJuHWIizVfeUNxVTGGFQw6c5Xr3bjtzmZjNaW783EQly+
 sdBr+uYubVYj3HhuI54t2vqtZUCtZvDKa/Z45RQhG1zM/gruT02cAJxFn5sLhC3Hy8Rw
 8HlV6+x4DTp3y/rhARyOWet3JWQX6/FgQrFKIG+rx/3P8zzm4a2TUO2J1AceaGEKpxIK pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd00sad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:41:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYsnE093491;
 Thu, 14 Jan 2021 15:41:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kf9p06f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:41:12 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10EFfBti016925;
 Thu, 14 Jan 2021 15:41:11 GMT
Received: from dhcp-10-39-210-188.vpn.oracle.com (/10.39.210.188)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 07:41:10 -0800
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20210114134904.GC299876@stefanha-x1.localdomain>
Date: Thu, 14 Jan 2021 10:41:08 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B39CA0EF-18D0-4F06-83F2-7D3FA24D05BC@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
 <68865004c4ecce557214bac5b3c527cfe3681b77.1610570756.git.jag.raman@oracle.com>
 <20210114134904.GC299876@stefanha-x1.localdomain>
To: Stefan Hajnoczi <stefanha@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 Gerd Hoffmann <kraxel@redhat.com>, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 14, 2021, at 8:49 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
>=20
> On Wed, Jan 13, 2021 at 03:53:27PM -0500, Jagannathan Raman wrote:
>>     while (nlocal_iov > 0) {
>>         ssize_t len;
>> -        len =3D qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
>> +        len =3D qio_channel_readv_full(ioc, local_iov, nlocal_iov, =
local_fds,
>> +                                     local_nfds, errp);
>>         if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
>>             if (qemu_in_coroutine()) {
>>                 qio_channel_yield(ioc, G_IO_IN);
>> @@ -112,20 +140,41 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>                 qio_channel_wait(ioc, G_IO_IN);
>>             }
>>             continue;
>> -        } else if (len < 0) {
>> -            goto cleanup;
>> -        } else if (len =3D=3D 0) {
>> -            if (partial) {
>> +        }
>> +
>> +        if (len <=3D 0) {
>> +            if ((len =3D=3D 0) && partial) {
>> +                size_t fd_idx =3D 0;
>> +
>>                 error_setg(errp,
>>                            "Unexpected end-of-file before all bytes =
were read");
>> -            } else {
>> +
>> +                if (nfds) {
>> +                    fd_idx =3D *nfds;
>> +                    *nfds =3D 0;
>> +                }
>> +
>> +                while (fds && fd_idx) {
>> +                    close((*fds)[fd_idx - 1]);
>> +                    fd_idx--;
>> +                }
>> +
>> +                if (fds) {
>> +                    g_free(*fds);
>> +                    *fds =3D NULL;
>> +                }
>> +            } else if (len =3D=3D 0) {
>>                 ret =3D 0;
>>             }
>=20
> The len < 0 case is missing. This function will return -1 and errp has
> been set by qio_channel_readv_full(). However, we may have received =
fds
> in a previous loop iteration (partial =3D=3D true), so it is necessary =
to
> close, free, and reset fds/nfds before returning.

Thanks for the feedback, Stefan! We have addressed this and sent the =
next version out for review.


