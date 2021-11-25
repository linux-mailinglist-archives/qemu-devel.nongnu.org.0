Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C545DB1E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:29:59 +0100 (CET)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqEp4-0003tU-8Z
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqEnD-0002Y4-I7
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:28:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqEn9-0000QK-KC
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637846876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7c32jIHUBoQLg3/LoNuHawvFVr7JkGvf0dhK6eV8CA=;
 b=QFlb99icVYB7OOlh6Sn/nstXRVAlGYfzRYaLTrov/ZNEmZJXxa8cT3wubx+oIzNJ8PfP+q
 mM7iCrX5DT6S35K2kcF1f15nADksJdVSPf3ujA2tkKiIvNSQcKF69tK0FphiQESt4rMDYL
 4o7H9tpn2PEd/VBM3v1OYjumwAUdLRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-KS-h5QCXOeyVGWfAqcZ6mw-1; Thu, 25 Nov 2021 08:27:50 -0500
X-MC-Unique: KS-h5QCXOeyVGWfAqcZ6mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF1081CCB6;
 Thu, 25 Nov 2021 13:27:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9883172FA7;
 Thu, 25 Nov 2021 13:27:19 +0000 (UTC)
Date: Thu, 25 Nov 2021 13:27:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+PNJRcyPGX4KAM@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com>
 <YZ6Ec0yG82nhbN+B@work-vm>
MIME-Version: 1.0
In-Reply-To: <YZ6Ec0yG82nhbN+B@work-vm>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: slp@redhat.com, afrosi@redhat.com, qemu-devel@nongnu.org,
 dovmurik@linux.ibm.com, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> > > Hi,
> > > 
> > > We recently discussed a way for remote SEV guest attestation through QEMU.
> > > My initial approach was to get data needed for attestation through different
> > > QMP commands (all of which are already available, so no changes required
> > > there), deriving hashes and certificate data; and collecting all of this
> > > into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> > > secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> > > provided, QEMU would then need to have support for attestation before a VM
> > > is started. Upon speaking to Dave about this proposal, he mentioned that
> > > this may not be the best approach, as some situations would render the
> > > attestation unavailable, such as the instance where a VM is running in a
> > > cloud, and a guest owner would like to perform attestation via QMP (a likely
> > > scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> > > commands, as this could be an issue.
> > 
> > As a general point, QMP is a low level QEMU implementation detail,
> > which is generally expected to be consumed exclusively on the host
> > by a privileged mgmt layer, which will in turn expose its own higher
> > level APIs to users or other apps. I would not expect to see QMP
> > exposed to anything outside of the privileged host layer.
> > 
> > We also use the QAPI protocol for QEMU guest agent commmunication,
> > however, that is a distinct service from QMP on the host. It shares
> > most infra with QMP but has a completely diffent command set. On the
> > host it is not consumed inside QEMU, but instead consumed by a
> > mgmt app like libvirt. 
> > 
> > > So I ask, does anyone involved in QEMU's SEV implementation have any input
> > > on a quality way to perform guest attestation? If so, I'd be interested.
> > 
> > I think what's missing is some clearer illustrations of how this
> > feature is expected to be consumed in some real world application
> > and the use cases we're trying to solve.
> > 
> > I'd like to understand how it should fit in with common libvirt
> > applications across the different virtualization management
> > scenarios - eg virsh (command line),  virt-manger (local desktop
> > GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> > And of course any non-traditional virt use cases that might be
> > relevant such as Kata.
> 
> That's still not that clear; I know Alice and Sergio have some ideas
> (cc'd).
> There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
> ) - that I can't claim to fully understand.
> However, there are some themes that are emerging:
> 
>   a) One use is to only allow a VM to access some private data once we
> prove it's the VM we expect running in a secure/confidential system
>   b) (a) normally involves requesting some proof from the VM and then
> providing it some confidential data/a key if it's OK

I guess I'm wondering what the threat we're protecting against is,
and / or which pieces of the stack we can trust ?

eg, if the host has 2 VMs running, we verify the 1st and provide
its confidental data back to the host, what stops the host giving
that dat to the 2nd non-verified VM ? 

Presumably the data has to be encrypted with a key that is uniquely
tied to this specific boot attempt of the verified VM, and not
accessible to any other VM, or to future boots of this VM ?


>   c) RATs splits the problem up:
>     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
>     I don't fully understand the split yet, but in principal there are
> at least a few different things:
> 
>   d) The comms layer
>   e) Something that validates the attestation message (i.e. the
> signatures are valid, the hashes all add up etc)
>   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
> 8.4 kernel, or that's a valid kernel command line)
>   g) Something that holds some secrets that can be handed out if e & f
> are happy.
> 
>   There have also been proposals (e.g. Intel HTTPA) for an attestable
> connection after a VM is running; that's probably quite different from
> (g) but still involves (e) & (f).
> 
> In the simpler setups d,e,f,g probably live in one place; but it's not
> clear where they live - for example one scenario says that your cloud
> management layer holds some of them, another says you don't trust your
> cloud management layer and you keep them separate.

Yep, again I'm wondering what the specific threats are that we're
trying to mitigate. Whether we trust the cloud mgmt APIs, but don't
trust the compute hosts, or whether we trust neither the cloud
mgmt APIs or the compute hosts.

If we don't trust the compute hosts, does that include the part
of the cloud mgmt API that is  running on the compute host, or
does that just mean the execution environment of the VM, or something
else?

> So I think all we're actually interested in at the moment, is (d) and
> (e) and the way for (g) to get the secret back to the guest.
> 
> Unfortunately the comms and the contents of them varies heavily with
> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
> while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
> SEV-ES in some cases).
> 
> So my expectation at the moment is libvirt needs to provide a transport
> layer for the comms, to enable an external validator to retrieve the
> measurements from the guest/hypervisor and provide data back if
> necessary.  Once this shakes out a bit, we might want libvirt to be
> able to invoke the validator; however I expect (f) and (g) to be much
> more complex things that don't feel like they belong in libvirt.

Yep, I don't think (f) & (g) belong in libvirt, since libvirt is
deployed per compute host, while (f) / (g) are something that is
likely to be deployed in a separate trusted host, at least for
data center / cloud deployments. May be there's a case where they
can all be same-host for more specialized use cases.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


