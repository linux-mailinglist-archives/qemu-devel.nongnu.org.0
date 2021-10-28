Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4C43E076
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 14:05:52 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg4AJ-000590-8h
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 08:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mg47r-0004TG-Gr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 08:03:21 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:37929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mg47k-00064R-OC
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 08:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=1wP8Wtn6B3HLaQsTnWI9l4mJXDmlq1NeKcB3guwlNxE=; b=O8ai+O0086TX9qiv0uhQRPbjcu
 YMt4NkUTXBuDRvFwSQ6x2tvPCmUzZY9P7cYBFCfjQ8/Sn5/BgvTR0iHPndb9Zhf1p52oopdHvprvL
 UFdL3EmA41doNK1S2YupweiC8tte31jzyRjrH7DOVqLVipQuyOg/22RmsznCXiwz8J8C1dGW4ajsh
 Gu8msCQ7GGDGkK3a2i4gKF5ozUq+ujywBI64I8K3oX8fQ7z69MOus7SnIkjDHMg78VFkRRs0vhhjB
 DOrnKDw+s8gdmP5O2x8mexfKmCjFK9YkQXABC1RKi/oRYSTQxrLd0LLwBWQaffz1i/t6a/Y8UsQ54
 8pWkWVfTEVnx7E/FWnRMKETjYmbA+V4kXNijGKDhoWUQ3DbUG+T/evNrabB8RGcJvFSlCLXH7BekZ
 Mq2gNZmu/MOKf8Z/wJStKccBgohdDdtDc22bR/ulr8NL6xGeqm9wnHsnuQiVjVZ8WY3B82LOyR/V0
 /Hk9lYgFrfnEHKf14/CCUD+pkGIgKhkGXY1a7rznxZ0UpqtIwftqQ63VDCgr41+L/1ZV+Q0tTTLdk
 QwPHYf/t0bOImX7GRwOz8UXOrHW/2dtkI1BzVj/zTZ4+80HmZMpPJdsR6hdWRLn9dHWUiHiesbFp2
 lD42Xd4HkScoHRKoIGimV2eKQuqVhXiiEFaHveQgA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
Date: Thu, 28 Oct 2021 14:03:08 +0200
Message-ID: <3116841.G7nDPmeRIp@silver>
In-Reply-To: <0550cde6-3284-92c0-94bb-e9e66553104f@linaro.org>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <13405882.ftTnZbQXCH@silver>
 <0550cde6-3284-92c0-94bb-e9e66553104f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 27. Oktober 2021 20:44:52 CEST Richard Henderson wrote:
