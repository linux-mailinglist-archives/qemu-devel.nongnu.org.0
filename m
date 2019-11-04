Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8616EE78C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 19:42:33 +0100 (CET)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRhJA-0001yP-JI
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 13:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lukasstraub2@web.de>) id 1iRhEE-0000Da-TT
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 13:37:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lukasstraub2@web.de>) id 1iRhED-0007Cf-Q3
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 13:37:26 -0500
Received: from mout.web.de ([212.227.15.4]:51569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lukasstraub2@web.de>) id 1iRhED-0007Bt-CM
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 13:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572892641;
 bh=uVPj3CjL2GEVh+hOtjZOcKFTWZXRDueQFYil0BhYu/Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=N2fAZLPq9nkQ1xZ0VieMGMj2AJ7ctGIoJjj7OOtQRn5t6tjKU3swyoRCZOmqyI7FJ
 wI8eoTEOmAHaTH1/tMK2zLLFQVSaSXaZ3dh77x16dF7o5npYLewUY0dHmuPhIaiABH
 8erCV/ANPXys/Ob6msA0NqSTqdKYi2DhrIYWgyGM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.169]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLUDi-1iSFBz2gpG-000YzV; Mon, 04
 Nov 2019 19:37:21 +0100
Date: Mon, 4 Nov 2019 19:37:19 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Daniel Cho <danielcho@qnap.com>
Subject: Re: The problems about COLO
Message-ID: <20191104193719.665f6b3c@luklap>
In-Reply-To: <CA+XQNE5xLXSNUEEd9n_=Hcgu=8QXvwFNuZ4B5WunSmiqM_tnrg@mail.gmail.com>
References: <CA+XQNE5xLXSNUEEd9n_=Hcgu=8QXvwFNuZ4B5WunSmiqM_tnrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6d4q380Aanmvr4eQ6ZyB21JJDwlm5n/AF520ad917DsrvtV/vMn
 Kj+qHHwxZOAQZUUiCd9LiGAO/jNbK8GpaoNBCZgTQu/3O9yEFNwBQDAtXEDHZej7nFb/GNA
 t3SdEduC0LzZg3q3UBcTY/OtSKDG8fZsPqKEiMfNCgTWhUv/Y2Wi74QEq32/07vhKnuZKES
 Ub127MFCySoTtB7jmbfpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WXp+so7p6Y8=:72Ro3E3niN6TmJccfeIsBW
 63J6Yv6J1O69CdkyYjhDjVhxOO2icUiOsgyRMiB/dsqWi0J24UVbSsH1vfVYKd3JCf3bdilIx
 VV7HCe+z4wioZvN2bvHqxA7fsnM/L1ftu952h03r0RudAtJHOgO2MAOomkxFVMNmBBh6/UGDL
 reTMFj0izBNC8uQaBibHqKD/eVNHkCSMcJutnKl+w1QO8Tq8E4q4GFGQDjt6tpz26Ez2CSv+P
 p06MbOohgaFUOAAv9cBSoAVrtGXZMJPVuLRuCTJ96O/JteuuAhuwQNswI4ZJmyEmQRZwmj7WV
 YNIGPd/1JN9hxblzsxPRiFa9ltq0GtiliYoFkUWEEIDfbl6eHqgyQCcJL/LHVbiTpLm7Tbkap
 0D/T0+80CbEEmecZiZUTnoMg1bF3ch+X6WsatPr5wF9huY1GCqzllc7FRb6r8Kthe7qB2xRAs
 wQ0TtrgIumjAJul5g8+L+FGWfmtnB8vmwUpmIvDiLfutDoFyp6ydvBISJ+CJh+qJhCC+ry9i6
 h8JD+qslnsEdkaqSn5OO4LyWOV5znRd8zF55kTZher9Z00ZSsF0SzQplnF8bfX+aB0y1l+tcV
 q60EDu8AWxH7zVdl2LYaGryg7HwbtEcyLU76m9AesibGkBYy2flCsVh1AbVKrCbV0Ldsrg5oT
 RVFZS4cM8jxwN6r3fECjj/INr8EJ2gEaEX7EsF4KiBoWKf9sCuNVqNPxeIZAYJ7QBD0gGoh6f
 W4L8mqw85GXFuQkDct7yeds3q0Js5aYHbykXR13qRq6tU67/8a6g7s9wm3S+QtjCZbEGoxb8l
 tBg1ir6TCRaZeKCYJxZZe8SWfMNr3UMaDL7hsc2miRVvDhnoxWFHNGL2Noaj4LT+OT1LnzTRu
 kcWol+66+zRPbWaKFSkMfza3VeQ/0mFHUYNzarJIFyrv+TM1qZjihn9fLCzjF3g79EYOqmcUn
 oFXEe2yqgIY8pWf3JVhf/Z0t50Erf5AX4yz9pkkk8fk5pn7a5hU9SfCh6KCnGhdjjJUwD4Zlj
 FjZWTzagYFRYT9HAKjwlr/Q/wWSSQ5Ab6CFZ97w4ls/EdaqO+lPun2KkYuIrhG+wHAeeUQc59
 h3GzZoUFpZ/dl7Ya5eDSiyGhDFrkUIocvHN/it3wourh9aoU26hp1IqIYJMhdtx20amuMxgBL
 1EIRpo/6fbvZsd24DAkZiGuip3jOBP2b9Hm1gSErsGOOWC33aUfL9roJK4xB5yiw8YaHgZwHU
 PXnnqSmzHr2HVzih/8IvAsRA/QE758Q8D1yhAbaWDcKT4AYEn1sov8RSb5Fs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.15.4
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Oct 2019 17:05:20 +0800
Daniel Cho <danielcho@qnap.com> wrote:

> Hello all,
> I have some questions about the COLO.
> 1)  Could we dynamic set fault tolerance feature on running VM?
> In your document, the primary VM could not  start first (if you start
> primary VM, the secondary VM will need to start), it means to if I
> want this VM with fault-tolerance feature, it needs to be set while
> we boot it.

Hi Daniel,
Yes, this is possible as long you have a quorum block node. The rest
can be added while running.

> 2)  If primary VM or secondary VM broke, could we start the third VM
> to keep fault tolerance feature?

I'm currently working on this, see my latest PATCH series here:
https://lore.kernel.org/qemu-devel/cover.1571925699.git.lukasstraub2@web.d=
e/

>
> Best regard,
> Daniel Cho.


