Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02555180B6A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 23:23:01 +0100 (CET)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBnHA-0003kG-2X
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 18:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jBnGP-0003J1-FH
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 18:22:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jBnGM-0001VT-KT
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 18:22:13 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jBnGM-0001TC-Aw
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 18:22:10 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02AMFFAK054398;
 Tue, 10 Mar 2020 22:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=IEb73A688TA3Oj5ZjE/ndSQpwXElWeD+1rtKLnrhcDM=;
 b=whREY6mQuGtExQFEj1Q2A92hxXekIF+GZTCgMOyON3vKczSsDnk+5MIgt/aw6HckNGzN
 VARot0PcAUbowEsZt2wGqVPspjKn5b9RxXh0ilwsx2Kt75gyxsHh5CYf5mRnl0WAOEBx
 lBIkT+6jgwXotEA3UIs1bsxTwn00qGy+eLF5kEKQV0l7bLkQ/W8sqOrMCDOTNk19rRKm
 81kYBSzVLRuUkVL19vn1H/1zyyPdVEbVxUZkoSIon/VF6WwDWslU4hp8bDTa21btW/BM
 h6kp11nQuD7hIoaPW/f9E2rDF5Ey9Ze3L0EGFxoVvnodG86kWSYBtgBQRU9FhJYjNqoh 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2yp7hm4qae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 22:22:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02AMCTb7085513;
 Tue, 10 Mar 2020 22:20:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2yp8nw43kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 22:20:06 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02AMK3ii016599;
 Tue, 10 Mar 2020 22:20:04 GMT
Received: from [192.168.14.112] (/79.181.212.171)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 15:20:03 -0700
Subject: Re: [PATCH v2 00/16]: hw/i386/vmport: Bug fixes and improvements
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200310165332.140774-1-liran.alon@oracle.com>
 <20200310133932-mutt-send-email-mst@kernel.org>
 <bcf7f439-7954-a6dc-322e-f8cbddd51d24@oracle.com>
 <20200310164239-mutt-send-email-mst@kernel.org>
 <b191ba0e-a864-fdc2-a029-c22783eb0106@oracle.com>
 <20200310173020-mutt-send-email-mst@kernel.org>
 <95fdfa38-1ef1-8735-2d50-e24c8a909144@oracle.com>
 <20200310175825-mutt-send-email-mst@kernel.org>
From: Liran Alon <liran.alon@oracle.com>
Message-ID: <b7e638a0-959a-4db0-7056-a0ab490a404b@oracle.com>
Date: Wed, 11 Mar 2020 00:19:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310175825-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003100132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100132
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: nikita.leshchenko@oracle.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/03/2020 0:00, Michael S. Tsirkin wrote:
> On Tue, Mar 10, 2020 at 11:57:49PM +0200, Liran Alon wrote:
>> On 10/03/2020 23:44, Michael S. Tsirkin wrote:
>>> On Tue, Mar 10, 2020 at 02:29:42PM -0700, Liran Alon wrote:
>>>> On 10/03/2020 22:56, Michael S. Tsirkin wrote:
>>>>> On Tue, Mar 10, 2020 at 08:09:09PM +0200, Liran Alon wrote:
>>>>>> On 10/03/2020 19:44, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Mar 10, 2020 at 06:53:16PM +0200, Liran Alon wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> This series aims to fix several bugs in VMPort and improve it by supporting
>>>>>>>> more VMPort commands and make command results more configurable to
>>>>>>>> user via QEMU command-line.
>>>>>>>>
>>>>>>>> This functionality was proven to be useful to run various VMware VMs
>>>>>>>> when attempting to run them as-is on top of QEMU/KVM.
>>>>>>>>
>>>>>>>> For more details, see commit messages.
>>>>>>> Well two versions in one day and some review comments weren't addressed.
>>>>>> There is a single review comment that wasn't addressed which is replacing an
>>>>>> enum with a comment. And I explicitly mentioned that it's because I want
>>>>>> additional opinion on this.
>>>>>> I don't see why such a small thing should block review for 15 patches...
>>>>>> All the rest of the comments (Which were great) have been addressed. Unless
>>>>>> I have mistakenly missed something, which please point it out if I did.
>>>>> OK I just took a quick peek, two things quickly jumped out at me.
>>>> Thanks for having a look.
>>>>> version property really should be a boolean and have some documentation
>>>>> saying what functionality enables.
>>>> I thought that having a version number approach is more generic and easy to
>>>> maintain going forward.
>>>> If I understand correctly, this is also the approach taken by qxl & qxl-vga.
>>>>
>>>> The more elaborate alternative could have been introducing compat_flags (As
>>>> PVSCSI does) but it seems like it will pollute the property space with a lot
>>>> of useless VMPort properties.
>>>> (E.g. x-read-eax-bug, x-no-report-unsupported-cmd, x-no-report-vmx-type and
>>>> etc.).
>>>>
>>>> What is the advantage of having a boolean such as "x-vmport-v2" instead of
>>>> having a single "version" property?
>>> It's not clear what should happen going forward. Let's say version is
>>> incremented again. This then becomes challenging for downstreams to
>>> backport.
>> As all conditions are in the form of "if (s->version > X)" then incrementing
>> version from 1 to 2 doesn't break any condition of "if (s->version > 1)".
>> What is the challenge of backporting I'm missing?
> the challenge is figuring out which parts does version apply to.
> It might be easy if there's just code, harder if there's
> also data, etc.
You mean things such as the following?
s->some_field = (s->version > X) ? A : B;

True that it could be a bit more difficult to spot.

>>>> Will it suffice if I would just add documentation above "version" property
>>>> on what is was the functionality in "version==1"?
>>>> (Though, it's just easy to scan the vmport.c code for if's involving
>>>> ">version"... "version" is more of an internal field for machine-type
>>>> compatibility and not really meant to be used by user)
>>>>
>>>> Which approach do you prefer?
>>> I just dislike versions, they are hard to maintain.
>>>
>>> Individual ones is cleanest imho. Self-documenting.
>> I agree. That's the PVSCSI approach of compat_flags. Have many properties
>> but each define bit in a compat_flags that specifies behavior.
>> The disadvantage it have is that it over-complicates code and introduce many
>> properties that will never be used as it's just for internal binding to
>> machine-type.
>>> But if not, I'd do something like "x-vmport-fixes" and
>>> set bits there for each bugfix.
>> Hmm this could a nice and simple approach.
>> Will it be OK then in this case to define "x-vmport-fixes" value in
>> hw_compat_4_2[] to a hard-coded value (e.g. "20") without directly encoding
>> each individual bit via vmport.h constants?
> Well how are you going to check a specific flag then?
In the code itself I will have constants of course.
I meant just in hw_compat_4_2[] machine-type compat entry because the 
bitmask value there should be specified as a string value.
>
>> I will note though that it seems this "x-vmport-fixes" bitmap seems to be
>> the first of it's kind. But I'm OK with this approach.
So just to be clear before implementing your suggesting approach, this 
doesn't bother you right?



