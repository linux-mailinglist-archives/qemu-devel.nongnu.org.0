Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8BDF0CB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 17:05:24 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZFK-0004zi-Gv
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 11:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.rikalo@rt-rk.com>) id 1iMZC4-0001U0-OV
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.rikalo@rt-rk.com>) id 1iMZC2-0006QD-Dl
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:01:59 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59219 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.rikalo@rt-rk.com>)
 id 1iMZC2-0005vk-1X
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:01:58 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B817F1A1DFE;
 Mon, 21 Oct 2019 17:00:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from [10.10.14.141] (rtrkw304-lin.domain.local [10.10.14.141])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9E4701A1DE3;
 Mon, 21 Oct 2019 17:00:52 +0200 (CEST)
Subject: Re: [PATCH v5 00/10] target/mips: Misc cleanups for September/October
 2019
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1571592258-27994-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Message-ID: <c4eaaa81-7675-0ec9-d89a-de77a277243d@rt-rk.com>
Date: Mon, 21 Oct 2019 17:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1571592258-27994-1-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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

 > From: Aleksandar Markovic <amarkovic@wavecomp.com>
 >
 > Mostly cosmetic changes.
 >
 > v4->v5:
 >
 >=C2=A0=C2=A0 - minor correction in patch on helper.c
 >=C2=A0=C2=A0 - added patches 9 and 10
 >
 > v3->v4:
 >
 >=C2=A0=C2=A0 - added patches 7 and 8
 >
 > v2->v3:
 >
 >=C2=A0=C2=A0 - removed all patches that were already integrated
 >=C2=A0=C2=A0 - patches 1 and 2 are improved from v2
 >=C2=A0=C2=A0 - added patches 3-6
 >
 > v1->v2:
 >
 >=C2=A0=C2=A0 - minor corrections to satisfy reviews
 >=C2=A0=C2=A0 - added several more patches
 >
 > Aleksandar Markovic (10):
 >=C2=A0=C2=A0 target/mips: Clean up helper.c
 >=C2=A0=C2=A0 target/mips: Clean up op_helper.c
 >=C2=A0=C2=A0 MAINTAINERS: Update mail address of Aleksandar Rikalo
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for <MAX|MIN>_A.<B|H|W|D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for <MAX|MIN>_<S|U>.<B|H|W=
|D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for ILV<EV|OD|L|R>.<B|H|W|=
D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for ADD<_A|S_A|S_S|S_U|V>.=
<B|H|W|D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for HADD_<S|U>.<H|W|D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for S<LL|RA|RAR|RL|RLR>.<B=
|H|W|D>
 >=C2=A0=C2=A0 target/mips: msa: Split helpers for PCK<EV|OD>.<B|H|W|D>
 >
 >=C2=A0 .mailmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +-
 >=C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 18 +-
 >=C2=A0 target/mips/helper.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 123 +-
 >=C2=A0 target/mips/helper.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 133 +-
 >=C2=A0 target/mips/msa_helper.c | 4244=20
+++++++++++++++++++++++++++++-----------------
 >=C2=A0 target/mips/op_helper.c=C2=A0 | 1010 +++++++----
 >=C2=A0 target/mips/translate.c=C2=A0 |=C2=A0 442 ++++-
 >=C2=A0 7 files changed, 3966 insertions(+), 2009 deletions(-)
 >


For the whole series:

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>


