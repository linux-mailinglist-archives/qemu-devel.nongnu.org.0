Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4735AB63
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 08:35:49 +0200 (CEST)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV7Dg-0002zn-IJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 02:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lV7C7-0002Z7-US
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 02:34:11 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lV7C3-0004mF-AE
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 02:34:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 721B398C5A02;
 Sat, 10 Apr 2021 08:33:57 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sat, 10 Apr
 2021 08:33:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00290b02224-a974-4869-95ed-f8e755ce22a0,
 5AFF45E2CBBF13D69B54EF9172E248F18F78FC5D) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Sat, 10 Apr 2021 08:33:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210410083355.1aa649ec@bahia.lan>
In-Reply-To: <20210409201441.ug5yqjb7ojfc2u4i@habkost.net>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <20210409201441.ug5yqjb7ojfc2u4i@habkost.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8cfe3d28-1622-438f-a33e-3a0d51dca6f7
X-Ovh-Tracer-Id: 5103985755571788070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekvddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 16:14:41 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Apr 09, 2021 at 06:03:38PM +0200, Greg Kurz wrote:
> [...]
> > In order to avoid further subtle breakages like this, change the
> > implentation of qdev_get_machine() to:
> > - keep the existing behaviour of creating the dummy "container"
> >   object for the user-mode case only ;
> > - abort() if the machine doesn't exist yet in the QOM tree for
> >   the system-mode case. This gives a precise hint to developpers
> >   that calling qdev_get_machine() too early is a programming bug.
> > 
> > This is achieved with a new do_qdev_get_machine() function called
> > from qdev_get_machine(), with different implementations for system
> > and user mode.
> > 
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >  qdev_get_machine: Assertion `machine != NULL' failed.
> > Aborted (core dumped)
> 
> Should this to be considered for 6.0?  It doesn't seem to be a
> bug fix, but just a preventive measure.
> 

Correct. I forgot to add a for-6.1 prefix but it is definitely too
late for 6.0.


