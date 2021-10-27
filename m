Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4443CFD2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:33:59 +0200 (CEST)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmoI-0007iu-Be
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mfmjp-0004hJ-Ap
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:29:21 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mfmjl-0005nK-M7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=b5CNdaosu3cP4qM0HAjwyN+DWXLWy0Xzf7W5d9otdAs=; b=e3TIPmihb8BYtb9WiVSZzYD08B
 OHV2yAQjusf2EQgaDOy7Z1U5UVOb4mCrGG3dypIhR0FW10TlqBC8tZo00wx4Ng1Au+oY0MEEaf7Wu
 XZUVcR2SAUEodpbJr7f1mmaL5slEJGgFI4b4n1vvMSEEKMvxMSsU4ogjmZp0X5Te92NdOwXmp7hlL
 zUE9Oj1K+0olJtCQZg/WeaBsDTPCKoqXsf6BZ1vLsThhDc+jOU6rfza55fhNK00kySmqfeA7zV1Gy
 Jh/BhEtWlviyQAyhj1BtztChiVSb0ryHaZC92iB4Dyw9esno/yNTfxsA/oADUOVY8I4zFxKKELblj
 WvQuY/NbBtVAaNXGqO1HO4H0ukvnHZdNbIagElXb6JMSrJlSTP5CX/QMwVAjcTk9Fy7BGymIJQ9aZ
 HPnyWDyBLp5+jFjs003++j5jFPpHZEMLGzHJjfhXNxuRywffY87uEhXdE2k6usUMCzX7clTay1vWd
 49Xq8J55nHGu2AKP/RVmIF4u5eGgp2dEDHfUjoHbTeugaAu4c+0k0WyHjyUFNBz/SmbEOwwd0Y3A7
 jzv6mWA6AoSVzwj7QYzwSsmsjemurnsEpdkT0v4o4FiF1iIR4ByH/aQy9MFY7bpJ3Z8Q5DpojFGfu
 U3LmPvwgIHRoT5zOv0Z7/jdTaGisu6obtB0LfZ3A4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
