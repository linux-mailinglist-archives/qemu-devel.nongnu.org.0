Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0767F5C8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 13:11:03 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htVSg-0005Ah-IR
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 07:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <samuel.thibault@gnu.org>) id 1htVS7-0004kt-1E
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1htVS6-0003in-8w
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:10:26 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:44768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1htVS6-0003hk-2k
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 07:10:26 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8F83F1414C;
 Fri,  2 Aug 2019 13:10:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgEo4A0VlmDM; Fri,  2 Aug 2019 13:10:21 +0200 (CEST)
Received: from function (lfbn-bor-1-380-179.w109-215.abo.wanadoo.fr
 [109.215.95.179])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id D866714149;
 Fri,  2 Aug 2019 13:10:21 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1htVS0-00027D-Of; Fri, 02 Aug 2019 13:10:20 +0200
Date: Fri, 2 Aug 2019 13:10:20 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20190802111020.dvorpd4gdxy3is7r@function>
References: <156452993884.16169.12168229409049273970@sif>
 <3c6ebc55-9416-a467-cfbe-73d2df6a64f2@redhat.com>
 <CAFEAcA9Vs=N_kaO1_DHM=Azttp=1Ju=bKFMU3iZdt6-+J=Oq4Q@mail.gmail.com>
 <CAFEAcA-dcHzyH0ojrpbKuq-NALToxRLjCwz9MiZqNfN2=xLLsA@mail.gmail.com>
 <CAJ+F1CJj8F3PFBDiKanqGdZ22r9AmeqYuTDQFq0RjeayR7U4dQ@mail.gmail.com>
 <CAFEAcA8xnvg3QjwZV8Yhkk4g7rM2cHn5GYkmXngNDVVkE290=Q@mail.gmail.com>
 <CAJ+F1CLbtvJjhekp===mb6ggUYdGqXj87hkoErS2G6JesJ+tMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ+F1CLbtvJjhekp===mb6ggUYdGqXj87hkoErS2G6JesJ+tMw@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a0c:e300::1
Subject: Re: [Qemu-devel] [ANNOUNCE] QEMU 4.1.0-rc3 is now available
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau, le ven. 02 ao=C3=BBt 2019 15:07:46 +0400, a ecrit=
:
> And Samuel probably thought the same, since he didn't update the submod=
ule.

I'm rather mostly buried under piles of things to do...

> According to MAINTAINERS, this is for Samuel to take care of. But I'll
> do it if he ask me.

Please do.

Samuel

