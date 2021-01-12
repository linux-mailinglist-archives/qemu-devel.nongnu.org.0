Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0F2F2E31
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:42:51 +0100 (CET)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI4Y-0002Dg-H0
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzHyW-0003A5-PE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kzHyR-0003iS-7S
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610451388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AOgxTLMTIdTZKNC7B3wsjgAb0AUyN6gAO1jJbajxeI=;
 b=AturSg9T9IEALRV9xyIW7esS0xnZHaWi5ioU/nT/pgg+rNB6EESBncmaPQg7TkEMzwAJex
 rLexSIucGVVUDKddLWeGLcNdQatdP1VVztDZhoN8YFnMRgR9rV0TZ0JIHssxGjNdNFFNNr
 +0DKfRtxB9fw9I3MMfr1ZtkjRb4tMgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-RAM-GMsoNzW6ODFs7TuxSA-1; Tue, 12 Jan 2021 06:36:24 -0500
X-MC-Unique: RAM-GMsoNzW6ODFs7TuxSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FEEDF8CF;
 Tue, 12 Jan 2021 11:36:22 +0000 (UTC)
Received: from gondolin (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15A9D10016FB;
 Tue, 12 Jan 2021 11:36:09 +0000 (UTC)
Date: Tue, 12 Jan 2021 12:36:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v6 13/13] s390: Recognize confidential-guest-support option
Message-ID: <20210112123607.39597e3d.cohuck@redhat.com>
In-Reply-To: <fcafba03-3701-93af-8eb7-17bd0d14d167@de.ibm.com>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-14-david@gibson.dropbear.id.au>
 <fcafba03-3701-93af-8eb7-17bd0d14d167@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 david@redhat.com, qemu-devel@nongnu.org, frankja@linux.ibm.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 09:15:26 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 12.01.21 05:45, David Gibson wrote:
> > At least some s390 cpu models support "Protected Virtualization" (PV),
> > a mechanism to protect guests from eavesdropping by a compromised
> > hypervisor.
> > 
> > This is similar in function to other mechanisms like AMD's SEV and
> > POWER's PEF, which are controlled by the "confidential-guest-support"
> > machine option.  s390 is a slightly special case, because we already
> > supported PV, simply by using a CPU model with the required feature
> > (S390_FEAT_UNPACK).
> > 
> > To integrate this with the option used by other platforms, we
> > implement the following compromise:
> > 
> >  - When the confidential-guest-support option is set, s390 will
> >    recognize it, verify that the CPU can support PV (failing if not)
> >    and set virtio default options necessary for encrypted or protected
> >    guests, as on other platforms.  i.e. if confidential-guest-support
> >    is set, we will either create a guest capable of entering PV mode,
> >    or fail outright.
> > 
> >  - If confidential-guest-support is not set, guests might still be
> >    able to enter PV mode, if the CPU has the right model.  This may be
> >    a little surprising, but shouldn't actually be harmful.
> > 
> > To start a guest supporting Protected Virtualization using the new
> > option use the command line arguments:
> >     -object s390-pv-guest,id=pv0 -machine confidential-guest-support=pv0  
> 
> 
> This results in
> 
> [cborntra@t35lp61 qemu]$ qemu-system-s390x -enable-kvm -nographic -m 2G -kernel ~/full.normal 
> **
> ERROR:../qom/object.c:317:type_initialize: assertion failed: (parent->instance_size <= ti->instance_size)
> Bail out! ERROR:../qom/object.c:317:type_initialize: assertion failed: (parent->instance_size <= ti->instance_size)
> Aborted (core dumped)
> 

> > +static const TypeInfo s390_pv_guest_info = {
> > +    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
> > +    .name = TYPE_S390_PV_GUEST,
> > +    .instance_size = sizeof(S390PVGuestState),
> > +    .interfaces = (InterfaceInfo[]) {
> > +        { TYPE_USER_CREATABLE },
> > +        { }
> > +    }
> > +};

I think this needs TYPE_OBJECT in .parent and
TYPE_CONFIDENTIAL_GUEST_SUPPORT as an interface to fix the crash.


