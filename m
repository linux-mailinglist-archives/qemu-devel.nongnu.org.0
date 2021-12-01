Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC66464B14
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 10:57:31 +0100 (CET)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msMMk-0002WX-Ju
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 04:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1msML3-00015P-0M
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 04:55:45 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1msMKx-00041i-Mw
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 04:55:43 -0500
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J3vZZ1rcZz67gvx;
 Wed,  1 Dec 2021 17:54:46 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Wed, 1 Dec 2021 10:55:35 +0100
Received: from localhost (10.52.125.180) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 09:55:34 +0000
Date: Wed, 1 Dec 2021 09:55:32 +0000
To: Ben Widawsky <ben.widawsky@intel.com>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 "Saransh Gupta1" <saransh@ibm.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Shreyas Shah <shreyas.shah@elastics.cloud>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211201095532.000035d8@Huawei.com>
In-Reply-To: <20211130172158.kzuptl2pxlcgvzft@intel.com>
References: <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119014822.j247ayrsdve4yxyu@intel.com>
 <BY5PR12MB4179AA1B062AEA75098E15D8E89C9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119032541.gr6berwu2ve4tkax@intel.com>
 <8735njf6f7.fsf@linaro.org>
 <20211129171631.ytixckw2gz3rya25@intel.com>
 <87mtlmzu3w.fsf@linaro.org> <20211130130956.00000ccd@Huawei.com>
 <20211130172158.kzuptl2pxlcgvzft@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.125.180]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 30 Nov 2021 09:21:58 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 21-11-30 13:09:56, Jonathan Cameron wrote:
> > On Mon, 29 Nov 2021 18:28:43 +0000
> > Alex Benn=E9e <alex.bennee@linaro.org> wrote:
> >  =20
> > > Ben Widawsky <ben.widawsky@intel.com> writes:
> > >  =20
> > > > On 21-11-26 12:08:08, Alex Benn=E9e wrote:   =20
> > > >>=20
> > > >> Ben Widawsky <ben.widawsky@intel.com> writes:
> > > >>    =20
> > > >> > On 21-11-19 02:29:51, Shreyas Shah wrote:   =20
> > > >> >> Hi Ben
> > > >> >>=20
> > > >> >> Are you planning to add the CXL2.0 switch inside QEMU or alread=
y added in one of the version?=20
> > > >> >>     =20
> > > >> >
> > > >> > From me, there are no plans for QEMU anything until/unless upstr=
eam thinks it
> > > >> > will merge the existing patches, or provide feedback as to what =
it would take to
> > > >> > get them merged. If upstream doesn't see a point in these patche=
s, then I really
> > > >> > don't see much value in continuing to further them. Once hardwar=
e comes out, the
> > > >> > value proposition is certainly less.   =20
> > > >>=20
> > > >> I take it:
> > > >>=20
> > > >>   Subject: [RFC PATCH v3 00/31] CXL 2.0 Support
> > > >>   Date: Mon,  1 Feb 2021 16:59:17 -0800
> > > >>   Message-Id: <20210202005948.241655-1-ben.widawsky@intel.com>
> > > >>=20
> > > >> is the current state of the support? I saw there was a fair amount=
 of
> > > >> discussion on the thread so assumed there would be a v4 forthcomin=
g at
> > > >> some point.   =20
> > > >
> > > > Hi Alex,
> > > >
> > > > There is a v4, however, we never really had a solid plan for the pr=
imary issue
> > > > which was around handling CXL memory expander devices properly (bot=
h from an
> > > > interleaving standpoint as well as having a device which hosts mult=
iple memory
> > > > capacities, persistent and volatile). I didn't feel it was worth se=
nding a v4
> > > > unless someone could say
> > > >
> > > > 1. we will merge what's there and fix later, or
> > > > 2. you must have a more perfect emulation in place, or
> > > > 3. we want to see usages for a real guest   =20
> > >=20
> > > I think 1. is acceptable if the community is happy there will be ongo=
ing
> > > development and it's not just a code dump. Given it will have a
> > > MAINTAINERS entry I think that is demonstrated. =20
> >=20
> > My thought is also 1.  There are a few hacks we need to clean out but
> > nothing that should take too long.  I'm sure it'll take a rev or two mo=
re.
> > Right now for example, I've added support to arm-virt and maybe need to
> > move that over to a different machine model...
> >  =20
>=20
> The most annoying thing about rebasing it is passing the ACPI tests. They=
 keep
> changing upstream. Being able to at least merge up to there would be huge.

Guess I really need to take a look at the tests :)  It went in clean so
I didn't poke them. Maybe we were just lucky!  A bunch of ACPI infrastructu=
re
had changed which was the biggest update needed + amusingly x86 kernel code=
 now
triggers the issue around smaller writes than the implementation supports f=
or
the mailbox.  For now I've just added the implementations as that removes
a blocker on this going upstream.

>=20
> > >=20
> > > What's the current use case? Testing drivers before real HW comes out?
> > > Will it still be useful after real HW comes out for people wanting to
> > > debug things without HW? =20
> >=20
> > CXL is continuing to expand in scope and capabilities and I don't see t=
hat
> > reducing any time soon (My guess is 3 years+ to just catch up with what=
 is
> > under discussion today).  So I see two long term use cases:
> >=20
> > 1) Automated verification that we haven't broken things.  I suspect no
> > one person is going to have a test farm covering all the corner cases.
> > So we'll need emulation + firmware + kernel based testing.
> >  =20
>=20
> Does this exist in other forms? AFAICT for x86, there isn't much example =
of
> this.

