Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBA50082D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 10:22:03 +0200 (CEST)
Received: from localhost ([::1]:59188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neujq-0007JP-2u
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 04:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1neuhg-0006Wo-5Y
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:19:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1neuhe-0005Ie-0x
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 04:19:47 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23E7kdsA012012; 
 Thu, 14 Apr 2022 08:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=e55QwbMZXK91Zj4nMLQrcAMzyrRss+nk5fU2bobMkdo=;
 b=d0BnIVZLuO4SE6tMSceGYagZSXFwefb6shtsrnps1G68xKxH6rbS1WcamSlmWtxYXTK2
 WwXYE/d6EyDITJ75wfHbpn+isZWCN6KCjGbHKDViJg/AVdkahW3w6peBy83HMidBkwPX
 uJFqHYSO5cyTVRtT1BgvQGUzgJoTDPT2ZkWTQ/g5RrY47tlqfh0ZlTnhAzx6y2D3HsIm
 xYpmZEIWYvFhLHqA4BV+fA8xjhP5b8OHuNvjTCF0x0gPxXWMMU84mwlCtHlKqxKbgHPG
 GB8Ml58Oc27MI9uRMaSx7yE3wRxiSy2Xzw55PO//0PN8a1u0yiICMcWSPQ4iJWfQX4W1 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fefh50hgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 08:19:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23E7wsSF021872;
 Thu, 14 Apr 2022 08:19:40 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fefh50hg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 08:19:40 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23E8CBpB024015;
 Thu, 14 Apr 2022 08:19:39 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3fb1sa7fyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 08:19:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23E8Jc1D7537370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 08:19:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6E7DB2066;
 Thu, 14 Apr 2022 08:19:38 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2441FB2065;
 Thu, 14 Apr 2022 08:19:37 +0000 (GMT)
Received: from [9.160.177.197] (unknown [9.160.177.197])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 08:19:36 +0000 (GMT)
Message-ID: <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
Date: Thu, 14 Apr 2022 11:19:35 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: adding 'official' way to dump SEV VMSA
Content-Language: en-US
To: Cole Robinson <crobinso@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E1sVJig55v5buFZG-9zx5qt95Jla0gGh
X-Proofpoint-ORIG-GUID: j_f3MH5H-n0LS9WYzrIJXbifu2cbOyTS
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_02,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=906 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140044
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, "Singh, Brijesh" <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cole,

On 13/04/2022 16:36, Cole Robinson wrote:
> Hi all,
> 
> SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
> validate the launch measurement. For developers dipping their toe into
> SEV-* work, the easiest way to get sample VMSA data for their machine is
> to grab it from a running VM.
> 
> There's two techniques I've seen for that: patch some printing into
> kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
> here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp
> 
> Seems like this could be friendlier though. I'd like to work on this if
> others agree.
> 
> Some ideas I've seen mentioned in passing:
> 
> - debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
> - new KVM ioctl
> - something with tracepoints
> - some kind of dump in dmesg that doesn't require a patch
> 
> Thoughts?


Brijesh suggested to me to construct the VMSA without getting any info from
the host (except number of vcpus), because the initial state of the vcpus
is standard and known if you use QEMU and OVMF (but that's open for discussion).

I took his approach (thanks Brijesh!) and now it's how we calculate expected
SNP measurements in sev-snp-measure [1].  The relevant part for VMSA construction
is in [2].

I plan to add SEV-ES and SEV measurements calculation to this 
library/program as well.


[1] https://github.com/IBM/sev-snp-measure
[2] https://github.com/IBM/sev-snp-measure/blob/main/sevsnpmeasure/vmsa.py

-Dov

