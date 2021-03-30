Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DF34E64B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:22:42 +0200 (CEST)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCSH-0007wq-56
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lRCRN-0007SK-Lc
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:21:45 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:59787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lRCRK-0008Oc-Vh
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:21:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 989D41940233;
 Tue, 30 Mar 2021 07:21:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Mar 2021 07:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pZdZK6a3aB/u38wQ0aX6CnmVhjmA0L1+X5Rf0OgqJ
 II=; b=pl+8YrKGLZVviO3DnwJBUZB1Tx3PNylNnE64BU38mPtoOjroq8Adygrde
 eMpO/dq5muLOPJ1fvzMkmr24lowtF4baDOjADPtuO1LxNuimqlr6VHljmg6i6MO7
 B/cEku2AvdIxHj7Rv1IB1RkUhJq5Z2nfj5DDeXUx3r9WOS+V0wdXiIyrG/7F110u
 YpfhEzFr8Xmxqr3IzmysCmJmQ9fRyDgvpdjq9JfOtov6wvtFMeKzH8CN+ZPL0f3L
 74tKRGiWT2VHA8jw2qPYtCFR2GvVM0ntQLKT9725slibEIfjl/iHG3yzmP+SsHDE
 FWGuWs5QAbND38Yk4tcQ8zSFfa8sw==
X-ME-Sender: <xms:xAljYGTefM1LI3nZIJp3R7abxdWJP6TZjnhpygqiwUfR38Rx0ZDMBA>
 <xme:xAljYEmW4ujerQyS9bPQ_5yKKXlz7CI0Uf0LbDBly6e-TTUCLyvsw5ZAjWRNJkIf7
 BZUX0Egng3GjQ9een4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 epudffjeeiueeludehfeejgeefvefhueeguefhgfeigeekffekgedtheelteeihfegnecu
 ffhomhgrihhnpegsvghrrhgrnhhgvgdrtghomhdpfhhlihgtkhhrrdgtohhmpdhlihgsvh
 hirhhtrdhorhhgpdgvnhhtrghnghhlvgdqphhhohhtohdrohhrghdpihhnshhtrghgrhgr
 mhdrtghomhenucfkphepkedurddukeejrddviedrvdefkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegumhgvsegumhgvrdhorhhg
X-ME-Proxy: <xmx:xAljYFJEnTJnSqBXuTHETXsZZfk_fi_Xz81AvaEQ-IjzM_HiqbNnOQ>
 <xmx:xAljYHTHHouq8UlH7BohiUCF-fvyIdWDrxaZX8yW7q3Atv8rYUTgZQ>
 <xmx:xAljYDTM-ARENtKMGDj1WXwZXQa_q3Odz9qJGFZHyRC2Rw4chqPwRw>
 <xmx:xQljYDWRYXwH-Iz_gSP2Ci34cMIUzmXcJMn_D1_BxNhFeRDamrAW3w>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 342D6240067;
 Tue, 30 Mar 2021 07:21:39 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id a32154af;
 Tue, 30 Mar 2021 11:21:37 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: Ways to deal with broken machine types
In-Reply-To: <20210323153730-mutt-send-email-mst@kernel.org>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323175447.0c57d2a4@redhat.com> <YFooFMWxwpiSB6ZJ@redhat.com>
 <20210323153730-mutt-send-email-mst@kernel.org>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Tue, 30 Mar 2021 12:21:37 +0100
Message-ID: <m2o8f0q43i.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=66.111.4.223; envelope-from=dme@dme.org;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 qemu devel list <qemu-devel@nongnu.org>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-23 at 15:40:24 -04, Michael S. Tsirkin wrote:

> On Tue, Mar 23, 2021 at 05:40:36PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Mar 23, 2021 at 05:54:47PM +0100, Igor Mammedov wrote:
>> > Let me hijack this thread for beyond this case scope.
>> >=20
>> > I agree that for this particular bug we've done all we could, but
>> > there is broader issue to discuss here.
>> >=20
>> > We have machine versions to deal with hw compatibility issues and that=
 covers most of the cases,
>> > but occasionally we notice problem well after release(s),
>> > so users may be stuck with broken VM and need to manually fix configur=
ation (and/or VM).
>> > Figuring out what's wrong and how to fix it is far from trivial. So le=
ts discuss if we
>> > can help to ease this pain, yes it will be late for first victims but =
it's still
>> > better than never.
>>=20
>> To summarize the problem situation
>>=20
>>  - We rely on a machine type version to encode a precise guest ABI.
>>  - Due a bug, we are in a situation where the same machine type
>>    encodes two distinct guest ABIs due to a mistake introduced
>>    betwen QEMU N-2 and N-1
>>  - We want to fix the bug in QEMU N
>>  - For incoming migration there is no way to distinguish between
>>    the ABIs used in N-2 and N-1, to pick the right one
>
>
> Not just incoming migration. Same applies to a guest restart.
>
>
>> So we're left with an unwinnable problem:
>>=20
>>   - Not fixing the bug =3D>
>>=20
>>        a) user migrating N-2 to N-1 have ABI change
>>        b) user migrating N-2 to N have ABI change
>>        c) user migrating N-1 to N are fine
>>=20
>>     No mitigation for (a) or (b)
>>=20
>>   - Fixing the bug =3D>
>>=20
>>        a) user migrating N-2 to N-1 have ABI change.
>>        b) user migrating N-2 to N are fine
>>        c) user migrating N-1 to N have ABI change
>>=20
>>     Bad situations (a) and (c) are mitigated by
>>     backporting fix to N-1-stable too.
>>=20
>> Generally we have preferred to fix the bug, because we have
>> usually identified them fairly quickly after release, and
>> backporting the fix to stable has been sufficient mitigation
>> against ill effects. Basically the people left broken are a
>> relatively small set out of the total userbase.
>>=20
>> The real challenge arises when we are slow to identify the
>> problem, such that we have a large number of people impacted.
>>=20
>>=20
>> > I'll try to sum up idea Michael suggested (here comes my unorganized b=
rain-dump),
>> >=20
>> > 1. We can keep in VM's config QEMU version it was created on
>> >    and as minimum warn user with a pointer to known issues if version =
in
>> >    config mismatches version of actually used QEMU, with a knob to sil=
ence
>> >    it for particular mismatch.
>> >=20
>> > When an issue becomes know and resolved we know for sure how and what
>> > changed and embed instructions on what options to use for fixing up VM=
's
>> > config to preserve old HW config depending on QEMU version VM was inst=
alled on.
>>=20
>> > some more ideas:
>> >    2. let mgmt layer to keep fixup list and apply them to config if av=
ailable
>> >        (user would need to upgrade mgmt or update fixup list somehow)
>> >    3. let mgmt layer to pass VM's QEMU version to currently used QEMU,=
 so
