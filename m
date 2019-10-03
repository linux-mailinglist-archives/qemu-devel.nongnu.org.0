Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC6C9A35
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 10:48:37 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFwmq-0002bE-9t
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 04:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iFwlS-00020O-3D
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 04:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iFwlR-0007HL-2w
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 04:47:10 -0400
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:46168)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iFwlN-0007ER-9d
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 04:47:05 -0400
Received: from player772.ha.ovh.net (unknown [10.109.159.157])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 410DE7AF6C
 for <qemu-devel@nongnu.org>; Thu,  3 Oct 2019 10:47:00 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 5B0A9A800AE8;
 Thu,  3 Oct 2019 08:46:53 +0000 (UTC)
Subject: Re: [PATCH v4 18/25] ppc/pnv: Skip empty slots of the XIVE NVT table
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190918160645.25126-1-clg@kaod.org>
 <20190918160645.25126-19-clg@kaod.org>
 <20191003022228.GN11105@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bf1dc2e7-a54d-69fc-676c-892c4243b7ff@kaod.org>
Date: Thu, 3 Oct 2019 10:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191003022228.GN11105@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Ovh-Tracer-Id: 13079297743255997337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeekgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.53
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/10/2019 04:22, David Gibson wrote:
> On Wed, Sep 18, 2019 at 06:06:38PM +0200, C=E9dric Le Goater wrote:
>> We try to loop on the full table skipping empty indirect pages which
>> are not necessarily allocated. This is useful to dump the contexts of
>> the KVM vCPUs.
>=20
> I think this patch can be merged into the previous one.  They're both
> short, so we might as well get the dumping code correct first time.

ok.

C.=20

