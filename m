Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81A4225D9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:03:42 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjAb-0001N0-7u
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXj6g-0007i8-BO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:59:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mXj6d-0002kW-VW
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:59:38 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195AfYRD004588; 
 Tue, 5 Oct 2021 07:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=e0HCCgT1DthYDYjzxvjJhzweUMYZwBPpj3XsUrG1wQ4=;
 b=UKCL7O7Qj4GKEaC7yw/RZqvqVmtEQt4CfuW9tsh6Gw+cv3VnOXrFqRKXG40jBPFYIcT+
 FlaEGjrLWhDrc+bgThAFK+Ura7b2jRmaU/XLNxLnC6J+uQdaoz6qvnwqnHerj/InYQFn
 wy+UZzRJveRGnAaf+yL4HqhpfF3YvJ2rUYXqWd6b5yryTd/Bs4MPww1tS+gfgUmt3S+I
 mBZXNnniVXGb6/zZ3GxsRlXDuEiylB06febCBVCwoWcPg2eW/QSNjxTrqNlTQIOkKBaZ
 +Ec5C8vLx2FTj3g8ce4v+Wx1wkyCGE8WcWeHHkADjIH42Okm+WwQWrAIzTIUTWGMb8Ey 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgn641q4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:59:31 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195As9lf012241;
 Tue, 5 Oct 2021 07:59:31 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgn641q49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 07:59:31 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195BwdLo004784;
 Tue, 5 Oct 2021 11:59:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3bef29yms7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 11:59:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 195Bs4ml51577184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 11:54:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 171374C05A;
 Tue,  5 Oct 2021 11:59:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35CEE4C050;
 Tue,  5 Oct 2021 11:59:23 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  5 Oct 2021 11:59:23 +0000 (GMT)
Date: Tue, 5 Oct 2021 13:59:09 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211005135909.2b8ab021.pasic@linux.ibm.com>
In-Reply-To: <87lf372084.fsf@redhat.com>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <87r1d64dl4.fsf@redhat.com>
 <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com>
 <20211001162213.18d7375e.pasic@linux.ibm.com>
 <87v92g3h9l.fsf@redhat.com>
 <20211002082128-mutt-send-email-mst@kernel.org>
 <20211004042323.730c6a5e.pasic@linux.ibm.com>
 <20211004040937-mutt-send-email-mst@kernel.org>
 <20211005124303.3abf848b.pasic@linux.ibm.com>
 <87lf372084.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tvYEnP4gwUldCvn6e7gtnn0Cif2yPHRJ
X-Proofpoint-GUID: JpHB1CZZO8HVuitSZ6ozW0Bea7HcAGyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 05 Oct 2021 13:13:31 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, Oct 05 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Mon, 4 Oct 2021 05:07:13 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:  
> >> Well we established that we can know. Here's an alternative explanation:  
> >
> >
> > I thin we established how this should be in the future, where a transport
> > specific mechanism is used to decide are we operating in legacy mode or
> > in modern mode. But with the current QEMU reality, I don't think so.
> > Namely currently the switch native-endian config -> little endian config
> > happens when the VERSION_1 is negotiated, which may happen whenever
> > the VERSION_1 bit is changed, or only when FEATURES_OK is set
> > (vhost-user).
> >
> > This is consistent with device should detect a legacy driver by checking
> > for VERSION_1, which is what the spec currently says.
> >
> > So for transitional we start out with native-endian config. For modern
> > only the config is always LE.
> >
> > The guest can distinguish between a legacy only device and a modern
> > capable device after the revision negotiation. A legacy device would
> > reject the CCW.
> >
> > But both a transitional device and a modern only device would accept
> > a revision > 0. So the guest does not know for ccw.  
> 
> Well, for pci I think the driver knows that it is using either legacy or
> modern, no?

It is mighty complicated. virtio-blk-pci-non-transitional and 
virtio-net-pci-non-transitional will give you BE, but 
virtio-crypto-pci, which is also non-transitional will get you LE,
before VERSION_1 is set (becausevirtio-crypto uses stl_le_p()). That is
fact.

The deal is that virtio-blk and virtion-net was written with
transitional in mind, and config code is the same for transitional and
non-transitional.

That is how things are now. With the QEMU changes things will be simpler.

> 
> And for ccw, the driver knows at that point in time which revision it
> negotiated, so it should know that a revision > 0 will use LE (and the
> device will obviously know that as well.)

With the future changes in QEMU, yes. Without these changes no. Without
these changes we get BE when the guest code things it is going to get
LE. That is what causes the regression.

The commit message for this patch is written from the perspective of
right now, and not from the perspective of future changes.

Or can you hack up a guest patch that looks at the revision, figures out
what endiannes is the early config access in, and does the right thing?

I don't think so. I tried to explain why that is impossible. Because
that would be preferable to messing with the the device and introducing
another exit. 

> 
> Or am I misunderstanding what you're getting at?
> 

Probably. I'm talking about pre- "do transport specific legacy detection
in the device instead of looking at VERSION_1" you are probably talking
about the post-state. If we had this new behavior for all relevant
hypervisors then we wouldn't need to do a thing in the guest. The current
code would work like charm.

Does that answer your question?

Regards,
Halil

