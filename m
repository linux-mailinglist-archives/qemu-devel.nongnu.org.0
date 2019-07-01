Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8C42E14
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 19:56:33 +0200 (CEST)
Received: from localhost ([::1]:34212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb7U9-0002HE-5P
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hb7LW-00045S-3n
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 13:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hb7LS-00084W-BT
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 13:47:35 -0400
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:36689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hb7LQ-0007yZ-4U
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 13:47:33 -0400
Received: from player693.ha.ovh.net (unknown [10.109.159.62])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 74D9217DE7B
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 19:47:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 1A6B66BE2A55;
 Wed, 12 Jun 2019 17:47:20 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190612174345.9799-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5749e4b4-cca7-e6a0-4951-431a9493581f@kaod.org>
Date: Wed, 12 Jun 2019 19:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612174345.9799-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4227472675956362048
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.108.172
Subject: Re: [Qemu-devel] [PATCH 0/2] ppc/pnc: fix XSCOM MMIO base address
 for P9 machines with multiple chips
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/2019 19:43, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> The base address of the MMIO window of the XSCOM bus is incorrect on
> P9 machines with multiple chips. Provide a fix for that to prepare
> ground for future PowerNV chips.

David,

I just noticed the 'pnc' in the title. If you were to merge, can you=20
fix it ?=20

Thanks,

C.=20