We run a bunch of stuff internally on a CI farm, targetting various trees,
though this is a complex case because of more elements than most hardware t=
ests
etc.  Our friends in openEuler run a bunch more stuff as well on a mixture =
of
physical and emulated machines on various architectures.  The other distros=
 have
similar setups though perhaps don't provide as much public info as our folk=
s do.
We are a bit early for CXL support so far so I don't think we have
yet moved beyond manual testing.  It'll come though as it's vital once cust=
omers
start caring about the hardware they bought.

Otherwise, if we contribute the resources there are various other orgs who
run tests on stable / mainline and next + various vendor trees. That stuff =
is
a mixture of real and virtual hardware and is used to verify stable releases
very quickly before Greg pushes them out.

Emulation based testing is easier obviously and we do some of that + I know=
 others
do. Once the CXL support is upstream, adding all the tuning parameters to Q=
EMU to
start exercising corner cases will be needed to support this.=20

>=20
> > 2) New feature prove out.  We have already used it for some features th=
at
> > will appear in the next spec version. Obviously I can't say what or
> > send that code out yet.  Its very useful and the spec draft has changed
> > in various ways a result.  I can't commit others, but Huawei will be
> > doing more of this going forwards.  For that we need a stable base to
> > which we add the new stuff once spec publication allows it.
> >  =20
>=20
> I can't commit for Intel but I will say there's more latitude now to work=
 on
> projects like this compared to when I first wrote the patches. I have
> interesting in continuing to develop this as well. I'm very interested in
> supporting interleave and hotplug specifically.

Great.=20

>=20
> > >  =20
> > > >
> > > > I had hoped we could merge what was there mostly as is and fix it u=
p as we go.
> > > > It's useful in the state it is now, and as time goes on, we find mo=
re usecases
> > > > for it in a VMM, and not just driver development.
> > > >   =20
> > > >>=20
> > > >> Adding new subsystems to QEMU does seem to be a pain point for new
> > > >> contributors. Patches tend to fall through the cracks of existing
> > > >> maintainers who spend most of their time looking at stuff that dir=
ectly
> > > >> touches their files. There is also a reluctance to merge large chu=
nks of
> > > >> functionality without an identified maintainer (and maybe reviewer=
s) who
> > > >> can be the contact point for new patches. So in short you need:
> > > >>=20
> > > >>  - Maintainer Reviewed-by/Acked-by on patches that touch other sub=
-systems   =20
> > > >
> > > > This is the challenging one. I have Cc'd the relevant maintainers (=
hw/pci and
> > > > hw/mem are the two) in the past, but I think there interest is lack=
ing (and
> > > > reasonably so, it is an entirely different subsystem).   =20
> > >=20
> > > So the best approach to that is to leave a Cc: tag in the patch itself
> > > on your next posting so we can see the maintainer did see it but didn=
't
> > > contribute a review tag. This is also a good reason to keep Message-Id
> > > tags in patches so we can go back to the original threads.
> > >=20
> > > So in my latest PR you'll see:
> > >=20
> > >   Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > >   Reviewed-by: Beraldo Leal <bleal@redhat.com>
> > >   Message-Id: <20211122191124.31620-1-willianr@redhat.com>
> > >   Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > >   Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > >   Message-Id: <20211129140932.4115115-7-alex.bennee@linaro.org>
> > >=20
> > > which shows the Message-Id from Willian's original posting and the
> > > latest Message-Id from my posting of the maintainer tree (I trim off =
my
> > > old ones).
> > >  =20
> > > >>  - Reviewed-by tags on the new sub-system patches from anyone who =
understands CXL   =20
> > > >
> > > > I have/had those from Jonathan.
> > > >   =20
> > > >>  - Some* in-tree testing (so it doesn't quietly bitrot)   =20
> > > >
> > > > We had this, but it's stale now. We can bring this back up.
> > > >   =20
> > > >>  - A patch adding the sub-system to MAINTAINERS with identified pe=
ople   =20
> > > >
> > > > That was there too. Since the original posting, I'd be happy to sig=
n Jonathan up
> > > > to this if he's willing.   =20
> > >=20
> > > Sounds good to me. =20
> >=20
> > Sure that's fine with me.  Ben, I'm assuming you are fine with being jo=
int maintainer?
> >  =20
>=20
> Yes, I brought it up :D. Once I land the region creation patches I should=
 have
> more time for a bit to circle back to this, which I'd like to do. FOSDEM =
CFP is
> out again, perhaps I should advertise there.

Great!

>=20
> > >  =20
> > > >> * Some means at least ensuring qtest can instantiate the device an=
d not
> > > >>   fall over. Obviously more testing is better but it can always be
> > > >>   expanded on in later series.   =20
> > > >
> > > > This was in the patch series. It could use more testing for sure, b=
ut I had
> > > > basic functional testing in place via qtest.   =20
> > >=20
> > > More is always better but the basic qtest does ensure a device doesn't
> > > segfault if it's instantiated. =20
> >=20
> > I'll confess this is a bit I haven't looked at yet. Will get Shameer to=
 give
> > me a hand.
> >=20
> > Thanks =20
>=20
> I'd certainly feel better if we had more tests. I also suspect the qtest =
I wrote
> originally no longer works. The biggest challenge I had was getting gitla=
b CI
> working for me.

Looks like it'll be tests that slow things down. *sigh*.

Why are there not enough days in the week?

Jonathan

>=20
> >=20
> > Jonathan
> >=20
> >  =20
> > >  =20
> > > >   =20
> > > >>=20
> > > >> Is that the feedback you were looking for?   =20
> > > >
> > > > You validated my assumptions as to what's needed, but your first bu=
llet is the
> > > > one I can't seem to pin down.
> > > >
> > > > Thanks.
> > > > Ben   =20
> > >=20
> > >  =20
> >  =20
>=20


