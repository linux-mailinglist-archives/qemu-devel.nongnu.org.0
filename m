Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF7159367
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 16:42:30 +0100 (CET)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1XgD-0003oc-Ba
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 10:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j1Xey-0002U9-KH
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j1Xex-0006tD-El
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:41:12 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:46509)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j1Xex-0006q4-51
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 10:41:11 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M9Ib1-1j6mqd0aV5-006Q5r; Tue, 11 Feb 2020 16:40:24 +0100
Subject: Re: [PATCH v2 0/4] linux-user: fix use of SIGRTMIN
References: <20200204171053.1718013-1-laurent@vivier.eu>
To: Peter Maydell <peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0a59acfa-35c5-4ecb-aa43-ceba0efca530@vivier.eu>
Date: Tue, 11 Feb 2020 16:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200204171053.1718013-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ScbpI+7wst7BZPaKOuvkDTRy0NDbcgfMCQP2C7YTe9uvD32n2zq
 H/55+2JEHStECvJtU0dPmAsZRuCrj8cHoPbLtryB+O4FKcXKAQlTBfwtHKB9WuHEZ9ftWGR
 TLc10m6c0qptyN8m/OIVxXxsIzkWkBFX1XDnCP8sLxDwCf73aS1AYOXGxAiukQ7L3U7uYqE
 +OZrKTxp02XkpGuFuJgwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sibVqUZyWF0=:EMNdZ1vxS4hNwwwRRO7GQe
 NXUwYl1Tutvw9q+VVp9BZt3rRdGFEgPukj3VEdgxDKGJBAFOMaWgObNCO4fSdALtIWB3q1RWC
 gOiy1cTHeKwz4y118cHsWjlZe24jdzPDAwVsGJ8L5wsgls21R/bjmJuVN1jkqqtadUEeWm1NU
 t9sF4zOkJzKr5+wfSzsBo7EEEL4/xjzbe6cKbPZGStdeHw07MGrGl7vYt3zRBuX2tDvBdUDiX
 MzUQT3JGBKvGa9AEU9PCnqJmi0uRH8FwStUXU+jTYZWELg4fR2+Dtx6vomiCUujoS64KmOP/S
 zBWwoIZ9g6f4hOxtEe7AndM12iBMjRZQg0Cbr6x5KzFS8slhQ/VJzMeeKeehmGCWXmkXU0D9Z
 CrI4wIEZpJIo3mWXEuet3lpaT6qmm45GzJTzYNeMYGIfFkItVd3AYmV5aB2F0ag3LdRGRB+3Q
 kiEpoPXjlVv4ctHqk9iO36nxPHPNHJtbZLJOIE6GXFCTLb/kiI+UrHvDcemzOVUole73MHlVt
 q8LA5ElhFMUr+lq8Gz6+fiefUCxFzoVQNAWloOAXi35spEw51vvemo0emxLU2dqMVn9B3zi5l
 gTtwEpQPgWtAcF09Tde3YMI2uItazvj3pKy6+L5uWhX9uatsYlhJ7LuwRQNQLtio1K6qcox57
 JHVJV7elgZ+iD+IlbBK6P4YPiffAW47kLMcRB6uIkMvSWxbRmzTltuaq8KB8FFFD+i74R8Kgl
 9t3XFe27BS8PI6ePmFJUuJamn2lSYcC0NsItbZORpDPIS5A9ZqW5Kzb6Ug+EbdHxQK4cYGGEl
 K1SgiOtIMhu4LTO96gk0MGbnzFQjrDiZMJecX8zHMEPgnMk5JMJnacWpPTUn1uMkvu/i0EW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
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
Cc: Josh Kunz <jkz@google.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Marlies Ruck <marlies.ruck@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Matus Kysel <mkysel@tachyum.com>, milos.stojanovic@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

do you have any comment on this way to fix the SIGRTMIN problem we have
now for years?

Thanks,
Laurent

Le 04/02/2020 à 18:10, Laurent Vivier a écrit :
> This series fixes the problem of the first real-time signals already
> in use by the glibc that are not available for the target glibc.
> 
> Instead of reverting the first and last real-time signals we rely on
> the value provided by the glibc (SIGRTMIN) to know the first available
> signal and we map all the signals from this value to SIGRTMAX on top
> of TARGET_SIGRTMIN. So the consequence is we have less available signals
> in the target (generally 2) but all seems fine as at least 30 signals are
> still available.
> 
> This has been tested with Go (golang 1.10.1 linux/arm64, bionic) on x86_64
> fedora 31. We can avoid the failure in this case allowing the unsupported
> signals when we don't provide the "act" parameters to sigaction, only the
> "oldact" one. I have also run the LTP suite with several target and debian
> based distros.
> 
> v2: tested with golang 1.12.10 linux/arm64, eoan)
>     Ignore unsupported signals rather than returning an error
>     replace i, j by target_sig, host_sig
> 
> Laurent Vivier (4):
>   linux-user: add missing TARGET_SIGRTMIN for hppa
>   linux-user: cleanup signal.c
>   linux-user: fix TARGET_NSIG and _NSIG uses
>   linux-user: fix use of SIGRTMIN
> 
>  linux-user/hppa/target_signal.h |   1 +
>  linux-user/signal.c             | 117 +++++++++++++++++++++++---------
>  linux-user/trace-events         |   3 +
>  3 files changed, 89 insertions(+), 32 deletions(-)
> 


