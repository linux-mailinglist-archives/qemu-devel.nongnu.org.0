Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61F4CAF74
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:13:36 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVLq-0005O8-PU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nPVKB-0004Kb-0I; Wed, 02 Mar 2022 15:11:51 -0500
Received: from [2001:738:2001:2001::2001] (port=28910 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nPVK7-0000JY-Td; Wed, 02 Mar 2022 15:11:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 926267457EF;
 Wed,  2 Mar 2022 21:11:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6F6B9745708; Wed,  2 Mar 2022 21:11:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6D6457456FE;
 Wed,  2 Mar 2022 21:11:42 +0100 (CET)
Date: Wed, 2 Mar 2022 21:11:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Issue with qemu-system-ppc running OSX guests
In-Reply-To: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
Message-ID: <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1626898179-1646251902=:37090"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-ppc@nongnu.org,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1626898179-1646251902=:37090
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 2 Mar 2022, Howard Spoelstra wrote:
> Hi all,
>
> I noticed qemu-system-ppc running OSX guests does not get to the desktop or
> does not display the menu bars.

Cc-ing the relevant people and the PPC list might help, I've added them. 
Also telling which OSX guest version can reproduce the problem could help 
debugging. Is it any OSX version?

Regards,
BALATON Zoltan

> Bisecting lead to this commit:
>
> 80eca687c8513a7e1611e0441abdd68b0c02a1d6 is the first bad commit
> commit 80eca687c8513a7e1611e0441abdd68b0c02a1d6
> Author: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
> Date:   Wed Mar 2 06:51:36 2022 +0100
>
>    target/ppc: moved vector even and odd multiplication to decodetree
>
>    Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
>    vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
>    muleuw and vmulouw from legacy to decodetree. Implemented
>    the instructions vmulesd, vmulosd, vmuleud, vmuloud.
>
>    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>    Signed-off-by: Lucas Mateus Castro (alqotel) <
> lucas.araujo@eldorado.org.br>
>    Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>    Message-Id: <20220225210936.1749575-3-matheus.ferst@eldorado.org.br>
>    Signed-off-by: Cédric Le Goater <clg@kaod.org>
>
> target/ppc/helper.h                 | 24 ++++++------
> target/ppc/insn32.decode            | 22 +++++++++++
> target/ppc/int_helper.c             | 20 +++++-----
> target/ppc/translate/vmx-impl.c.inc | 77
> ++++++++++++++++++++++++++++---------
> target/ppc/translate/vmx-ops.c.inc  | 15 ++------
> tcg/ppc/tcg-target.c.inc            |  6 +++
> 6 files changed, 112 insertions(+), 52 deletions(-)
>
> Best,
> Howard
>
--3866299591-1626898179-1646251902=:37090--

