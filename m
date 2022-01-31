Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178F4A4972
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:36:25 +0100 (CET)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXn4-0002r6-Fm
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXe8-0001ci-3y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXe5-0002sb-9N
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643639224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pe3aGQ15encFFpdc88SO+PuqrXwNIss2zck147qZ430=;
 b=EZLYZ0cwSTVe4wX9ECpZ1u0i/MNdt/D9UvejAGHyf4YKko7Qewb8Ab9SUwakLTP8lrBOLR
 vnsizHCzHGJn5NZCxtBbKm0XM1Q6Io/3qQvxLmKLRZz2UnkP3TKkjhk7/ZK+yQnhLA231O
 upFqj3tYoYrv5udo6cKGzcEneiIJ0k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-vOmbEthTOPG2aIhTKWW5OQ-1; Mon, 31 Jan 2022 09:26:51 -0500
X-MC-Unique: vOmbEthTOPG2aIhTKWW5OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C24CA1054FAB;
 Mon, 31 Jan 2022 14:26:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39ECF10A4037;
 Mon, 31 Jan 2022 14:26:47 +0000 (UTC)
Date: Mon, 31 Jan 2022 14:26:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to
 launch-measure response
Message-ID: <YffxpK99EibxdXG4@redhat.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 03:38:47PM +0200, Dov Murik wrote:
> 
> 
> On 31/01/2022 13:44, Daniel P. Berrangé wrote:
> > On Mon, Jan 31, 2022 at 11:15:39AM +0000, Dov Murik wrote:
> >> Currently the responses of QMP commands query-sev-launch-measure and
> >> query-sev-attestation-report return just the signed measurement. In
> >> order to validate it, the Guest Owner must know the exact guest launch
> >> digest, besides other host and guest properties which are included in
> >> the measurement.
> >>
> >> The other host and guest details (SEV API major, SEV API minor, SEV
> >> build, and guest policy) are all available via query-sev QMP command.
> >> However, the launch digest is not available.  This makes checking the
> >> measurement harder for the Guest Owner, as it has to iterate through all
> >> allowed launch digests and compute the expected measurement.
> > 
> > So more specifically to validate the measurement, the guest owner is
> > currently calculating:
> > 
> >    expected_measurement = HMAC(0x04 || API_MAJOR || API_MINOR || BUILD ||
> >                                GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
> > 
> > where GCTX.LD is
> > 
> >     SHA256(FIRMWARE-CODE || KERNEL-HASHES-TABLE || VMSA-FOREACH-VCPU)
> > 
> > and comparing expected_measurement to the actual measurement from
> > query-sev-launch-measure.
> > 
> >> Add a new field debug-launch-digest to the response of
> >> query-sev-launch-measure and query-sev-attestation-report which includes
> >> the guest launch digest, which is the SHA256 of all initial memory added
> >> to the guest via sev_launch_update_data().
> > 
> > So this new 'debug-launch-digest' field is returning GCTX.LD value
> > above.
> > 
> 
> Yes. Maybe rename it to gctx-ld ?
> 
> hmmm, except at the moment it doesn't include the VMSAs, because I don't
> know an easy way to do it within QEMU :-( .  So the content of
> debug-launch-digest is currently incorrect for SEV-ES guests.

Yes, that comes back to the problem we've discussed previously about
how to determine the correct expected VMSA content which has no easy
answer. 


> The scenario we are encountering is that there's not one allowed
> assignment to the parameters, but rather a more relaxed policy along the
> lines of:
> 
> API_MAJOR.API_MINOR should be >= 12.34
> BUILD should be >= 66
> GCTX.POLICY should be 0x0 or 0x2
> GCTX.LD can be one of these allowed OVMFs: {hash-a, hash-b, hash-c}
> 
> 
> Having the values of API*, BUILD, POLICY from query-sev is very
> comfortable for verifying they are in the allowed ranges.  But since the
> Guest Owner doesn't have GCTX.LD, they have to compute the measurement
> for each of the allowed OVMF images.  Once the values are known and
> "allowed", then the HMAC must be computed to see that the signed
> measurement does indeed match.

Ok, so the usage scenario is that the platform owner is deciding 
which OVMF build in use, not the guest owner. That guest owner just
knows that it is an OVMF build from a set of builds published by the
platform owner. Good enough if you trust the cloud owner in general,
but want confidence that their compute host isn't compromised. Would
need  an independantly reproducible build, if you don't trust the
cloud owner at all.


Assuming we've got 5 possible OVMF builds, currently we would need
to calculate 5 HMACs over the inpuot data.

With this extra piece of info, we only need to calculate 1 HMAC.

So this is enabling a performance optimization, that could indeed
be used in a production deployment.  The HMAC ops are not exactly
performance intensive though until we get to the point of choosing
between a huge number of possible OVMFs.

If we can't get the VMSA info included, then the guest owner still
needs a local copy of every possible OVMF binary that is valid. IOW
this digest is essentially no more than a filename to identify which
OVMF binary to calc the HMAC over.

> Note: I guess that adding the hashes of kernel/initrd/cmdline here might
> help too (for direct boot with kernel-hashes=on), and maybe the hash of
> OVMF itself (on its own).

IOW, I think there's only two scenarios that make sense

1. The combined launch digest over firmware, kernel hashes
   and VMSA state.

2. Individual hashes for each of firmware, kernel hashes table and
   VMSA state

I think we should assume that anyone who has access to SEV-ES hardware
is likely to run in SEV-ES policy, not SEV policy. So without VMSA
state I think that (1) is of quite limited usefulness. (2) would
be nicer to allow optimization of picking which OVMF blob to use,
as you wouldn't need to figure out the cross-product of very valid
OVMF and every valid kernel hashes table - the latter probably isn't
even a finite bounded set.

> More generally: within space/network constraints, give the Guest Owner
> all the information it needs to compute the launch measurement.  There's
> a problem with OVMF there (we don't want to send the whole 4 MB over the
> QMP response, but given its hash we can't "extend" it to include the
> kernel-hashes struct).

Yeah its a shame we aren't just measuring the digest of each piece
of information in  GCTX.LD, instead of measuring the raw information
directly.


I wonder if we're thinking of this at the wrong level though. Does
it actually need to be QEMU providing this info to the guest owner ?

Guest owners aren't going to be interacting with QEMU / QMP directly,
nor are they likely to be interacting with libvirt directly. Their
way into the public cloud will be via some high level API. eg the
OpenStack Nova REST API, or the IBM Cloud API (whatever that may
be). This high level mgmt infra is likely what is deciding which
of the 'N' possible OVMF builds to pick for a given VM launch. It
could easily just expose the full OVMF data to the user via its
own API regardless of what query-sev does.

Similarly if the cloud is choosing which kernel, out of N possible
kernels to boot with, they could expose the raw kernel data somewhere
in their API - we don't neccessarily need to expose that from QEMU.

If we don't find a way to extract the VMSA data blob on the fly,
then the cloud owner will need to public VMSA data somewhere out
of band regardless.



> > Is that really compelling enough to justify adding this extra
> > info to the QAPI commands ? IME of writing code to verify the SEV
> > measurement, there were many little ways I screwed up at first
> > and having this field would not have made a significant difference
> > to my debugging efforts.
> 
> I think that adding the extra field is not that bad, even if it's useful
> just for some cases.
> 
> I'll be glad to get rid of the launch_memory buffer in my implementation
> and replace it with a SHA256-context variable (but found none in QEMU).
>  Other than that I don't think the suggested addition is too bad (in
> fact, I would add some more info like kernel hashes.).

Given we can't actually emit a valid GCTX.LD for SEV, my preference
would be to just report the hashes of each piece of data that is a
input to the GCTX.LD. eg report 'firmware-digest', 'kernel-digest',
'initrd-digest', 'cmdline-digest'.

They can use firmware-digest as a identifier to locate the raw
firmware data blob.

They can use kernel-digest, initrd-digest, and cmdline-digest to
compare against their list of expected kernel/initrd binaries, if
the cloud owner controls them, and also to then build the kernl
hashes table.

They still have to figure out the VMSAs separately somehow, or
the cloud mgmt layer can use all of this info to expose the
raw data in their own higher level API.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


