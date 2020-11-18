Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB02B8504
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:44:04 +0100 (CET)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTN5-0003H8-0E
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfTKX-0002gW-KA
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:41:25 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfTKV-0004pJ-7G
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:41:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.253])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 2230D23663A;
 Wed, 18 Nov 2020 20:41:18 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 18 Nov
 2020 20:41:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bcda294b-ea00-4a00-94cd-4de81d3b6b9a,
 DB26A258A4617E4A35ED309337BB3BA939245823) smtp.auth=groug@kaod.org
Date: Wed, 18 Nov 2020 20:41:16 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/1] ppc-for-5.2 patch queue 2020-11-18
Message-ID: <20201118204116.5c80a603@bahia.lan>
In-Reply-To: <CAFEAcA-=CtUT2hfPp+=KL77zZreMvV35DU1-WhOWzm05HXiMHw@mail.gmail.com>
References: <20201118152639.173860-1-groug@kaod.org>
 <CAFEAcA-=CtUT2hfPp+=KL77zZreMvV35DU1-WhOWzm05HXiMHw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 6effda9f-6ea4-438e-96e0-36509798892f
X-Ovh-Tracer-Id: 8709398732647012771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefhedgudeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekfeegffevgfeuleeuffdtgeeiieeuffefgffhtedvledujeevveevgfevudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 14:41:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Cedric Le Goater <clg@fr.ibm.com>, qemu-ppc@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I created the PR manually and forgot to Cc qemu-ppc. Doing it now.

On Wed, 18 Nov 2020 18:54:41 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 18 Nov 2020 at 15:27, Greg Kurz <groug@kaod.org> wrote:
> >
> > The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158:
> >
> >   Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/gkurz/qemu.git tags/ppc-for-5.2-20201118
> >
> > for you to fetch changes up to 6d24795ee7e3199d199d3c415312c93382ad1807:
> >
> >   Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts" (2020-11-18 11:05:56 +0100)
> >
> > ----------------------------------------------------------------
> > ppc patch queue for 2020-11-18
> >
> > This fixes a regression that badly breaks some guest setups because
> > IPIs end up misconfigured in the XIVE interrupt controller. Hopefully,
> > the last fix for sPAPR. I'm sending this PR with the blessing of David
> > who is currently on holidays.
> >
> > ----------------------------------------------------------------
> > Greg Kurz (1):
> >       Revert series "spapr/xive: Allocate vCPU IPIs from the vCPU contexts"
> >
> >  hw/intc/spapr_xive_kvm.c | 102 +++++++++--------------------------------------
> >  1 file changed, 18 insertions(+), 84 deletions(-)
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
> for any user-visible changes.
> 
> -- PMM


