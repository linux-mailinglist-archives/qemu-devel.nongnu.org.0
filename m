Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975620FDC4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 22:37:40 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqN0d-0007c0-92
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 16:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqMzd-0006hV-Hp; Tue, 30 Jun 2020 16:36:37 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jqMzb-0001Im-Jx; Tue, 30 Jun 2020 16:36:37 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 59FC8BF676;
 Tue, 30 Jun 2020 20:36:33 +0000 (UTC)
Date: Tue, 30 Jun 2020 22:36:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 00/10] hw/block/nvme: namespace types and zoned namespaces
Message-ID: <20200630203630.am3a3bc5ze5m2r3k@apples.localdomain>
References: <20200630100139.1483002-1-its@irrelevant.dk>
 <20200630125932.GA553472@localhost.localdomain>
 <c10b18a8-44f3-7dab-b9bb-7d017f210934@redhat.com>
 <20200630154228.GB1987534@dhcp-10-100-145-180.wdl.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630154228.GB1987534@dhcp-10-100-145-180.wdl.wdc.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 16:29:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 30 08:42, Keith Busch wrote:
> On Tue, Jun 30, 2020 at 04:09:46PM +0200, Philippe Mathieu-Daudé wrote:
> > What I see doable for the following days is:
> > - hw/block/nvme: Fix I/O BAR structure [3]
> > - hw/block/nvme: handle transient dma errors
> > - hw/block/nvme: bump to v1.3
> 
> 
> These look like sensible patches to rebase future work on, IMO. The 1.3
> updates had been prepared a while ago, at least.

I think Philippe's "hw/block/nvme: Fix I/O BAR structure" series is a
no-brainer. It just needs to get in asap.

The "hw/block/nvme: handle transient dma errors" series would really
benefit from most of the patches in my "hw/block/nvme: AIO and address
mapping refactoring" series. The elephant in the room is the AIO part
(the "hw/block/nvme: allow multiple aios per command" patch), so I will
get rid of it and leave the cleanup patches there and post it as a new
series together with the "handle transient dma errors" fixes. This would
make it a series of around ~17-18 patches, but I think they are all
quite reviewable.

The bump to v1.3 should also pretty much be ready for merging.

