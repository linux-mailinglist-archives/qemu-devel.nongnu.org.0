Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56868846B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcSN-0006lg-CZ; Thu, 02 Feb 2023 11:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pNcSI-0006ke-4X; Thu, 02 Feb 2023 11:29:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pNcSG-00059L-IU; Thu, 02 Feb 2023 11:28:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAC0461BE0;
 Thu,  2 Feb 2023 16:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B729AC433EF;
 Thu,  2 Feb 2023 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675355324;
 bh=vtD2jzguhzCVkXCD7bfBMkIilEwFWfya//AvKlmwY0I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rCVgvkQnmNmcR4PhhmrhGhiSlnMKjyNb/Ap5GZI+hmnRfsZ/aPO3rLmsNpKaml9D0
 XWr50Xfpqjt7fRJUCNQOaR+izO8Q1dfo81aLWXnVRBup6D32OYhToBte07XP+Fjylo
 UAPYZa74c3c4G1oBxO1DelFvi8HSnr/dVquOSU+az78imh8JrCX1J4qVJalndBZjxr
 0FKCGPZ0XMQBL0CQGeNrKrBt1MeVN20mrnegegNN9ETgLCMQYLuayM83+6xq1uZtgb
 fP4zBj9iUfiousknNUKHA72qCs1OCOaA9Y2Lpd646ZVgxyhBUpqZCb6VMXUV/XprSK
 1vSZLjfOOpE4A==
Date: Thu, 2 Feb 2023 08:28:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: paul@xen.org
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
In-Reply-To: <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
Message-ID: <alpine.DEB.2.22.394.2302020828260.132504@ubuntu-linux-20-04-desktop>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
 <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
 <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
 <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1274086482-1675355324=:132504"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1274086482-1675355324=:132504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Feb 2023, Paul Durrant wrote:
> On 01/02/2023 18:22, Vikram Garhwal wrote:
> > Hi Paul,
> > 
> > Thanks for reviewing this and other patches in series.
> > 
> > Please see my reply below.
> > 
> > On 2/1/23 12:30 AM, Paul Durrant wrote:
> > > On 31/01/2023 22:51, Vikram Garhwal wrote:
> > > > Add a new machine xenpvh which creates a IOREQ server to
> > > > register/connect with
> > > > Xen Hypervisor.
> > > > 
> > > 
> > > Is this really the right way? Is it not possible to do the Xen
> > > initialization (including ioreq server registration) off the back of the
> > > accelerator init (i.e. AccelOpsClass ops_init function), which seems like
> > > the right place to do it now that it's no longer architecture specific.
> > > 
> > There are few other machines using the "accel=xen" option and few of these
> > machines aren't using IOREQ and other Xen related initialization. Example:
> > /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other machines
> > under /hw/i386/pc_piix.c//.
> 
> Ok. TBH the concept of 'accel=xen' is probably somewhat broken then. (QEMU
> isn't even running the VM in question, so how can it be accelerated?). Maybe
> abstract machine types really are the right way then.

Yes, it doesn't quite match QEMU as device model for Xen. However, as an
internal API in QEMU it can be useful to Xen as well occasionally. It is
just that in this specific case it doesn't look like it is the right
fit.


> > /So, that's//why we moved the IOREQ and other common initialization parts in
> > hw/xen/xen-hvm-common.c and call them as needed for the particular machine.
> > 
> > @stefano, just checking if you want to add any other suggestion here.
> > 
> > >   Paul
> > > 
> 
--8323329-1274086482-1675355324=:132504--

