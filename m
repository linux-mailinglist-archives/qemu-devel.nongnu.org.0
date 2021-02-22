Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDF3214BA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:05:53 +0100 (CET)
Received: from localhost ([::1]:35566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE92G-0001i7-KP
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lE8yM-0007Gs-By
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:01:50 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:33324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lE8yH-00010i-LI
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:01:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 97E3A268288;
 Mon, 22 Feb 2021 12:01:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 12:01:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00341a78e50-9373-4196-9071-97badd1303aa,
 7322555201F4CCBA135B576978D07BE5564972B5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 22 Feb 2021 12:01:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Leonardo Augusto =?UTF-8?B?R3VpbWFyw6Nlcw==?= Garcia
 <lagarcia@linux.ibm.com>
Subject: Re: Editing QEMU POWER Platform wiki page
Message-ID: <20210222120138.31f313c9@bahia.lan>
In-Reply-To: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: fe13f32d-bacd-40ce-8221-4c4e854fc262
X-Ovh-Tracer-Id: 10309865447699683631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvteejtedvtdfgvdejleetuefhledtveetvefgueeifeelgedvleffkeekvddunecuffhomhgrihhnpehqvghmuhdrohhrghdprhgvrgguthhhvgguohgtshdrihhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>, QEMU PPC
 devel list <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>,
 lagarcia@br.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 10:16:25 -0300
Leonardo Augusto Guimar=C3=A3es Garcia <lagarcia@linux.ibm.com> wrote:

> Hi there,
>=20
> I would like to edit the wiki page at [0] as it contains some outdated=20
> information. Could anyone that has access to the wiki please help me=20
> create a user so that I can edit it?
>=20
> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>=20

Hi Leo,

User creation isn't publicly available to avoid spam : only an existing
user can create a new account. This being said, wiki isn't the preferred
way to expose documentation since there's no review and things ultimately
bitrot. Page [0] you want to update is a perfect example of the mess :
not only it contains irrelevant data but also stuff that is definitely
wrong (e.g. 'compat' cpu property was deprecated in QEMU 5.0 and will
be removed in QEMU 6.0).

Ideally we'd want everything to be in the main QEMU doc and don't
even need a wiki.

On the PowerPC front, the most up-to-date docs are in the QEMU tree:

docs/system/ppc/embedded.rst=20
docs/system/ppc/powermac.rst=20
docs/system/ppc/powernv.rst =20
docs/system/ppc/prep.rst    =20
docs/system/ppc/pseries.rst =20
docs/system/target-ppc.rst  =20

So I don't know exactly what changes you had in mind, but maybe first
consider to update the main documentation.

On my side, I think I want do ditch all the current content and just put
links to https://qemu.readthedocs.io/en/latest/ instead. I can take care
of that, in which case you wouldn't need an account.

Cheers,

--
Greg

PS:

Cedric reported that we also have a page for non-pseries
platforms:

https://wiki.qemu.org/Documentation/Platforms/PowerPC

I'm Cc'ing some regular contributors for those platforms so
they can  evaluate the bitrotting status of this wiki.

> Cheers,
>=20
> Leo
>=20
>=20


