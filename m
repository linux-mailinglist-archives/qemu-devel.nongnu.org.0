Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEB64EEEF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DTk-0001XX-0q; Fri, 16 Dec 2022 11:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p6DT8-0001Qe-Ec
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:22:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p6DT5-0008Df-Di
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:21:53 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGGFujN005969
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Y+G6ekFfkOdvC1GKwH/aQOcHM3Jylo3ycWwmmqX2BHU=;
 b=USlb1cbGQEevFS2K4HzX99v1KwkyMaWORRT0L3vFZdgv7u5tsf3jDILiKIl9pvzKq12Y
 1v3wgodHDdjdQ1/u5yawK9EoQ1+BYYivphjHQbJM4yw1YGXn9vnuMASs+W0NkLJBbu0g
 1rb883Th05edelKdz3r+j3Z3XhxvgZq7/7VPLKmoSrUI/lw5aH2bH4rZ9Q1A1vDio4Al
 kh/6W8f0WfusfiN0sLhZV0x1Iq3uKioaywJg9DGXAWa9IXJzlSp/+bZUuC7GinOJ6xyO
 Dn/wFsW/SNNSo2Jl8OvO8tdfdh79YxiE0az9J9amjvSc5IMIl8h7HjV25ay/7gzUtTiq tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgv1w83kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:21:49 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGGGd9K008117
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:21:48 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgv1w83jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 16:21:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGFDxZa016829;
 Fri, 16 Dec 2022 16:21:47 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3meyrvk44v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 16:21:47 +0000
Received: from smtpav01.dal12v.mail.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BGGLjmc57409988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 16:21:46 GMT
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D89A858063;
 Fri, 16 Dec 2022 16:21:45 +0000 (GMT)
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50D245805D;
 Fri, 16 Dec 2022 16:21:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.com (Postfix) with ESMTP;
 Fri, 16 Dec 2022 16:21:45 +0000 (GMT)
Message-ID: <da47f743-6734-850b-9545-c0e2ddb50fc1@linux.ibm.com>
Date: Fri, 16 Dec 2022 11:21:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com>
 <1ee8a9cb-ba2c-60d0-a150-9710270020b7@linux.ibm.com>
 <c4203617f5a017c30175ebccde80bdc3d680b615.camel@linux.ibm.com>
 <7cd73725-27ff-8500-9d18-b1a284be97be@linux.ibm.com>
 <cc98a0c647e14403a91c646e95918c5521e91810.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <cc98a0c647e14403a91c646e95918c5521e91810.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yq0xa_LPiSbz3JpzhfIKkJCrnoKEXX4B
X-Proofpoint-ORIG-GUID: pHGPU3jdAzyEXUHH5830_jY45Z99ubu3
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=589
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160139
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/16/22 11:13, James Bottomley wrote:
> On Fri, 2022-12-16 at 11:08 -0500, Stefan Berger wrote:
>> On 12/16/22 10:48, James Bottomley wrote:
> [...]
>>> +The mssim backend supports snapshotting and migration, but the
>>> state
>>> +of the Microsoft Simulator server must be preserved (or the server
>>> +kept running) outside of QEMU for restore to be successful.
>>
>> You said you tested it. Can you show how to set it up with command
>> lines? I want to try out at least suspend and resume .
> 
> I already did here:
> 
> https://lore.kernel.org/qemu-devel/77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com/
> 
> But to recap, it's
> 
> stop
> migrate "exec:gzip -c > STATEFILE.gz"
> quit
> 
> Followed by a restart with
> 
> <qemu-command-line> -incoming "exec: gzip -c -d STATEFILE.gz"

Good, you can put it into the documentation. Can I do a reboot of the host in between or does the TPM have to keep on running?

    Stefan

> 
> James
> 

