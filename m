Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657A3080EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:07:45 +0100 (CET)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5FS3-00048J-P2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l5FQz-0003ZL-AS
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:06:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l5FQx-0005Zv-3L
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:06:37 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SM1nUL038124
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pn2+Q2iSproNyFieEwxjxvGZuM1Vtmn4O0jkP4FnCoE=;
 b=FxNpJYJZ//3jOJuKeeVpCVsZo29AZ7ym0zQLeWwT8A1Py1Ly/sDS3QOCCesrk8I0Afsu
 dyrdneVz+qrhPb+ddZBlgQO7jhebq+VC6lkcwn4kAWe1/epjcP035N/yEIq2meYxe8eb
 pHDLpiEH4WzD/HyymAFm+F5BIY0Ke5KWQacmxO8HR9C+N6ToyMq8eRss9obG5iPC5SUn
 lBES9zG/5UbiUn+TNB5mwTsocEpWrh6g+0kRowh100lx/FshJ7ssxkWMeFKEfk15INC1
 GoK1GrNw2edQOHy/JRcB87C1dhJTk8iyr13YqVFAO/x4kqzuQDU7h9Pc5c3sajpypnlS Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3dwun6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:06:31 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SM21WK038749
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:06:31 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3dwun67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 17:06:31 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SM1qgO027766;
 Thu, 28 Jan 2021 22:06:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 36a0t30upm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 22:06:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SM6TNU36766094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 22:06:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C3656A06F;
 Thu, 28 Jan 2021 22:06:29 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73E186A071;
 Thu, 28 Jan 2021 22:06:28 +0000 (GMT)
Received: from [9.160.13.166] (unknown [9.160.13.166])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 22:06:28 +0000 (GMT)
Subject: Re: [PATCH 0/1] tests/acceptance/boot_linux: Switch to Fedora 32
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
 <20c6fbf7-3000-0ef4-cdb1-31d748878206@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <9955636f-507f-3b6a-d403-d23c4b78f01e@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 17:06:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20c6fbf7-3000-0ef4-cdb1-31d748878206@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280104
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/2021 3:19 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 1/26/21 10:09 PM, Daniele Buono wrote:
>> Local acceptance tests run with "make check-acceptance" are now
>> showing some cases canceled like the following:
>>
>> (01/39) 
>> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: 
>> CANCEL: Failed to download/prepare boot image (0.25 s)
>>
>> Turns out, every full-vm test in boot_linux.py is trying to use a
>> Fedora 31 cloud image and is failing, with Avocado refusing to download
>> it, presumably because Fedora 31 is EOL.
>>
>> This patch moves to Fedora 32, which is still supported. And seem to
>> work fine
> 
> While ago it was discussed about updating the Fedora version which, in 
> my opinion, ended up without a conclusion. Please see the complete 
> thread in:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763986.html

Oops, didn't notice the previous thread. Apologies for the duplicate!

> 
> I'm CC'ing Daniel Berrrangé so that, perhaps, we could resume the 
> discussion.
> 
> Thanks!
> 
> - Wainer
> 
>>
>> The script has the image checksums hardcoded. I downloaded and verified
>> the checksums with the Fedora 32 GPG key, but I would feel more
>> confident if someone else wants to verify it too.
>>
>> The checksum files are here:
>> https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/ppc64le/images/Fedora-Cloud-32-1.6-ppc64le-CHECKSUM 
>>
>> https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/s390x/images/Fedora-Cloud-32-1.6-s390x-CHECKSUM 
>>
>> https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/aarch64/images/Fedora-Cloud-32-1.6-aarch64-CHECKSUM 
>>
>> https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/x86_64/images/Fedora-Cloud-32-1.6-x86_64-CHECKSUM 
>>
>> and the GPG keys are available here:
>> https://getfedora.org/en/security/
>>
>> NOTE: I tried moving to Fedora 33, but the aarch64 VM cannot boot
>> properly. May be worth investigating but I have no experience with ARM
>> so I'll leave that to someone else, if interested.
>>
>> Daniele Buono (1):
>>    tests/acceptance/boot_linux: Switch to Fedora 32
>>
>>   tests/acceptance/boot_linux.py | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
> 