> On 10/27/21 10:29 AM, Christian Schoenebeck wrote:
> > On Mittwoch, 27. Oktober 2021 18:48:10 CEST Philippe Mathieu-Daud=E9 wr=
ote:
> >> On 10/27/21 18:21, Christian Schoenebeck wrote:
> >>> On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daud=E9=
=20
wrote:
> >>>> Hi Christian,
> >>>>=20
> >>>> On 10/27/21 16:05, Christian Schoenebeck wrote:
> >>>>> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck=20
wrote:
> >>>>>> The following changes since commit
> >>>=20
> >>> 931ce30859176f0f7daac6bac255dae5eb21284e:
> >>>>>>    Merge remote-tracking branch
> >>>>>>    'remotes/dagrh/tags/pull-virtiofs-20211026'
> >>>>>>=20
> >>>>>> into staging (2021-10-26 07:38:41 -0700)
> >>>>>>=20
> >>>>>> are available in the Git repository at:
> >>>>>>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> >>>>>>=20
> >>>>>> for you to fetch changes up to
> >=20
> > 7e985780aaab93d2c5be9b62d8d386568dfb071e:
> >>>>>>    9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> >>>>>>=20
> >>>>>> ----------------------------------------------------------------
> >>>>>> 9pfs: performance fix and cleanup
> >>>>>>=20
> >>>>>> * First patch fixes suboptimal I/O performance on guest due to
> >>>>>> previously
> >>>>>>=20
> >>>>>>    incorrect block size being transmitted to 9p client.
> >>>>>>=20
> >>>>>> * Subsequent patches are cleanup ones intended to reduce code
> >>>>>> complexity.
> >>>>>>=20
> >>>>>> ----------------------------------------------------------------
> >>>>>>=20
> >>>>>> Christian Schoenebeck (8):
> >>>>>>        9pfs: fix wrong I/O block size in Rgetattr
> >>>>>>        9pfs: deduplicate iounit code
> >>>>>>        9pfs: simplify blksize_to_iounit()
> >>>>>>        9pfs: introduce P9Array
> >>>>>>        fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
> >>>>>>        9pfs: make V9fsString usable via P9Array API
> >>>>>>        9pfs: make V9fsPath usable via P9Array API
> >>>>>>        9pfs: use P9Array in v9fs_walk()
> >>>>>>  =20
> >>>>>>   fsdev/9p-marshal.c |   2 +
> >>>>>>   fsdev/9p-marshal.h |   3 +
> >>>>>>   fsdev/file-op-9p.h |   2 +
> >>>>>>   fsdev/p9array.h    | 160
> >>>>>>=20
> >>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c
> >>>>>>=20
> >>>>>> 70 +++++++++++++----------
> >>>>>>=20
> >>>>>>   5 files changed, 208 insertions(+), 29 deletions(-)
> >>>>>>   create mode 100644 fsdev/p9array.h
> >>>>>=20
> >>>>> Regarding last 5 patches: Daniel raised a concern that not using
> >>>>> g_autoptr
> >>>>> would deviate from current QEMU coding patterns:
> >>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
> >>>>>=20
> >>>>> Unfortunately I saw no way to address his concern without adding
> >>>>> unnecessary code complexity, so I decided to make this a 9p local t=
ype
> >>>>> (QArray -> P9Array) for now, which can easily be replaced in future
> >>>>> (e.g.
> >>>>> when there will be something appropriate on glib side).
> >>>>=20
> >>>> Hmm various patches aren't reviewed yet... In particular
> >>>> patch #5 has a Suggested-by tag without Reviewed-by, this
> >>>> looks odd.
> >>>>=20
> >>>> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
> >>>>    Don't send pull requests for code that hasn't passed review.
> >>>>    A pull request says these patches are ready to go into QEMU now,
> >>>>    so they must have passed the standard code review processes. In
> >>>>    particular if you've corrected issues in one round of code review,
> >>>>    you need to send your fixed patch series as normal to the list;
> >>>>    you can't put it in a pull request until it's gone through.
> >>>>    (Extremely trivial fixes may be OK to just fix in passing, but
> >>>>    if in doubt err on the side of not.)
> >>>=20
> >>> There are in general exactly two persons adding their RBs to 9p patch=
es,
> >>> which is either Greg or me, and Greg made it already clear that he
> >>> barely
> >>> has time for anything above trivial set.
> >>>=20
> >>> So what do you suggest? You want to participate and review 9p patches?
> >>=20
> >> Well I am a bit surprised...
> >>=20
> >> $ git log --oneline \
> >>=20
> >>      --grep=3D'Reviewed-by: Philippe Mathieu-Daud=E9' -- hw/9pfs/ | wc=
 -l
> >>=20
> >> 18
> >>=20
> >> I also reviewed patch #3 if this pull request...
> >>=20
> >>=20
> >> Now I see you posted this 4 times in 2 months, so indeed eventual
> >> reviewers had plenty of time to look at your patches.
> >>=20
> >> Note I haven't said I'd NAck your pull request, I noticed your own
> >> concern wrt Daniel comment, so I looked at the patch and realized
> >> it was not reviewed, and simply said this is this is odd.
> >>=20
> >> Regards,
> >>=20
> >> Phil.
> >=20
> > Philippe, of course I understand why this looks odd to you, and yes you
> > reviewed that particular patch. But the situation on the 9p front is li=
ke
> > this for >2 years now: people quickly come by to nack patches, but even
> > after having addressed their concerns they barely add their RBs
> > afterwards. That means I am currently forced to send out PRs without RBs
> > once in a while.
> In know the feeling -- it takes quite some prodding to get tcg patches
> reviewed, and I have also sent out PRs that are incompletely reviewed.
>=20
> I see that patch 5 was something I suggested myself, which I then failed =
to
> review afterward.  In recompense, I have reviewed the whole patch set:
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> I think the P9Array is fairly clever, and I do prefer it over glib ugline=
ss.
>  I can imagine only C++ being an improvement over what you've created.
>=20
> Rather than force you to re-create the PR, I'll simply apply this along w=
ith
> the S-o-b, to the merge object.
>=20
>=20
> r~

Thanks Richard, I highly appreciate that!

Best regards,
Christian Schoenebeck



