Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E333B5BE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 15:06:23 +0200 (CEST)
Received: from localhost ([::1]:46242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haK0E-00016Y-CS
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 09:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1haJuT-00080h-Uq
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1haJuQ-0002VF-8H
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:00:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1haJuO-0002TM-8U
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:00:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 45D4A9C158;
 Mon, 10 Jun 2019 13:00:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80DF560C69;
 Mon, 10 Jun 2019 12:59:59 +0000 (UTC)
Date: Mon, 10 Jun 2019 14:59:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190610145955.7877a408@redhat.com>
In-Reply-To: <b65a3316-005a-02cb-8ea4-b956f9c26941@redhat.com>
References: <20190607153725.18055-1-philmd@redhat.com>
 <20190607153725.18055-5-philmd@redhat.com>
 <e6e5f4ef-27c1-ce7c-e404-621c86af43ea@redhat.com>
 <b65a3316-005a-02cb-8ea4-b956f9c26941@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 10 Jun 2019 13:00:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v18 04/29] !fixup target/rx: CPU definition
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jun 2019 20:06:12 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 6/7/19 8:02 PM, Eric Blake wrote:
> > On 6/7/19 10:37 AM, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >> Rename macros. =20
> >=20
> > Why is this marked '!fixup' in the subject instead of just merging the
> > patches directly? =20
>=20
> Since all the series is reviewed/tested and Igor asked to amend a fixup
> but we are having hard time to figure if we understand Igor request
> correctly, I thought it would be easier for him to review this way, then
> for Richard to squash the patches and send the pull request.
I've explicitly asked for merging if I'm not mistaken.

=20
> Is it confuse/bad practice?
it's confusing at least for me, since I have to review broken patch and fix=
 ups
on top doing merge in my head and still won't be sure if I've missed
something in process on not.

(Fix ups are fine for trivial change that affect only one patch,
which isn't case here)

Please respin.

>=20
> In the cover I wrote:
>=20
>   If Igor aggrees with the fixup patches, Richard, can you squash
>   them and send a pull request?  (without the last patch, which is
>   expected to go via Eduardo's tree, but since it is helpful for
>   testing this series, I included it).
>=20
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  target/rx/cpu.c | 22 ++++++++++++++--------
> >>  target/rx/cpu.h | 12 ++++++------
> >>  2 files changed, 20 insertions(+), 14 deletions(-)
> >> =20


