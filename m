Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD555BB2F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:53:11 +0200 (CEST)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rz4-0006yc-Qz
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o5rZ0-0001d6-6S
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o5rYx-0003bA-Od
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:13 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RFpRKx027916
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : from : subject : to : content-type :
 content-transfer-encoding; s=pp1;
 bh=efrDfl4CRbpZ++awl6Gyi/Dtir3l8T95RpN0aiJeUWU=;
 b=jZUqxem7l/xL7B17YOBOxB7+sWCuCzVJmj39ieeDrSZzqbUkHVAYm7GLbTioiuJwHGBo
 g0tB0ul19z/8pq44v6Zb1lQi41P/DsjZY0lJqexTuDxcx/g5C7aWjfGMh8Bn5N5h1GLD
 QBs/960lcnXjN4HJpixQYxlbBBwKpxwuqnBS3GivSWfDU0RwRhxn7WJ4wly2bQZLF4p8
 CGxixFtCOuoQJ+woSSVPnpRdzd3beNrtWtHdfbZbyUVtbwPls3yHM0+h+3oaPhh3ssyO
 imDXO9e4QpxitLRQh9Dr69PEL4cDw6KGPZSRjNOlG3qdS3QHkwPc64TYmihp4GUDWttk SQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyfj515p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RGKvPD003195
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3gwt08u715-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25RGQ0d423986680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9066B11C04A
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E0C611C050
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:00 +0000 (GMT)
Received: from [9.145.19.215] (unknown [9.145.19.215])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:26:00 +0000 (GMT)
Message-ID: <6bb77384-8648-c672-4510-f3eb88c89fdb@linux.ibm.com>
Date: Mon, 27 Jun 2022 18:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Slowness with multi-thread TCG?
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pmqObHfKLPCLoA1h6TwHqGOlFg7JubVk
X-Proofpoint-GUID: pmqObHfKLPCLoA1h6TwHqGOlFg7JubVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I've been looking at why our qemu powernv model is so slow when booting 
a compressed linux kernel, using multiple vcpus and multi-thread tcg. 
With only one vcpu, the decompression time of the kernel is what it is, 
but when using multiple vcpus, the decompression is actually slower. And 
worse: it degrades very fast with the number of vcpus!

Rough measurement of the decompression time on a x86 laptop with 
multi-thread tcg and using the qemu powernv10 machine:
1 vcpu => 15 seconds
2 vcpus => 45 seconds
4 vcpus => 1 min 30 seconds

Looking in details, when the firmware (skiboot) hands over execution to 
the linux kernel, there's one main thread entering some bootstrap code 
and running the kernel decompression algorithm. All the other secondary 
threads are left spinning in skiboot (1 thread per vpcu). So on paper, 
with multi-thread tcg and assuming the system has enough available 
physical cpus, I would expect the decompression to hog one physical cpu 
and the time needed to be constant, no matter the number of vpcus.

All the secondary threads are left spinning in code like this:

	for (;;) {
		if (cpu_check_jobs(cpu))  // reading cpu-local data
			break;
		if (reconfigure_idle)     // global variable
			break;
		barrier();
	}

The barrier is to force reading the memory with each iteration. It's 
defined as:

   asm volatile("" : : : "memory");


Some time later, the main thread in the linux kernel will get the 
secondary threads out of that loop by posting a job.

My first thought was that the translation of that code through tcg was 
somehow causing some abnormally slow behavior, maybe due to some 
non-obvious contention between the threads. However, if I send the 
threads spinning forever with simply:

     for (;;) ;

supposedly removing any contention, then the decompression time is the same.

Ironically, the behavior seen with single thread tcg is what I would 
expect: 1 thread decompressing in 15 seconds, all the other threads 
spinning for that same amount of time, all sharing the same physical 
cpu, so it all adds up nicely: I see 60 seconds decompression time with 
4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit. 
And single thread tcg hogs one physical cpu of the laptop vs. 4 physical 
cpus for the slower multi-thread tcg.

Does anybody have an idea of what might happen or have suggestion to 
keep investigating?
Thanks for your help!

   Fred