>> >       that QEMU could maintain and apply fixups based on QEMU version =
+ machine type.
>> >       The user will have to upgrade to newer QEMU to get/use new fixup=
s.
>>=20
>> The nice thing about machine type versioning is that we are treating the
>> versions as opaque strings which represent a specific ABI, regardless of
>> the QEMU version. This means that even if distros backport fixes for bugs
>> or even new features, the machine type compatibility check remains a
>> simple equality comparsion.
>>=20
>> As soon as you introduce the QEMU version though, we have created a
>> large matrix for compatibility.
>
>
> Yes but. If we explicitly handle them all the same then
> mechanically testing them all is an overkill.
> We just need to test the ones that have bugs which we
> care about fixing.
>
>
>> This matrix is expanded if a distro
>> chooses to backport fixes for any of the machine type bugs to their
>> stable streams. This can get particularly expensive when there are
>> multiple streams a distro is maintaining.
>>=20
>> *IF* the original N-1 qemu has a property that could be queried by
>> the mgmt app to identify a machine type bug, then we could potentially
>> apply a fixup automatically.
>>=20
>> eg query-machines command in QEMU version N could report against
>> "pc-i440fx-5.0", that there was a regression fix that has to be
>> applied if property "foo" had value "bar".
>>=20
>> Now, the mgmt app wants to migrate from QEMU N-2 or N-1 to QEMU N.
>> It can query the value of "foo" on the source QEMU with qom-get.
>> It now knows whether it has to override this property "foo" when
>> spawning QEMU N on the target host.
>>=20
>> Of course this doesn't help us if neither N-1 or N-2 QEMU had a
>> property that can be queried to identify the bug - ie if the
>> property in question was newly introduced in QEMU N to fix the
>> bug.
>>=20
>> > In my opinion both would lead to explosion of 'possibly needed' proper=
ties for each
>> > change we introduce in hw/firmware(read ACPI) and very possibly a lot =
of conditional
>> > branches in QEMU code. And I'm afraid it will become hard to maintain =
QEMU =3D>
>> > more bugs in future.
>> > Also it will lead to explosion of test matrix for downstreams who care=
 about testing.
>> >=20
>> > If we proactively gate changes on properties, we can just update fixup=
 lists in mgmt,
>> > without need to update QEMU (aka Insite rules) at a cost of complexity=
 on QMEU side.
>> >=20
>> > Alternatively we can be conservative in spawning new properties, that =
means creating
>> > them only when issue is fixed and require users to update QEMU, so tha=
t fixups could
>> > be applied to VM.
>> >=20
>> > Feel free to shoot the messenger down or suggest ways how we can deal =
with the problem.
>>=20
>> The best solution is of course to not have introduced the ABI change in
>> the first place. We have lots of testing, but upstream at least, I don't
>> think we have anything that is explicitly recording the ABI associated
>> with each machine type and validating that it hasn't changed. We rely on
>> the developers to follow the coding practices wrt setting machine type
>> defaults for back compat, and while we're good, we inevitably screw up
>> every now & then.
>>=20
>> Downstreams do have some of this ABI testing - several problems like the
>> one we have there, have been identified when RHEL downstream QE did
>> migration tests and found a change in RHEL machine types, which then
>> was traced back to upstream.
>>=20
>> I feel like we need some standard tool which can be run inside a VM
>> that dumps all the possible ABI relevant information about the virtual
>> machine in a nice data format.
>>=20
>> We would have to run this for each machine type, and save the
>> results to git immediately after release. Then for every change to
>> master, we would have to run the test again for every historic
>> machine type version and compare to the recorded ABI record.
>>=20
>> Regards,
>> Daniel
>
>
> Unfortunately I do not think this is practical :(.
>
> All examples of breakage I am aware of, we did not
> realise some part of interface was part of guest ABI
> and unsafe to change. We simply would not know to write a
> test for it.

While agreeing that it would not be possible to cover all aspects of the
ABI immediately, does that mean that some level of coverage would not be
useful?

>> --=20
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberra=
nge :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.=
com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberra=
nge :|

dme.
--=20
Leaves are falling all around, it's time I was on my way.

