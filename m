Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875CE51E7BB
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 16:18:13 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnLG8-0007k4-4A
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 10:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnLED-0006FN-Qp
 for qemu-devel@nongnu.org; Sat, 07 May 2022 10:16:14 -0400
Received: from mout.web.de ([217.72.192.78]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnLEA-00044o-MM
 for qemu-devel@nongnu.org; Sat, 07 May 2022 10:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1651932968;
 bh=A/csNgxFBNNnI4OJla1cyy22/z1NyaiOkhlb+awMYsA=;
 h=X-UI-Sender-Class:From:Subject:Date:References:To:In-Reply-To;
 b=Yhp58Wiuni7/2z5l13ALWxdw/+o0vEd0ZzlsdZgwU9+sNX/u/LSEYjwzXwWeH68AR
 uMKR9dh3B1a5UyxD5WTFqWyPO0NTDbqcWuDvQFyjdi57g/g+jGViFAImoiaB5sF89R
 WpQazSKmDNvK9labyRQNoj/ryFKbaulLbyV17TvA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5lj7-1ntfjH1oc7-0174G0 for
 <qemu-devel@nongnu.org>; Sat, 07 May 2022 16:16:08 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Possible bug in Aarch64 single-stepping
Date: Sat, 7 May 2022 16:16:07 +0200
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
To: qemu-devel@nongnu.org
In-Reply-To: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
Message-Id: <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:sw8f+HY1Am6G7nSHCOjnD7jO9adAWf0rHili/cYkcNFPei16TX/
 wW0iKvUA3JRURbQbeq7LVqX3/OevpOIHAwMO0F8n/Sl2o0gUmf3oh1Ig5ixFUHFqqYmwNPJ
 rkrO9wiIdz19Hzf1ETdU8rMrPLHQBRdKUmGZxDv4aaavqk68aJSKfRJDe6/D2MhxpHCH/Lu
 CUcSs9MOQlaKQADoU452g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RPCt66eB/SY=:M8VNUzmrbMKZDz2S8JrtvF
 HBb9mPKCzdKNfQ2Onrmr+1UCqQ0XlqLBD6fNnJCk3j7RW+M3hgBufoje3z/zQSHU/RiE2iA+X
 Hh6wqbR/nMPtI/422dlPco4/wQl23cnORM637kEHmQYa6gW5TB6n/jYMBjF8TCOZRwQb1+4QW
 aHBYlbpPdQzOKIMGg1nB7kH/d7ogWGjAOv29ELK8WyQ6OHggYNte74M7cFYn20D9b09IIayvm
 qPWNfwwRZO8TYwNH8ZkMgSHXDZm24kjP0Zgn3BWGCB82anrR/CidrLfTuJXwjzPgK1g1Q5Aex
 yuxlykXIwN6hYP9BJqtv82xjsDNwDoiHelR/G7MTEi/Fu6GDaVbXo2LRMTIqM96DldVP9NTqd
 8LmYTLG5V7LgkbUIrDtfE/Yx7aQtS9xvlvlxTRWmJcXp5oBeGlK7uooP39Cuf3aCs3d4Pb/1W
 FPmAAOIY/l01r0taGOrbwiemZT9b+9AGEM4carsEIj6XYg8dDjq+p5JPWVRYYC4syym0Zp338
 yyt6hJPol1aVwFGJu2mmC9tByaO8CNwUeirvI2DWcC9LPjAk9f6IlGxkAK8lZF/qLzFYEoa0R
 t3EzqsNkO/w1q8Xgesn3be2rVsp3W3Mg4bLjLF3Xfn+MKmm4MpxyoD3y2ukQ2H5Smi1vHkbUt
 Xv1cHNH0XnlVKJi9lgqwxCQ2OaI4FuyYGmNFzXddQzwHAb9b0jLV1ewWH4K1bwANz3p0c2/2p
 iQ40nYzXeKFtUvkdHCQaeAqfrrq9bHq6xO1f7YhI8zhJsyFrnkFrKKUF5vYluyS+FhonnTtWt
 o8PGknVH+m+4KtvuDvRccfe5FOrpZlOnH/uKjNfxNynmgwXevOeTO/WKNE6slTsvVNZ7YF4Gz
 b2+hmN/AqaenrUn1X1geazbO7dSXMcsgFxXkqq31ZPcOkpD59ikVYObSrVQ1Mw5jzq3krNTyY
 EhK+U8cqWCc3r4wH0nUmZBOSl9jZWsD70FP+S6Puia9cMqtpdvpwOopZ0SbuwEtGle37R8ZVe
 LxTFq3f4wMiiV63ICSRXma+evf/hqHEL3ux9YrYRZGawcHqh0Ic/opHFUTaESoywbAEZRaIQD
 nmYcpFPTfYlMW8=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7. May 2022, at 15:42, Chris Howard <cvz185@web.de> wrote:
>=20
> Hi, I=E2=80=99m writing a simple debugger in assembly code for the =
Raspberry Pi 3B (in aarch64).
>=20
> I=E2=80=99m using QEMU 7.0.0. Everything is running in EL1. (I have =
MDE and KDE set in MDSCR_EL1).
>=20
> I=E2=80=99m coming across Unexpected Behaviour when playing with =
single-stepping:
>=20
> It appears that single-stepping is enabled (ie. an exception is =
generated after every instruction) when the SS bit (bit-0) is set in =
MDSCR_EL1 and debug events are enabled in the CPSR (=E2=80=9CD=E2=80=9D =
bit clear) *** irrespective of whether the SS bit (bit-21) is set in =
CPSR or not ***.
>=20
> I thought the SS bit (bit-21) needs to be set in CPSR for =
single-stepping to occur (and that it gets cleared whenever an exception =
is taken and needs to be reset if one wants to single-step again).
>=20
> Have I misunderstood / misconfigured something, or is this a bug?
>=20
> Attached is a minimal(ish) example:

Oh, and the exception occurs immediately (after the ERET), rather than =
after the instruction has been executed. It appears to be acting like a =
hardware breakpoint.


PS. In plain gdb (ie. no nice user interface) a large number (but not =
all) of the system registers gets displayed after each step. It would be =
nice if these were sorted in some way. At the moment they=E2=80=99re =
completely jumbled =E2=80=94 not alphabetic, not grouped by EL, nor by =
=E2=80=9Cmeaning=E2=80=9D  (DBGWVR0_EL1 isn=E2=80=99t necessarily next =
to DBGWCR0_EL1).

Also, there are multiple (identical?) instances of =E2=80=9CDBGBVR=E2=80=9D=
 and =E2=80=9CDBGBCR=E2=80=9D (and  =E2=80=9CDBGWVR=E2=80=9D and =
=E2=80=9CDBGWCR=E2=80=9D) rather than the expected =E2=80=9CDBGWVR0_EL1=E2=
=80=9D, =E2=80=9CDBGWVR1_EL1=E2=80=9D etc.

Would this be a QEMU or a GDB issue? Or isn=E2=80=99t it an issue at =
all? :-)=

