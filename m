Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED7650D1AE
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 14:28:18 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nibLd-0003RP-Bm
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 08:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nibKc-0002bx-JI
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:27:14 -0400
Received: from mout.web.de ([212.227.17.12]:58677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nibKa-0003uW-Nz
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1650803231;
 bh=PPKhB8+x8wlhLaj/ldRvywGKJAFC0l01QrQhZQDPsUQ=;
 h=X-UI-Sender-Class:From:Subject:Date:References:To:In-Reply-To;
 b=hc8fd51ExaSDU/AvnrgqV+0vueWTtG+ASW1qtGU0fj/wA/8UU2mmLImX5eZP+GiOK
 UhQwPYDtmVE0ZdGvto8wC//uglX/PWyla8eSOR3p3IIlzBBVuPa12x17EObdD+LHnm
 ne+sEybw7LUhrGmtIqLMQjJkzY7OS1HX4YdP8/Lg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5CQh-1nq8R13d1Z-0111XN for
 <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 14:27:10 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Possible bug when setting aarch64 watchpoints
Date: Sun, 24 Apr 2022 14:27:10 +0200
References: <DF7731C2-424F-4438-BD46-A09CAAE21835@web.de>
To: qemu-devel@nongnu.org
In-Reply-To: <DF7731C2-424F-4438-BD46-A09CAAE21835@web.de>
Message-Id: <8A733777-02DE-45C2-930D-A83948C804BA@web.de>
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:ctp4/D5nfjZJlIq+TWBMt61zdoLgSv8m5+17RMC23MHgjDr4hCa
 L8Oxfa+8MTFunRjoWln9CfpYzU+3P99b2fuc1giX62vbgOZ+xbakT/cGjziMx3d0i4lEdxh
 3+AclXYwEFKEKl0Cd+GcUzYM1zy7NW29k6aMUwCU63fz0LocnmEPsr0P0qdyCS6uEQccI05
 HMZD2b5sIkRUoKPn5P2yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RveAwV5bDDY=:wfR79vr1i8KJIw+WDHuAJs
 6cnj3kh39Jt4Rg8VhwUsk6F2pYTV9AkHFay9jAt0vA7YGs9OeRqKfakNvHME5yxBHxWiU/1N2
 PiBz27tXGslI5oBRenjyc77sxBYWrri0gMTBI5fAc8b/nQ3629quDeqi8I6UlMHn5l0tSsnNr
 GUN1X04OR19qI3zqSYj6xUNw/GszcXp3y7slsTRgtoh/nguXNvGjmtvEy8rK90MOpUSwUc3os
 pRB4RSGilPIwrIoE527Q9RglsS9F672mhFUidCWM+loMM5kVGcfSsgJUUumUVDWuwEZwpCj25
 JMFA9xOdidSN+DRLCojeFIdRcxmm8bW9C6k3ZoF3PBUENsctnVNgr7pxuwU3BgovG37qgCioC
 STlqbgPRqkaZUTHbe89S2nZibluZa5bmXzZJkNfsTjll4rHsEHVIKwi+EpUdvM2I8fU+JB455
 XNu2JUv9IfDot7smyaRo2UrzVvXrv8zJ01XQzW50I7daGxkFMl8zjjAzv+c5EPjxgm7Af/Qzp
 8VwZzuh/BTIoW7Q/e483s5Gprog6kfHbMN4EZcUHuqZvqWTNZ6PvDT3xbYlkkdGZfztTGonpO
 Bi943pKkcY9Q6s5OaXWa59OU9gQFCIzN4EZ+NGRwdmkQWnyEOiWOPXdXUL9AcWdY+PxGvLrCr
 tfEGkIgAeZe0t5n1bPjG84GQbkgSrfmEq34xRrVoOpAllC/5vNE9DfACFFehE9IQNJ/T3NaMc
 EiBJufQLOf9EAvbFe6JEuDMRDZNgziwlQaUYb3BuQce7DbmfiFPBP7S2KokwVdWU94zBPCEDX
 GD4LMyulO4UDtgHGYgj8UGZgJNZSisnKT/2fMs9eDWTI0q6HtX9bVRSKx2zuaO55Cz/O4P+kP
 wadk7w2zHc5RWcufrxdVccXlgLeMJ5q6dqbxpNWSEJciBNPjRnNje7RU289hozD/HDiggf7YE
 CmqF2O1Ege0/NPTlEPkuxr0yJi0Rt4o+5hNY2ceKkntvmQ6Dlg512j4rP4z6yp5CpYDQIiyUC
 xQ/FH84j810SinxOu1V/59S/jAXUt3yu8msasJUKmBj2wWnQRPN3qn7al4Jk139/97pvrbk0m
 f/lkIqGtJVPZtI=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Sorry, I need to correct my previous post:



If I set

DBGWVR0_EL1 =3D 1<<23			// ie. 0x00800000

and

DBGWCR0_EL1 =3D 0x17<<24 | 0xFF<<5 | 0b11<<3 | 0b11<<1 | 0b1<<0		=
// ie. MASK =3D 23 =3D 0b10111

and then access  memory [0x0080007F]  I get a watchpoint exception. (ie. =
watchpoints ARE working/enabled)

But if I access [0x00800080] I *don=E2=80=99t* get an exception.

**If the MASK field gets set to 0b0111 instead of 0b10111 then only the =
bottom 7 bits of the address get masked (instead of 23) and the masked =
address isn=E2=80=99t 0x00800000, and the exception won=E2=80=99t be =
triggered.**

(if I *attempt* to set the MASK to 0b11111, but it actually gets set to =
0b01111, then I get the behaviour quoted below).


> On 24. Apr 2022, at 13:40, Chris Howard <cvz185@web.de> wrote:
>=20
> Hi, I=E2=80=99m new to qemu (and even bug-reporting) so apologies in =
advance=E2=80=A6
>=20
> The MASK field in DBGWCRx_EL1 is **5** bits wide [28:24].
>=20
> In target/arm/kvm64.c I found the line:
>=20
> wp.wcr =3D deposit32(wp.wcr, 24, 4, bits);		// ie **4** bits =
instead of **5**
>=20
>=20
> If it=E2=80=99s not copying (or calculating?) the number of bits =
correctly this would explain the behaviour I=E2=80=99m seeing:
>=20
> If I set
>=20
> DBGWVR0_EL1 =3D 0x00800000
>=20
> and
>=20
> DBGWCR0_EL1 =3D 0x1F<<24 | 0xFF<<5 | 0b11<<3 | 0b11<<1 | 0b1<<0
>=20
> and then access  memory [0x00807FFF]  I get a watchpoint exception. =
(ie. watchpoints ARE working/enabled)
>=20
> But if I access [0x008080000] I *don=E2=80=99t* get an exception.
>=20
> **If the MASK field gets set to 0b1111 instead of 0b11111 then only =
the bottom 15 bits of the address get masked (instead of 31) and the =
masked address isn=E2=80=99t 0x00800000, and the exception won=E2=80=99t =
be triggered.**
>=20
>=20
> Unfortunately, changing the 4 to a 5 and recompiling had no effect :-(
>=20
> I may well have misunderstood something. :-/
>=20
> =E2=80=94Chris


