Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8C184724
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 13:46:09 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCjhY-0002kp-3U
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 08:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pasic@linux.ibm.com>) id 1jCjgQ-0001by-8k
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 08:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pasic@linux.ibm.com>) id 1jCjgP-0000K3-3W
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 08:44:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pasic@linux.ibm.com>) id 1jCjgO-0000HV-S9
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 08:44:57 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DCYxN1034880
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 08:44:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yquenyg2j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 08:44:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <pasic@linux.ibm.com>;
 Fri, 13 Mar 2020 12:44:52 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Mar 2020 12:44:48 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02DCilZ949283312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 12:44:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4F05AE055;
 Fri, 13 Mar 2020 12:44:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF3BBAE051;
 Fri, 13 Mar 2020 12:44:47 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.160])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Mar 2020 12:44:47 +0000 (GMT)
Date: Fri, 13 Mar 2020 13:44:46 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Singh, Brijesh"
 <brijesh.singh@amd.com>
Subject: Re: [PATCH V2] vhost: correctly turn on VIRTIO_F_IOMMU_PLATFORM
In-Reply-To: <20200227104233-mutt-send-email-mst@kernel.org>
References: <20200226094357.25061-1-jasowang@redhat.com>
 <20200226142839.4263de9b.pasic@linux.ibm.com>
 <20200226083654-mutt-send-email-mst@kernel.org>
 <20200226163618.31aa86ed.pasic@linux.ibm.com>
 <20200226115009-mutt-send-email-mst@kernel.org>
 <20200227140215.2d12149c.pasic@linux.ibm.com>
 <20200227104233-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031312-0020-0000-0000-000003B3C7B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031312-0021-0000-0000-0000220C1FF5
Message-Id: <20200313134446.782c5f7c.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130067
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[..]
> > 
> > CCing Tom. @Tom does vhost-vsock work for you with SEV and current qemu?
> > 
> > Also, one can specify iommu_platform=on on a device that ain't a part of
> > a secure-capable VM, just for the fun of it. And that breaks
> > vhost-vsock. Or is setting iommu_platform=on only valid if
> > qemu-system-s390x is protected virtualization capable?
> > 
> > BTW, I don't have a strong opinion on the fixes tag. We currently do not
> > recommend setting iommu_platform, and thus I don't think we care too
> > much about past qemus having problems with it.
> > 
> > Regards,
> > Halil
> 
> 
> Let's just say if we do have a Fixes: tag we want to set it correctly to
> the commit that needs this fix.
> 

I finally did some digging regarding the performance degradation. For
s390x the performance degradation on vhost-net was introduced by commit
076a93d797 ("exec: simplify address_space_get_iotlb_entry"). Before
IOMMUTLBEntry.addr_mask used to be based on plen, which in turn was
calculated as the rest of the memory regions size (from address), and
covered most of the guest address space. That is we didn't have a whole
lot of IOTLB API overhead.

With commit 076a93d797 I see IOMMUTLBEntry.addr_mask == 0xfff which comes
as ~TARGET_PAGE_MASK from flatview_do_translate(). To have things working
properly I applied 75e5b70e6, b021d1c044, and d542800d1e on the level of
076a93d797 and 076a93d797~1.

Regarding vhost-vsock. It does not work with iommu_platform=on since the
very beginning (i.e. 8607f5c307 ("virtio: convert to use DMA api")). Not
sure if that is a good or a bad thing. (If the vhost driver in the kernel
would actually have to do the IOTLB translation, then failing in case
where it does not support it seems sane. The problem is that
ACCESS_PLATFORM is used for more than one thing (needs translation, and
restricted memory access).)

I don't think I've heard back from AMD whether vsock works with SEV or
not... I don't have access to HW to test it myself.

We (s390) don't require this being backported to the stable qemus,
because for us iommu_platform=on becomes relevant with protected
virtualization, and those qemu versions don't support it.

Cheers,
Halil


