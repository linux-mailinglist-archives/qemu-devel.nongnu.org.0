Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52832AC21
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:12:15 +0100 (CET)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCJS-0002Mw-2T
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lHBzu-0005dc-04; Tue, 02 Mar 2021 15:52:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lHBzs-00009a-22; Tue, 02 Mar 2021 15:52:01 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KimjX125265; Tue, 2 Mar 2021 15:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vSsWuKqBHoxgcltuE4fyB1VYpEVl0u/TKZnY5PZdE8c=;
 b=F4ceMs4ik9F5dfmhUt9C5D90vbBtjalpccAxRmo/esBo7SQ/256wO/0qHRyLDHY9YRyK
 2WjHfzSSzlfBR8rHgaSR56ax+KFjxWNBZjoC3SpdVHUVJ2RTifHD7isiadUYtzlpxzxs
 cT+v+aPFEG6Y4f+fqrVew4/e5gW1NoWqutdVMTkbePKtewrD1KjRekXcK8E3VO8Q98s1
 yPSTLG0m+4H8ASCD5Z0b0gmhoTptEqwS3OvDBFi/BTPKIi97ExfaIN4g0j1q/at60nEX
 yEXcxZNKmt4JAs/NMb5+HLxx0f2MAm9xgatJBBb/CNJ4LGnYvzJpyWj4HU3RChOIqCem IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnt08fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:51:55 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KjC8W128357;
 Tue, 2 Mar 2021 15:51:54 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnt08ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:51:54 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KmaqW030531;
 Tue, 2 Mar 2021 20:51:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3710sqndgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:51:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KpqX644433810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:51:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7578AC05E;
 Tue,  2 Mar 2021 20:51:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 532A6AC059;
 Tue,  2 Mar 2021 20:51:52 +0000 (GMT)
Received: from [9.65.212.95] (unknown [9.65.212.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:51:52 +0000 (GMT)
Subject: Re: [PATCH] vfio-ccw: Do not read region ret_code after write
To: Cornelia Huck <cohuck@redhat.com>
References: <20210301195143.4106604-1-farman@linux.ibm.com>
 <20210302191402.7bce604b.cohuck@redhat.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <cc440ee8-28c5-3208-19db-ebb48ea60e9d@linux.ibm.com>
Date: Tue, 2 Mar 2021 15:51:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302191402.7bce604b.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/2/21 1:14 PM, Cornelia Huck wrote:
> On Mon,  1 Mar 2021 20:51:43 +0100
> Eric Farman <farman@linux.ibm.com> wrote:
> 
>> A pwrite() call returns the number of bytes written (or -1 on error),
>> and vfio-ccw compares this number with the size of the region to
>> determine if an error had occurred or not. If they are equal, the
>> code reads the ret_code field from the region. However, while the
>> kernel sets the ret_code field as necessary, the region and thus
>> this field is not "written back" to the user. So the value can only
>> be what it was initialized to, which is zero.
>>
>> Not harming anything, but it's a puzzle. Let's avoid the confusion
>> and just set the return code to zero for this case.
> 
> Yes, ret_code seems to be pretty much useless for us: we don't even
> look at it when we read the region for interrupt handling. Thankfully,
> we don't seem to really need it, as we can rely on errno. (Probably
> worth double checking that this is indeed the case.)

I didn't see any scenario on either the kernel or qemu side that made me 
worried.

> 
> I don't suppose we need to handle a hypothetical broken kernel that
> returns the wrong size with errno==0?

Well, that would be silly of it. :) But, since I'm in here, sure I can 
add in some suspenders.

Thanks,
Eric

> 
>>
>> Suggested-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>   hw/vfio/ccw.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> index bc78a0ad76..bfd5fd07a5 100644
>> --- a/hw/vfio/ccw.c
>> +++ b/hw/vfio/ccw.c
>> @@ -106,7 +106,7 @@ again:
>>           error_report("vfio-ccw: write I/O region failed with errno=%d", errno);
>>           ret = -errno;
>>       } else {
>> -        ret = region->ret_code;
>> +        ret = 0;
>>       }
>>       switch (ret) {
>>       case 0:
>> @@ -194,7 +194,7 @@ again:
>>           error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
>>           ret = -errno;
>>       } else {
>> -        ret = region->ret_code;
>> +        ret = 0;
>>       }
>>       switch (ret) {
>>       case 0:
>> @@ -234,7 +234,7 @@ again:
>>           error_report("vfio-ccw: write cmd region failed with errno=%d", errno);
>>           ret = -errno;
>>       } else {
>> -        ret = region->ret_code;
>> +        ret = 0;
>>       }
>>       switch (ret) {
>>       case 0:
> 

