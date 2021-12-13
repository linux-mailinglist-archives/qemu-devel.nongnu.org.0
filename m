Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E0472EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:18:47 +0100 (CET)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmAA-0007dO-DD
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonb@NetBSD.org>) id 1mwlmL-0008Qb-Uc
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:54:09 -0500
Received: from thoreau.thistledown.com.au ([203.214.66.21]:53699)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <simonb@NetBSD.org>) id 1mwlmK-00062X-1N
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:54:09 -0500
Received: from thoreau.thistledown.com.au (localhost [127.0.0.1])
 by thoreau.thistledown.com.au (Postfix) with ESMTP id B6EC11FA5;
 Tue, 14 Dec 2021 00:54:05 +1100 (AEDT)
From: Simon Burge <simonb@NetBSD.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [PATCH] MIPS - fix cycle counter timing calculations
In-Reply-To: Your message of "Mon, 13 Dec 2021 11:23:53 +0100"
 <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28283.1639403645.1@thoreau.thistledown.com.au>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Dec 2021 00:54:05 +1100
Message-Id: <20211213135405.B6EC11FA5@thoreau.thistledown.com.au>
Received-SPF: neutral client-ip=203.214.66.21; envelope-from=simonb@NetBSD.org;
 helo=thoreau.thistledown.com.au
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: Simon Burge <simonb@NetBSD.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

=3D?UTF-8?Q?Philippe_Mathieu-Daud=3Dc3=3Da9?=3D wrote:

> Oops, missing your Signed-off-by tag, see:
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-ema=
ils-must-includ
e-a-signed-off-by-line
>
> Do you mind re-sending with your S-o-b? Meanwhile, patch dropped.

Hopefully I've configured "git format-patch" and "git send-email"
correctly and sent a better patch to the mailing list.  I'll make
sure to include the maintainers in future patches.

Cheers,
Simon.

