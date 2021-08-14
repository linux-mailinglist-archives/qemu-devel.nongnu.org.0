Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893E3EC2C3
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 15:07:08 +0200 (CEST)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEtNS-0007Eg-N6
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 09:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mEtMg-0006Zd-Pt
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 09:06:18 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mEtMf-0005me-2d
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 09:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IVzuzxMA0T64RTalAcPLmRU9Qw+aeV8l8rLAHfqTdgw=; b=QpeCWBFL7Dp+kWkBeZcf4wlTLp
 fs36OpGJ6s6QEwzEsnQvXckCRdM4MvJ2O4EkdPlKdmDL/b0Ynct5noR9U8i3tGaNyF7tddutqCgAn
 0q939vZz6unN77tbObiN6D04U9u37Qhswda4c8OH7fNX8630WvvcVujrJcwxWEjxgLcNFUUsCs4je
 zEmrMxmGEzoqvhGgfLbdKdZj488yLKihIS1IyYiieC6W+Uva/OrIsnuuXknx/c9mOLjlwhwb+MT7T
 P3gEJEkVsCgTCeDfJ3JIh3OZ5mV8fVGsz0o5q2v0JVVUiJWXShrr2yCmR2KwSg6SWtaeJZ1wAK4lM
 21pHipu9lcQA/G6Xa2K/X4iZN/TJ1XVnrXtTwUXESnkKQMm/aSwaOcX51R7er+EppgT4xTIauTl1R
 LI56xVv5Zoqux8QQYPSDxUpsrqKOvEw9R3nTRvrLsGI7lD0cob1FxiaQqpFc9DSggxiA/6PSGZAAg
 1XWoG4JV1jACM1r/8aGMX1+J9/PnrXx1FhrDZ8nbnPCU8v8BQ4OaYQ9tf8aBufsDFZHAny1IIIqeL
 vLm4tDAnXlj4HS298NOcCf8ncl3USYrgBeJNvd2oL3Rjiuebix3cjazNo4OruGni49l7h+ZMvVy4M
 p30SP27PfBCQVmH41vTjtyvZYlczdOrJsrffpdXpE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>, clamky@hotmail.com,
 Geoffrey McRae <geoff@hostfission.com>
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
Date: Sat, 14 Aug 2021 15:06:11 +0200
Message-ID: <56171895.JjOkaYd8Qb@silver>
In-Reply-To: <6a9ce32c-b6fb-91e5-efaf-82e883dd1796@redhat.com>
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <77562211.GzqkouU55n@silver>
 <6a9ce32c-b6fb-91e5-efaf-82e883dd1796@redhat.com>
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

On Donnerstag, 12. August 2021 15:13:24 CEST Philippe Mathieu-Daud=E9 wrote:
> Hi all,
>=20
> On 8/12/21 2:24 PM, Christian Schoenebeck wrote:
> > On Donnerstag, 12. August 2021 10:42:10 CEST Gerd Hoffmann wrote:
> >>   Hi,
> >>  =20
> >>>> On Tue, Aug 10, 2021 at 03:17:43PM +0300, clamky@hotmail.com wrote:
> >>>>> Gerd Hoffmann <kraxel@redhat.com> writes:
> >>>>>=20
> >>>>> Hell Gerd.
> >>>>>=20
> >>>>>> New maintainer wanted. Downgrade status to "Odd Fixes" for now.
> >>>>>=20
> >>>>> I can try to retake it.
> >>=20
> >> Given your track record is zero contributions to qemu in recent years
> >> I suggest you start getting involved in the development process as
> >> reviewer.  Just send a patch adding a "R: Name <email>" line for
> >> yourself to the MAINTAINERS file (best based on my pending pull
> >> request to avoid conflicts).  scripts/get_maintainer.pl will Cc: you
> >> on any audio-related patches then.
> >>=20
> >> I'd recommend to open an gitlab.com account (unless you already have
> >> one of course) so you can help triage bugs + issues.  You can also
> >> easily run qemu CI then (just push a branch to a qemu repo fork).
> >>=20
> >> HTH & take care,
> >>=20
> >>   Gerd
> >=20
> > I will add myself as reviewer for audio to help out a bit at least. I
> > won't be able to take over maintainership at this point though.
>=20
> Thanks for volunteering :)
>=20
> Following the overall thread, since I have been wondering about
> this subsystem during the night.
>=20
> As of v6.1.0-rc3:
>=20
> $ find {,include/}audio -type f | xargs cat | wc -l
> 11412
>=20
> $ find {,include/}hw/audio -type f | xargs cat | wc -l
> 14265
>=20
> So the backends / frontends have almost the same size.
>=20
> First idea, split the current entry in too, allowing developers
> with different interests to add their contact to the relevant entries.

Splitting the audio section sounds like a good idea to me.

It might also be worth a try asking the individual authors whether they wer=
e=20
fine being added as reviewer for their specific audio sources. If yes, then=
=20
the audio section could be further subdivided accordingly so that reviewers=
=20
would only get CCed for their specific code.

Best regards,
Christian Schoenebeck



