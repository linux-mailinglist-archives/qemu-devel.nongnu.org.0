Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10113A24B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 08:54:24 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irH1s-0004Vs-23
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 02:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>) id 1irH0t-0003at-QL
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 02:53:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <benh@kernel.crashing.org>) id 1irH0s-0005q9-UW
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 02:53:23 -0500
Received: from kernel.crashing.org ([76.164.61.194]:53900)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <benh@kernel.crashing.org>)
 id 1irH0q-0005pL-84; Tue, 14 Jan 2020 02:53:20 -0500
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00E7r2tr000335
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 14 Jan 2020 01:53:06 -0600
Message-ID: <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Liviu Ionescu <ilg@livius.net>
Date: Tue, 14 Jan 2020 18:53:01 +1100
In-Reply-To: <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 76.164.61.194
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, keithp@keithp.com, qemu-arm@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-01-14 at 09:32 +0200, Liviu Ionescu wrote:
> > On 14 Jan 2020, at 08:25, Benjamin Herrenschmidt <
> > benh@kernel.crashing.org> wrote:
> > 
> > I noticed that the bulk of arm-semi.c (or riscv-semi.c) is
> > trivially
> > made completely generic by doing a couple of changes:
> 
> Last year I did a similar exercise in OpenOCD, where I took the Arm
> semihosting code from the Arm specific location, extracted the common
> part, updated it for latest Arm 64-bit specs, and then used the
> common code for both Arm and RISC-V.
> 
> If you think useful, you might take a look there too.

Well, one of the LCA talks wasn't that interesting so I started doing
it and am almost done :-)

I'll look at doing something for arm, riscv and ppc and send patches
once I get it working.

Cheers,
Ben.

> 
> Regards,
> 
> Liviu


