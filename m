Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C7118F76
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 19:05:50 +0100 (CET)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iejtN-0003Uq-7f
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 13:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iejsC-0002xm-9Y
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 13:04:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iejsB-0003s3-36
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 13:04:35 -0500
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:48365)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iejsA-0003rM-Rs
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 13:04:35 -0500
Received: from player738.ha.ovh.net (unknown [10.108.57.153])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8FAE57A5E5
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 19:04:31 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id F2BACD411880;
 Tue, 10 Dec 2019 18:04:24 +0000 (UTC)
Subject: Re: [PATCH 1/2] ppc/pnv: Loop on the whole hierarchy to populate the
 DT with the XSCOM nodes
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Greg Kurz <groug@kaod.org>
References: <20191210135845.19773-1-clg@kaod.org>
 <20191210135845.19773-2-clg@kaod.org>
 <20191210174901.6215ddd4@bahia.tlslab.ibm.com>
 <5f5fb7b7-32a1-29d6-d197-9759a27af69f@kaod.org>
Message-ID: <59593cdb-6a88-aa6c-7698-8a7b1f34bc73@kaod.org>
Date: Tue, 10 Dec 2019 19:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5f5fb7b7-32a1-29d6-d197-9759a27af69f@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 16010015202726284096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuhffvfhfkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.39.61
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2019 18:08, C=C3=A9dric Le Goater wrote:
> On 10/12/2019 17:49, Greg Kurz wrote:
>> On Tue, 10 Dec 2019 14:58:44 +0100
>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>
>>> Some PnvXScomInterface objects lie a bit deeper (PnvPBCQState) than
>>
>> I didn't find any trace of PnvPBCQState in the code... what is it ?
>=20
> PHB4, which is not merged yet. =20

In fact, PnvPBCQState  is for PHB3. But we have a similar need for PHB4.

C.=20

