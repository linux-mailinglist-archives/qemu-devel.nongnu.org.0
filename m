Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46638463528
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:12:03 +0100 (CET)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2vR-00026X-Ii
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:12:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ms2tf-0001KK-PF
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:10:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ms2tc-0005Wt-Ks
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:10:11 -0500
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J3Msb52l7z67t3s;
 Tue, 30 Nov 2021 21:05:55 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:09:57 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 30 Nov
 2021 13:09:57 +0000
Date: Tue, 30 Nov 2021 13:09:56 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: Ben Widawsky <ben.widawsky@intel.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, Saransh Gupta1 <saransh@ibm.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 <shameerali.kolothum.thodi@huawei.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211130130956.00000ccd@Huawei.com>
In-Reply-To: <87mtlmzu3w.fsf@linaro.org>
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
 <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119014822.j247ayrsdve4yxyu@intel.com>
 <BY5PR12MB4179AA1B062AEA75098E15D8E89C9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119032541.gr6berwu2ve4tkax@intel.com>
 <8735njf6f7.fsf@linaro.org>
 <20211129171631.ytixckw2gz3rya25@intel.com>
 <87mtlmzu3w.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml733-chm.china.huawei.com (10.201.108.84) To
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

On Mon, 29 Nov 2021 18:28:43 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Ben Widawsky <ben.widawsky@intel.com> writes:
>=20
> > On 21-11-26 12:08:08, Alex Benn=E9e wrote: =20
> >>=20
> >> Ben Widawsky <ben.widawsky@intel.com> writes:
> >>  =20
> >> > On 21-11-19 02:29:51, Shreyas Shah wrote: =20
> >> >> Hi Ben
> >> >>=20
> >> >> Are you planning to add the CXL2.0 switch inside QEMU or already ad=
ded in one of the version?=20
> >> >>   =20
> >> >
> >> > From me, there are no plans for QEMU anything until/unless upstream =
thinks it
> >> > will merge the existing patches, or provide feedback as to what it w=
ould take to
> >> > get them merged. If upstream doesn't see a point in these patches, t=
hen I really
> >> > don't see much value in continuing to further them. Once hardware co=
mes out, the
> >> > value proposition is certainly less. =20
> >>=20
> >> I take it:
> >>=20
> >>   Subject: [RFC PATCH v3 00/31] CXL 2.0 Support
> >>   Date: Mon,  1 Feb 2021 16:59:17 -0800
> >>   Message-Id: <20210202005948.241655-1-ben.widawsky@intel.com>
> >>=20
> >> is the current state of the support? I saw there was a fair amount of
> >> discussion on the thread so assumed there would be a v4 forthcoming at
> >> some point. =20
> >
> > Hi Alex,
> >
> > There is a v4, however, we never really had a solid plan for the primar=
y issue
> > which was around handling CXL memory expander devices properly (both fr=
om an
> > interleaving standpoint as well as having a device which hosts multiple=
 memory
> > capacities, persistent and volatile). I didn't feel it was worth sendin=
g a v4
> > unless someone could say
> >
> > 1. we will merge what's there and fix later, or
> > 2. you must have a more perfect emulation in place, or
> > 3. we want to see usages for a real guest =20
>=20
> I think 1. is acceptable if the community is happy there will be ongoing
> development and it's not just a code dump. Given it will have a
> MAINTAINERS entry I think that is demonstrated.

My thought is also 1.  There are a few hacks we need to clean out but
nothing that should take too long.  I'm sure it'll take a rev or two more.
Right now for example, I've added support to arm-virt and maybe need to
move that over to a different machine model...

>=20
> What's the current use case? Testing drivers before real HW comes out?
> Will it still be useful after real HW comes out for people wanting to
> debug things without HW?

CXL is continuing to expand in scope and capabilities and I don't see that
reducing any time soon (My guess is 3 years+ to just catch up with what is
under discussion today).  So I see two long term use cases:

1) Automated verification that we haven't broken things.  I suspect no
one person is going to have a test farm covering all the corner cases.
So we'll need emulation + firmware + kernel based testing.

2) New feature prove out.  We have already used it for some features that
will appear in the next spec version. Obviously I can't say what or
send that code out yet.  Its very useful and the spec draft has changed
in various ways a result.  I can't commit others, but Huawei will be
doing more of this going forwards.  For that we need a stable base to
which we add the new stuff once spec publication allows it.

>=20
> >
> > I had hoped we could merge what was there mostly as is and fix it up as=
 we go.
> > It's useful in the state it is now, and as time goes on, we find more u=
secases
> > for it in a VMM, and not just driver development.
> > =20
> >>=20
> >> Adding new subsystems to QEMU does seem to be a pain point for new
> >> contributors. Patches tend to fall through the cracks of existing
> >> maintainers who spend most of their time looking at stuff that directly
> >> touches their files. There is also a reluctance to merge large chunks =
of
> >> functionality without an identified maintainer (and maybe reviewers) w=
ho
> >> can be the contact point for new patches. So in short you need:
> >>=20
> >>  - Maintainer Reviewed-by/Acked-by on patches that touch other sub-sys=
tems =20
> >
> > This is the challenging one. I have Cc'd the relevant maintainers (hw/p=
ci and
> > hw/mem are the two) in the past, but I think there interest is lacking =
(and
> > reasonably so, it is an entirely different subsystem). =20
>=20
> So the best approach to that is to leave a Cc: tag in the patch itself
> on your next posting so we can see the maintainer did see it but didn't
> contribute a review tag. This is also a good reason to keep Message-Id
> tags in patches so we can go back to the original threads.
>=20
> So in my latest PR you'll see:
>=20
>   Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>   Reviewed-by: Beraldo Leal <bleal@redhat.com>
>   Message-Id: <20211122191124.31620-1-willianr@redhat.com>
>   Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>   Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>   Message-Id: <20211129140932.4115115-7-alex.bennee@linaro.org>
>=20
> which shows the Message-Id from Willian's original posting and the
> latest Message-Id from my posting of the maintainer tree (I trim off my
> old ones).
>=20
> >>  - Reviewed-by tags on the new sub-system patches from anyone who unde=
rstands CXL =20
> >
> > I have/had those from Jonathan.
> > =20
> >>  - Some* in-tree testing (so it doesn't quietly bitrot) =20
> >
> > We had this, but it's stale now. We can bring this back up.
> > =20
> >>  - A patch adding the sub-system to MAINTAINERS with identified people=
 =20
> >
> > That was there too. Since the original posting, I'd be happy to sign Jo=
nathan up
> > to this if he's willing. =20
>=20
> Sounds good to me.

Sure that's fine with me.  Ben, I'm assuming you are fine with being joint =
maintainer?

>=20
> >> * Some means at least ensuring qtest can instantiate the device and not
> >>   fall over. Obviously more testing is better but it can always be
> >>   expanded on in later series. =20
> >
> > This was in the patch series. It could use more testing for sure, but I=
 had
> > basic functional testing in place via qtest. =20
>=20
> More is always better but the basic qtest does ensure a device doesn't
> segfault if it's instantiated.

I'll confess this is a bit I haven't looked at yet. Will get Shameer to give
me a hand.

Thanks

Jonathan


>=20
> > =20
> >>=20
> >> Is that the feedback you were looking for? =20
> >
> > You validated my assumptions as to what's needed, but your first bullet=
 is the
> > one I can't seem to pin down.
> >
> > Thanks.
> > Ben =20
>=20
>=20


