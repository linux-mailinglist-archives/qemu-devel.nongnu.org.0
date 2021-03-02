Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A732AC22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:14:54 +0100 (CET)
Received: from localhost ([::1]:41196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCM1-0005Q8-9p
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHC97-0008Pc-Pq
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:01:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27426
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHC90-0001H2-Fu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:01:33 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Kuv6U134701
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 16:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=I5MPA2P0ODtPOdqcbFxbTmqpqnI2NxfWoNncoPlgwmA=;
 b=kdyFqXOFrGPZL5tTnm1upLfe8x17Gw5sE6nwQXeoT96YRAM/B93h9G7ctbdqAZoRj4IT
 X7loPJcYGvlAtrYJoTePreN0UDfOsZh9bL7lIw1lhesMqPALUncjmb6jP2QogtcfBZCd
 JETSuIexCN2K05nX632VvzroA80mWSmbMV/QoROnnLi23AJYps+Plq8QJOG1uBxwepaB
 uutkhZysB6yPimlfk2uyrzG8ZNf9LTCjG8dQv9cLHJd5y2OwIFliHarBjJcx1/XAN/GW
 EYbIeJi8I+dIdS8nRM/p8Lk15Wr/iTSHW4OkCF1MSszoWtMi/AlTXfnEwesVO5tIoxGj Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vud05ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 16:01:22 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Kv5e2135416
 for <qemu-devel@nongnu.org>; Tue, 2 Mar 2021 16:01:21 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vud05b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 16:01:21 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KxcEI019124;
 Tue, 2 Mar 2021 21:01:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3711dwtj2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 21:01:20 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122L1Jlm46203194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 21:01:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0BAF6A047;
 Tue,  2 Mar 2021 21:01:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6584B6A04D;
 Tue,  2 Mar 2021 21:01:19 +0000 (GMT)
Received: from [9.211.86.147] (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 21:01:19 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
 <YD0Day/wGawuWdpi@redhat.com>
 <950b36a4-ec19-84df-9292-c88c390ce5fc@linux.vnet.ibm.com>
 <YD4T1nVIEdL7/IoG@redhat.com>
 <50a8e650-841f-cac4-8a14-8c659ef274ca@linux.vnet.ibm.com>
 <YD5b74uynDvWUySy@redhat.com>
 <a4f78c9c-3a42-13dc-f095-16144d09ca6b@linux.vnet.ibm.com>
 <YD5qdKLNZwg6XB7T@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <4c72d19e-9df6-d9fa-e8c8-f199307e9454@linux.vnet.ibm.com>
Date: Tue, 2 Mar 2021 16:01:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD5qdKLNZwg6XB7T@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/2021 11:40 AM, Daniel P. Berrangé wrote:
> The CFI protection is something I'd say is relevant to virtualization
> use cases, not to emulation use cases
> 
>     https://qemu-project.gitlab.io/qemu/system/security.html
> 
> IOW, the targets that are important to test are the ones where KVM
> is available.
> 
> So that's  s390x, ppc, x86, mips, and arm.
> 
> I think we can probably ignore mips as that's fairly niche.
> We can also reasonably limit ourselves to only test the 64-bit
> variants of the target, on the basis that 32-bit is increasingly
> legacy/niche too.
> 
> So that gives us  ppc64le, x86_64, aarch64 and s390x as the
> targets we should get CI coverage for CFI.

Thanks Daniel,
I'll start working on a V3 that only contains those 4 targets, probably 
in two sets of build/check/acceptance to maintain the jobs below the 
hour mark.

These would still be x86 binaries that are not testing KVM, however,
because of the capabilities of the shared gitlab runners.

I see that there's some work from Cleber Rosa to allow running custom 
jobs on aarch64 and s390x systems. I think that, when the infrastructure 
is ready, having a KVM-based CFI test there would help a lot in terms of 
coverage for those architectures.

