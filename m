Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE83331C7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:56:04 +0100 (CET)
Received: from localhost ([::1]:37368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJlGl-0005My-Vt
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJlFj-0004f5-1x
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:54:59 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:39711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJlFf-0000EE-HZ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:54:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 9E9032471B1;
 Tue,  9 Mar 2021 23:54:51 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 23:54:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001fd8a561b-acc5-47cb-b49d-a348f01b07f7,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 23:54:49 +0100
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Fix the location of tools manuals
Message-ID: <20210309235449.138fb41a@bahia.lan>
In-Reply-To: <dd68974a-d2df-88ea-52fc-fb8def4b4ee3@redhat.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <dd85243c-860d-e915-295d-8292d0a2f36f@redhat.com>
 <dd68974a-d2df-88ea-52fc-fb8def4b4ee3@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9c02ed1c-e9e5-42e9-b0df-dbbe99ab9a2b
X-Ovh-Tracer-Id: 18211149521477999026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Qemu-block <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, dgilbert@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 20:48:40 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 09/03/2021 18.41, Wainer dos Santos Moschetta wrote:
> > Hi,
> >=20
> > Any issue that prevent this of being queued?
>=20
> Maybe it's just not clear who should take the patch ... CC:-ing qemu-triv=
ial=20
> and qemu-block now, since I think it could go through the trivial or bloc=
k tree.
>=20

For the virtfs change:

Acked-by: Greg Kurz <groug@kaod.org>

> > On 2/4/21 10:59 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 2/4/21 2:54 PM, Wainer dos Santos Moschetta wrote:
> >>> The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst,=20
> >>> qemu-trace-stap.rst,
> >>> and virtiofsd.rst manuals were moved to docs/tools, so this update=20
> >>> MAINTAINERS
> >>> accordingly.
> >>>
> >>> Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
> >>> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >>> ---
> >>> v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
> >>> v2: Fixed the location of all files [philmd]
> >>>
> >>> =C2=A0 MAINTAINERS | 10 +++++-----
> >>> =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 00626941f1..174425a941 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -1829,7 +1829,7 @@ S: Odd Fixes
> >>> =C2=A0 F: hw/9pfs/
> >>> =C2=A0 X: hw/9pfs/xen-9p*
> >>> =C2=A0 F: fsdev/
> >>> -F: docs/interop/virtfs-proxy-helper.rst
> >>> +F: docs/tools/virtfs-proxy-helper.rst
>=20
> FWIW:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>=20


