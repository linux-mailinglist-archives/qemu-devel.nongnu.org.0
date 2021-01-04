Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9652E948C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:09:43 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOg9-0003mX-Ug
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kwOfD-0003Gi-A8; Mon, 04 Jan 2021 07:08:43 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60554
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kwOf9-0002xT-Mq; Mon, 04 Jan 2021 07:08:43 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 591405FC99;
 Mon,  4 Jan 2021 13:08:34 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 03/18] target/arm: use arm_is_el2_enabled() where
 applicable
Date: Mon, 04 Jan 2021 14:08:31 +0200
Message-ID: <5669299.lOV4Wx5bFT@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <6f114b65-e6e8-e9a2-41f0-c3fda14680d0@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-3-remi.denis.courmont@huawei.com>
 <6f114b65-e6e8-e9a2-41f0-c3fda14680d0@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

Le maanantaina 21. joulukuuta 2020, 22.54.08 EET Richard Henderson a =C3=A9=
crit :
> On 12/18/20 2:37 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > Do not assume that EL2 is available in non-secure context.
>=20
> Just noticed this wording is off.  Should be
> "Do not assume that EL2 is unavailable in a secure context"

It would be clearer, but I'd hate to rereresend the patchset just for this.

Indeed, the second sentence clarifies that this was meant reciprocally, i.e=
=2E=20
that it should not be assumed that EL2 is always and only available in non-
secure context:

> > That equivalence is broken by ARMv8.4-SEL2.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >=20
> >  target/arm/cpu.h        |  4 ++--
> >  target/arm/helper-a64.c |  8 +-------
> >  target/arm/helper.c     | 33 +++++++++++++--------------------
> >  3 files changed, 16 insertions(+), 29 deletions(-)


=2D-=20
R=C3=A9mi Denis-Courmont



