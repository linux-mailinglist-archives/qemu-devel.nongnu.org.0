Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38F5604C5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:39:12 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Zma-0006s0-0K
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6ZkR-00059Y-5k; Wed, 29 Jun 2022 11:36:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o6ZkP-00064z-6T; Wed, 29 Jun 2022 11:36:58 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TFQeNa029575;
 Wed, 29 Jun 2022 15:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6q2t9xQ6pMV6Q3cVv9N4+l7mgCvAubtl7+wFRT4JFhs=;
 b=RmjMCe9L2nDvH4Zq6FkVoawMGmo/0LqkhTq9GBdK7Nb8GsJZZSRqxDe+2FbnCVkUf5b7
 QnOo+xI86zhe9w6sFD0O1o4xsDZ/g81orwsAwv9+t7TSJcKJjUr9t/1E+rxzZ0qbnOga
 ft2UTQ3AgggVhWXcYHNzh5alkV4gvhziUfZFt17ollKjiJukNjYdxdE6SQiGP1QthFk2
 qZFTt+/dZcRC1A14+INO35GhW1+cjr6+QCWGS4mc7cGNpQdddCO8W30w5vJN7ElL8QUU
 u3VPnV9RdFGGmM9r98RY1xhkja8z65bHgClKwMd4Oamhj949Rw8+H74Nec4B6AKvt6dG Ow== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h0sctrbrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 15:36:49 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25TFamIf026580;
 Wed, 29 Jun 2022 15:36:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3gwt08xr7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 15:36:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25TFajHW23134494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jun 2022 15:36:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91C4D4C044;
 Wed, 29 Jun 2022 15:36:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41D464C040;
 Wed, 29 Jun 2022 15:36:45 +0000 (GMT)
Received: from [9.145.190.55] (unknown [9.145.190.55])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jun 2022 15:36:45 +0000 (GMT)
Message-ID: <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
Date: Wed, 29 Jun 2022 17:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
 <8735fojukm.fsf@linaro.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <8735fojukm.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ozNm1T-eJ-77OCONp-2risJWzIYFFMd7
X-Proofpoint-ORIG-GUID: ozNm1T-eJ-77OCONp-2risJWzIYFFMd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_17,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=956
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206290056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 29/06/2022 00:17, Alex Bennée wrote:
> If you run the sync-profiler (via the HMP "sync-profile on") you can
> then get a breakdown of which mutex's are being held and for how long
> ("info sync-profile").


Alex, a huge thank you!

For the record, the "info sync-profile" showed:
Type               Object  Call site                     Wait Time (s) 
        Count  Average (us)
--------------------------------------------------------------------------------------------------
BQL mutex  0x55eb89425540  accel/tcg/cpu-exec.c:744           96.31578 
     73589937          1.31
BQL mutex  0x55eb89425540  target/ppc/helper_regs.c:207        0.00150 
         1178          1.27


And it points to a lock in the interrupt delivery path, in 
cpu_handle_interrupt().

I now understand the root cause. The interrupt signal for the 
decrementer interrupt remains set because the interrupt is not being 
delivered, per the config. I'm not quite sure what the proper fix is yet 
(there seems to be several implementations of the decrementer on ppc), 
but at least I understand why we are so slow.

With a quick hack, I could verify that by moving that signal out of the 
way, the decompression time of the kernel is now peanuts, no matter the 
number of cpus. Even with one cpu, the 15 seconds measured before was 
already a huge waste, so it was not really a multiple-cpus problem. 
Multiple cpus were just highlighting it.

Thanks again!

   Fred

