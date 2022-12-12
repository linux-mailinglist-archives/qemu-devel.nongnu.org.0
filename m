Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14D64A345
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:28:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jmH-0004dL-63; Mon, 12 Dec 2022 09:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4jm1-0004WY-4U
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4jly-00063n-RL
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:16 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCE8spj030240
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pbRr98I9kAGqqPKACvriqVjqEU7EivH0q/NecGZjSWU=;
 b=VuFGELCb234i6VobTVYlY4DuCv1Yp70d+sHmkrYXWx12sjEReZOoJn0RSvJl4AWzWc1t
 CLQ6B4FlyMCSpllFVrbnKTKb4YKLjo4DhPlRZic7xSSLAaxk29tfqNCcnW7NOBQ72EyL
 cNGbROCYNeAKCa6IA3J/VoiohbX/UUm9yq3bJSfwFA9LQEeofglyvhlm/gdkM7QSouBi
 2+XIiPnYVfO+Qe5E9OcgnUkKRS21Ig6SUJ90LkMiAJhdKYBEZcD8ktLvsttOYQehr0fI
 /CmPMvQ0fkWjoji5rZGvagSFL2k3rGcgKSzZRwPsJTggfuVPYzMnmCBUW/0UBXPo2nw8 iw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md40kt6ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:27:11 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCBSUJR010321
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:27:09 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6nfkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:27:09 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCER8G532244372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 14:27:08 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D7945805A;
 Mon, 12 Dec 2022 14:27:08 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2581758058;
 Mon, 12 Dec 2022 14:27:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 14:27:08 +0000 (GMT)
Message-ID: <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
Date: Mon, 12 Dec 2022 09:27:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
 <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UaQhpW--OlRBmPyRUvjnvKOUC-hyC3F5
X-Proofpoint-ORIG-GUID: UaQhpW--OlRBmPyRUvjnvKOUC-hyC3F5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 mlxlogscore=716 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120130
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



On 12/12/22 08:59, James Bottomley wrote:
> On Mon, 2022-12-12 at 08:43 -0500, Stefan Berger wrote:
>>
>>
>> On 12/10/22 12:10, James Bottomley wrote:
>>> The Microsoft Simulator (mssim) is the reference emulation platform
>>> for the TCG TPM 2.0 specification.
>>>
>>> https://github.com/Microsoft/ms-tpm-20-ref.git
>>>
>>> It exports a fairly simple network socket baset protocol on two
>>
>> baset -> based.
>>
>>> sockets, one for command (default 2321) and one for control
>>> (default 2322).  This patch adds a simple backend that can speak
>>> the mssim protocol over the network.  It also allows the host, and
>>> two ports to be specified on the qemu command line.  The benefits
>>> are twofold: firstly it gives us a backend that actually speaks a
>>> standard TPM emulation protocol instead of the linux specific TPM
>>> driver format of the current emulated TPM backend and secondly,
>>> using the microsoft protocol, the end point of the emulator can be
>>> anywhere on the network, facilitating the cloud use case where a
>>> central TPM ervice can be used over a control network.
>>>
>>> The implementation does basic control commands like power off/on,
>>> but doesn't implement cancellation or startup.  The former because
>>> cancellation is pretty much useless on a fast operating TPM
>>> emulator and the latter because this emulator is designed to be
>>> used with OVMF which itself does TPM startup and I wanted to
>>> validate that.
>>
>> How did you implement VM suspend/resume and snapshotting support?
> 
> TPM2 doesn't need to.  The mssim follows the reference model which


You mean TPM2 doesn't need to resume at the point where the VM resumes (I am not talking about ACPI resume but virsh save/restore) after for example a host reboot?
What does this have to do with the mssim reference model and TPM2_Shutdown protocol?

> obeys the TPM2_Shutdown protocol, so the software does a power off with
> 
> TPM2_Shutdown(TPM_SU_STATE)
> 
> This allows poweroff to preserve the PCR state, provided the startup
> does
> 
> TPM2_Startup(TPM_SU_STATE).
> 
> the edk2 SecurityPackage does this in OVMF on S3 Resume, so using this
> backend allows us to check the OVMF startup for correctness.
> 
> Now getting QEMU to go through S3 suspend is another issue, but when it
> does, the TPM should just work.
> 
> James
> 

