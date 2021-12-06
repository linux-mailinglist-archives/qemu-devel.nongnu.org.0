Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2A46958A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:18:07 +0100 (CET)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muCwW-0000KV-TI
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muCtz-0007oa-25
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 07:15:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56532
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muCtx-0003Mp-2E
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 07:15:26 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6BJSiX007879
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 12:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Xjmy3QmHZj0qJ0TN+JVfMPbTIiBBfeDQG/+nDtwil4U=;
 b=LzRkR9bP7IExtL96im/R63EaHJAI5q0tWdsFwjScTwvgwQGhkX+XwIEfofdQk3Jq1l09
 PQxyVbZnfq6H9fbqwVSeQrBrnBPAnBcYnWr3znhl1RseZ192xeNv65ndhI3/akLAdZHF
 oZ9unDNg1neMHOWqep1DnjOAvlM7wJ2Rcw53OjfTR3hp0r0jYx3KBvHYEfEIniPqKWwF
 p+6AV21+b2TTgh1OHfey+SU8I69OWQVg6/58hiQ85EEmBpWSM8wGRfQbpduLnj4oqq5y
 LqlKdNBQMD3F/vp2WGMby5fc6XjrFF3gv+sCl313Khp59kWUB6tQ+Vpq0vIyEk0A0unZ EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csfrau48p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 12:15:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B6Bte73017990
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 12:15:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csfrau47w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 12:15:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B6C7jNZ027022;
 Mon, 6 Dec 2021 12:15:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3cqyy9btsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 12:15:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B6CFHTj9306548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 12:15:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C93152052;
 Mon,  6 Dec 2021 12:15:17 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.173])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0F01752051;
 Mon,  6 Dec 2021 12:15:17 +0000 (GMT)
Date: Mon, 6 Dec 2021 13:15:14 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20211206131514.02801337@p-imbrenda>
In-Reply-To: <Ya34a03f7XGIrqql@redhat.com>
References: <20211206110611.27283-1-imbrenda@linux.ibm.com>
 <Ya3yJoUh97+B2EYJ@redhat.com> <20211206124312.0a13b7c0@p-imbrenda>
 <Ya34a03f7XGIrqql@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4cCV1DqYXTfeg2iVCEO3joAKYU8zDMFb
X-Proofpoint-ORIG-GUID: k6k-PXn2GoM0UgzF0ypZMA4OBYO0SoyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060073
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Dec 2021 11:47:55 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Dec 06, 2021 at 12:43:12PM +0100, Claudio Imbrenda wrote:
> > On Mon, 6 Dec 2021 11:21:10 +0000
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Mon, Dec 06, 2021 at 12:06:11PM +0100, Claudio Imbrenda wrote: =20
> > > > This patch adds support for asynchronously tearing down a VM on Lin=
ux.
> > > >=20
> > > > When qemu terminates, either naturally or because of a fatal signal,
> > > > the VM is torn down. If the VM is huge, it can take a considerable
> > > > amount of time for it to be cleaned up. In case of a protected VM, =
it
> > > > might take even longer than a non-protected VM (this is the case on
> > > > s390x, for example).
> > > >=20
> > > > Some users might want to shut down a VM and restart it immediately,
> > > > without having to wait. This is especially true if management
> > > > infrastructure like libvirt is used.
> > > >=20
> > > > This patch implements a simple trick on Linux to allow qemu to retu=
rn
> > > > immediately, with the teardown of the VM being performed
> > > > asynchronously.
> > > >=20
> > > > If the new commandline option -async-teardown is used, a new proces=
s is
> > > > spawned from qemu using the clone syscall, so that it will share its
> > > > address space with qemu.
> > > >=20
> > > > The new process will then wait until qemu terminates, and then it w=
ill
> > > > exit itself.
> > > >=20
> > > > This allows qemu to terminate quickly, without having to wait for t=
he
> > > > whole address space to be torn down. The teardown process will exit
> > > > after qemu, so it will be the last user of the address space, and
> > > > therefore it will take care of the actual teardown.
> > > >=20
> > > > The teardown process will share the same cgroups as qemu, so both
> > > > memory usage and cpu time will be accounted properly.   =20
> > >=20
> > > If this suggested workaround has any benefit to the shutdown of a VM
> > > with libvirt, then it is a bug in libvirt IMHO.
> > >=20
> > > When libvirt tears down a QEMU VM, it should be waiting for *every*
> > > process in the VM's cgroup to be terminated before it reports that
> > > the VM is shutoff. IOW, the fact that this workaround lets the main
> > > QEMU process exit quickly should not matter. libvirt should still
> > > be blocked in exactly the same place in its code, waiting for the
> > > "async" cleanup process to exit. IOW, this should not be async at
> > > all from libvirt's POV. =20
> >=20
> > interesting, I did not know that about libvirt.
> >=20
> > maybe libvirt could be fixed/improved to allow this patch to work? =20
>=20
> That would not be desirable. When libvirt reports a VM as shutoff,
> it is expected that all resources associated with the VM huave been
> fully released, such that they are available for launching a new
> VM.  We can't allow resources to be asynchronously released as that
> violates app's expectation that the resources are released once the
> VM is shutoff.

what about people who do not use libvirt? should those also be
prevented from taking advantage of this feature only because libvirt
can't use it?

>=20
> > surely without this patch an asynchronous teardown will not be possible
> > at all =20
>=20
> I appreciate that the current slow teardown is a pain, but async
> teardown does not sound like an appealing alternative given that
> the app can't use the resources again until the teardown is
> complete.

when a VM starts, it will not use all of the memory at once. it will
start using it a little at a time. time during which the asynchronous
process can complete the teardown.

consider what would happen if you need to shut down and restart a big
VM (>10TB)

>=20
> Regards,
> Daniel


