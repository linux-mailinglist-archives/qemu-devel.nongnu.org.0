Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CEA54E311
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:11:51 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qDt-0003Pp-Kj
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1o1q0C-0000tx-IA; Thu, 16 Jun 2022 09:57:40 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:58926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1o1q09-0008Bb-Du; Thu, 16 Jun 2022 09:57:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40340B82284;
 Thu, 16 Jun 2022 13:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864C1C34114;
 Thu, 16 Jun 2022 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655387850;
 bh=PrnplhhoMwY/RfH8mhOFQDG+dCRdtqcmyb8tYn4XO1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtrFRdqH91BZElQ+3bx4zRpa0rszRVxKiEPzbTfO6zMU59sQ6arXF23x3IZsZkAm8
 yxJtASfGB3868Y5BnFr+uJQXXNTtKMjQR0J4olzEt4YN9XuchJ+O+7pIHisLvX0x9U
 5XRQpIF9ILN32RckOv6eE+SnL+Hk12Arn+MCfrDzhd7Ty13lJLz7ISM44StLd8ZDna
 rGIfJEZ0E0nL/wuo4MjlhuIoK2mf+Q0crneNSNakga1Zpf49C6PWBAPBKyWogoxHh1
 xCXTCZyjRePOJgbdyuc/nKMV+hVd+ia/ETp5BqSgXvNxPCtGpP2pMJIcfszjlhmBsI
 jGxetGlUlRHGg==
Date: Thu, 16 Jun 2022 07:57:27 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] hw/nvme: add support for TP4084
Message-ID: <Yqs2x7Y/EjKGGCTg@kbusch-mbp.dhcp.thefacebook.com>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
 <YqsJKZRpNEMUhdjY@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqsJKZRpNEMUhdjY@apples>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 12:42:49PM +0200, Klaus Jensen wrote:
> On Jun  8 03:28, Niklas Cassel via wrote:
> > Hello there,
> > 
> > considering that Linux v5.19-rc1 is out which includes support for
> > NVMe TP4084:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/nvme/host/core.c?id=354201c53e61e493017b15327294b0c8ab522d69
> > 
> > I thought that it might be nice to have QEMU support for the same.
> > 
> > TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
> > as ready independently from the controller.
> > 
> > When CC.CRIME is 0 (default), things behave as before, all namespaces
> > are ready when CSTS.RDY gets set to 1.
> > 
> > Add a new "ready_delay" namespace device parameter, in order to emulate
> > different ready latencies for namespaces when CC.CRIME is 1.
> > 
> > The patch series also adds a "crwmt" controller parameter, in order to
> > be able to expose the worst case timeout that the host should wait for
> > all namespaces to become ready.
> > 
> > 
> > Example qemu cmd line for the new options:
> > 
> > # delay in s (20s)
> > NS1_DELAY_S=20
> > # convert to units of 500ms
> > NS1_DELAY=$((NS1_DELAY_S*2))
> > 
> > # delay in s (60s)
> > NS2_DELAY_S=60
> > # convert to units of 500ms
> > NS2_DELAY=$((NS2_DELAY_S*2))
> > 
> > # timeout in s (120s)
> > CRWMT_S=120
> > # convert to units of 500ms
> > CRWMT=$((CRWMT_S*2))
> > 
> >              -device nvme,serial=deadbeef,crwmt=$CRWMT \
> >              -drive file=$NS1_DATA,id=nvm-1,format=raw,if=none \
> >              -device nvme-ns,drive=nvm-1,ready_delay=$NS1_DELAY \
> >              -drive file=$NS2_DATA,id=nvm-2,format=raw,if=none \
> >              -device nvme-ns,drive=nvm-2,ready_delay=$NS2_DELAY \
> > 
> > 
> > Niklas Cassel (4):
> >   hw/nvme: claim NVMe 2.0 compliance
> >   hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
> >   hw/nvme: add support for ratified TP4084
> >   hw/nvme: add new never_ready parameter to test the DNR bit
> > 
> >  hw/nvme/ctrl.c       | 151 +++++++++++++++++++++++++++++++++++++++++--
> >  hw/nvme/ns.c         |  17 +++++
> >  hw/nvme/nvme.h       |   9 +++
> >  hw/nvme/trace-events |   1 +
> >  include/block/nvme.h |  60 ++++++++++++++++-
> >  5 files changed, 233 insertions(+), 5 deletions(-)
> > 
> > -- 
> > 2.36.1
> > 
> > 
> 
> Hi Niklas,
> 
> I've been going back and forth on my position on this.
> 
> I'm not straight up against it, but this only seems useful as a one-off
> patch to test the kernel support for this. Considering the limitations
> you state and the limited use case, I fear this is a little bloaty to
> carry upstream.
> 
> But I totally acknowledge that this is a horrible complicated behavior
> to implement on the driver side, so I guess we might all benefit from
> this.
> 
> Keith, do you have an opinion on this?

There are drivers utilizing the capability, so I think supporting it is fine
despite this environment not having any inherent time-to-ready delays.

This will probably be another knob that gets lots of use for initial driver
validation, then largely forgotten. But maybe it will be useful for driver unit
and regression testing in the future.