Date: Wed, 27 Oct 2021 19:29:13 +0200
Message-ID: <13405882.ftTnZbQXCH@silver>
In-Reply-To: <36b93ef0-bcff-1be6-ce8d-03cd61f0a0fd@redhat.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <2647527.eb0YlLX8Cn@silver> <36b93ef0-bcff-1be6-ce8d-03cd61f0a0fd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 27. Oktober 2021 18:48:10 CEST Philippe Mathieu-Daud=E9 wrote:
> On 10/27/21 18:21, Christian Schoenebeck wrote:
> > On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daud=E9 wr=
ote:
> >> Hi Christian,
> >>=20
> >> On 10/27/21 16:05, Christian Schoenebeck wrote:
> >>> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wro=
te:
> >>>> The following changes since commit
> >=20
> > 931ce30859176f0f7daac6bac255dae5eb21284e:
> >>>>   Merge remote-tracking branch
> >>>>   'remotes/dagrh/tags/pull-virtiofs-20211026'
> >>>>=20
> >>>> into staging (2021-10-26 07:38:41 -0700)
> >>>>=20
> >>>> are available in the Git repository at:
> >>>>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> >>>>=20
> >>>> for you to fetch changes up to=20
7e985780aaab93d2c5be9b62d8d386568dfb071e:
> >>>>   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> >>>>=20
> >>>> ----------------------------------------------------------------
> >>>> 9pfs: performance fix and cleanup
> >>>>=20
> >>>> * First patch fixes suboptimal I/O performance on guest due to
> >>>> previously
> >>>>=20
> >>>>   incorrect block size being transmitted to 9p client.
> >>>>=20
> >>>> * Subsequent patches are cleanup ones intended to reduce code
> >>>> complexity.
> >>>>=20
> >>>> ----------------------------------------------------------------
> >>>>=20
> >>>> Christian Schoenebeck (8):
> >>>>       9pfs: fix wrong I/O block size in Rgetattr
> >>>>       9pfs: deduplicate iounit code
> >>>>       9pfs: simplify blksize_to_iounit()
> >>>>       9pfs: introduce P9Array
> >>>>       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
> >>>>       9pfs: make V9fsString usable via P9Array API
> >>>>       9pfs: make V9fsPath usable via P9Array API
> >>>>       9pfs: use P9Array in v9fs_walk()
> >>>> =20
> >>>>  fsdev/9p-marshal.c |   2 +
> >>>>  fsdev/9p-marshal.h |   3 +
> >>>>  fsdev/file-op-9p.h |   2 +
> >>>>  fsdev/p9array.h    | 160
> >>>>=20
> >>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c
> >>>>=20
> >>>> 70 +++++++++++++----------
> >>>>=20
> >>>>  5 files changed, 208 insertions(+), 29 deletions(-)
> >>>>  create mode 100644 fsdev/p9array.h
> >>>=20
> >>> Regarding last 5 patches: Daniel raised a concern that not using
> >>> g_autoptr
> >>> would deviate from current QEMU coding patterns:
> >>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
> >>>=20
> >>> Unfortunately I saw no way to address his concern without adding
> >>> unnecessary code complexity, so I decided to make this a 9p local type
> >>> (QArray -> P9Array) for now, which can easily be replaced in future
> >>> (e.g.
> >>> when there will be something appropriate on glib side).
> >>=20
> >> Hmm various patches aren't reviewed yet... In particular
> >> patch #5 has a Suggested-by tag without Reviewed-by, this
> >> looks odd.
> >>=20
> >> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
> >>   Don't send pull requests for code that hasn't passed review.
> >>   A pull request says these patches are ready to go into QEMU now,
> >>   so they must have passed the standard code review processes. In
> >>   particular if you've corrected issues in one round of code review,
> >>   you need to send your fixed patch series as normal to the list;
> >>   you can't put it in a pull request until it's gone through.
> >>   (Extremely trivial fixes may be OK to just fix in passing, but
> >>   if in doubt err on the side of not.)
> >=20
> > There are in general exactly two persons adding their RBs to 9p patches,
> > which is either Greg or me, and Greg made it already clear that he bare=
ly
> > has time for anything above trivial set.
> >=20
> > So what do you suggest? You want to participate and review 9p patches?
>=20
> Well I am a bit surprised...
>=20
> $ git log --oneline \
>     --grep=3D'Reviewed-by: Philippe Mathieu-Daud=E9' -- hw/9pfs/ | wc -l
> 18
>=20
> I also reviewed patch #3 if this pull request...
>=20
>=20
> Now I see you posted this 4 times in 2 months, so indeed eventual
> reviewers had plenty of time to look at your patches.
>=20
> Note I haven't said I'd NAck your pull request, I noticed your own
> concern wrt Daniel comment, so I looked at the patch and realized
> it was not reviewed, and simply said this is this is odd.
>=20
> Regards,
>=20
> Phil.

Philippe, of course I understand why this looks odd to you, and yes you=20
reviewed that particular patch. But the situation on the 9p front is like t=
his=20
for >2 years now: people quickly come by to nack patches, but even after=20
having addressed their concerns they barely add their RBs afterwards. That=
=20
means I am currently forced to send out PRs without RBs once in a while.

The mentioned 5 patches look like overkill on first sight, but they are jus=
t=20
intended as preparatory ones. I actually should fix a protocol implementati=
on=20
deficit in "Twalk" request handling, and that in turn means I will have to =
add=20
complexity to function v9fs_walk(). But before even daring to do so, I shou=
ld=20
get rid of as much of complexity as possible. Because we already had a bunc=
h=20
of issues in that function before. I believe these are trivial 5 patches. B=
ut=20
I can also accompany them with test cases if somebody is worried.

Greg, I could also drop them now, but the general issue will retain: Realit=
y=20
is that I am the only person working on 9p right now and a fact that I cann=
ot=20
change. The rest is for other people to decide.

Best regards,
Christian Schoenebeck



