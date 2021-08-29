Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104373FAA33
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 10:44:02 +0200 (CEST)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKGQ5-0000fy-5l
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 04:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph.mayer@protonmail.com>)
 id 1mKCJH-00061o-G1
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 00:20:44 -0400
Received: from mail-40138.protonmail.ch ([185.70.40.138]:53446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph.mayer@protonmail.com>)
 id 1mKCJD-0000z3-EW
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 00:20:42 -0400
Date: Sun, 29 Aug 2021 04:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630210835;
 bh=t8jSpgcbHqxkY8vWaZwTe4fB1J4ElJlryrfosDdl7q4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=RpfHIZ6oizmKp8ml/fiQ97KHkiGzVH80e2aG08pFPvRl8qvyNoN1EoJsEreTBMc66
 sg/eKrjnixmm1BhK243oy2lklwgKMHW2B/sSdoV17YqbTvwqG1KstHAAPDzd6OVf0Z
 p0h/nngKF9QT6v6x4zn3K3j1YaZeAgCSJCUMxjGg=
To: Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>,
 "ppc@openbsd.org" <ppc@openbsd.org>
From: Joseph <joseph.mayer@protonmail.com>
Cc: pjp@centroid.eu, QEMU Developers <qemu-devel@nongnu.org>, gardask@gmail.com,
 rgcinjp@disroot.org, daniel@pocock.pro, kite@centroid.eu, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
Message-ID: <rsXZBagdw5FfhNG03S3YOPy0gXevBIpZ2ugg1vO381FSYZPj2Cxjtn-SBmEfa1Z2R4lQLB_Qwt3kI7C_-amLCSy1fBxTbkAQckqjYHAhWcs=@protonmail.com>
In-Reply-To: <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.138;
 envelope-from=joseph.mayer@protonmail.com; helo=mail-40138.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 29 Aug 2021 04:41:06 -0400
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
Reply-To: Joseph <joseph.mayer@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> runs Linux powernv bare metal on Power9 hardware. Each VM is a
> KVM-QEMU instance.

> > > If you want to also run OpenBSD inside a VM, then OpenBSD must
> > > implement proper support to be able to run in the paravirtualized
> > > PAPR environment provided by KVM-QEMU on POWER. The OpenBSD statement
> > > seem to indicate this is missing. Nothing special "should" be needed
> > > on the KVM-QEMU side.

Terminology, what is PAPR an abbreviation of, is pseries (hardware
interface) equivalent with PAPR?

Also all discussed above is supported by Raptor Talos/Blackbird
hardware right - the Raptor machine exports PowerNV to the host system
that runs on bare metal, and the host system (=3D Linux QEMU-KVM for
now) will export a virtualized pseries/papr Power9 machine to the VM
guest, which runs at close to full bare metal speed?

