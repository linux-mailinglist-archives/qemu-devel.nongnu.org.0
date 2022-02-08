Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2ED4ACE05
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 02:31:34 +0100 (CET)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHFLw-0000NS-Vt
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 20:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHFIQ-000833-BX
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:27:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8726
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nHFIN-0007jB-Iu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:27:53 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2180haMQ010869; 
 Tue, 8 Feb 2022 01:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=LQZ4xurtH9cROikpYnAAVwgXWWgWNxFrZeEtb8sMXtI=;
 b=phcNw0YXsn1EszLnNsl8t0/aIIKwASOsgMRPNRfIN4f7eEhk8CHGpHvkWmx6+0rDj9/6
 LZ9IJpYyobwedwYY8lTbEhI2uT+ey5DFv0SNmlHRU3f9j69OoHF0c6IDfZaj5LOS9UpS
 p17lOqIN3MtPkEbxJCjDloEjIGlWMj3IPdk/gIoYJ0rRX+pP3Ac89YByNHjcpZgAgj2T
 tQ1vgr8uF/nYcBClp5/jJ8Fbbap5so7AHTUoH62BklsHaQdrvzbNewbXMbQxK7km6Gw/
 rPyDgOWNflXliBNAZh1AQyBcbZzbOLYmDzV3+zYkxvQnhgv/3VvU0BQkHfRO2oY10Mds 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22whq0fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 01:27:47 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2181QAha001197;
 Tue, 8 Feb 2022 01:27:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22whq0fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 01:27:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2181I9om004561;
 Tue, 8 Feb 2022 01:27:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3e1gv98j04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 01:27:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2181Hc3H42729784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 01:17:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6397242042;
 Tue,  8 Feb 2022 01:27:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD3042041;
 Tue,  8 Feb 2022 01:27:41 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.169])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Feb 2022 01:27:41 +0000 (GMT)
Date: Tue, 8 Feb 2022 02:27:38 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Message-ID: <20220208022738.234f0a1b.pasic@linux.ibm.com>
In-Reply-To: <e1566e82-6990-4d2b-952c-7d59886f7af5@gmail.com>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <20220207154615.72b8756a.pasic@linux.ibm.com>
 <e1566e82-6990-4d2b-952c-7d59886f7af5@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AM749C2SOQ8ZiXWhPZEEdlbZVFCRjCRw
X-Proofpoint-ORIG-GUID: sL3Go3hYTba9OsUXFzPuzca45myO_7gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080003
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 16:46:04 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 2/7/22 11:46, Halil Pasic wrote:
> > On Mon, 7 Feb 2022 08:46:34 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >   
> > I have considered this and decided against it. The reason why is
> > if that approach is taken, we can't really add more code to the
> > end of the function. An early return is good if we want to
> > abort the function with an error. My point is !has_iommu does
> > not necessarily mean we are done: after a block that handles
> > the has_iommu situation, in future, there could be a block that
> > handles something different.  
> 
> And that's fine, but the way this patch is changing it I'm not sure it's better
> than what we already have. Today we have:
> 
> if (has_iommu) {

To be exact today we have :
if (klass->get_dma_as != NULL && has_iommu) {


>    (... assign vdev->dma_as in some cases ...)

Today not in some case but unconditionally. WE already checked for
!!klass->get_dma_as and that is important.

Because if you rewrite current to what you have just described here,
then in this branch of the if-else you have to handle !klass->get_dma_as.

So you would have to do
    if (klass->get_dma_as) {
        vdev->dma_as = klass->get_dma_as();
        if (cond) {
            do_error();
        }
    } else {
	vdev->dma_as = &address_space_memory;
    }

> } else {
>     vdev->dma_as = &address_space_memory;
> }
> 
> 
> Your patch is doing:
> 
> vdev->dma_as = &address_space_memory;
> 
> if (has_iommu) {
>    (... assign vdev->dma_as in some cases ...)
> }
> 
> 
> You got rid of an 'else', but ended up adding a double "vdev->dma_as =" assignment
> depending on the case (has_iommu = true and klass->get_dma_as != NULL). 

And why is that bad?

The solution I wrote is very clear about vdev->dma_as != NULL and that
vdev->dma_as conceptually defaults to &address_space_memory, and may
deviate from that only if both has_iommu and klass->get_dma_as != NULL
in which case get_dma_as() may override it to something different.

The compile can still generate branches and stores as it pleases
as long as the behavior is the same AFAIK. 

> This is why
> I proposed the early exit.
> 
> If we're worried about adding more code in the future might as well leave the existing
> if/else as is.
> 

Not really, we would end up having two extra else branches instead of
none (with 3 if-s in both cases) and 3 places where we might assign
->dma_as (although mutually exclusive) instead of just two.

For me my version is easier to read.

        
> 
> 
> > 
> > Would this patch work for power? Or are there valid scenarios that
> > it breaks? I'm asking, because you voiced concern regarding this before.  
> 
> 
> I'll test it when I have an opportunity and let you know.
> 
> 

Thank you!

Regards,
Halil

