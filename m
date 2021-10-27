Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B797B43CF0E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:53:41 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmBI-00076d-RH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mflg0-000085-HN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:21 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mflfu-0003oj-NH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Lf5MuGZ4m1wU5Vr/Bxs6dtiQ/8xNFsuIftEtEYxB3mg=; b=IZtreAw0KbfubGTm4Dhy7q1t4/
 rjQ3HSrioRt1YK4RQPJ/XX4aJAW8PaHnAEmfXBtB5cEQspX+jp9x6SeSbMlmKyIwDrShFo61hrfje
 Y5vaN8C4HwHwNxq7/itmI+bWsj7QUJiSPd+5snmoEnCduKOCQPTJajdAIUCD/UKzCGEL10a/ca4Vy
 IF5K9OJ4Bn+R4aQfOit0uvYxz4LPMavT2kO5/yY5hxpw9c10UdQW+/LhaUR9x8IjGVraN2VZY6AvO
 ghvz5L0WFKlzxARTBJgUCTB/ND7NgPPN+CqS7/bMfxQIS8ziVqlsq/i/M12IOy/auHQ/agnNYaaIi
 QaFaA1oTl9cBYu+RGypLrvCYbQ9+PIhdvGz4+5ngCojK8dWl7J0diSSGB65Ik1FSjvlJjTLhumnTC
 gLxJZJmWPOxQgnpFF+vZpPSjAZ5VjvHUW5NQIkzfNuJLTE07bLfe/i63v5GM5l4rRjL0FVcAkkiry
 azzrZdva9nNGqNmfnlNW4vYtqkWHn3NzACbjsYB/CpQYRK151z7WPVGnOrpoOypGECFk7rCEqla18
 K2cY5sopoAEy4+A45So2/tro+o+2cFkg5q4rPD5lJsCCbxIZaGdneTp2DVXpv7D7M/h+f7gJu3sem
 4KtnM5R4+Lakv/k9MjKNfBzocl3J3x8Rw5awNbut4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
Date: Wed, 27 Oct 2021 18:21:10 +0200
Message-ID: <2647527.eb0YlLX8Cn@silver>
In-Reply-To: <dd17a177-c7eb-b879-a980-a986344b9cac@redhat.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <1763549.VT83FdeJ1q@silver> <dd17a177-c7eb-b879-a980-a986344b9cac@redhat.com>
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

On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daud=E9 wrote:
> Hi Christian,
>=20
> On 10/27/21 16:05, Christian Schoenebeck wrote:
> > On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
> >> The following changes since commit=20
931ce30859176f0f7daac6bac255dae5eb21284e:
> >>   Merge remote-tracking branch
> >>   'remotes/dagrh/tags/pull-virtiofs-20211026'
> >>=20
> >> into staging (2021-10-26 07:38:41 -0700)
> >>=20
> >> are available in the Git repository at:
> >>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> >>=20
> >> for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071=
e:
> >>   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> >>=20
> >> ----------------------------------------------------------------
> >> 9pfs: performance fix and cleanup
> >>=20
> >> * First patch fixes suboptimal I/O performance on guest due to previou=
sly
> >>=20
> >>   incorrect block size being transmitted to 9p client.
> >>=20
> >> * Subsequent patches are cleanup ones intended to reduce code complexi=
ty.
> >>=20
> >> ----------------------------------------------------------------
> >>=20
> >> Christian Schoenebeck (8):
> >>       9pfs: fix wrong I/O block size in Rgetattr
> >>       9pfs: deduplicate iounit code
> >>       9pfs: simplify blksize_to_iounit()
> >>       9pfs: introduce P9Array
> >>       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
> >>       9pfs: make V9fsString usable via P9Array API
> >>       9pfs: make V9fsPath usable via P9Array API
> >>       9pfs: use P9Array in v9fs_walk()
> >> =20
> >>  fsdev/9p-marshal.c |   2 +
> >>  fsdev/9p-marshal.h |   3 +
> >>  fsdev/file-op-9p.h |   2 +
> >>  fsdev/p9array.h    | 160
> >>=20
> >> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c    =
 =20
> >> |
> >> 70 +++++++++++++----------
> >>=20
> >>  5 files changed, 208 insertions(+), 29 deletions(-)
> >>  create mode 100644 fsdev/p9array.h
> >=20
> > Regarding last 5 patches: Daniel raised a concern that not using g_auto=
ptr
> > would deviate from current QEMU coding patterns:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
> >=20
> > Unfortunately I saw no way to address his concern without adding
> > unnecessary code complexity, so I decided to make this a 9p local type
> > (QArray -> P9Array) for now, which can easily be replaced in future (e.=
g.
> > when there will be something appropriate on glib side).
>=20
> Hmm various patches aren't reviewed yet... In particular
> patch #5 has a Suggested-by tag without Reviewed-by, this
> looks odd.
>=20
> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
>=20
>   Don't send pull requests for code that hasn't passed review.
>   A pull request says these patches are ready to go into QEMU now,
>   so they must have passed the standard code review processes. In
>   particular if you've corrected issues in one round of code review,
>   you need to send your fixed patch series as normal to the list;
>   you can't put it in a pull request until it's gone through.
>   (Extremely trivial fixes may be OK to just fix in passing, but
>   if in doubt err on the side of not.)

There are in general exactly two persons adding their RBs to 9p patches, wh=
ich=20
is either Greg or me, and Greg made it already clear that he barely has tim=
e=20
for anything above trivial set.

So what do you suggest? You want to participate and review 9p patches?

Best regards,
Christian Schoenebeck



