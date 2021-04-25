Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351736A71D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 14:23:18 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ladnA-0006tE-QJ
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 08:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1ladlx-00064u-To
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 08:22:03 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maciej.szmigiero@oracle.com>)
 id 1ladlr-0000Vw-HH
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 08:22:01 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13PCLf47020117; Sun, 25 Apr 2021 12:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=bb4EhzvhCv038fayhAlI7LLPYEXOK8A1aXXJxFqpgDE=;
 b=fGdgiy1ty/RvqtVHxo1IVVGxJTNNrdGG+okU2PAXX9dGaAg7ELWGnsYtzg1TRLoSIO3u
 FytRrqeaG1gwQ2wdRABZIrFJhuHNd82TvZJp9Xgf0ElfhLfSCMFOaBYW/CdiK8hYYs/Z
 Np/fciRnK9WtSi849evJpjrBlkPhs0Ue0Iu4lrbCBw2R0Em25dx7EBsk3EUzqwX5PKoy
 lggdLFuIZ4x+WzI7n7lZf/R6WL/Npo4v2s399XbLkkZTxTZk6q2N3LRwjnRtHLEYAXOG
 8xz2BGjIIzum8TZW3AiBzgY2rGn5knC7A/4GSGpKy9OjoxPArsaYuzioiSVePqbWhwK4 Hg== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3849x00ct1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 25 Apr 2021 12:21:49 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13PCHFj1049577;
 Sun, 25 Apr 2021 12:21:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 384w3qcw48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 25 Apr 2021 12:21:47 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13PCLjgG001046;
 Sun, 25 Apr 2021 12:21:46 GMT
Received: from [10.175.220.74] (/10.175.220.74)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 25 Apr 2021 12:21:45 +0000
From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH] vmbus: Don't make QOM property registration conditional
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201009200701.1830060-1-ehabkost@redhat.com>
 <4caca0ac-f3a0-bf45-c3d8-7b8c3ec18857@oracle.com>
 <20201009213336.GJ7303@habkost.net>
 <4de9310f-7627-7440-7fcb-23dc2a0f7441@oracle.com>
Message-ID: <12b52998-d818-5d2a-691b-5bd9135a8042@oracle.com>
Date: Sun, 25 Apr 2021 14:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4de9310f-7627-7440-7fcb-23dc2a0f7441@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9964
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104250093
X-Proofpoint-ORIG-GUID: RmMX3m1oovlCGWbFDsS7EvOl3-6l-PRJ
X-Proofpoint-GUID: RmMX3m1oovlCGWbFDsS7EvOl3-6l-PRJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=maciej.szmigiero@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jon Doron <arilou@gmail.com>,
 qemu-devel@nongnu.org, Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.10.2020 01:30, Maciej S. Szmigiero wrote:
> On 09.10.2020 23:33, Eduardo Habkost wrote:
>> On Fri, Oct 09, 2020 at 11:05:47PM +0200, Maciej S. Szmigiero wrote:
>>> On 09.10.2020 22:07, Eduardo Habkost wrote:
>>>> Having properties registered conditionally makes QOM type
>>>> introspection difficult.  Instead of skipping registration of the
>>>> "instanceid" property, always register the property but validate
>>>> its value against the instance id required by the class.
>>>>
>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> ---
>>>> Note: due to the lack of concrete vmbus-dev subclasses in the
>>>> QEMU tree, this patch couldn't be tested.
>>>
>>> Will test it tomorrow since I have a VMBus device implementation.
>>
>> Thanks!
>>
> 
> Tested the patch with a hv-balloon device and is seems to work okay, so:
> Acked-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 

I see this patch wasn't picked up - it still makes sense and applies
cleanly to the current git, so I think it should be picked up.

Thanks,
Maciej

