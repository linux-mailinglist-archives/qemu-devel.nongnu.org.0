Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD924212E92
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 23:15:15 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr6Y6-0005Nc-Qn
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 17:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1jr6WK-0003tr-Q3; Thu, 02 Jul 2020 17:13:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1jr6WI-0000uB-P9; Thu, 02 Jul 2020 17:13:24 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C42421582;
 Thu,  2 Jul 2020 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593724399;
 bh=+axVpkBNCejTS0EAQLTOQQKGplDtp00MUX26mvVno3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PksdEUoUg3KzCbS/kDGy7MIc2DBz3kEyRk5T2vlAgG6YbDQ7MnCdgiM6efqhsnFyK
 IiIjxQozoLZHjzpnLikJ5aaXeGUOay0jT9CBCmAup/RPnibhBqM7Hs+WUggeIDfuR4
 FNVxmy2TsE7/2LerC+p8745R50fwN2hT4W/Gf8W4=
Date: Thu, 2 Jul 2020 14:13:16 -0700
From: Keith Busch <kbusch@kernel.org>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: nvme emulation merge process
Message-ID: <20200702211316.GA1990925@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200630100139.1483002-1-its@irrelevant.dk>
 <20200630125932.GA553472@localhost.localdomain>
 <c10b18a8-44f3-7dab-b9bb-7d017f210934@redhat.com>
 <20200630154228.GB1987534@dhcp-10-100-145-180.wdl.wdc.com>
 <20200630203630.am3a3bc5ze5m2r3k@apples.localdomain>
 <20200701103407.GA11634@linux.fritz.box>
 <20200701131820.l4gb2ewjmnm6ysmt@apples.localdomain>
 <645af679-d2a3-a744-d07c-477198879680@redhat.com>
 <28258e14-843d-d736-e3b1-9bb11bf2e138@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28258e14-843d-d736-e3b1-9bb11bf2e138@linux.intel.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 17:13:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Klaus Jensen <its@irrelevant.dk>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 02, 2020 at 01:29:26PM -0700, Andrzej Jakowski wrote:
> 
> Thx! Of course I am interested in helping and I think it is actually great 
> idea to have couple of designated maintainers/reviewers as it would be easier
> for folks to receive feedback vs requesting it in polling manner :)
> And please don't get me wrong -- I'm not complaining about anything -- I
> think it is just reality that everybody is stretched out into multiple directions
> struggling to allocate time for multiple things. Having many people will
> actually increase likelihood of introducing high quality improvements.
> 
> Also, +1 on separate tree for nvme emulation.

Thanks for your help.

Klaus and I will be setting up an external tree for qemu-nvme
development (tentatively on git.infradead.org) and pull-request. I'm
just waiting for the server admin to upload our public keys. If I don't
hear back by Monday, I will use an alternate server in the interim.

