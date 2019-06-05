Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B63628D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 19:29:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYZj5-0003h5-JV
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 13:29:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYZhW-0003EJ-5b
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 13:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lidong.chen@oracle.com>) id 1hYZhU-0001YV-8r
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 13:27:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:55798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lidong.chen@oracle.com>)
	id 1hYZhS-0001Uy-Cy
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 13:27:48 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x55HOxO9161678; Wed, 5 Jun 2019 17:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=kc7atfJXY1jEXrFbooe4Qyogz4QpihbvrQzsS+4pyQI=;
	b=xdsueHE7dy9g0KJX4Vr3QKw9gLAVhBm6CoHxeGG3gja9DYFpQv1fx9aQkTqOb0ClKmBt
	fWT4RrJNov8H8UgMtAZQHUGHymywrwm/wIl1mBxHhmpbdIGOE96oqvCmby3b/HUXyRQ1
	bBUd+Mmd+ryKulbAGiALfJd0u7MRIn8KvT2TUHdz/VTlHPo1h9BZVVhJPJEFyBq6DJoW
	JSMZjn3bEcpG24VGVQ6G0UmX5xc3ePhA2v6YazRaWRNrre9dAhvlKAJfOWm0U8QQkJU+
	vEN0vQXSULlXKWoDZMX7HI6aUgXeALkNXHKSnvsi/oAvsQSRPgSC1QTzCawzwMTOAegK
	cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 2suevdmbcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 17:27:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x55HNsSC060403; Wed, 5 Jun 2019 17:25:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 2swngj0npr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jun 2019 17:25:34 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x55HPXlU007497;
	Wed, 5 Jun 2019 17:25:33 GMT
Received: from [10.159.243.231] (/10.159.243.231)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 05 Jun 2019 10:25:32 -0700
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <cover.1559710447.git.lidong.chen@oracle.com>
	<2410fe0d6dc7d5afdec8e3b8901b32e71ed303a5.1559710447.git.lidong.chen@oracle.com>
	<9fdf1275-b2b5-c823-9213-2f3021ebd6a8@redhat.com>
From: Lidong Chen <lidong.chen@oracle.com>
Organization: Oracle Corporation
Message-ID: <6d2d6381-0e02-d3ca-0a44-b845b2c4fd0b@oracle.com>
Date: Wed, 5 Jun 2019 10:25:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9fdf1275-b2b5-c823-9213-2f3021ebd6a8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906050108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906050109
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2130.oracle.com id
	x55HOxO9161678
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.79
Subject: Re: [Qemu-devel] [Qemu-devel PATCH v2 2/2] util/main-loop: Fix
 incorrect assertion
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, liran.alon@oracle.com,
	liq3ea@gmail.com, armbru@redhat.com, darren.kenny@oracle.com,
	marcandre.lureau@gmail.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/5/2019 1:57 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> This patch doesn't seem related to the series cover.
I will resent the patch to include more details to the cover.
>
> On 6/5/19 8:21 AM, Lidong Chen wrote:
>> The check for poll_fds in g_assert() was incorrect. The correct assert=
ion
>> should check "n_poll_fds + w->num <=3D ARRAY_SIZE(poll_fds)" because t=
he
>> subsequent for-loop is doing access to poll_fds[n_poll_fds + i] where =
i
>> is in [0, w->num).
>>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

Liam Merwick also suggested this fix. So, added him as well.

Thanks,

Lidong

>
>> Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
>> Reviewed-by: Liran Alon <liran.alon@oracle.com>
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>> ---
>>   util/main-loop.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/main-loop.c b/util/main-loop.c
>> index e1e349c..a9f4e8d 100644
>> --- a/util/main-loop.c
>> +++ b/util/main-loop.c
>> @@ -422,7 +422,7 @@ static int os_host_main_loop_wait(int64_t timeout)
>>       g_main_context_prepare(context, &max_priority);
>>       n_poll_fds =3D g_main_context_query(context, max_priority, &poll=
_timeout,
>>                                         poll_fds, ARRAY_SIZE(poll_fds)=
);
>> -    g_assert(n_poll_fds <=3D ARRAY_SIZE(poll_fds));
>> +    g_assert(n_poll_fds + w->num <=3D ARRAY_SIZE(poll_fds));
>>  =20
>>       for (i =3D 0; i < w->num; i++) {
>>           poll_fds[n_poll_fds + i].fd =3D (DWORD_PTR)w->events[i];
>>

