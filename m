Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500194DAC65
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 09:25:25 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUOyB-0002sq-TQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 04:25:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@ellerman.id.au>)
 id 1nUOwz-0002BU-GL; Wed, 16 Mar 2022 04:24:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@ellerman.id.au>)
 id 1nUOwx-0002NJ-1J; Wed, 16 Mar 2022 04:24:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KJNbG0r1Wz4xc4;
 Wed, 16 Mar 2022 19:23:54 +1100 (AEDT)
From: Michael Ellerman <michael@ellerman.id.au>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 5/8] mailmap/gitdm: more fixes for bad tags and authors
In-Reply-To: <20220315121251.2280317-6-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-6-alex.bennee@linaro.org>
Date: Wed, 16 Mar 2022 19:23:50 +1100
Message-ID: <87y21a2tm1.fsf@mpe.ellerman.id.au>
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 Jason Wang <jasowang@redhat.com>, Aaron Larson <alarson@ddci.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Andreas =?utf-8?Q?F=C3=A4rber?= <andreas.faerber@web.de>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Aaron Larson <alarson@ddci.com>
> Cc: Andreas F=C3=A4rber <andreas.faerber@web.de>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael Ellerman <michael@ellerman.id.au>
>
> ---
> v2
>   - added Aaron's acked by
>   - dropped Peter Chubb from CC (bouncing emails)
>   - used Michaels preferred coding email

Thanks.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

