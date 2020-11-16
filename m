Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09BB2B4AF6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:27:09 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehLQ-0000zR-T2
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kehIo-0007BZ-97; Mon, 16 Nov 2020 11:24:26 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:57083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kehIm-0004L8-1j; Mon, 16 Nov 2020 11:24:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 138EF730C56C;
 Mon, 16 Nov 2020 17:24:19 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 17:24:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00570843d4e-e766-4f2b-be7a-a415865bf593,
 5DC1A71B4DA47E6A258F2FD66590EA27958A2DF2) smtp.auth=groug@kaod.org
Date: Mon, 16 Nov 2020 17:24:17 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.2] Revert series "spapr/xive: Allocate vCPU IPIs
 from the vCPU contexts"
Message-ID: <20201116172417.6c23a679@bahia.lan>
In-Reply-To: <46173c00-f0db-1d58-2dec-7c4f1acc9847@kaod.org>
References: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
 <46173c00-f0db-1d58-2dec-7c4f1acc9847@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8bffd6cc-5ed9-4fac-a960-b4743380816b
X-Ovh-Tracer-Id: 12084002227500063081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:24:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Satheesh Rajendran <sathnaga@linux.ibm.com>,
 Gustavo Romero <gromero@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 16:54:32 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/16/20 4:34 PM, Greg Kurz wrote:
> > This series was largely built on the assumption that IPI numbers are
> > numerically equal to vCPU ids. Even if this happens to be the case
> > in practice with the default machine settings, this ceases to be true
> > if VSMT is set to a different value than the number of vCPUs per core.
> > This causes bogus IPI numbers to be created in KVM from a guest stand
> > point. This leads to unknow results in the guest, including crashes
> > or missing vCPUs (see BugLink) and even non-fatal oopses in current
> > KVM that lacks a check before accessing misconfigured HW (see [1]).
> >=20
> > A tentative patch was sent (see [2]) but it seems too complex to be
> > merged in an RC. Since the original changes are essentially an
> > optimization, it seems safer to revert them for now. The damage is
> > done by commit acbdb9956fe9 ("spapr/xive: Allocate IPIs independently
> > from the other sources") but the previous patches in the series are
> > really preparatory patches. So this reverts the whole series:
> >=20
> > eab0a2d06e97 ("spapr/xive: Allocate vCPU IPIs from the vCPU contexts")
> > acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other s=
ources")
>=20
> These are introducing the optimisation to allocate the vCPU IPI from the=
=20
> running task, and, at the same time, the issue for guests using vSMT.
>=20
> > fa94447a2cd6 ("spapr/xive: Use kvmppc_xive_source_reset() in post_load")
> > 235d3b116213 ("spapr/xive: Modify kvm_cpu_is_enabled() interface")
>=20
> IMO, these two last patches are fine.=20
>=20

235d3b116213 is useless if you no longer want to feed kvm_cpu_is_enabled()
with IPI numbers ;-) , so it seems safer to keep it taking a CPU state
pointer.

Keeping fa94447a2cd6 without 235d3b116213 and fa94447a2cd6 wouldn't make
a lot of sense since the next try at implementing the optimization will
likely result in a different set of changes. It would certainly be more
beneficial to get the feature with a brand new series IMHO.

Cheers,

--
Greg

> C.=20
>=20
> =20

