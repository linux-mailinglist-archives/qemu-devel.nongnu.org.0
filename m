Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59092DB7C8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 01:24:58 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpKcj-0007Rt-Ci
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 19:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kpKbU-0006vI-Nj; Tue, 15 Dec 2020 19:23:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:41014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kpKbT-0006Zz-6B; Tue, 15 Dec 2020 19:23:40 -0500
Date: Tue, 15 Dec 2020 16:23:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608078216;
 bh=xZtSYMJH3Rrn6tG69Uq+4ioWlUJx1sKqBgQORKjdgIY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTT2rxulE4WlYMpvkNdrW+Uue6ihzT9mOHrkcFxdCFD2lufYGeXiXElY7WeHrLRZS
 wbn2pV9uEbNXTiQmWS9l30LmBVKTapruc8cG/2/V6Nl4FeWd+XDULLhYTjJoVmhgNO
 Et206gbfg6VkgWCZg30Mw1vDg3rljPpWNLtpT6ZKJ/3AmilfSPZlZQcU8MQRvDhxuU
 FsZW9FdzeCfco7jiakT3alFqVoj9rZoKeeoGnYkiKcmfEN4Ed7t76RCPEzq2lmOxKH
 YKJFV8DJiaZq+5NXdQmM1uzznW2AMHjWKVhRzSOmT186IQ//AiWD0Rt14vWfE/NE51
 uZGbh+u6ZBdVw==
From: Keith Busch <kbusch@kernel.org>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v11 00/13] hw/block/nvme: Support Namespace Types and
 Zoned Namespace Command Set
Message-ID: <20201216002331.GC3915989@dhcp-10-100-145-180.wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dmitry,

Looks good to me, thanks for sticking with it.

Reviewed-by: Keith Busch <kbusch@kernel.org>

