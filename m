Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929702FEC21
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:38:58 +0100 (CET)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2aAr-0003lK-MJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2a9r-0003JN-Pm; Thu, 21 Jan 2021 08:37:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2a9p-0007tM-27; Thu, 21 Jan 2021 08:37:55 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LDVoag013753; Thu, 21 Jan 2021 08:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UtMG7SZLtWeZLGwjnFK86MDSyZaRmS9TJFVrRVKHOnU=;
 b=S0Dg+qGevMHdV1eZC4oIiz9G8J9q+4Dc78EQMM7LqIAyALBKAMEL6dGIbVLFBptqjNu5
 waq3n/1TpoF52b5PbB62MdrHVGfCZWIAbwMEoTw1dcvXRXM9E/GHo7egyIHEHw6FHGtp
 ZkC0sSGabzbjTC81DBK6/fLUG75WcdM1phLxJpdqaLAvYYLzSt/ZKTrDSB2kcmOR+S5h
 /sG5hg22JnNyyevSIDkArBMqdESZlblBmyRC+9cTL5N2eXxVsUoVEFHsebf4GmAPIHry
 +dO/cBc6uuvO/XcPrYkExjcGUtG81QwD4te2xvRcp2+JvSnEr8Wqrs+HdzrbUHa/plzL NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3679y197tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 08:37:46 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LDWNnD015728;
 Thu, 21 Jan 2021 08:37:43 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3679y197nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 08:37:43 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LDVSt5002897;
 Thu, 21 Jan 2021 13:37:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3668p78vvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 13:37:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10LDbMp428442934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 13:37:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 346E1AE059;
 Thu, 21 Jan 2021 13:37:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 825EDAE04D;
 Thu, 21 Jan 2021 13:37:28 +0000 (GMT)
Received: from [9.145.88.16] (unknown [9.145.88.16])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 13:37:28 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
 <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
 <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <4a3e13fe-ec6a-27bc-7f30-9ad9691a4522@linux.ibm.com>
Date: Thu, 21 Jan 2021 14:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_06:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101210070
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=schnelle@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, alex.williamson@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/21/21 1:30 PM, Pierre Morel wrote:
> 
> 
> On 1/21/21 10:58 AM, Niklas Schnelle wrote:
>>
>>
>> On 1/21/21 9:27 AM, Pierre Morel wrote:
>>>
>>>
>>> On 1/20/21 9:29 PM, Matthew Rosato wrote:
>>>> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>>>>
>>>>>
>>> ...snip...
>>>
>>>>
>>>> So, I mean I can change the code to be more permissive in that way (allow any device that doesn't have MSI-X capability to at least attempt to use the region).  But the reality is that ISM specifically needs the region for successful pass through, so I don't see a reason to create a different bit for that vs just checking for the PFT in QEMU and using that value to decide whether or not region availability is a requirement for allowing the device to pass through.
>>>
>>>
>>> There is no need for a new bit to know if a device support MIO or not, as I said before, there is already one in the CLP query PCI function response and it is already used in the kernel zPCI architecture.
>>>
>>>
>>> It is not a big think to do and does not change the general architecture of the patch, only the detection of which device is impacted to make it generic instead of device dedicated.
>>>
>>> Regards,
>>> Pierre
>>
>> Just wanted to say that we've had a very similar discussion with
>> Cornelia end of last year and came to the conclusion that explicitly
>> matching the PFT is likely the safest bet:
>> https://lkml.org/lkml/2020/12/22/479
> 
> What I see there is a discussion on the relation between relaxed access and MIO without explaining to Connie that we have in the kernel the possibility to know if a device support MIO or not independently of it supports the relaxed access.
> 
> The all point here is about taking decisions for the right reasons.
> 
> We have the possibility to take the decision based on functionalities and not on a specific PCI function.

Yes but that goes both ways the functionality of the region has to match
that of the device and at least in it's current state the regions functionality
matches only ISM in a way that is so specific that it is very unlikely to match anything
else. For example it can't support a PCI device that requires non-MIO but
also MSI-X. In its current form it doesn't even support PCI Store only PCI Store
Block, we had that in an earlier version and it's trivial but then we get the MSI-X
problem.

> 
> 
> If we keep the PFT check, and we can do this of course, but is it a good solution if it appears we have other PFT with the same functionalities?
> 
> Please note that this is a minor code change, keeping track of the MIO support just as we keep track of the PFT and check on this instead of on the PFT.

That is certainly true and I'm not strongly against matching on functionality
it just seems to me that it's too specific for that to make sense and
in that case I feel it's better to be clear about that and make it ISM
specific in name and functionality.

If we manage to find a fix for the MSI-X problem which I'd be really happy about
we can simply extend the regions functionality and reuse the same code
for a backwards compatibile ISM region and a more generic zPCI non-MIO
region that could even be used if the client (QEMU) uses non-MIO and
the device can do both as is the case for all current physical devices.

> 
> It does not modify the general architecture of the patch series neither in kernel nor in QEMU at all.
> 
> 
> Pierre
> 

