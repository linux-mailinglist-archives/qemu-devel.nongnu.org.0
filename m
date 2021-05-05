Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4640373C71
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:32:46 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHdt-0008HY-VJ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Johannes.Schindelin@gmx.de>)
 id 1leHJ8-0000It-3I; Wed, 05 May 2021 09:11:19 -0400
Received: from mout.gmx.net ([212.227.17.22]:38095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Johannes.Schindelin@gmx.de>)
 id 1leHJ0-0002Vd-KV; Wed, 05 May 2021 09:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620220263;
 bh=RoFtDrJfd7YF41NXT2fGshKqr35lekJMpNFoQix0PdA=;
 h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
 b=gnzWKY8rbeaXiwCdqto7lowswH9pVF3W24eItRDGFuRWZXPKMbfWL8GnRmoj4EpRa
 vlWlcuCu9rCU8dBop18reRxk4I+xhxvts4EOMfrCh8cnDJcLYfY9D9ttOdjMGKv2K6
 2FlV34pFPesS8puhK5q+l5kt7FChA5UbdpiwNLDs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.28.146.104] ([89.1.212.20]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1lFQ8S3vzO-00ktxR; Wed, 05
 May 2021 15:11:03 +0200
Date: Wed, 5 May 2021 15:11:01 +0200 (CEST)
From: Johannes Schindelin <Johannes.Schindelin@gmx.de>
X-X-Sender: virtualbox@gitforwindows.org
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/4] block/vvfat: Fix leaks and out of bounds writes
In-Reply-To: <20210430162519.271607-1-philmd@redhat.com>
Message-ID: <nycvar.QRO.7.76.6.2105051509440.50@tvgsbejvaqbjf.bet>
References: <20210430162519.271607-1-philmd@redhat.com>
User-Agent: Alpine 2.21.1 (DEB 209 2017-03-23)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-322352566-1620220262=:50"
X-Provags-ID: V03:K1:0qoVB1EcPvKLSimrr3NmU2jgpcA/eIrkFmVYz9l/ucERUPrTDf4
 IU5zEyGABpgxXMZZoXlPztN6/714iUSL8SZpoOmWH5Q/QMqwNbY1X65NdaGkKtGW3e+O3Lh
 ltMMhNgJDqEx3VPXkweQLVSf71qTq8S7SwmnVeJugFuegHsbCZUrRwlvuaj77wTNNVZpiPV
 T3o4B3XgQ1Iw9A8vGVLKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QBWvHLXHmfo=:f6g3mHd+5Tgzl97mChveGy
 hk9s3DpbLDBrijBTV+DiZl1iMOFg9Z59Sy9ieNhV0Sb3hJ7OqAcLqrcmZnJ0XrSYF11bINsAd
 nTMY4Y6uBkZaiL1em0APhvRUHXcXWf0X7XPWN7es5aT6dcmXOhty3K+zD+jtVPHGDc5bUOZPr
 sJkqNBZ4za9STSXLS9CSHodlq4/i3wTrGq9ML9VhCv6XqIuzowHbiJuaiwbVY+QgAkGqzv5xh
 ztAIjmC3TEF/rqNx57do0p/qTEFtLv+dJFNMkS5U/bMMJ4PYlRK48zME0iIJ2ySpJeYdlxo+s
 Li6H+HOmEDkMvYL8NR85ZpmW8Lx+Jvfc6xzYIkPCgf6UxoeKpNkjaoRTxps5M5m7avwhjSJj+
 JdGeBvKbMs8gpwbDmHf9HG3y4hHmgAerL9pczkEGJpwNrowsbVIFKSBdbGZ4SuFEV2TVPFGWD
 ND8Uw87yUfCUIV56XDpRhzQJynot5UBYg8NopeloXOd29spvou/GJjVA6U3/d0C6mpuBPJDtL
 9zQSJi/Ad0V5hsGAtimkvMEQZr6kSNlun998lou7pPLttPVmoraa287QlFYgTHd59wdYJEczq
 GFlXGiS53akjLhhOIsgD3Yht36aIxq0JEGOn1HUBGS4oZGLPYf8/CWQTZnPZHj3ix8EUnmyDK
 nSAKH0wQXa+wCrJH4hdTVtFRpJgA5j+9KiMLXqv2GV6DWQHQdwPCfJlyZ4egi1jCyw2MAfWSB
 vIcmYU37ogcB1ArPQH3e8qBo+AHPIF/aiPag0ixmAm+iIiEYgjPfuXZQ245WVnGvyiGoMc8vq
 BbUH7NZ3S5TONZtm05ceZXFoxabZ27bo74qnWHV3hkftL+jcKOVJwFPyV8dYxGyxhcM4QSbba
 hBO28YRex7CnDRzPm0gYwSR8UxTRwKdqePb8oZaLDEuQVj4lCb11NJNJP8uWBcwfKzQvbTmIQ
 nIOG6cFEwd484OVHNsyqdJLzgQOF/akoCmOAMlR/5h1rIXZ4FrquO2ksUcsOKit7qMxCeP30l
 RSYCeSkuNrkzOfZX3jooH/cf8BhqN1SX+7kmV7oyDsSu7KWMgHA3PRVBKgROcpC7mYSZK/s1A
 t678zjJYhc5IbIRMsCh1LCXYfxndNHFlgq+rF6NmmUr/eTaDbHG3PyQoD3B8DmEQwA0F59OYB
 w/+RDjpv/NhKMJm/PhEQmXSCYTPwRnbkIw9C4sc7HfFJAeAkv7bdhK4fuHsb0Jq4Rub+8L7s9
 nSWW4vlHreZXRue8t
Received-SPF: pass client-ip=212.227.17.22;
 envelope-from=Johannes.Schindelin@gmx.de; helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 May 2021 09:30:09 -0400
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-322352566-1620220262=:50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Fri, 30 Apr 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> The first 3 patches are trivial leak fixes, the last
> one is a RFC since I have no clue about this code.
>
> Johannes, you wrote this 18 years ago, do you still
> remember? =3D)

I do remember writing them, but I remember almost nothing of the details.
The patch series looks good to me (but keep in mind that I am not active
in the QEMU project, and that I never used that driver except for a little
playing around).

Ciao,
Johannes

>
> Philippe Mathieu-Daud=C3=A9 (4):
>   block/vvfat: Fix leak of BDRVVVFATState::qcow_filename
>   block/vvfat: Fix leak of BDRVVVFATState::used_clusters
>   block/vvfat: Fix leak of mapping_t::path
>   block/vvfat: Avoid out of bounds write in create_long_filename()
>
>  block/vvfat.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> --
> 2.26.3
>
>
>

--8323328-322352566-1620220262=:50--

