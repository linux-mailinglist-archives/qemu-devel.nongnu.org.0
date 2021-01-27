Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0C306086
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:06:04 +0100 (CET)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nKV-0008JX-Vg
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l4nHp-0006o2-Hf; Wed, 27 Jan 2021 11:03:17 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l4nHm-00046B-4Q; Wed, 27 Jan 2021 11:03:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B34C27FC69B4;
 Wed, 27 Jan 2021 17:03:02 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 27 Jan
 2021 17:02:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c5279565-85ea-4031-b89f-9910a7c99a1a,
 E0AEAA2FFBCC539F7495E66DC8DC75F2C85CA1F9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 27 Jan 2021 17:02:55 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] MAINTAINERS: Update 9pfs tree URL
Message-ID: <20210127170255.1d381a0a@bahia.lan>
In-Reply-To: <1679340.e36fRnoiaZ@silver>
References: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
 <2867808.c4G3KLOmWt@silver> <1679340.e36fRnoiaZ@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 6ef69a89-0108-442f-9da4-436e9c2dbd8a
X-Ovh-Tracer-Id: 10283406800436369888
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeejiedvtddtleejjeelvdelhfeukeejkeffhfehjeeftdekiedvveeggfffkeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlrghurhgvnhhtsehvihhvihgvrhdrvghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org, Laurent
 Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 15:33:51 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 15. Januar 2021 14:50:17 CET Christian Schoenebeck wrote:
> > On Freitag, 15. Januar 2021 14:42:24 CET Greg Kurz wrote:
> > > I've already moved my repositories to gitlab for extra CI coverage,
> > > and I won't use the ones at github anymore.
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > 
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > 
> > > ---
> > > 
> > >  MAINTAINERS |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index cb0656aec3d4..21038d3fdfce 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
> > > 
> > >  F: fsdev/
> > >  F: docs/interop/virtfs-proxy-helper.rst
> > >  F: tests/qtest/virtio-9p-test.c
> > > 
> > > -T: git https://github.com/gkurz/qemu.git 9p-next
> > > +T: git https://gitlab.com/gkurz/qemu.git 9p-next
> > > 
> > >  virtio-blk
> > >  M: Stefan Hajnoczi <stefanha@redhat.com>
> 
> What's the status of this patch? I would add my T: line below just for the 
> records. But I'd rather wait for this patch being merged to main line.
> 

Drat... I forgot about this one and I'm not about to post a PR
anytime soon.

Laurent,

Any chance you can take this in the trivial tree ?

> Best regards,
> Christian Schoenebeck
> 
> 


