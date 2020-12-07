Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171132D0D7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 10:55:28 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDEs-0006bY-FN
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 04:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmDDH-0006Bq-3d
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:53:48 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:55149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmDDE-0000rX-1R
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:53:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6C3A421E3A4;
 Mon,  7 Dec 2020 10:53:38 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 7 Dec 2020
 10:53:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00415a040f8-7e38-4ef1-a307-8a41a8420f3e,
 96C53C8645D225A2EF98A9818159DE0D98C51A94) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Mon, 7 Dec 2020 10:53:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v10] spapr: Implement Open Firmware client interface
Message-ID: <20201207105336.7190f621@bahia.lan>
In-Reply-To: <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
References: <20201013021911.28701-1-aik@ozlabs.ru>
 <20201204193205.45d2a15a@bahia.lan>
 <c5cf97dd-d1aa-389a-2bff-5781a6af803e@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 128ab56c-5e88-4caf-8386-d1577d1889ed
X-Ovh-Tracer-Id: 18132055051795863971
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 18:33:34 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

[...]

> >> +    }
> >> +
> >> +    return offset;
> >> +}
> >> +
> >> +static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
> >> +{
> >> +    char *node, *unit, *part;
> > 
> > If you do this:
> > 
> >      g_autofree *node = NULL, *unit = NULL, *part = NULL;
> 
> 
> Did you mean
>         g_autofree char *node = NULL, *unit = NULL, *part = NULL;
> ?
> 

Yes. Sorry for the missing char :)

[...]

> >> +static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const char *path)
> >> +{
> >> +    int offset;
> >> +    uint32_t ret = 0;
> >> +    SpaprOfInstance *inst = NULL;
> >> +    char *node, *unit, *part;
> >> +
> >> +    if (spapr->of_instance_last == 0xFFFFFFFF) {
> >> +        /* We do not recycle ihandles yet */
> >> +        goto trace_exit;
> > 
> > And g_free() is passed uninitialized pointers.
> > 
> > A typical use case for the g_auto magic.
> 
> g_autofree, you mean?
> 

If you switch to g_strsplit_set(), you'd need a g_auto(GStrv). But since you
explained that you'd rather keep split_path() as is, then you should use
g_autofree indeed.

[...]

> 
> Thanks! I'll repost in a sec. But I still wonder on what terms this is 
> going to be allowed in the QEMU tree at all.
> 

Pros:

This notably improves the boot time of the -kernel/-initrd experience.
Even if the feature isn't used in production, it can be quite useful for
developers.

Cons:

It doesn't provide a full alternative to SLOF with respect to the boot
loader.

This is still a lot of code that we'll need to support, especially since
the changes affect paths used in production.



IMHO, unless this gets momentum in the community, and eventually
allows to get rid of SLOF once and for all, it seems premature to
merge this.

Cheers,

--
Greg

