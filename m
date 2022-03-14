Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BF4D8FD2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 23:45:41 +0100 (CET)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtRc-0002zl-8G
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 18:45:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@ellerman.id.au>)
 id 1nTtQ7-0002Js-97
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:44:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@ellerman.id.au>)
 id 1nTtQ4-0002MY-PF
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:44:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KHWmN21L2z4xbs;
 Tue, 15 Mar 2022 09:43:48 +1100 (AEDT)
From: Michael Ellerman <michael@ellerman.id.au>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] mailmap/gitdm: more fixes for bad tags and authors
In-Reply-To: <20220311135200.680127-1-alex.bennee@linaro.org>
References: <20220311135200.680127-1-alex.bennee@linaro.org>
Date: Tue, 15 Mar 2022 09:43:45 +1100
Message-ID: <87a6ds40ke.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=michael@ellerman.id.au; helo=gandalf.ozlabs.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Peter Chubb <peter.chubb@nicta.com.au>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <andreas.faerber@web.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Aaron Larson <alarson@ddci.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> I was running some historical tags for the last 10 years and got the
> following warnings:
>
>   git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/g=
itdm -n -l 5
>   alarson@ddci.com is an author name, probably not what you want
>   bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invali=
d continuation byte) in patchm skipping
>   bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invali=
d continuation byte) in patchm skipping
>   michael@ozlabs.org  is an author name, probably not what you want
>   Oops...funky email nicta.com.au
>   bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invali=
d continuation byte) in patchm skipping
>   Oops...funky email andreas.faerber
>   Grabbing changesets...done
>   Processed 76422 csets from 1902 developers
>
> The following fixes try and alleviate that although I still get a
> warning for Aaron which I think is from 9743cd5736.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Aaron Larson <alarson@ddci.com>
> Cc: Andreas F=C3=A4rber <andreas.faerber@web.de>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael Ellerman <michael@ellerman.id.au>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> ---
>  .mailmap              | 6 ++++++
>  contrib/gitdm/aliases | 5 ++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 5113f55b3a..5dc168b199 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -28,7 +28,11 @@ Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe=
2-441c-8c8c-71466251a162>
>  malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
>=20=20
>  # Corrupted Author fields
> +Aaron Larson <alarson@ddci.com> alarson@ddci.com
> +Andreas F=C3=A4rber <andreas.faerber@web.de> Andreas F=C3=A4rber <andrea=
s.faerber>
> +Jason Wang <jasowang@redhat.com> Jason Wang <jasowang>
>  Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.=
com>
> +Michael Ellerman <michael@ellerman.id.au> michael@ozlabs.org <michael@oz=
labs.org>

I prefer to use mpe@ellerman.id.au for coding related things, but
obviously this address also works.

cheers

