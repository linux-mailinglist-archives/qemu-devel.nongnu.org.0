Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700EE4EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 16:12:37 +0200 (CEST)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO0KS-00054o-EC
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 10:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iO0Bt-0005tF-DC
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iO0Br-0007rs-Kg
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:03:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27442
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iO0Br-0007oq-Fn
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572012212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TzvCcOB98PtxSJn5wedoJCyEeADXx+3e8fc2D7d5+w=;
 b=H2/uVMWXUs0Mxrl0Z8qqGo+lnPRXoypSwX5JmrG5eJD3wcxmHk4nrXAjTT2/OQurS2mPyt
 5xrEKl1Sp3irfOg45FlH8eivKi2XC1kbjJ0+3p87c/8UYzkX5IjzFAJ6LaIMjP4Fy/kpRI
 6xQkQF//NwC3WJuxpXJ1rXdR9VP53D0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-Y2k6KR-CNQiZ5rf9ziHE5Q-1; Fri, 25 Oct 2019 10:03:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16981005500;
 Fri, 25 Oct 2019 14:03:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB075D71C;
 Fri, 25 Oct 2019 14:03:12 +0000 (UTC)
Date: Fri, 25 Oct 2019 15:03:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/7] i386: Add `machine` parameter to query-cpu-definitions
Message-ID: <20191025140310.GB3581@redhat.com>
References: <20191025022553.25298-1-ehabkost@redhat.com>
 <dbf9e4c1-0acf-9469-84f9-f80c41e2cae0@redhat.com>
 <6e7d171e-18c4-6835-f89c-e9e66c093d62@de.ibm.com>
 <4cd530f9-54f3-80e7-1b66-c91f71160062@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4cd530f9-54f3-80e7-1b66-c91f71160062@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Y2k6KR-CNQiZ5rf9ziHE5Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 25, 2019 at 10:02:29AM +0200, David Hildenbrand wrote:
> On 25.10.19 09:55, Christian Borntraeger wrote:
> >=20
> >=20
> > On 25.10.19 09:17, David Hildenbrand wrote:
> > > On 25.10.19 04:25, Eduardo Habkost wrote:
> > > > We had introduced versioned CPU models in QEMU 4.1, including a
> > > > method for querying for CPU model versions using
> > >=20
> > > Interesting, I was not aware of that.
> > >=20
> > > On s390x, we somewhat have versioned CPU models, but we decided again=
st giving them explicit names (e.g., z13-v1 or z13-4.1.0), because it didn'=
t really seem to be necessary. (and we often implement/add features for old=
er CPU models, there is a lot of fluctuation) Actually, you would have had =
to add "z13-z/VM-x.x.x" or "z13-LPAR-x.x.x" or "z13-KVM-x.x.x" to model the=
 features you actually see in all the different virtual environments ("what=
 a CPU looks like"). Not to talk about QEMU versions in addition to that. S=
o we decided to always model what you would see under LPAR and are able to =
specify for a KVM guest. So you can use "z13" in an up-to-date LPAR environ=
ment, but not in a z/VM environment (you would have to disable features).
> > >=20
> > > Each (!base) CPU model has a specific feature set per machine. Libvir=
t uses query-cpu-model-expansion() to convert this model+machine to a machi=
ne-independent representation. That representation is sufficient for all us=
e cases we were aware of (esp. "virsh domcapabilities", the host CPU model,=
 migration).
> > >=20
> > > While s390x has versioned CPU models, we have no explicit way of spec=
ifying them for older machines, besides going over query-cpu-model-expansio=
n and using expanded "base model + features".
> > >=20
> > > I can see that this might make sense on x86-64, where you only have m=
aybe 3 versions of a CPU (e.g., the one Intel messed up first - Haswell, th=
e one Intel messed up next - Haswell-noTSX, and the one that Intel eventual=
ly did right - Haswell-noTSX-IBRS) and you might want to specify "Haswell" =
vs. "Haswell-IBRS" vs. "Haswell-noTSX-IBRS". But actually, you will always =
want to go for "Haswell-noTSX-IBRS", because you can expect to run in updat=
ed environments if I am not wrong, everything else are corner cases.
> > >=20
> > > Of course, versioned CPU model are neat to avoid "base model + list o=
f features", but at least for expanding the host model on s390x, it is not =
really helpful. When migrating, the model expansion does the trick.
> > >=20
> > > I haven't looked into details of "how to specify or model versions". =
Maybe IBM wants to look into creating versions for all the old models we ha=
d. But again, not sure if that is of any help for s390x. CCing IBM.
> >=20
> > I agree that this does not look very helpful.
> > Especially as several things depend on the kernel version a QEMU versio=
n is
> > not sufficient to be guarantee construction success.
> > So we would need something like z14-qemu4.0-kernel-5.2-suse-flavour-onL=
PAR
> >=20
> > Instead we do check if we can construct an equivalent model on the migr=
ation target.
> > And that model is precise. We do even have versions.
> > Right now with QEMU on s390  our models are versioned in a way that we =
fence of
> > facilities for old machine versions.
> >=20
> > For example
> > -machine s390-virtio-ccw-3.1 -cpu z14 will not have the multiple epoch =
facility
> > and
> > -machine s390-virtio-ccw-4.0 -cpu z14 will have the multiple epoch faci=
lity.
> > As migration does always require the tuple of machine and cpu this is s=
ave. I fail
> > to see what the benefit of an explicit z14-3.1 would be.
> >=20
>=20
> AFAIKS the only real benefit of versioned CPU models is that you can add =
new
> CPU model versions without new QEMU version.

This is very important for backporting CPU security fixes to existing QEMU
releases.=20

>=20
> Then you can specify "-cpu z13-vX" or "-cpu z13 -cpuv X" (no idea how
> versioned CPU model were implemented) on any QEMU machine. Which is the s=
ame
> as telling your customer "please use z13,featX=3Don" in case you have a g=
ood
> reason to not use the host model (along with baselining) but use an expli=
cit
> model.
>=20
> If you can change the default model of QEMU machines, you can automate th=
is
> process. I am pretty sure this is a corner case, though (e.g., IBRS).
> Usually you have a new QEMU machine and can simply enable the new feature
> from that point on.

There are now 4 Haswell variants, only some of which are runnable
on any given host, depending on what microcode the user has installed
or what particular Haswell silicon SKU the user purchased. Given the
frequency of new CPU flaws arrived since the first Meltdown/Spectre,
this isn't a corner case, at least for the x86 world & Intel in
particular. Other arches/vendors haven't been quite so badly affected
in this way.

If we tied each new Haswell variant to a machine type, then users would
be blocked from consuming a new machine type depending on runnability of
the CPU model. This is not at all desirable, as mgmt apps now have complex
rules on what machine type they can use.

When dealing with backporting patches for new CPU hardware flaws, the
new CPU features are backported to many old QEMU versions. The new
machine types are not backportable.

Both these called for making CPU versioning independant of machine
type versioning.

Essentially the goal with CPU versioning is that the user can request
a bare "Haswell" and libvirt (or the mgmt app) will automatically
expand this to the best Haswell version that the host is able to
support with its CPUs / microcode / BIOS config combination.



Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


